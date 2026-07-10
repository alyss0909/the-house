// myPKA Slack Expansion — Socket Mode listener
//
// Architecture:
//   Slack DM/mention -> Socket Mode WebSocket -> this listener
//     -> writes inbound message to <mypka>/Team Inbox/slack-incoming/<ts>-<channel>.md
//     -> optionally fires OS notification (SLACK_NOTIFY_OS=true)
//     -> optionally posts in-thread autoresponder (when Larry inactive >= SLACK_AUTORESPONDER_MIN)
//   Outbound queue: <mypka>/Team Inbox/slack-outgoing/*.md
//     -> drained by this listener at a 5-second polling cadence
//     -> POSTed via chat.postMessage with unfurl_links=false, unfurl_media=false (NEVER overridden)
//     -> sent files moved to .sent/, errors written as <name>.error sibling files
//
// Hard rules:
//   - Tokens never logged.
//   - unfurl_links/unfurl_media always false on outbound (anti-leak default).
//   - Idempotent: duplicate Slack events (replay) detected by ts+channel filename uniqueness.
//   - Filename sanitization: anything from Slack is treated as untrusted input.

import { SocketModeClient } from '@slack/socket-mode';
import { WebClient } from '@slack/web-api';
import fs from 'node:fs';
import fsp from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawn } from 'node:child_process';
import os from 'node:os';

const BOT_TOKEN = process.env.SLACK_BOT_TOKEN;
const APP_TOKEN = process.env.SLACK_APP_TOKEN;
const DEFAULT_CHANNEL = process.env.SLACK_DEFAULT_CHANNEL || '';
const NOTIFY_OS = (process.env.SLACK_NOTIFY_OS || 'false').toLowerCase() === 'true';
const AUTORESPONDER_MIN = parseInt(process.env.SLACK_AUTORESPONDER_MIN || '30', 10);
const IGNORE_CHANNELS = (process.env.SLACK_IGNORE_CHANNELS || '')
  .split(',')
  .map((s) => s.trim())
  .filter(Boolean);

if (!BOT_TOKEN || !APP_TOKEN) {
  console.error('[mypka-slack] FATAL: SLACK_BOT_TOKEN and SLACK_APP_TOKEN are required.');
  process.exit(1);
}

// myPKA layout: this script lives at <mypka>/Expansions/slack/runtime/index.js
// F3 (v1.0.4): use fileURLToPath, not URL.pathname. On Windows, `.pathname`
// yields a leading-slash drive path (e.g. /C:/...) that path.dirname mishandles;
// fileURLToPath produces a correct native path on every platform.
const RUNTIME_DIR = path.dirname(fileURLToPath(import.meta.url));
const EXPANSION_DIR = path.resolve(RUNTIME_DIR, '..');
const VAULT_DIR = path.resolve(EXPANSION_DIR, '..', '..');
const INBOX_INCOMING = path.join(VAULT_DIR, 'Team Inbox', 'slack-incoming');
const INBOX_OUTGOING = path.join(VAULT_DIR, 'Team Inbox', 'slack-outgoing');
const PROCESSED_DIR = path.join(INBOX_INCOMING, '.processed');
const SENT_DIR = path.join(INBOX_OUTGOING, '.sent');

await fsp.mkdir(INBOX_INCOMING, { recursive: true });
await fsp.mkdir(INBOX_OUTGOING, { recursive: true });
await fsp.mkdir(PROCESSED_DIR, { recursive: true });
await fsp.mkdir(SENT_DIR, { recursive: true });

const web = new WebClient(BOT_TOKEN);
const socket = new SocketModeClient({ appToken: APP_TOKEN });

// ---------- Identity bootstrap ----------
let BOT_USER_ID = null;
try {
  const auth = await web.auth.test();
  BOT_USER_ID = auth.user_id;
  console.log(`[mypka-slack] Connected to Slack via Socket Mode`);
  console.log(`[mypka-slack] Bot user: ${auth.user} (${BOT_USER_ID}) in workspace ${auth.team}`);
} catch (err) {
  console.error('[mypka-slack] FATAL: auth.test failed. Check SLACK_BOT_TOKEN.', err.data?.error || err.message);
  process.exit(1);
}

console.log(`[mypka-slack] Inbound queue:  ${INBOX_INCOMING}`);
console.log(`[mypka-slack] Outbound queue: ${INBOX_OUTGOING}`);

// ---------- Last-Larry-active heuristic for autoresponder ----------
// We treat "Larry active" as: any file written in your myPKA under Team Knowledge/session-logs/
// in the last AUTORESPONDER_MIN minutes. This is a soft heuristic, not strong correlation.
async function larryRecentlyActive() {
  const sessionLogsDir = path.join(VAULT_DIR, 'Team Knowledge', 'session-logs');
  try {
    const cutoff = Date.now() - AUTORESPONDER_MIN * 60_000;
    const stack = [sessionLogsDir];
    while (stack.length) {
      const dir = stack.pop();
      let entries;
      try {
        entries = await fsp.readdir(dir, { withFileTypes: true });
      } catch {
        continue;
      }
      for (const e of entries) {
        const p = path.join(dir, e.name);
        if (e.isDirectory()) stack.push(p);
        else {
          const stat = await fsp.stat(p);
          if (stat.mtimeMs >= cutoff) return true;
        }
      }
    }
  } catch {
    return false;
  }
  return false;
}

// ---------- Filename sanitization ----------
function sanitizeForFilename(s) {
  return String(s || '')
    .replace(/[^A-Za-z0-9._-]/g, '-')
    .replace(/-+/g, '-')
    .slice(0, 80);
}

// Strict sanitizer for filename path-components (no dots — defeats path traversal).
// Used for both `ts` and `channel` when composing the inbound filename.
function strictFilenameComponent(s) {
  return String(s || '')
    .replace(/[^0-9a-zA-Z_-]/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 80);
}

// Canonical inbound directory (resolved once) for defense-in-depth prefix-match check.
const INBOX_INCOMING_RESOLVED = path.resolve(INBOX_INCOMING);

// ---------- Autoresponder per-channel cooldown (F2, v1.0.4) ----------
// Without this, a burst of inbound messages each triggered its own autoresponse
// (5 DMs -> 5 identical "Larry will reply" replies). We now track the last
// autoresponse timestamp per channel and suppress repeats within the cooldown
// window. The window reuses SLACK_AUTORESPONDER_MIN: one autoresponse per channel
// per AUTORESPONDER_MIN minutes.
const autoresponderCooldown = new Map(); // channel ID -> last-autoresponse epoch ms
function autoresponderOnCooldown(channel) {
  const last = autoresponderCooldown.get(channel);
  if (last === undefined) return false;
  return Date.now() - last < AUTORESPONDER_MIN * 60_000;
}

// ---------- Inbound: write to slack-incoming/ ----------
async function captureInbound(event) {
  const tsRaw = event.ts || `${Date.now() / 1000}`;
  const tsSafe = strictFilenameComponent(tsRaw);
  const channelSafe = strictFilenameComponent(event.channel || 'unknown');
  // Reject empty-after-sanitization inputs to avoid degenerate filenames.
  if (!tsSafe || !channelSafe) {
    console.error('[mypka-slack] inbound rejected: empty filename component after sanitization', { tsRaw, channel: event.channel });
    return false;
  }
  const filename = `${tsSafe}-${channelSafe}.md`;
  const filepath = path.resolve(path.join(INBOX_INCOMING, filename));
  // Defense-in-depth: ensure the resolved path stays under the canonical inbound dir.
  // Guards against symlink/traversal even though strictFilenameComponent already strips dots/slashes.
  if (filepath !== path.join(INBOX_INCOMING_RESOLVED, filename) ||
      !filepath.startsWith(INBOX_INCOMING_RESOLVED + path.sep)) {
    console.error('[mypka-slack] inbound rejected: path-traversal guard tripped', { filename });
    return false;
  }

  // Idempotency: if this file already exists, Slack replayed the event. Skip.
  try {
    await fsp.access(filepath);
    console.log(`[mypka-slack] inbound dedup: ${filename} already captured`);
    return false;
  } catch {
    // not present -> proceed
  }

  let senderRealName = '';
  try {
    if (event.user) {
      const info = await web.users.info({ user: event.user });
      senderRealName = info.user?.real_name || info.user?.name || '';
    }
  } catch {
    // best-effort; not fatal
  }

  const frontmatter = [
    '---',
    `source: slack`,
    `channel_id: ${event.channel || ''}`,
    `thread_ts: ${event.thread_ts || event.ts || ''}`,
    `message_ts: ${event.ts || ''}`,
    `sender_id: ${event.user || ''}`,
    `sender_real_name: ${JSON.stringify(senderRealName)}`,
    `event_type: ${event.type || ''}`,
    `received_at: ${new Date().toISOString()}`,
    '---',
    '',
  ].join('\n');

  const body = (event.text || '').trim() || '_(empty message)_';
  await fsp.writeFile(filepath, `${frontmatter}${body}\n`, { mode: 0o600 });
  console.log(`[mypka-slack] inbound captured: ${filename}`);

  // Optional OS notification
  if (NOTIFY_OS) {
    fireOSNotification('myPKA Slack', `New message from ${senderRealName || event.user || 'Slack'}`);
  }

  // Autoresponder: if Larry hasn't been active recently, post in-thread.
  // F2 (v1.0.4): per-channel cooldown — one autoresponse per channel per
  // AUTORESPONDER_MIN window, so a burst of inbound messages gets one reply,
  // not one reply each.
  try {
    if (event.channel && autoresponderOnCooldown(event.channel)) {
      console.log(`[mypka-slack] autoresponder suppressed (cooldown active): ${event.channel}`);
    } else {
      const active = await larryRecentlyActive();
      if (!active && event.channel) {
        await web.chat.postMessage({
          channel: event.channel,
          thread_ts: event.thread_ts || event.ts,
          text: 'Larry will reply when next active. (Your message has been queued.)',
          unfurl_links: false,
          unfurl_media: false,
        });
        // Record only after a successful post so a failed send can retry next inbound.
        autoresponderCooldown.set(event.channel, Date.now());
      }
    }
  } catch (err) {
    console.error('[mypka-slack] autoresponder error:', err.data?.error || err.message);
  }

  return true;
}

function fireOSNotification(title, message) {
  try {
    const platform = os.platform();
    if (platform === 'darwin') {
      spawn('osascript', ['-e', `display notification "${message.replace(/"/g, '\\"')}" with title "${title.replace(/"/g, '\\"')}"`], { detached: true, stdio: 'ignore' }).unref();
    } else if (platform === 'linux') {
      spawn('notify-send', [title, message], { detached: true, stdio: 'ignore' }).unref();
    }
    // Windows: no built-in CLI notifier; skip silently.
  } catch {
    // best-effort
  }
}

// ---------- Outbound: drain slack-outgoing/ ----------
function parseFrontmatter(content) {
  const m = content.match(/^---\n([\s\S]*?)\n---\n?/);
  if (!m) return { fm: {}, body: content };
  const fm = {};
  for (const line of m[1].split('\n')) {
    const idx = line.indexOf(':');
    if (idx < 0) continue;
    const key = line.slice(0, idx).trim();
    let val = line.slice(idx + 1).trim();
    if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) {
      val = val.slice(1, -1);
    }
    fm[key] = val;
  }
  return { fm, body: content.slice(m[0].length).trim() };
}

async function drainOutbound() {
  let entries;
  try {
    entries = await fsp.readdir(INBOX_OUTGOING, { withFileTypes: true });
  } catch {
    return;
  }
  const files = entries.filter((e) => e.isFile() && e.name.endsWith('.md')).map((e) => e.name);
  for (const name of files) {
    const filepath = path.join(INBOX_OUTGOING, name);
    let content;
    try {
      content = await fsp.readFile(filepath, 'utf8');
    } catch {
      continue;
    }
    const { fm, body } = parseFrontmatter(content);
    const channel = fm.channel_id || fm.channel || DEFAULT_CHANNEL;
    if (!channel) {
      await writeError(filepath, 'no channel_id in frontmatter and SLACK_DEFAULT_CHANNEL unset');
      continue;
    }
    const thread_ts = fm.thread_ts || undefined;
    const text = body || '(empty)';

    let attempts = 0;
    let posted = false;
    while (attempts < 3 && !posted) {
      attempts++;
      try {
        await web.chat.postMessage({
          channel,
          thread_ts,
          text,
          unfurl_links: false,
          unfurl_media: false,
        });
        posted = true;
      } catch (err) {
        const code = err.data?.error || err.code || 'unknown';
        const status = err.data?.response_metadata?.statusCode || err.statusCode;
        // Permanent errors: do not retry
        if (['invalid_auth', 'channel_not_found', 'is_archived', 'not_in_channel', 'missing_scope'].includes(code)) {
          await writeError(filepath, `permanent: ${code}`);
          posted = false;
          break;
        }
        // Rate limit: respect Retry-After
        if (status === 429 || code === 'rate_limited') {
          const retryAfter = parseInt(err.data?.headers?.['retry-after'] || err.headers?.['retry-after'] || '5', 10);
          console.log(`[mypka-slack] rate limited; sleeping ${retryAfter}s`);
          await new Promise((r) => setTimeout(r, retryAfter * 1000));
          continue;
        }
        // Transient: exponential backoff
        await new Promise((r) => setTimeout(r, 500 * 2 ** attempts));
      }
    }
    if (posted) {
      const sentPath = path.join(SENT_DIR, name);
      await fsp.rename(filepath, sentPath);
      console.log(`[mypka-slack] outbound sent: ${name} -> ${channel}`);
    } else if (attempts >= 3) {
      await writeError(filepath, 'failed after 3 attempts');
    }
  }
}

async function writeError(originalPath, reason) {
  const errPath = `${originalPath}.error`;
  await fsp.writeFile(errPath, JSON.stringify({ reason, at: new Date().toISOString() }, null, 2));
  console.error(`[mypka-slack] outbound error on ${path.basename(originalPath)}: ${reason}`);
}

// ---------- Event wiring ----------
socket.on('message', async ({ event, ack }) => {
  try {
    await ack();
    if (!event) return;
    if (event.subtype === 'bot_message') return; // ignore other bots' messages
    if (event.user === BOT_USER_ID) return; // ignore self
    if (IGNORE_CHANNELS.includes(event.channel)) return;
    // Only DMs (channel type 'im') for the message.im event
    if (event.channel_type !== 'im' && event.channel_type !== undefined) return;
    await captureInbound(event);
  } catch (err) {
    console.error('[mypka-slack] message handler error:', err.message);
  }
});

socket.on('app_mention', async ({ event, ack }) => {
  try {
    await ack();
    if (!event) return;
    // F2 (v1.0.4): match the `message` handler — ignore other bots' messages.
    // Without this filter an @-mention from another bot would be captured and
    // could trigger an autoresponse to that bot.
    if (event.subtype === 'bot_message') return; // ignore other bots' messages
    if (event.user === BOT_USER_ID) return; // ignore self
    if (IGNORE_CHANNELS.includes(event.channel)) return;
    await captureInbound(event);
  } catch (err) {
    console.error('[mypka-slack] app_mention handler error:', err.message);
  }
});

socket.on('disconnect', () => {
  console.log('[mypka-slack] Socket disconnected; the SDK will auto-reconnect.');
});

socket.on('error', (err) => {
  console.error('[mypka-slack] socket error:', err.message);
});

// ---------- Outbound polling loop ----------
const OUTBOUND_POLL_MS = 5000;
setInterval(() => {
  drainOutbound().catch((err) => console.error('[mypka-slack] drain error:', err.message));
}, OUTBOUND_POLL_MS);

// ---------- Heartbeat (visible to SOP-slack-listener-health) ----------
const HEARTBEAT_MS = 60_000;
setInterval(() => {
  console.log(`[mypka-slack] heartbeat ${new Date().toISOString()}`);
}, HEARTBEAT_MS);

// ---------- Connect ----------
await socket.start();
console.log('[mypka-slack] Listener running. Press Ctrl+C to stop.');

process.on('SIGINT', async () => {
  console.log('[mypka-slack] SIGINT received; shutting down.');
  try {
    await socket.disconnect();
  } catch {}
  process.exit(0);
});
process.on('SIGTERM', async () => {
  console.log('[mypka-slack] SIGTERM received; shutting down.');
  try {
    await socket.disconnect();
  } catch {}
  process.exit(0);
});

import 'dotenv/config';
import express from 'express';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import fs from 'node:fs/promises';
import { Composio } from '@composio/core';
import Anthropic from '@anthropic-ai/sdk';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const PORT = process.env.PORT || 4599;

if (!process.env.COMPOSIO_API_KEY) {
  console.error('\n  Missing COMPOSIO_API_KEY. Copy .env.example to .env and add your keys.\n');
  process.exit(1);
}

const composio = new Composio({ apiKey: process.env.COMPOSIO_API_KEY });
const anthropic = process.env.ANTHROPIC_API_KEY
  ? new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY })
  : null;

// email -> Composio connected-account id, resolved once at startup so the
// dashboard can just say "support" and the server knows which mailbox.
const ACCOUNTS = {};
async function resolveAccounts() {
  const list = await composio.connectedAccounts.list({ toolkitSlugs: ['gmail'] });
  const items = list.items || list.data || list;
  for (const acc of items) {
    const email = acc.data?.email || acc.meta?.email || acc.params?.email;
    if (email) ACCOUNTS[email.toLowerCase()] = acc.id;
  }
  console.log('Resolved Gmail accounts:', Object.keys(ACCOUNTS).join(', ') || '(none)');
}

function accountId(email) {
  const id = ACCOUNTS[(email || '').toLowerCase()];
  if (!id) throw new Error(`No connected Gmail account for ${email}`);
  return id;
}

async function exec(slug, email, args) {
  return composio.tools.execute(slug, {
    userId: process.env.COMPOSIO_USER_ID || 'default',
    connectedAccountId: accountId(email),
    arguments: args,
  });
}

const app = express();
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// The triage snapshot the dashboard renders. Refreshed by the daily sweep.
app.get('/api/inbox', async (_req, res) => {
  try {
    const data = JSON.parse(await fs.readFile(path.join(__dirname, 'data.json'), 'utf8'));
    res.json(data);
  } catch (e) {
    res.status(500).json({ error: String(e) });
  }
});

// Archive: remove from inbox only, never delete.
app.post('/api/archive', async (req, res) => {
  const { email, ids } = req.body || {};
  if (!email || !Array.isArray(ids) || !ids.length) {
    return res.status(400).json({ error: 'Send { email, ids: [...] }' });
  }
  try {
    await exec('GMAIL_BATCH_MODIFY_MESSAGES', email, {
      messageIds: ids,
      removeLabelIds: ['INBOX'],
    });
    res.json({ ok: true, archived: ids.length });
  } catch (e) {
    res.status(500).json({ error: String(e) });
  }
});

// Draft a reply into Gmail's Drafts (never sends).
app.post('/api/draft', async (req, res) => {
  const { email, threadId, instruction } = req.body || {};
  if (!email || !instruction) {
    return res.status(400).json({ error: 'Send { email, instruction, threadId? }' });
  }
  if (!anthropic) return res.status(400).json({ error: 'Add ANTHROPIC_API_KEY to draft.' });
  try {
    const msg = await anthropic.messages.create({
      model: 'claude-fable-5',
      max_tokens: 700,
      messages: [{
        role: 'user',
        content: `Write a short, warm email reply in Alyssa Coleman's voice. Return ONLY the email body, no subject line, no preamble.\n\n${instruction}`,
      }],
    });
    const body = msg.content.map(b => (b.type === 'text' ? b.text : '')).join('').trim();
    const draft = await exec('GMAIL_CREATE_EMAIL_DRAFT', email, {
      ...(threadId ? { thread_id: threadId } : {}),
      body,
    });
    res.json({ ok: true, body, draftId: draft?.data?.id });
  } catch (e) {
    res.status(500).json({ error: String(e) });
  }
});

app.get('/api/health', (_req, res) => res.json({ ok: true, accounts: Object.keys(ACCOUNTS) }));

resolveAccounts()
  .catch(e => console.warn('Account resolve warning:', e.message))
  .finally(() => {
    app.listen(PORT, () => console.log(`\n  The Mailroom is live at http://localhost:${PORT}\n`));
  });

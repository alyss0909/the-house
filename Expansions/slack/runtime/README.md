# Slack Listener Runtime

Node.js Socket Mode listener for the myPKA Slack Expansion.

## Files

- `index.js` — the listener. ES modules. Requires Node 18+.
- `package.json` — declares `@slack/socket-mode` and `@slack/web-api` as the only direct runtime deps, exact-pinned. Both are official Slack SDKs.
- `package-lock.json` — myICOR-generated, `npm audit`-clean lockfile pinning the full transitive tree. `scripts/install.sh` installs strictly from it with `npm ci --omit=dev --ignore-scripts`. The lockfile is regenerated and re-audited at every pack release (see the pack release checklist).

## How it runs

`scripts/start.command` (or `.sh` / `.bat`) loads `Expansions/slack/.env` with a strict `KEY=VAL` parser (the launcher never `source`s the `.env`, so a malformed or hostile `.env` cannot execute shell code), and runs `node index.js` from this directory. The listener:

1. Authenticates with the bot token, fetches the bot's user ID.
2. Connects to Slack via Socket Mode (WebSocket, outbound-only).
3. Subscribes to `message.im` (DMs) and `app_mention` events.
4. On inbound: writes a markdown file with frontmatter to `<mypka>/Team Inbox/slack-incoming/<ts>-<channel>.md`. Idempotent (filename uniqueness dedups Slack replays).
5. Polls `<mypka>/Team Inbox/slack-outgoing/` every 5 seconds. For each `.md` file, reads the frontmatter (`channel_id`, `thread_ts`), POSTs via `chat.postMessage` with `unfurl_links: false` and `unfurl_media: false` (always — never overridable). Moves sent files to `.sent/`. Writes `.error` siblings on permanent failures.
6. Logs a heartbeat line every 60 seconds (used by `SOP-slack-listener-health.md`).

## Hard rules in code

- Tokens are NEVER logged. No `console.log` of `BOT_TOKEN` or `APP_TOKEN`.
- `unfurl_links` and `unfurl_media` are passed as literal `false` on every outbound `chat.postMessage`. There is no code path that lets the frontmatter override these.
- Filenames derived from Slack input (channel, ts) are sanitized (`/[^A-Za-z0-9._-]/g` -> `-`, length-capped at 80 chars).
- The listener ignores its own messages (`event.user === BOT_USER_ID`) and other bots' messages (`event.subtype === 'bot_message'`).
- Channel ignore-list (`SLACK_IGNORE_CHANNELS`) is honored.

## Dev / debug

- Run with `DEBUG=*` for verbose Slack SDK logging (still won't print tokens — the SDK masks them).
- The heartbeat line is the canary for liveness checks. If `/tmp/mypka-slack-listener.log` hasn't been written to in > 90 seconds, assume the listener is dead.

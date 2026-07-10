# SOP-slack-post-message — Drain the outbound Slack queue

- **Default owner:** Mack. Reusable by any agent.
- **Status:** Installed by the Slack Expansion v1.0.0. Auto-numbered into `SOP-NNN-slack-post-message.md` at install.
- **Triggered by:** files appearing in `Team Inbox/slack-outgoing/`. The listener runtime polls this folder every 5 seconds and drains it automatically — this SOP documents the contract Mack is implementing in code, and the manual procedure if the runtime is down or a user wants to post a one-off ad-hoc.
- **References:** `runtime/index.js` (the executor), [[SOP-slack-incoming-routing]] (which queues the files this SOP drains), [[SOP-slack-listener-health]].

## Purpose

Take a Slack-bound message file from `Team Inbox/slack-outgoing/`, parse its frontmatter, POST to Slack via `chat.postMessage` with strict security defaults, and archive on success or write a `.error` sibling on permanent failure.

## Inputs

A markdown file at `Team Inbox/slack-outgoing/<ts>.md` with frontmatter (per [[SOP-slack-incoming-routing]] §5):

```yaml
---
channel_id: C01ABCDEF23
thread_ts: 1715000000.000200       # the parent message's ts — makes the reply land in-thread
in_reply_to_message_ts: 1715000000.000200
composed_by: larry
composed_at: 2026-05-09T15:35:00Z
---
The reply text.
```

## Procedure (automatic — runtime/index.js)

The Node.js runtime polls `Team Inbox/slack-outgoing/` every 5 seconds. For each `.md` file:

1. Parse frontmatter. Extract `channel_id` (or fall back to `SLACK_DEFAULT_CHANNEL`), `thread_ts`, body text.
2. Call `web.chat.postMessage({ channel, thread_ts, text, unfurl_links: false, unfurl_media: false })`.
3. On success: move the file to `Team Inbox/slack-outgoing/.sent/<ts>.md`. Log `outbound sent: <name> -> <channel>`.
4. On 429 (rate limited): respect `Retry-After` header, sleep, retry.
5. On 5xx (transient): exponential backoff, up to 3 attempts (500ms, 1s, 2s).
6. On permanent failure (`invalid_auth`, `channel_not_found`, `is_archived`, `not_in_channel`, `missing_scope`): write `<ts>.md.error` with `{ reason, at }` JSON. Do NOT retry. Surface to Larry on his next session.

## Procedure (manual — listener down or one-off)

If the runtime is down and you need to post manually:

1. Curl directly:
   ```bash
   source Expansions/slack/.env
   curl -s -X POST https://slack.com/api/chat.postMessage \
     -H "Authorization: Bearer ${SLACK_BOT_TOKEN}" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d '{
       "channel": "C01ABCDEF23",
       "thread_ts": "1715000000.000200",
       "text": "the reply text",
       "unfurl_links": false,
       "unfurl_media": false
     }'
   ```
2. Confirm the response has `"ok": true`.
3. If posting from a queued file, manually move it to `.sent/` after success.

## Hard rules

- **`unfurl_links: false` and `unfurl_media: false` are NEVER overridden.** Not by frontmatter. Not by environment variable. Not by user request. This is the v1.0 security default that prevents the link-unfurling data-leak bug class that killed Anthropic's deprecated reference Slack MCP server (May 2025).
- **Tokens never logged.** The runtime never `console.log`s `SLACK_BOT_TOKEN`. The manual curl example masks the token by using the env var, not inlining it.
- **Permanent failures stop retrying.** Bot kicked from channel? Write `.error`, surface to Larry, do not retry. Auth revoked? Same. Retrying these silently masks the real problem.
- **Idempotency by filename.** The runtime dedupes by source filename in the queue; if the same outbound file appears twice (you wrote it, deleted it, wrote again with the same name), the runtime will post it twice. Use unique filenames (`<message_ts>` is naturally unique because Slack ts is unique per message).

## Failure modes

| Error | Cause | Resolution |
|---|---|---|
| `invalid_auth` | Bot token revoked or workspace removed the app. | Regenerate at api.slack.com → OAuth & Permissions. Update `.env`. |
| `channel_not_found` | Channel ID typo, or channel deleted, or bot was never in it. | Verify the channel ID. Re-invite the bot if needed (`/invite @Larry`). |
| `not_in_channel` | Bot was kicked from the channel. | Re-invite the bot. |
| `missing_scope` | A scope was removed from the bot. | Add `chat:write` (and others) at api.slack.com → OAuth & Permissions. Re-install the app. |
| `is_archived` | Channel was archived after the reply was queued. | Permanent. Drop the reply. |
| `rate_limited` | Tier 3 = ~50 posts/min. | Runtime auto-retries with `Retry-After`. If sustained, batch differently. |

## When this SOP is invoked

- Continuously, by the runtime, while it's alive.
- Manually, by Mack, when the runtime is down and a critical reply needs to go out.
- During incident response after a `.error` file is written — Mack reads the error, fixes the underlying issue, and decides whether to re-queue or drop the reply.

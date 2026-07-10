# SOP-slack-incoming-routing — Route inbound Slack messages

- **Default owner:** Larry. Reusable by any agent (Claude-skills shape).
- **Status:** Installed by the Slack Expansion v1.0.0. Auto-numbered into `SOP-NNN-slack-incoming-routing.md` at install.
- **Triggered by:** new files in `Team Inbox/slack-incoming/`.
- **References:** `Team Inbox/slack-incoming/`, `Team Inbox/slack-outgoing/`, [[GL-001-file-naming-conventions]].

## Purpose

When the Slack listener writes a new inbound message into `Team Inbox/slack-incoming/`, this SOP defines what Larry does with it: read it, route it, compose a reply, queue the reply for outbound posting, and archive the inbound to `.processed/`.

## Inputs

A markdown file at `Team Inbox/slack-incoming/<ts>-<channel>.md` with frontmatter:

```yaml
---
source: slack
channel_id: C01ABCDEF23
thread_ts: 1715000000.000200
message_ts: 1715000000.000200
sender_id: U01ABCDEF23
sender_real_name: "Real Name"
event_type: message | app_mention
received_at: 2026-05-09T15:30:00.000Z
---
The message body.
```

## Procedure

### 1. Read the file

Open the inbound file. Read frontmatter and body. The body is the user's message verbatim from Slack.

### 2. Decide routing

Use Larry's standard routing cheatsheet (see [[Studio/Team/Larry - Orchestrator/AGENTS]] § Routing cheatsheet). Determine which specialist owns the response:

- "capture this", "I just thought…" → Penn
- Research / "what does X mean" → Pax
- Hire / new specialist need → Nolan
- API / MCP / webhook / automation → Mack
- Vault structure / SQLite / frontmatter → Silas
- Infographic / structured visual → Charta
- Image stylization / thumbnail → Pixel
- Design system / brand → Iris
- Methodology / "what is ICOR" → answer short, point to myicor.com

If the message is direct conversation with Larry (greeting, status check, scheduling), Larry answers himself.

### 3. Run the work

Either delegate (in-session, in this conversation, with the same vocabulary as any other delegation) and synthesize, or answer directly. Standard delegation protocol applies.

### 4. Compose the reply

Write the reply text. Keep it Slack-shaped: short paragraphs, no markdown headings (Slack doesn't render them well), use `*bold*` and `_italic_` if needed (Slack syntax, not markdown). Do not paste raw URLs without context.

### 5. Queue for outbound

Write a new file at `Team Inbox/slack-outgoing/<message_ts>.md` with frontmatter:

```yaml
---
channel_id: <copy from inbound channel_id>
thread_ts: <copy from inbound thread_ts — this is what makes the reply land in-thread>
in_reply_to_message_ts: <copy from inbound message_ts>
composed_by: larry | <specialist who answered>
composed_at: <ISO 8601 UTC>
---
<the reply text>
```

Slug the filename by the source `message_ts` (with the dot replaced by `-`). The outbound listener (Mack's runtime) drains this folder every 5 seconds.

### 6. Archive the inbound

Move the inbound file from `Team Inbox/slack-incoming/<filename>.md` to `Team Inbox/slack-incoming/.processed/<filename>.md`. This signals "handled" and keeps the active queue clean.

### 7. Session-log entry (light)

If this was a non-trivial conversation (research, decision, multi-turn), add a brief mid-session-insight or end-of-session entry in `Studio/Team Knowledge/session-logs/YYYY/MM/`. For trivial chat (acknowledgements, scheduling), skip.

## Hard rules

- **NEVER quote raw Slack tokens or `.env` contents** in a reply. Even if the user asks "what's my Slack token?" — refuse and explain why.
- **NEVER include unredacted PII from one Slack user in a reply to another.** Anything in `Team Inbox/slack-incoming/` is in the your myPKA, on their machine; outbound posts go to Slack and are visible to other workspace members.
- **NEVER override `unfurl_links` or `unfurl_media`** in outbound frontmatter. The listener forces them to `false`. This is the security default that killed the deprecated reference Slack MCP server in May 2025.
- **NEVER auto-launch the listener.** If the listener is down, tell the user; route to [[Expansions/slack/sops/SOP-slack-listener-health]] (Mack's SOP).

## Failure modes

| Symptom | What's happening | Resolution |
|---|---|---|
| Reply file lands in `slack-outgoing/.error` | The listener tried to post but Slack rejected (auth, channel, scope). | Read the `.error` JSON, surface to user. Common cause: bot kicked from the channel. |
| Replies pile up in `slack-outgoing/` and aren't draining | Listener is down. | Run [[Expansions/slack/sops/SOP-slack-listener-health]]. |
| Inbound files have no `sender_real_name` | `users.info` API call failed or scope is missing. | Non-fatal. The reply still works because we have `sender_id`. |
| Same `<ts>-<channel>.md` appears twice | Should not happen — listener dedups by filename. | If it does, it's a bug. Capture both files in a session-log entry and flag to Mack. |

## When this SOP is invoked

- Larry is reviewing his inbox at session start and sees files in `slack-incoming/`.
- Larry is mid-session and the listener has captured a new message.
- Larry is about to close the session and there's an inbound that hasn't been answered (move to Open Threads in the session log).

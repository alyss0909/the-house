# Slack Expansion

Turn Slack into a chat surface for Larry and your team. DM the bot or @-mention it in a channel, and the message lands in your `Team Inbox/slack-incoming/`. Larry routes it to the right specialist on his next session, composes the reply, and Mack posts it back to Slack in-thread.

This is a **runtime Expansion** — it ships a long-lived background process (a Slack Socket Mode listener) that runs independently of any Larry session. Inbound messages are captured even when Larry isn't open. Replies happen the next time Larry is active.

## What it does

- Listens for DMs to your bot and @-mentions in channels — captures them to `Team Inbox/slack-incoming/<ts>.md` with frontmatter (channel, sender, thread).
- Watches `Team Inbox/slack-outgoing/` for files Larry composes — drains the queue, posts each one to Slack via `chat.postMessage`.
- Replies in-thread by default (no channel pollution).
- Optional OS notification on inbound (off by default — opt in via `SLACK_NOTIFY_OS=true`).
- Optional autoresponder when Larry has been inactive for N minutes (default 30, configurable via `SLACK_AUTORESPONDER_MIN`).

## What it does not do (v1.0)

- File uploads either direction.
- Slash commands (`/larry ...`).
- Reactions, presence, or status sync.
- Multiple Slack workspaces.

These are deferred to v1.1+.

## How to install

1. Drop this folder into your `Expansions/` directory in your myPKA folder. Larry detects it on the next session boot and runs [[WS-003-install-an-expansion]].
2. Larry presents the install preview, runs the security review (Vex), merges the three SOPs into your `Team Knowledge/SOPs/` (auto-numbered), prompts you for the Slack tokens, and tells you how to launch the listener.
3. Follow `INSTALL.md` to create the Slack app at api.slack.com (one-time, ~5 minutes), copy the two tokens into `.env`, and double-click `scripts/start.command` to launch.

The listener runs in the background as a launchd service (macOS), a systemd-style background process (Linux), or a foreground terminal window (Windows). Restart it via `launchctl kickstart` (macOS) or by re-running `start.sh` (Linux/Windows).

## How to uninstall

Tell Larry "uninstall the Slack Expansion" or "remove Slack." Larry runs the symmetric flow:

- Mack stops the listener and unloads the launchd plist.
- Nolan removes the three installed SOPs from `Team Knowledge/SOPs/`.
- Silas validates the post-uninstall myPKA state.
- Larry archives the install record to `Expansions/_uninstalled/slack-1.0.0/`.

`Team Inbox/slack-incoming/` and `Team Inbox/slack-outgoing/` are kept by default — that's your data, on your machine. Delete them manually if you want them gone.

## How it works (architecture)

- **Inbound delivery: Socket Mode (WebSocket).** No public URL, no tunnel, no signing-secret rotation. The Slack app talks outbound to slack.com over WSS. This is the canonical pattern for personal/desktop Slack bots.
- **Outbound posting: direct Slack Web API.** `chat.postMessage` with `unfurl_links: false` and `unfurl_media: false` always-on (the security default that killed the deprecated reference Slack MCP server in May 2025).
- **No MCP runtime, no protobuf decoding, no live database access.** The listener writes plain markdown files to `Team Inbox/`; Larry reads them on his next session.
- **No shared bot.** You create your own Slack app under your own workspace. No myICOR-issued shared bot, no cloud infrastructure.

## Privacy & security

- Tokens live only in `Expansions/slack/.env` (chmod 600, gitignored). Never in `expansion.yaml`. Never logged.
- Inbound messages land in `Team Inbox/slack-incoming/` as plaintext markdown inside your myPKA. Anything DM'd to Larry is captured to disk on your machine.
- Outbound posts default to `unfurl_links: false` and `unfurl_media: false` — Slack's link-unfurling pipeline is the most common data-leak surface for bots. We disable it by default.
- You are the data controller (GDPR Art. 4(7)) for messages that pass through this listener. Paperless Movement S.L. does not vet, sandbox, or guarantee third-party Expansions beyond shipping the contract.

## License

Proprietary — myICOR AI Library Software License. See LICENSE.

## Files Larry writes outside this folder

Declared in `expansion.yaml` `uninstall.residual_paths`:

- `~/Library/LaunchAgents/com.mypka.slack-listener.plist` (macOS only, if autostart is enabled)
- [[Expansions/slack/sops/SOP-slack-incoming-routing]] (auto-numbered into next free SOP-NNN slot)
- [[Expansions/slack/sops/SOP-slack-post-message]] (auto-numbered)
- [[Expansions/slack/sops/SOP-slack-listener-health]] (auto-numbered)
- `Team Inbox/slack-incoming/` (your inbound message queue)
- `Team Inbox/slack-outgoing/` (your outbound message queue)
- `/tmp/mypka-slack-listener.log` and `/tmp/mypka-slack-listener.err` (launchd capture)

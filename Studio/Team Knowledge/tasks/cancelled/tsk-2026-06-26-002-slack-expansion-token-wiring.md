---
id: tsk-2026-06-26-002
title: Wire Slack Expansion tokens and test listener
status: open
created: 2026-06-26
owner: Mack
priority: medium
linked_sops: [SOP-028-slack-incoming-routing, SOP-029-slack-post-message, SOP-030-slack-listener-health]
linked_workstreams: []
linked_guidelines: []
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []
---

## What needs to happen

The Slack Expansion v1.0.0 SOPs (028-030) are installed and indexed. The runtime requires two tokens that Alyssa must provide. This task wires them up and confirms the listener works.

### What Alyssa needs to provide

Two tokens from her Slack app settings (api.slack.com/apps):

1. **SLACK_BOT_TOKEN** — starts with `xoxb-`. Required. Bot OAuth token.
2. **SLACK_APP_TOKEN** — starts with `xapp-`. Required. App-level token for Socket Mode.

These go in `Expansions/slack/.env` (which is gitignored — never committed).

### Steps for Mack

1. **Receive tokens from Alyssa** — drop them in the chat when ready.
2. **Write `.env`** — `Expansions/slack/.env` with the two key=value pairs.
3. **Test** — run `start.bat` once manually to confirm the Socket Mode listener connects.
4. **Confirm with SOP-030** — run the listener health check.

### CRITICAL rules

- **NEVER auto-launch** `start.bat` or any background process. Alyssa starts the listener manually.
- **NEVER store tokens in PKM/ or Team Knowledge/** — `.env` only, and it stays gitignored.
- **NEVER commit `.env`** — it's in `.gitignore` by design.

### Trigger

Alyssa is ready to connect her Slack workspace — usually when she wants incoming Slack messages to route through Larry.

Cancelled 2026-07-16: Alyssa retired the Slack listener; tokens never needed.

---
# Identity
id: tsk-2026-06-01-004
title: "Set up Telegram -> Claude -> PKM automation"

# Ownership & priority
assignee: mack
priority: 2

# Status
status: cancelled
blocked_reason: null
blocked_by: null

# Time
created: 2026-06-01T00:00:00Z
updated: 2026-06-05T00:00:00Z
due: null

# Provenance
created_by: larry
source: manual
parent: null

# Cross-references
linked_sops: [SOP-003-keep-notes-to-journal, SOP-012-codex-windows-sandbox-recovery]
linked_workstreams: [WS-004-inbox-processing]
linked_guidelines: []
linked_my_life: [pkm, systematize-socials]
linked_session_logs: [2026-06-02-17-20_larry_telegram-capture-mvp-handoff, 2026-06-03-22-21_larry_telegram-mvp-and-open-loop-realignment, 2026-06-04-10-58_larry_instagram-saves-telegram-processing, 2026-07-13-11-05_mack_telegram-capture-bot-fix]
linked_journal_entries: []

# Tagging
tags: [automation, telegram, ai, inbox]
---

# Set up Telegram -> Claude -> PKM automation

## What this is

Wire a Telegram bot so that messages Alyssa sends to it get routed into the myPKA inbox processing flow, eventually hitting Team Inbox or the right journal entry/running doc via Claude/Codex. Part of the broader inbox, socials, and Obsidian ecosystem.

The capture layer should stay Telegram-first, not browser-cookie-first. Alyssa does not want AI controlling or accessing a logged-in browser session for Instagram; Telegram becomes the low-friction capture chute, and Claude/Codex handles processing after the save has already landed safely.

## Context one click away

- Inbox processing SOP: [[SOP-003-keep-notes-to-journal]]
- Daily journaling workstream: [[WS-004-inbox-processing]]
- Assigned to: Mack (automation + webhook specialist)

## Success criteria

- Telegram message -> Claude/Codex -> processed into PKM (journal entry, running doc, or task)
- Works as a capture channel alongside Keep and web clipper
- Integrated into the unified inbox processing flow once that SOP is finalized
- Supports Instagram/social inspiration captures as `URL + intent tags`, so the processing layer knows why Alyssa saved the post before it reaches review

## Processing insight from Instagram Saves Engine

Only borrow the processing architecture from the Notion "The Instagram Saves Engine" pattern, not the risky browser-cookie capture method:

- **Raw capture stays separate from polished ideas.** Telegram messages land as raw inbox items first; approved ideas move later into the right content system or Notion queue.
- **Processing is batch/on-demand.** Alyssa can capture casually from Android, then ask Claude/Codex to process new saves into content ideas when she is ready.
- **Every processed save should preserve intent.** Use Alyssa's Telegram tags to guide whether a post is for recreation, reposting, design inspiration, content angle mining, hook study, or another purpose.
- **Approval stays human.** The AI can propose hooks, angles, outlines, captions, and platform breakdowns, but Alyssa approves what becomes usable content.

## Telegram capture convention

When sending Instagram/social saves through Telegram, Alyssa wants to include the URL plus lightweight intent tags such as:

- `#recreate` - make an Alyssa-flavored version of the concept or format
- `#repost` - likely worth sharing or referencing directly
- `#design` - visual direction, layout, aesthetic, carousel treatment, or brand-world inspiration
- `#content` - turn into a content idea, outline, email, post, or campaign angle
- `#hook` - study or reuse the opening/frame

Example shape: `https://www.instagram.com/reel/... #hook #content`.

## Updates

- 2026-06-01 (larry) - created from Alyssa's note; details pending.
- 2026-06-02 (mack) - MVP built: `Team Knowledge/scripts/telegram-capture-mvp.py`, env example, README, .gitignore entries. Bot created via BotFather (username: ideaeaterbot). Token exposed in screenshot; must be regenerated after first successful test.
- 2026-06-02 (larry) - listener never started; Windows sandbox refresh error blocked the run. Handoff note at [[Studio/Team Knowledge/session-logs/2026/06/2026-06-02-17-20_larry_telegram-capture-mvp-handoff]]. Blocker: need to run the Python script and verify test message lands in Team Inbox, then regenerate token.
- 2026-06-03 (larry) - Windows sandbox blocker fixed. Root cause was corrupted `C:\Users\accol\.codex\.sandbox\deny_read_acl_state.json` plus elevated sandbox mode; recovery documented in [[SOP-012-codex-windows-sandbox-recovery]]. Remaining work: run the listener proof test, then regenerate the exposed BotFather token.
- 2026-06-03 22:21 (mack) - MVP pipe verified from existing Telegram captures in `Team Inbox/_Processed/`; current token health-check succeeds for `@ideaeaterbot`; one-time poll found no queued messages. Added `--health-check`, `--once`, and flushed status output so future tests are clear. Remaining blocker: regenerate exposed BotFather token and run one final message test.
- 2026-06-04 14:58 (mack) - incorporated Alyssa's realignment from the Notion Instagram Saves Engine page: keep Telegram as the capture layer, use the post's processing/ideation pattern, and ask Alyssa to send social URLs with intent tags like `#recreate`, `#repost`, `#design`, `#content`, and `#hook`.
- 2026-06-05 (mack) - service installer built at `Team Knowledge/Automations/telegram-service-install.ps1`. Registers a Windows Task Scheduler task ("myPKA - Telegram Capture Bot") that runs at startup under the `accol` account using `pythonw.exe` (no console window), restarts on failure up to 3 times then every 1 hour, and appends all output to `Team Knowledge/scripts/telegram-capture.log`. One action remaining: Alyssa runs `telegram-service-install.ps1` once as Administrator to register the task — no other tools required.
- 2026-07-13 (mack) - priors loaded: none (task's `linked_journal_entries` is empty). The live task ended up being a different, simpler registration than the installer above (`TelegramCaptureBot`, raw `python.exe`, no log redirect, logon trigger) and it silently failed after the 2026-07-09/10 restructure. Fixed a real bug the restructure introduced (`VAULT_ROOT` path-depth miscalculation was about to send captures to a nonexistent `Studio/Notebook/Inbox` instead of the real `Notebook/Inbox` — caught before any message was actually misfiled), added internal logging and poll-loop error backoff, corrected the README's stale env-file location. Full detail: [[Studio/Team Knowledge/session-logs/2026/07/2026-07-13-11-05_mack_telegram-capture-bot-fix]]. Bot verified running again. Did not touch `blocked_reason` (token-regeneration) — out of this session's scope; the bot has in practice been running on the same un-regenerated token for weeks, so that blocker may already be moot, but that's a call for whoever owns this task next, not decided here.

## Outcome

_(filled when status flips to done)_

## Closed 2026-07-20

Killed by Alyssa 2026-07-20: "i already regenerated like months ago wtf we dont even use the telegram thing anyway". The token block was stale and the capture chute never became part of her actual workflow. Capture now runs through Google Keep via KeepSidian (see [[tsk-2026-07-16-001-keepsidian-google-reauth]]) and the Instagram Saves Engine. If a low-friction mobile capture chute is ever wanted again, start fresh rather than reviving this.

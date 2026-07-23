---
# Identity
id: tsk-2026-07-23-007
title: "Wire the 🌙 Archive label into the mailroom sweep and remaining accounts"

# Ownership & priority
assignee: larry
priority: 2

# Status (mirrors folder location)
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-23T15:25:00Z
updated: 2026-07-23T15:25:00Z
due: null

# Provenance
created_by: larry
source: mailroom-archive-label-decision-2026-07-23
parent: null

# Cross-references
linked_sops: [SOP-004-create-task]
linked_workstreams: []
linked_guidelines: []
linked_my_life: []
linked_session_logs: [2026-07-23-15-20_larry_mailroom-bulk-cleanup-and-archive-label]
linked_journal_entries: []

# Tagging
tags: [mailroom, automation]
---

# Wire the 🌙 Archive label into the mailroom sweep and remaining accounts

## What this is

Alyssa's 2026-07-23 call: archived mail gets filed under a searchable "🌙 Archive" label, not just removed from the inbox. The label exists on personal (`Label_19`) and support (`Label_3323713876616453460`) and the whole bulk cleanup was labeled. What is not yet done is making it automatic going forward.

## Subtasks

- [ ] Create the "🌙 Archive" label on business and wellness (labelShow, messageListVisibility show)
- [ ] Update the daily sweep scheduled task so every archive action adds the account's 🌙 Archive label alongside removing INBOX
- [ ] Update the `/mailroom` command's archive step the same way
- [ ] Note per-account label ids in the Mailroom README so the command can look them up

## Success criteria
- Every future archive, daily or bulk, files mail under 🌙 Archive automatically on all four accounts

## Updates
- 2026-07-23 15:25 (larry) — created from the Archive-label decision; README doctrine already updated, wiring pending

## Outcome
_(filled when status flips to done — see [[SOP-006-close-task]])_

---
# Identity
id: tsk-2026-06-02-001
title: "Automate Meetily meeting capture pointers into Team Inbox"

# Ownership & priority
assignee: mack
priority: 2

# Status (mirrors folder location)
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-06-02T18:25:00Z
updated: 2026-06-02T18:25:00Z
due: null

# Provenance
created_by: larry
source: user-session-2026-06-02
parent: null

# Cross-references
linked_sops: []
linked_workstreams: [WS-005-meeting-capture-processing, WS-004-inbox-processing]
linked_guidelines: [GL-001-file-naming-conventions, GL-002-frontmatter-conventions]
linked_my_life: []
linked_session_logs: []
linked_journal_entries: [2026-06-02-samir-creative-assistant-intro]

# Tagging
tags: [automation, meetily, meeting, inbox]
---

# Automate Meetily meeting capture pointers into Team Inbox

## What this is
Build the lowest-friction Mack automation for Alyssa's bot-free meeting capture flow. Meetily should keep raw meeting folders outside the vault, while the automation creates a tiny pointer note in `Team Inbox/Meeting Captures/` whenever a completed recording appears. Daily inbox processing can then turn those pointers into Journal/CRM/Project notes and clean up raw files.

## Context one click away
- Workstreams: [[WS-005-meeting-capture-processing]], [[WS-004-inbox-processing]]
- Guidelines: [[GL-001-file-naming-conventions]], [[GL-002-frontmatter-conventions]]
- First successful manual run: [[2026-06-02-samir-creative-assistant-intro]]

## Success criteria
- New completed Meetily folders are detected without Alyssa manually pasting the folder path.
- A pointer note is created in `Team Inbox/Meeting Captures/` with date, source, raw path, status, and any detected meeting/person label.
- Raw audio/transcript files remain outside myPKA.
- Processed pointers can be cleaned up after the Journal note is written.
- Raw source cleanup supports either immediate deletion after approval or quarantine in `_ready-to-delete`.

## Updates
- 2026-06-02 18:25 (larry) - created after the first successful Samir meeting-processing run.

## Outcome
_(filled when status flips to done)_

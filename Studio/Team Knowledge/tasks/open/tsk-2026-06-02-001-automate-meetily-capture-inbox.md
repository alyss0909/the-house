---
# Identity
id: tsk-2026-06-02-001
title: "Automate Meetily meeting capture pointers into Notebook/Inbox"

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

# Automate Meetily meeting capture pointers into Notebook/Inbox

## What this is
Build the lowest-friction Mack automation for Alyssa's bot-free meeting capture flow. Meetily should keep raw meeting folders outside the vault, while **Daily Meeting Clean** creates a tiny pointer note in `Notebook/Inbox/Meeting Captures` whenever a completed recording appears. The mechanical job should also delete bulky audio/video after 7 days and keep transcripts only as temporary source until processed meeting memory exists. **Weekly Meeting Processing** can then turn those pointers into Journal/CRM/Project notes and task links.

## Context one click away
- Workstreams: [[WS-005-meeting-capture-processing]], [[WS-004-inbox-processing]]
- Guidelines: [[GL-001-file-naming-conventions]], [[GL-002-frontmatter-conventions]]
- First successful manual run: [[2026-06-02-samir-creative-assistant-intro]]

## Success criteria
- New completed Meetily folders are detected without Alyssa manually pasting the folder path.
- A pointer note is created in `Notebook/Inbox/Meeting Captures/` with date, source, raw path, status, cleanup fields, and any detected meeting/person label.
- Raw audio/transcript files remain outside myPKA.
- Audio/video files are deleted automatically after 7 days.
- Transcripts are retained temporarily, then retired only after the meeting pointer is marked processed.
- Processed pointers can be cleaned up after the Journal note is written.
- Raw source cleanup supports either immediate deletion after approval or quarantine in `_ready-to-delete`.

## Updates
- 2026-06-02 18:25 (larry) - created after the first successful Samir meeting-processing run.
- 2026-07-10 11:10 (larry/mack) - updated for house restructure: `Team Inbox` -> `Notebook/Inbox`; added media-delete-after-7-days and transcript-as-temporary-source policy; built `Team Knowledge/Automations/meetily-inbox-prep.ps1` as **Daily Meeting Clean** and dry-run verified it finds 2 completed meetings, 0 missing pointers, and 75.78 MB of old media eligible for deletion.

## Outcome
_(filled when status flips to done)_

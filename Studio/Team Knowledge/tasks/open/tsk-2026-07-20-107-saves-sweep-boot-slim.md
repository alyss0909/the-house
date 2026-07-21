---
# Identity
id: tsk-2026-07-20-107
title: "Slim the /saves-sweep daily boot"

# Ownership & priority
assignee: larry
priority: 3

# Status (mirrors folder location)
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-20T16:00:00Z
updated: 2026-07-20T16:00:00Z
due: null

# Provenance
created_by: larry
source: capture-gap-audit-2026-07-20
parent: null

# Cross-references
linked_sops: [SOP-004-create-task]
linked_workstreams: []
linked_guidelines: [GL-014-the-compounding-architecture]
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [capture-gap-audit]
---

# Slim the /saves-sweep daily boot

## What this is

It loads full METHOD, hook forensics, BUSINESS and FUNNEL every single day. Largest recurring token load in the content lane. Flagged rather than fixed at the time because compaction is what caused the voice bug, so this needs care, not a blunt cut.

Filed 2026-07-20 during the capture-gap audit. This had been committed to but never became a task, which is exactly the leak that audit existed to close.

## Success criteria
- Daily boot cost drops with no loss of voice fidelity in the output

## Updates
- 2026-07-20 16:00 (larry) — created from the capture-gap audit

## Outcome
_(filled when status flips to done — see [[SOP-006-close-task]])_

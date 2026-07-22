---
# Identity
id: tsk-2026-07-20-115
title: "Fix the daily-meeting-clean duplicate defect"

# Ownership & priority
assignee: mack
priority: 3

# Status (mirrors folder location)
status: done
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

# Fix the daily-meeting-clean duplicate defect

## What this is

The automation recreates pointer notes for raw folders that already have processed notes. It did this on 2026-07-17 for two captures already processed back in June, which is why three captures looked unhandled when only one was.

Filed 2026-07-20 during the capture-gap audit. This had been committed to but never became a task, which is exactly the leak that audit existed to close.

## Success criteria
- The automation checks raw_source_path against existing processed notes before writing a pointer

## Updates
- 2026-07-20 16:00 (larry) — created from the capture-gap audit

## Outcome
_(filled when status flips to done — see [[SOP-006-close-task]])_

- 2026-07-21 (mailroom sweep) — Status was already done on the Notion board; file reconciled from tasks/open/ to tasks/done/.

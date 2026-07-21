---
# Identity
id: tsk-2026-07-20-113
title: "Finish the Claude Code config hardening"

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

# Finish the Claude Code config hardening

## What this is

Built and left unwired pending Alyssa's yes, from the 2026-07-16 insights audit.

Filed 2026-07-20 during the capture-gap audit. This had been committed to but never became a task, which is exactly the leak that audit existed to close.

## Subtasks

- [ ] Wire the bash-guard hook (the script already exists at scripts/hooks/bash-guard.py)
- [ ] Confirm the UTF-8 environment line is doing its job
- [ ] Run /fewer-permission-prompts: settings.local.json carries roughly 65 one-off approvals including expired Instagram image URLs

## Success criteria
- Settings hold general patterns rather than a pile of one-time approvals

## Updates
- 2026-07-20 16:00 (larry) — created from the capture-gap audit

## Outcome
_(filled when status flips to done — see [[SOP-006-close-task]])_

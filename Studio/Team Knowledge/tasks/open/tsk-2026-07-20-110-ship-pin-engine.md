---
# Identity
id: tsk-2026-07-20-110
title: "Ship the Pin Engine Blueprint lead magnet"

# Ownership & priority
assignee: mack
priority: 1

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

# Ship the Pin Engine Blueprint lead magnet

## What this is

A finished lead magnet has been unshippable since 2026-07-09 over a two-line change. website/lead-magnets/pin-engine-blueprint.html line 677 still ships data-uid="{FORM_UID}", so the page cannot capture a single subscriber. The Kit connection here can read forms but not create them, so the form itself has to be made in Kit's UI.

Filed 2026-07-20 during the capture-gap audit. This had been committed to but never became a task, which is exactly the leak that audit existed to close.

## Subtasks

- [ ] Alyssa creates the form in Kit and supplies the UID
- [ ] Swap the placeholder and verify a real test signup lands in Kit

## Success criteria
- A test email address submitted on the live page appears in Kit

## Updates
- 2026-07-20 16:00 (larry) — created from the capture-gap audit

## Outcome
_(filled when status flips to done — see [[SOP-006-close-task]])_

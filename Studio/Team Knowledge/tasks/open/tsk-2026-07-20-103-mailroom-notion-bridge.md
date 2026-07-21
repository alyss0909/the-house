---
# Identity
id: tsk-2026-07-20-103
title: "Finish the Mailroom Notion bridge"

# Ownership & priority
assignee: mack
priority: 2

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

# Finish the Mailroom Notion bridge

## What this is

The Cloudflare Worker is written and security-reviewed but has never been deployed, so the Notion mailroom cannot trigger anything. Half-built and parked since 2026-07-17.

Filed 2026-07-20 during the capture-gap audit. This had been committed to but never became a task, which is exactly the leak that audit existed to close.

## Subtasks

- [ ] Deploy the Worker (needs Alyssa's four secrets, the KV namespace id, and the two TODO(verify live) Composio slugs confirmed)
- [ ] Replace the placeholder VOICE_SYSTEM with the Hermes voice block so drafts do not read generic-polite
- [ ] Wire the three Notion Mailroom buttons by hand (UI-only, the API cannot do it)
- [ ] Decide shared-secret versus signed webhook, left open by Vex because Notion automation webhooks are not cryptographically signed

## Success criteria
- A real email in a real inbox produces a real draft through the Notion board

## Updates
- 2026-07-20 16:00 (larry) — created from the capture-gap audit

## Outcome
_(filled when status flips to done — see [[SOP-006-close-task]])_

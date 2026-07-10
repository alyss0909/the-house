---
# Identity
id: tsk-2026-07-10-002
title: "Restore Obsidian back button + scrollbars (lost in earlier formatting pass)"

# Ownership & priority
assignee: larry
priority: 2

# Status
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-10T00:00:00Z
updated: 2026-07-10T00:00:00Z
due: null

# Provenance
created_by: larry
source: chat — Alyssa 2026-07-10 (backburner while vault reorder wraps)
parent: null

# Cross-references
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [obsidian, ui, css, regression]
---

# Restore Obsidian back button + scrollbars

## What this is (Alyssa's words)

"I'm missing my back + scroll down bars after doing a bunch of Obsidian formatting a while back."

## Where to look first

`.obsidian/snippets/hide-ui.css` and `.obsidian/snippets/tabs.css` are the prime suspects — a UI-hiding rule likely swallowed the nav arrows and scrollbars along with whatever it was meant to hide. Diagnose with the CSS toggled off one at a time (Settings → Appearance → CSS snippets), then surgically narrow the offending selector instead of removing the whole snippet. Use the Obsidian CLI screenshot/DOM tools to verify (measure, don't eyeball).

## Success criteria

- Back/forward navigation arrows visible again.
- Scrollbars visible in note panes.
- Everything the hide-ui snippet was *supposed* to hide stays hidden.

## Updates

- 2026-07-10 (larry) — created.

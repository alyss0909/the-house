---
# Identity
id: tsk-2026-07-10-001
title: "Delivery format + clickable links everywhere (terminal AND Obsidian)"

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
linked_guidelines: [GL-013-the-house-rules]
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [delivery, wikilinks, obsidian, ux]
---

# Delivery format + clickable links everywhere

## What this is (Alyssa's words)

"How things are delivered to me, the way things are wikilinked here in the code terminal (so I can open in Obsidian) AND inside Obsidian so I can click and go to the link you're referring to without searching it."

She circled the overnight report where `Notebook/Todos` and git tags appeared as plain code text instead of clickable links.

## The two fixes

1. **In-vault documents (reports, wraps, audits):** every file reference must be a real `[[wikilink]]` (with `|display text` when the path is ugly), never inline-code path strings. Clickable in Obsidian, jumps straight there. Applies to all agents — candidate rule for GL-013 enforcement or the report template.
2. **Terminal replies:** file references should be clickable links; test whether `obsidian://open?vault=the-house&file=...` URIs work from the terminal so she can jump from chat straight into Obsidian.

## Success criteria

- Alyssa never has to search for a file an agent just mentioned — she clicks.
- The rule is written where every report-writing agent loads it (not just remembered).

## Updates

- 2026-07-10 (larry) — created; adopted immediately for new in-vault docs, formal wiring pending.

- Closed 2026-07-16: delivered. Wikilinks rule enforced in AGENTS.md and memories, Open tasks base titles are clickable links, and the vault-links redirector makes vault links clickable from Notion too.

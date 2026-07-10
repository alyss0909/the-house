---
# Identity
id: tsk-2026-06-05-001
title: "Review Semantic Recurrence Layer (SOP-013) and confirm what gets swept"

# Ownership & priority
assignee: alyssa
priority: 2

# Status
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-06-05T00:00:00Z
updated: 2026-06-05T00:00:00Z
due: null

# Provenance
created_by: larry
source: alyssa-feedback
parent: null

# Cross-references
linked_sops: [SOP-013-semantic-sweep]
linked_workstreams: []
linked_guidelines: [GL-002-frontmatter-conventions]
linked_my_life: [pkm]
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [pkm, semantic-layer, ai]
---

# Review Semantic Recurrence Layer (SOP-013) and confirm what gets swept

## What this is

Larry built the Semantic Recurrence Layer without running it past Alyssa first. She wants to review what was built and confirm the sweep themes are actually the signals she wants tracked. This is a content and intent decision — the infrastructure is in place, but Alyssa should sign off on what it watches for.

## What to review

1. **SOP-013** — [[Studio/Team Knowledge/SOPs/SOP-013-semantic-sweep]] — read the 6-step process and confirm it matches how you'd want a sweep to work
2. **Signals Index** — [[Studio/Signals/signals-index]] — this is the seeded list of signal themes. The main question: are these the right things to track? Add, remove, rename as needed.
3. **GL-002 Signal schema** — [[Studio/Team Knowledge/Guidelines/GL-002-frontmatter-conventions]] — a Signal entity type was added. Confirm the fields make sense.
4. **AGENTS.md sweep trigger** — confirms sweeps fire during weekly/monthly/quarterly reviews. Confirm this is the cadence you want or adjust.

## Context

- Built in: [[2026-06-03-22-21_larry_telegram-mvp-and-open-loop-realignment]] (plan) → executed 2026-06-05 by open-loops cleanup agent
- Alyssa's note: "kinda wish I approved that first" — this review is the approval step that should have come first.

## Success criteria

- Alyssa has read SOP-013 and the Signals Index
- Signal themes are confirmed or corrected
- Larry knows whether to adjust GL-002 or AGENTS.md

## Updates

- 2026-06-05 (larry) — created after Alyssa flagged she wanted to review before the sweep runs for the first time

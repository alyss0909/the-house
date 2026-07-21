---
# Identity
id: tsk-2026-07-20-116
title: "Repoint the Hermes lineup paths"

# Ownership & priority
assignee: larry
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

# Repoint the Hermes lineup paths

## What this is

TASTE.md, FABLE.md and MAP.md in Studio/Hermes still describe the lineup as the full originals in Library/Examples/<format>/, which for Carousels is an image folder, not copy. Same trap that was just fixed in the checker.

Filed 2026-07-20 during the capture-gap audit. This had been committed to but never became a task, which is exactly the leak that audit existed to close.

## Success criteria
- [x] Every lineup pointer in the house names a real .md copy source

## Updates
- 2026-07-20 16:00 (larry) — created from the capture-gap audit
- 2026-07-20 (night shift) — done. All three Hermes files repointed. [[Studio/Hermes/TASTE]] gained a carousel exception paragraph under the lineup test. [[Studio/Hermes/FABLE]] lineup-test rule now names the two copy sources inline. [[Studio/Hermes/MAP]] fixed in three places: the Library/Examples territory row, the Carousel/caption recipe row, and the §5 exemplar index (new lead paragraph). All three now state that the dated folders under Library/Examples/Carousels are slide images and never a copy source. Both cited targets verified present: [[Studio/Content/nine-decks]] and [[Library/Examples/Carousels/for-the-girls-slide-copy]].

## Outcome
Complete 2026-07-20. Every carousel lineup pointer in Hermes now names a real .md copy source, and the image-folder trap is called out by name in each file so it cannot be re-introduced by a reader skimming one file. Awaiting Larry's close at session end (see [[SOP-006-close-task]]).

## Outcome

Done 2026-07-20. TASTE.md, FABLE.md and MAP.md now name the two real copy sources ([[Studio/Content/nine-decks]] and [[Library/Examples/Carousels/for-the-girls-slide-copy]]) and state explicitly that the dated folders under Library/Examples/Carousels/ are slide images, never a copy source. Both target files were verified to exist before being cited.

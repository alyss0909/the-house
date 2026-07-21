---
# Identity
id: tsk-2026-07-20-114
title: "Clear the last journal integrity residue"

# Ownership & priority
assignee: penn
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

# Clear the last journal integrity residue

## What this is

The wave-2 fabrication scan did its job. What survived is small and specific, confirmed by a fresh scan on 2026-07-20. All of it is a Notebook write, which is Alyssa's to approve.

Filed 2026-07-20 during the capture-gap audit. This had been committed to but never became a task, which is exactly the leak that audit existed to close.

## Subtasks

- [x] Strip the two agent-written commentary paragraphs from [[2026-06-04-camila-weekly-rhythm]] (third-person 'her' inside her own journal is the tell)
- [ ] Decide the 12 em-dash gloss lines across 6 entries: leave, or reduce to bare links
- [x] Add aliases to peter-yang.md and ruben-hassid.md so display-name wikilinks stop being fragile
- [x] Settle the tall phlox line with git log -L on the flowers entry, since the earlier diff was inconclusive — settled as cannot-be-determined, line left in place

## Success criteria
- No agent-written prose is sitting inside her journal entries unmarked

## Updates
- 2026-07-20 16:00 (larry) — created from the capture-gap audit
- 2026-07-20 (night shift) — three of four subtasks done. [[2026-06-04-camila-weekly-rhythm]]: removed only the two agent-written analysis paragraphs; her raw capture, the Related notes block and the Connections line are untouched. [[Notebook/Life/CRM/People/peter-yang]] and [[Notebook/Life/CRM/People/ruben-hassid]] each gained an `aliases:` block list carrying the display-name form; no other CRM person file has aliases yet, so the block-list style was matched to the `tags:` style already in those files. Tall phlox: git log -L proves the line was blank ("- ") in the 2026-07-09 baseline and was filled in by commit 778ac22, whose own message discloses it swept in pre-existing uncommitted edits from both Alyssa and the night shift. Authorship therefore cannot be determined from git, so the line stays. Supporting detail: the neighbouring delphinium line carries the same parenthetical growing-conditions style and predates that commit, so the style itself is hers. Reverting on suspicion was declined. Em-dash gloss lines left open — that one is a judgment call for Alyssa, not a mechanical fix.

## Outcome
_(filled when status flips to done — see [[SOP-006-close-task]])_

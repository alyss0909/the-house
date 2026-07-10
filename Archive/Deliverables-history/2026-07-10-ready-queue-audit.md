---
title: Ready Queue Audit
date: 2026-07-10
author: silas
source_class: output
status: awaiting-alyssa-decision
---

# Ready Queue Audit — 2026-07-10

Requested by Alyssa ("idk what ready queue is and i have a feeling its redundant"). Audits [[PKM/Second Brain/ready-queue.md]]. Studio opinion, not a ruling.

## 1. What this file's job is

The Ready Queue is the bridge between the idea garden and production: content briefs that passed the taste check, with an assignee and source links, waiting to be dispatched. Created 2026-06-27 by the intelligent-system plan.

- **Who writes it:** Larry only — via [[Team Knowledge/Workstreams/WS-008-content-activation.md]] (the queue's manager) and SOP-013 semantic-sweep flags. Larry keeps it at 3-7 items.
- **Who reads it:** Larry at session start (WS-010 Daily Pulse priority #2), WS-006 weekly review Phase 3 ("The Queue"), and WS-008 dispatch. [[Hermes/SOURCES.md]] explicitly quarantines it (never treated as her voice). [[Team Knowledge/Guidelines/GL-009-source-boundaries-and-promotion.md]] classes "Ready Queue rows" as the `task` class, alongside task files.

## 2. Redundancy map

| Overlaps with | Verdict | Concrete overlap |
|---|---|---|
| [[Team Knowledge/tasks/open]] (task system) | **Structural duplicate home.** GL-009's `task` class lists two homes: `Team Knowledge/tasks/` AND `ready-queue.md`. That is a one-home-per-fact violation baked into the schema. | No current entry duplicates a specific open task file (checked all 21 open tasks) — the duplication is the *mechanism*, not the rows. |
| Weekly pitch sheet ([[Studio/Content/2026-W30-pitch.md]], WS-011 Content OS) | **Functional supersession for content ideation.** The pitch loop now owns idea → react → production for social content. | Item 2 (Email → Carousel standing) duplicates WS-008's own Standing Brief 1 verbatim AND is subsumed by the weekly pitch loop. Item 3 (Hook Framework → 5 carousels) is exactly what Concept Guy + the taste ledger do weekly now. |
| [[Studio/Signals/Developing Ideas/INDEX.md]] (the garden) | **Feeder, not duplicate.** Queue items cite garden theses as source; they don't restate them. | Item 1 draws on [[Studio/Signals/Developing Ideas/middle-ground-entrepreneur.md]] and [[Studio/Signals/Developing Ideas/boh-as-permission-not-product.md]]. Item 5, though, duplicates work the garden already absorbed (see below). |

## 3. Status hygiene (entry by entry)

| # | Entry | Marked | Reality check |
|---|---|---|---|
| 1 | BOH Summer Launch Email Sequence (Hermes) | READY, "Highest" | **Stale.** READY since ~2026-06-27; no draft in Deliverables/ or its archive. Originally a Wren assignment (Wren retired 2026-07-05). Whether the 3-email launch sequence is still wanted is Alyssa's call. |
| 2 | Standing: Email → Carousel (Hermes) | READY | **Redundant.** Duplicated word-for-word as WS-008 Standing Brief 1, and superseded by the WS-011 weekly pitch loop. Close as duplicate. |
| 3 | Hook Framework → Carousel Brief | READY | **Superseded.** Carousel ideation now runs through the weekly pitch sheet. The source ([[Notebook/Journal/2026/04/2026-04-30-hooks.md]]) stays valuable as pitch-loop input. |
| 4 | — | — | **Anomaly:** numbering jumps 3 → 5. An item was deleted without renumbering. |
| 5 | Silas Task: Wikilink Audit | READY | **Looks COMPLETED.** All 7 garden notes now carry journal wikilinks (37 links verified on disk today). No session note confirms who/when, but the deliverable state exists. Move to Done. |
| 6 | Launch Carousel — Recreate (Charta) | BLOCKED | **Stale.** Blocked on a Chrome extension since June; carousel design now happens inside the Content OS production rungs. Archive or re-brief through Suki. |
| 7 | Launch Visual Palette (Charta) | READY | **Stale.** No deliverable found; launch visual work predates the confirmed vault design system and Content OS. Alyssa's call whether the palette pairing is still wanted. |
| 8 | Hook: "You Get What You Get" (Hermes) | READY | **Stale but live-looking.** No draft found. Source [[Notebook/Journal/2026/06/2026-06-26-hook-you-get-what-you-get.md]] exists. Either dispatch through the pitch loop or close. |
| — | Completed table (5 rows) | DONE | Clean. All four linked journal deliverables verified on disk. |

Net: zero queue movement since 2026-06-29, while the task system and the pitch sheet both kept moving. That is the tell.

## 4. Recommendation (two versions per GL-009 Versions Rule)

**Version A — keep and clean (safer).** Ready Queue stays the single content-activation queue. Actions: mark #5 Done; close #2 as duplicate of WS-008 Standing Brief 1; close #3 as superseded by the pitch loop; archive #6; ask Alyssa yes/no on #1, #7, #8; fix the numbering. No wiring changes.

**Version B — dissolve and retire (cleaner schema).** Rows #1, #7, #8 (if still wanted) become task files in `Team Knowledge/tasks/open/`; content ideation lives only in the pitch sheet; the file is retired to Archive. Requires updating the references in AGENTS.md (WS-006 Phase 3, WS-008 triggers, WS-010 Pulse #2, SOP-013 flag target), GL-009's `task` row, and Hermes/SOURCES.md — system wiring, so it needs Alyssa's approval before execution either way.

**My pick as DB architect: B.** GL-009 currently gives the `task` class two homes, which is the exact desync bug GL-013 Rule 3 exists to prevent, and the queue's real job (content ideation → dispatch) was absorbed by the WS-011 pitch loop weeks ago. A queue with zero movement in eleven days while its two neighbors thrive is a dead table; dissolve it into the systems that actually move.

---
title: Phase 0 Structural Reconciliation — Librarian pass
built: 2026-07-05
owner: Librarian (worker pass, not orchestrated)
status: complete
---

# Phase 0 Reconciliation — Librarian

Scope: items 7-12 of the Phase 0 structural cleanup brief, plus the MAP §3 ladder encoding. Every move, edit, and verification below was executed directly — no delegation.

## Files moved

| Old path | New path | Fate |
|---|---|---|
| `Team Knowledge/content-os/README.md` | [[Deliverables/_archive/content-os/README]] | archived |
| [[Deliverables/_archive/content-os/content-evidence-system]] | [[Deliverables/_archive/content-os/content-evidence-system]] | archived (its one live decision — "a missing exact example is not a blocked slot" — promoted into [[Hermes/FABLE]] disciplines section as a one-line rule) |
| [[Deliverables/_archive/content-os/evidence-table]] | [[Deliverables/_archive/content-os/evidence-table]] | archived; its self-referencing `source_rule` wikilink rewritten to point at the new archive path + FABLE.md |
| [[Deliverables/_archive/station-mean-alyssa.agent-draft]] | [[Deliverables/_archive/station-mean-alyssa.agent-draft]] | archived (Alyssa's NO stands; [[Hermes/MEAN-ALYSSA]] is the real gate) |
| [[Deliverables/_archive/station-ws-011-weekly-content-batch.draft]] | [[Deliverables/_archive/station-ws-011-weekly-content-batch.draft]] | archived after folding into WS-008 |

`Team Knowledge/content-os/` (now empty) was removed. `Deliverables/2026-07-05-content-os-brain/` still holds [[Deliverables/2026-07-05-content-os-brain/web-research-steal-list]], untouched (out of scope).

## Files edited

| File | Change |
|---|---|
| [[Hermes/FABLE]] | Added one-line discipline: "A missing exact example is not a blocked slot" (folds the retired content-os evidence-first rule). Bumped `status:` frontmatter to v3 — Phase 0 reconciliation, 2026-07-05. |
| [[Hermes/README]] | Bumped "four parts" section header to note v3 — Phase 0 reconciliation, 2026-07-05. |
| [[Hermes/MAP]] | §7: corrected the `examples/good\|bad` note — `Hermes/examples/good/` and `Hermes/examples/bad/` DO exist on disk (verified: 8 files in good/, 2 in bad/); it is `PKM/Second Brain/examples/good\|bad/` that does not exist. Old line wrongly said both were missing. §3: encoded Alyssa's canonical ladders (Bingeable Newsletters → The 5 Minute Newsletter; Pin Planner → Slowly Viral as upsell class; Promo Planner moved out of the W3 Wed slot row into its own Sales-overlay line, matching the preamble's own "never a week slot" rule it had been contradicting); added the W3/W4-teach-from-source-not-carousel preamble line. |
| [[Studio/Team Knowledge/Workstreams/WS-008-content-activation]] | Added "Weekly batch mode (two touchpoints)" and "Hard halts (never soft-fail)" sections, folding in the WS-011 draft's two-touchpoint structure and hard-halt rules (unverified chat word → HALT/concept-only; GAP never filled by inference; never edit PKM/Second Brain/). |
| [[Deliverables/2026-07-05-vault-learn/learn-pitch-index]] | Item 11 fix: all 24 product "Identity" lines had their literal price/status/chat-word re-typed from BUSINESS.md — replaced with `see [[Hermes/BUSINESS]] row` pointers (keeping Name/Funnel/Theme/URL, which are navigational, not facts). Appendix A (Rush Order price, Geriatric/Sunset prices) and Appendix B (price-conflict numbers, "manual" chat-word list) similarly stripped to pointers at `[[Hermes/BUSINESS]]` / `[[Hermes/MAP]]` §7. Teachable snippets and pitch angles (craft content, not facts) were left untouched. |
| `.claude/agents/wren.md` | Added a retirement banner (frontmatter description + body callout) noting Wren is retired 2026-07-05, superseded by Hermes per FABLE.md rule #6. Contract body preserved for historical reference; new copy work should not route here. |
| `Team Knowledge/tasks/INDEX.md` | Fully regenerated from disk. Was stale since 2026-06-05 (showed 13/15 open with mismatched summary counts). Now matches disk exactly: 17 open (incl. the never-closed `EXAMPLE-tsk-2026-05-10-001`), 0 in-progress, 3 done (all-time; 0 this month), 2 closed, 0 cancelled. |

## BUSINESS.md / MAP §3 contradiction check

No BUSINESS.md row contradicted Alyssa's stated canonical ladders (Bingeable→5 Minute Newsletter, Pin Planner→Slowly Viral, Promo Planner as Sales overlay) — BUSINESS.md's existing funnel-chain rule #4 is silent on those two ladders but doesn't contradict them, so **BUSINESS.md was not edited**. The actual contradiction was in `MAP.md` §3 itself: the W3 Wed row listed "Promo Planner (manual)" as if it were a weekly-slot product, directly contradicting the preamble's own "Sales = event-driven promo overlay... never a week slot" sentence one paragraph above it. Fixed by moving Promo Planner to its own Sales-overlay line beneath the table.

## Mean Alyssa agent file

Confirmed via glob: **no `mean-alyssa` file exists in `.claude/agents/`.** Nothing to flag or delete there.

## Wren staleness sweep (item 12a)

Grepped `Hermes/`, `.claude/agents/`, `Team Knowledge/` (excluding session-logs, Weekly Reviews, Monthly Reviews, and the `Team/Wren...` folder itself, per instruction).

- [[Hermes/README]], [[Hermes/MAP]], [[Hermes/SOURCES]] already correctly quarantine Wren (no fix needed).
- `Team Knowledge/` outside session-logs/reviews: zero matches — clean already.
- [[Studio/Team/agent-index]]: already correctly marks Wren "RETIRED 2026-07-05 — superseded by Hermes." No fix needed (this also confirms the earlier-flagged "Hermes missing from agent-index" bug is already resolved — Hermes has its own row).
- `.claude/agents/wren.md`: the one file that still presented Wren as fully active with no retirement note. **Fixed** (see Files edited above).
- `PKM/Second Brain/ready-queue.md`: checked directly (flagged in an earlier session log as having Wren-assigned items) — zero Wren matches now, already clean.

## Task INDEX verification (item 12b)

Disk counts vs. new INDEX: open 17/17, in-progress 0/0, done 3/3, closed 2/2, cancelled 0/0. Every wikilink in the new INDEX resolves to a real file in its stated folder (verified against the `ls` listing used to build it). Flagged inline: [[Studio/Team Knowledge/tasks/open/EXAMPLE-tsk-2026-05-10-001-welcome-to-tasks]] is a scaffold seed task that self-instructs "read this and then close me" but has sat open since 2026-05-10 — left as-is (disk-accurate) since closing tasks is a destructive action outside this Librarian pass's scope; noted for Alyssa/Larry.

## TASTE lineup pointers (item 12c)

Verified on disk: `Hermes/examples/good/` (8 files) and `Hermes/examples/bad/` (2 files) exist; `PKM/Second Brain/examples/good/` and `.../bad/` do not. [[Hermes/SOUL]], [[Hermes/STYLE]], [[Hermes/TASTE]], [[Hermes/LEARNING]], and the `craft/` files already pointed at the correct existing `Hermes/examples/...` path — no fix needed there. Only `MAP.md` §7 had it backwards (said both didn't exist); corrected to name precisely which path is missing (`PKM/Second Brain/examples/good|bad`) vs. which exists (`Hermes/examples/good|bad`). The "until she names gold standards" caveat is preserved — no gold standards were invented.

## Link resolution check (mandatory final grep)

Grepped `Hermes/` and `Team Knowledge/` for references to all five moved files:

- `Team Knowledge/content-os` path references outside session-logs: zero remaining (the folder is gone; only my own FABLE.md line cites the retired file by name as provenance, which is a historical citation, not a live navigational link/promise).
- `station-mean-alyssa` / `station-ws-011-weekly-content-batch` references in `Hermes/` or `Team Knowledge/`: zero.
- Also checked `Deliverables/` (broader than the mandatory scope): three older diagnostic/analysis files ([[Deliverables/2026-07-05-0655-vault-automation-analysis]], [[Deliverables/2026-07-05-root-cause/dup-register]], [[Deliverables/2026-07-05-vault-learn/learn-system-state]]) still name the old `Team Knowledge/content-os/` path as part of their own historical bug-finding narrative. These are audit-trail documents describing a past state, not live navigation — left untouched, same treatment as session-logs. Flagging here rather than silently deciding it doesn't matter.

## Needs Alyssa

None generated by this pass. (The pre-existing open decisions — price conflicts, PIN vs Pinterest, manual chat words — already live in [[Hermes/MAP]] §7 and were not touched or resolved here, per "hers to call.")

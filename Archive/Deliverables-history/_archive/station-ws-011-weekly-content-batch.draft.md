# DRAFT — destination: `Team Knowledge/Workstreams/WS-011-weekly-content-batch.md` (needs Alyssa approval to install)

---
title: WS-011 — Weekly Content Batch
type: workstream
owner: Larry
participants: test-kitchen pitchers (subagents), mean-alyssa, hermes, the pass (Larry)
cadence: weekly (or monthly in batch mode — 4 weeks in one run)
prerequisite: Hermes/FABLE.md loaded FIRST by every participant
status: draft-v1
---

# WS-011 — Weekly Content Batch

Runs one theme week (or a full month) of content end-to-end with exactly two Alyssa touchpoints. Any capable model can orchestrate this if it loads the Fable Brain first. This workstream is the wiring; all judgment lives in [[Hermes/FABLE]] and the files it indexes.

## Phase 0 — Slot resolution (orchestrator, 2 min)

1. Determine week-of-month → theme via [[Hermes/MAP]] §3 (W1 Email / W2 Pinterest / W3 BoH / W4 Productivity).
2. Pull the week's 3 slots (Mon Edu / Wed Offer / Fri FTG) from [[Hermes/MAP]] §3: freebie, product, chat word, BOH module, exemplar, snippets.
3. **Halt condition:** if the slot's chat word is "manual selection needed" or the product has a flagged conflict, the slot ships as concept-only and the missing item goes in the For Alyssa block. Never invent, never delay the rest of the batch.
4. Check [[Studio/Signals/signals-index]] + recent journal for a live seed (a real moment beats a cold slot-fill).

## Phase 1 — Test Kitchen (4-6 parallel subagents, Sonnet/Haiku)

Spawn 4-6 pitchers with FORCED divergent personas — the Historian, the Contrarian, the Scroller, the Obsessive, the Bestie (+1 wildcard). Each prompt is self-contained: worker-not-orchestrator instruction, FABLE + MAP load, the slot's relations slice. Each returns per slot: concept (2 sentences) + hook (verbatim slide-1 line) + comment word (from MAP §3 only) + which snippet it teaches + which exemplar spine it rides.

Divergence check before gating: if two pitches share a skeleton, kill one and re-pitch from a different premise.

## Phase 2 — Mean Alyssa gate (Sonnet minimum)

Full protocol per her agent file: blind score → ANTI-AI senior pass → red-flag sweep → tournament. Periodically the orchestrator plants a known-bad decoy; if she praises it, bench and rebuild her before trusting the batch.

Output: P3 survivors ranked, P0-P2 casualties with one-line causes.

## Phase 3 — TOUCHPOINT 1: Alyssa reacts (10 min)

Present ONLY the top 2-3 survivors per slot: concept + hook + comment word. One message, no walls of text. She picks/edits/kills. No copy is written before her pick.

## Phase 4 — Sous Chef teach-pass (Sonnet)

For each picked concept: open the slot's BOH module file (per relations-map), extract the REAL lesson, shape it as one-nuance-then-gap using the product's approved snippet from the product's Offers/ file (via MAP). Output: teaching brief (the nuance, the proof detail, the gap line direction) — not copy.

## Phase 5 — Hermes writes (the only writer)

Hermes runs his own full protocol per `.claude/agents/hermes.md` with the teaching brief + slot spine from the slot's exemplar analyses (via MAP §5). Then self-runs ANTI-AI final pass + lineup test vs `examples/good/`. Any lineup failure = rewrite before it ever reaches Alyssa.

## Phase 6 — The Pass (orchestrator packaging)

Per slot: slide-by-slide spec + caption + chat word (re-verified verbatim or HALT that slot) + Simmer/email variant where the calendar calls for it + pin titles/descriptions feeding the 7×10×4×5 layer.

## Phase 7 — TOUCHPOINT 2: Alyssa reviews finals

One sitting. Her corrections are logged verbatim to [[Hermes/learning/inbox]] (the self-improvement loop). Recurring corrections get a graduation proposal into ANTI-AI/TASTE — proposal only, she approves.

## Weekly stats loop (when wired)

Kit/IG metrics flow back → winners promoted as exemplars in the codex, rubric weights recalibrated. Until Mack wires the automation, this is a manual note in the weekly review.

## Hard halts (never soft-fail)

- Unverifiable chat word → slot ships concept-only.
- Hermes lineup-test failure twice → escalate model tier, don't ship the third try silently.
- Mean Alyssa passing >1/3 of a batch → recalibrate her before continuing.
- Any need to edit `PKM/Second Brain/` → stop; that never happens.

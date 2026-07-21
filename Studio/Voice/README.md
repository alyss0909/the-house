---
name: Voice Layer
type: house-layer
ruling_date: 2026-07-10
description: House-level voice layer. Every agent loads this before writing or answering in Alyssa's voice, not just content agents.
---

# Voice

This is a house-level layer, not a content-desk tool. It exists because Alyssa ruled on 2026-07-10 that voice is not owned by Hermes, the content-desk writer. Voice belongs to the whole house. Every specialist who writes copy or answers a question in Alyssa's voice loads this folder first, whether that specialist works on content, email, sales pages, a Notion deliverable, or a plain chat reply that speaks as her.

This implements Option 2 from [[Archive/Deliverables-history/2026-07-10-voice-cards-on-the-table]]: examples-first. Her full real writing is the primary source. Rulebooks are demoted to an editing pass that runs after a draft already exists, not the thing you write from.

## The rule

Before writing or answering in Alyssa's voice, load [[Studio/Voice/README]] (this file), then the relevant file in [[Studio/Voice/formats]] for the format you're writing. Write toward her real examples first. Run [[Studio/Voice/KILL-LIST]] as the last pass, after a draft exists, not before.

## Authority order

1. **Her real published examples come first.** [[Library/Examples]] holds the primary source: real sales emails, Simmers, Soft Sundays, sales pages, carousels, and website copy she actually shipped. You write toward these. See the format-by-format breakdown in [[Studio/Voice/formats/README]].
2. **The kill list is the editing pass, run after a draft exists.** [[Studio/Voice/KILL-LIST]] is not a writing guide. It is a checklist you run against a finished draft to catch AI tells: banned reframe shapes, banned vocabulary, punctuation rules, and the rule-priority order. It is sourced from [[Hermes/ANTI-AI]], which is itself built from Alyssa's own journal words, not from AI inference about her.
3. **Everything in [[Hermes]] and [[Studio/Analysis]] is downstream reference, not authority.** Those folders hold prior analysis, judgment rules, and voice research built up over earlier phases of the project. They stay useful as reference material and historical context, but they no longer sit above the real examples in [[Library/Examples]]. When a rule in Hermes or Studio/Analysis conflicts with what her real examples actually show, the real examples win.

## Published is not approved

Provenance never overrules the tells. Judge every draft against [[Studio/Voice/KILL-LIST]] even when the source material is (or reads as) her real published work — the corpus contains at least one piece she later flagged as too-AI after it shipped ([[Library/Examples/soft-sundays/me-i-need-ideas-i-already-had]], a calibration miss caught in [[Hermes/MEAN-ALYSSA]]). Don't treat every file in [[Library/Examples]] as automatically safe to imitate wholesale just because it's in the examples-first folder — read it, and still run the kill list.

If a format genuinely has no real example yet in [[Library/Examples]], the answer is to ask Alyssa, never to invent a register for her. See [[Hermes/MEAN-ALYSSA]] for the full verdict vocabulary this gate runs on.

## Not yet wired

Two decisions are waiting on Alyssa and Larry before this layer is fully load-bearing across the house:

- **Whether [[AGENTS.md]] gets a mandatory-load rule for [[Studio/Voice/README]]**, so every specialist is required to load this layer before writing or answering in Alyssa's voice, not just the ones who happen to remember to check.
- **The gap audit against this layer is written and unmerged.** [[Deliverables/2026-07-10-voice-metabolization-audit]] compares this layer against the old Hermes brain it was meant to digest and finds roughly 55 real, Alyssa-derived rules that never made it across (the format files are a fraction of the depth in the matching `Studio/Hermes/craft/` files). It is marked REPORT ONLY — nothing was edited to produce it, and nothing has been merged from it since. Anyone deepening a file in [[Studio/Voice/formats]] should read its MISSING queue first rather than re-deriving the same rules from the corpus.
- **Whether the redundant [[Studio/Analysis]] voice files** (voice-profile, voice-archive, writing-style) **get archived** now that this layer exists and holds the examples-first source of truth. Nothing in Hermes or Studio/Analysis has been touched, moved, or deleted this pass. Both stay exactly where they are until Alyssa says otherwise.

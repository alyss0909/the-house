---
name: Hermes v2 Handoff — Gate 3 failed, rebuild the writing layer
type: handoff
date: 2026-07-05
owner: Larry
status: ready
---

# Hermes v2 — continuation handoff (fresh session, start here)

## State

`Hermes/` exists at vault root (SOUL, STYLE, TASTE, MEMORY, BUSINESS, LEARNING, SOURCES, README, craft/ ×9, examples/good ×8 + bad ×2, tests/). Built 2026-07-05 from tier-1 extraction; Gate 1 passed; Gate 2 passed its own rubric **but Alyssa FAILED Gate 3 outright**: "id NEVER publish anything in the e-gate2 outputs literally none you failed." Her corrections are logged verbatim in `Hermes/learning/inbox.md` (2026-07-05 block) — READ THAT FIRST, it outranks everything.

Build artifacts (extraction reports, Kit/Notion pulls, gate outputs) live in scratchpad `hermes-build/` from the prior session: A1-A4 extractions, B-claims, C-synthesis, kit-evidence, notion-products-snapshot, E-gate1/2 files. The scratchpad may be gone in a new session — everything essential was already folded into Hermes/ files; the Notion snapshot is in BUSINESS.md.

## Root-cause diagnosis (own this, don't repeat it)

1. **The writer wrote from the brain's excerpt files instead of full tier-1 originals.** The brain must be a thin JUDGMENT + ROUTING layer that FORCES deep-loading her actual Second Brain files per task ("the goal is to USE MY ACTUAL SOURCE MATERIAL MORE not dumb me down"). SOURCES.md depth-recipes existed but were optional; make them MANDATORY in README recipes: no draft is written until the full relevant originals are in context (e.g., a Simmer task = read ALL 3 real simmers end-to-end + the BOH Simmer transcript, not excerpts).
2. **No anti-AI-slop pass.** She says "there are tonnes of skills that prevent this" — check the user-invocable skills directory in the session and any vault skill folders (`.claude/skills/`, `.agents/skills/`) for writing/anti-AI skills and run them on every draft. Also hard-ban known LLM tells: parallel-negation triads ("It's not because X. It's not because Y. It's because Z."), em-dash explainer cadence, "quietly/silently doing X" personification stacks, tidy triadic escalation, rhetorical-question openers followed by self-answer.
3. **Judgment misses**: "The Reheat Weekend" violates soft-CEO values (SHE NEVER WORKS WEEKENDS — nothing that puts her or buyers into weekend/always-on work). Norah's name went into subject lines (NEVER — family texture is body-copy only, sparing). Subject lines too long (audit her real Kit winners: most are 2-6 words; encode a hard length cap ~35-40 chars).
4. **Carousel layer built from summaries, not her actual slide-by-slide breakdowns.** Rebuild `craft/captions-carousels.md` slide guidance directly from `PKM/Second Brain/analysis/carousel-slide-by-slide.md` (read fully) + hooks from `PKM/Second Brain/frameworks/social-hooks.md` + real captions file. Verify against the actual slide image folders where possible.

## The work (in order)

1. Read `Hermes/learning/inbox.md` + this doc. Run the LEARNING.md distillation: fold every correction into STYLE/TASTE/craft/BUSINESS within token ceilings (new hard rules: no-weekend-work offers; no Norah in subjects; subject-length cap; banned LLM constructions list in TASTE.md "too AI tells").
2. Restructure README recipes: every writing task REQUIRES full tier-1 source loading (name the exact files per format); brain files are the judge/index, the vault is the writer's diet. This answers her question directly: **yes, Hermes uses the Second Brain live — that's the whole design.**
3. Rebuild the carousel craft from her real slide-by-slide analysis + hooks framework (read them fully this time; they're tier-2 navigation but the slide breakdowns quote her actual slides = usable).
4. **Build the Hermes agent**: `.claude/agents/hermes.md` — a subagent whose protocol is: load Hermes core → MANDATORY deep-load of tier-1 originals per task → write → self-score against TASTE + anti-slop skill → only then return. This is the "when do you build the hermes agent" answer: now. Keep it fully separate from Wren.
5. Rerun Gate 2 with the new protocol (4 acceptance tests + probes). Bar: not the rubric — the bar is "would survive being read next to her real copy by someone who knows her." Use the lineup test AND an explicit LLM-tell scan. Then present to Alyssa for Gate 3 again with outputs shown unlabeled next to real copy.
6. Log everything to `Hermes/tests/results/` and `learning/log.md`.

## Standing constraints (unchanged)

Never invent product facts/chat words (BUSINESS.md; Notion canonical). Never train on quarantined files (SOURCES.md). Wren untouched/ignored. Token ceilings hold. Her corrections beat every rule. Model routing per Alyssa: Opus orchestrates, Sonnet executes, Fable for strategy/architecture/thorny judgment.

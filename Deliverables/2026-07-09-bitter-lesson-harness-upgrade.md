---
title: Bitter Lesson Engineering — myPKA Harness Audit & Upgrade Plan
type: deliverable
author: Larry (audit + plan), for Alyssa
created: 2026-07-09
status: awaiting-Alyssa-approval (per feedback rule — approve before execute; no wiring changes until she says go)
scope: entire harness — AGENTS.md, SOPs, Guidelines, Workstreams, agent shims, Hermes brain, dashboard pipeline, /loop
---

# Bitter Lesson Engineering — Harness Audit & Upgrade Plan

**Handoff note:** This file is self-contained. Any model or specialist picking it up can execute a phase without this conversation's context. Read §1 for the principle, §2 for the findings, §3 for the plan, §4 for the standing rule.

---

## 1. The principle (Sutton's Bitter Lesson, applied to harnesses)

Richard Sutton's 2019 essay, from 70 years of AI history: **methods that encode human knowledge about *how* to do a task win short-term and lose long-term.** General methods that leverage more computation (search and learning) eventually crush hand-built knowledge — chess, Go, speech, vision, every time. Worse, the hand-built knowledge becomes a *ceiling*: it hard-codes yesterday's understanding of what the machine can't do.

For an AI harness like ours, the violation patterns are:

| Pattern | What it looks like here |
|---|---|
| Process scaffolding | Step-by-step SOPs for things the model does natively |
| Format contracts | Exact string formats + regex parsers between model-written stages |
| Baked-in decomposition | Fixed pipelines of narrow roles the model must pass work through |
| Resource micromanagement | Token budgets / load-order rules tuned to one model's context window |
| Frozen environment facts | "X doesn't work here (verified <date>)" woven into permanent design files |

**The counter-lesson — what to KEEP.** Sutton is not "delete everything human." The layers that survive every model upgrade, and get MORE valuable as models improve:

- **Goals** (comments → ManyChat → list; saves→sends)
- **Facts** (BUSINESS.md — prices, chat words, live/banned offers)
- **Taste** (taste ledger, Alyssa's reacts, Mean Alyssa gate, examples/)
- **Data** (tier-1 source originals; map-don't-digest)
- **Gates** (approval marks, Vex on installs, no-write-before-approval)

It's the *choreography* — the how — that rots. Durable layers get written tight and permanent. Method layers get written as **dated defaults with escape hatches**.

## What this harness already gets right (do not touch)

- Plain-markdown, portable, SSOT, one-home-per-fact — the substrate outlives every host and model.
- Hermes data layer: SOURCES.md tier-1 originals, examples/, LEARNING.md, "verbatim tier-1 beats any rule here."
- The gates: Mean Alyssa, Vex, Alyssa's approval marks, plan/approve gates in WS-002/WS-003.
- Map-don't-digest ruling (2026-07-05) — itself a Bitter Lesson call.

---

## 2. Audit findings — where we violate it (ranked by blast radius)

### Tier 1 — Load-bearing brittleness

**V1. Pipeline contract is a regex parser pretending to be a protocol.**
`dashboard/PIPELINE-CONTRACT.md` demands EXACT section headers, `✓` prefixes, `[approved]` suffixes, verbatim title string-pairing. `dashboard/advance-watch.mjs` is 367 lines of hand-written parsing to detect what a model reading the sheet sees instantly. The contract documents its own failure: 2026-07-09, a maker wrote "substance arcs" instead of "slide skeletons" and the dash went blank. The approval *semantics* (concept approved → build arc) are durable; the string *format* is not.

**V2. Maker prompts frozen inside JavaScript.**
`arcPrompt()` / `draftPrompt()` in advance-watch.mjs duplicate the makers' contracts verbatim — an SSOT violation and a Bitter Lesson violation. When Cass/Hermes improve, the JS copy silently doesn't. Cycle-specific business facts ("Pinterest is the chat word this cycle") are hard-coded in permanent process files (loop.md, the contract).

**V3. GL-007 token discipline is a spec for a smaller model.**
Hard-codes: max 4 files/task, mandatory load orders ("voice-profile.md first, every time" — STALE: contradicts the 2026-07-05 Hermes ruling demoting analysis voice docs), per-file-type line ceilings, "message 30 costs 30×," /compact cadence. Every number is tuned to one model's window and pricing circa mid-2026. Principle (no speculative loading) is fine; arithmetic is a ceiling. It also contradicts Hermes' "full originals END TO END" rule.

### Tier 2 — Structural over-decomposition

**V4. The four-rung content ladder is mandatory, not default.**
Angus (concept) → Reeve (hook) → Cass (arc) → Hermes (draft), each with agent file, SOP, gate, exact handoff format, and routing rules that FORBID crossing rungs. This decomposition helped; it is also exactly "building in how we think the task should be broken up." A stronger model may write a better carousel holding concept-through-copy in one head. The current architecture forbids ever discovering that.

**V5. SOP proliferation for native capabilities.**
SOP-021→027 (transcribe audio/URL, webpage-to-text, image/PDF/document conversion, OCR, metadata strip) are procedures for things models increasingly just do. SOPs encoding Alyssa's decisions (SOP-037 Mean Alyssa gate, SOP-038 strategy brief) are durable; SOPs encoding tool mechanics are depreciation on legs.

**V6. Trigger-phrase tables in AGENTS.md.**
Four tables, ~80 lines, enumerating literal phrasings ("wrap up," "import my [tool] export," "install the [X] Expansion") — intent-recognition scaffolding for a model that couldn't be trusted to recognize intent. Current models can. Costs startup tokens every session.

### Tier 3 — Frozen environment assumptions

**V7. "No headless claude (verified 2026-07-09)" baked into three permanent files** (loop.md frontmatter, advance-watch.mjs header, RUN_MODE constant). Environment facts belong in ONE dated place with a re-verify instruction. Note: the current Claude Code harness exposes scheduled/cron cloud-agent tools — the "Larry IS the loop because no daemon can run" premise may already be obsolete.

**V8. AGENTS.md accretion + hand-built priority algorithms.**
348 lines and growing via special-case sections (Daily Pulse's 5-item priority order, Semantic Sweep mechanics) that are really "Larry, use judgment about surfacing what matters" — hand-crafted algorithms for what a good model does better by reading recent state.

---

## 3. The upgrade plan (phased; each phase independently shippable)

Organizing principle: **separate durable layers (goals, facts, taste, state, gates) from the disposable layer (process); make every process rule advisory-with-an-escape-hatch.** Then model improvements are absorbed automatically instead of requiring rewrites.

### Phase 1 — Loosen the pipeline contract (highest ROI, ~1 session)
1. Recast PIPELINE-CONTRACT.md as **semantic, not syntactic**: newest pitch sheet = state machine; each post at one of four stages; Alyssa's mark advances it. Block formats become *recommended* rendering shape, not validity conditions.
2. Replace advance-watch.mjs's parser role with a **model read**: /loop step 1 = read the sheet, list pending advances. Format drift becomes impossible to break on; the model normalizes drift instead of failing. Keep a thin mechanical detector only if Obsidian dash rendering truly requires exact headers.
3. **Delete `arcPrompt`/`draftPrompt` from the JS.** /loop dispatches Cass and Hermes pointing at their own agent files + the sheet. One home per contract.
4. Move cycle-specific facts (live chat word, banned CTAs) to `Hermes/BUSINESS.md` only; process files say "check BUSINESS.md."

### Phase 2 — GL-007 rewrite (~half session)
Replace with ~30 lines of principles: load what the task needs, nothing speculative; prefer entry points; **full originals override thrift for voice work** (resolves the Hermes contradiction); any specific number (file caps, message counts, line ceilings) is a benchmark to re-measure on model upgrade, not a law. Fix the stale voice-profile.md load order per the 2026-07-05 ruling.

### Phase 3 — Ladder becomes a default, not a law (~1 session, needs Alyssa's taste)
Keep the four rungs as the default — the inter-rung gates are where her taste enters; that's durable. Add one clause to GL-010/GL-012: **Suki may run a fused pass** (one maker, concept→copy) on a subset of posts as an experiment, judged by the same gates and her reacts. If fused wins her approvals, the ladder shortens itself. Her reacts become the training signal for *architecture*, not just copy.

### Phase 4 — Slim the process surface (~1 session)
1. Collapse SOP-021→027 into one dated "capability notes" Guideline (tool quirks discovered here, dated, re-verify before trusting).
2. Compress the four AGENTS.md trigger tables to one paragraph each: intent → workstream → hard gates (gates stay — no-write-before-approval is durable). Recovers ~80 lines of session floor.
3. Fold Daily Pulse / Semantic Sweep sections in AGENTS.md down to goal statements + escalation gates ("never graduate/dismiss a signal without Alyssa"); drop the hand-built priority algorithms. Full SOPs remain as reference.

### Phase 5 — Date-stamp environment assumptions (quick)
New `GL-0XX-environment-facts.md`: no-headless-claude (2026-07-09), Obsidian buffer-flush race, binary-path gotchas — each dated, each with a re-verify instruction. loop.md and advance-watch.mjs point at it instead of embedding rationale. **First task under the new rule:** re-verify the no-daemon premise against the harness's scheduled-cloud-agent tools.

---

## 4. The standing rule (install as GL-0XX Bitter Lesson Engineering, ~20 lines)

Every future SOP / Workstream / contract / agent file is checked against:

1. **Goal, fact, taste call, or gate?** → Permanent layer. Write it tight; it appreciates with model quality.
2. **Method?** (how to decompose, what format, what order, how many files) → Write as a *default with an escape hatch*. Date it. Note which model limitation motivated it — so when that limitation dies, the rule visibly expires.
3. **Never write a parser where a reader will do.** Exact-match string contracts are a last resort for machine-to-machine only, never model-to-model.
4. **Model-tuned numbers are benchmarks, not laws.** Token budgets, context caps, message counts, file limits — re-measure on every model upgrade.
5. **Environment claims carry a date and a re-verify instruction.** "X doesn't work here" expires.

---

## Execution notes for whoever picks this up

- Recommended order: Phase 1 first (fixes the thing that actually broke 2026-07-09), then 5 (cheap), 2, 4, 3 (needs Alyssa in the loop for the fused-pass experiment design).
- AGENTS.md and sweep-behavior changes require Alyssa's show-and-tell approval before execution (standing feedback rule).
- Do NOT touch the keep-list in §1: Hermes data layer, gates, SSOT, markdown portability.
- Log each phase to `Team Knowledge/session-logs/` and update `Team Knowledge/Guidelines/INDEX.md` when the new GLs land.

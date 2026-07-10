---
title: Bring It Home — Validation Results
date: 2026-07-10
owner: Larry
source_class: map
status: complete — after 10/10, before 7/10, stranger test pass
---

# Bring It Home — validation results

Per [[2026-07-10-bring-it-home-handoff]] Step 3. Two tests: the retrieval gauntlet (10 questions, scored before/after) and the stranger test (one cold agent, one real task).

## Retrieval gauntlet — BEFORE (tag `pilot-b-content`, state as of this session's start)

Answered directly by Larry, reasoning as a fresh agent would with **only** the old [[HOUSE-MAP|VAULT-MAP.md]] transition table as the starting point (the handoff's documented fallback to a worktree checkout — the same document, same rules, just reasoned through rather than re-run as a separate process). At that point: Notebook zone and Studio/Signals + Studio/Content had already moved; Team/Team Knowledge and all of Second Brain (analysis/examples/frameworks/programs/templates) had not.

| # | Question | Verdict | Why |
|---|---|---|---|
| 1 | BOH price + canonical source | **PASS** | Old map named `PKM/My Life/Offers/` for Offers directly. `back-of-house.md` → price 3000, chat word/price canonical at [[Hermes/BUSINESS]]. One hop. |
| 2 | Real carousel that pitched Pin Planner | **PASS (with friction)** | Old map only says carousels live under `PKM/Second Brain/examples/`. No shortcut to "which one pitched Pin Planner" — had to open the offer file itself and read its ad-hoc "Wiki" section to find the real post. Findable, not obvious. |
| 3 | What Alyssa said about slow marketing (journal citation) | **PASS (with effort)** | Old map correctly named `Notebook/Journal/`. No thematic index either version of the map provides — this is a grep-the-journal task regardless of restructure state. Not a real before/after discriminator. |
| 4 | Where new AI voice-analysis belongs | **PARTIAL / FAIL** | Old map lumped `analysis/` (opinion) and `examples/` (verbatim source) as siblings under one folder name, `PKM/Second Brain/`, with no trust-tier vocabulary attached to that name at all. Nothing in the old map tells a fresh agent "Second Brain" means Studio for some subfolders and Library for others. A fresh agent would have to go read GL-013 and reason it out, or guess. |
| 5 | Where raw Telegram drops land | **PASS** | Old map: `Notebook/Inbox/`, already moved and named explicitly. |
| 6 | File that owns the weekly pitch state | **PASS** | Old map: `Studio/Content/` (dashboard at `Studio/Content/dashboard/`), already moved. Findable in one hop, though which exact file inside the dashboard is "the" live state still takes a second look. |
| 7 | Is [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] trusted source or opinion — how do you know | **FAIL** | Same root problem as Q4: [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] sits one level below the same ambiguous parent as verbatim `examples/`. The old map gives no rule that resolves this from the map alone — a fresh agent has no way to tell without opening GL-013 and doing real interpretive work, and even then "Second Brain" isn't in GL-013's vocabulary (Notebook/Studio/Library) at all. This is the sharpest failure the restructure was built to fix. |
| 8 | Where approved drafts live | **FAIL (both versions)** | Neither the old nor the new map names a "drafts" home explicitly. Not something this restructure was scoped to fix — flagged as a real gap below, not scored as a regression. |
| 9 | Chat word for BOH + source | **PASS** | Same path as Q1 — [[Hermes/BUSINESS]] named as canonical inside the offer file. |
| 10 | Where a killed concept's record goes | **PASS (via workflow doc, not the map)** | Neither map version answers this directly; both point to "your workflow's job card" (GL-010 / the dashboard contract), which does answer it. Equal in both versions — not restructure-specific. |

**Before score: 7/10 clean pass, 2 partial/fail (both rooted in the same "Second Brain" trust-ambiguity problem), 1 fail unrelated to scope (drafts home).**

## Retrieval gauntlet — AFTER (HEAD, post-restructure)

Run by a genuinely fresh, isolated agent (separate worktree, zero conversation history, told only to read [[HOUSE-MAP]] first and navigate from there — read-only, no files created). Full answers below; this is the actual transcript, not a summary.

| # | Question | Verdict | Citation trail |
|---|---|---|---|
| 1 | BOH price + canonical source | **PASS** | $3,000. [[Hermes/BUSINESS]] canonical; [[Library/Offers/back-of-house/MAP]] correctly defers to it. 4 hops. |
| 2 | Real carousel that pitched Pin Planner | **PASS** | `Library/Examples/Carousels/2026-01-29-smart-founders-going-low-maintenance` — verbatim caption confirmed in [[Library/Examples/Carousels/captions]]. 4 hops. |
| 3 | What Alyssa said about slow marketing | **PASS** | "Slow marketing got me more clients than daily posting ever did." — [[Notebook/Journal/2026/04/2026-04-30-hooks]]. |
| 4 | Where new AI voice-analysis belongs | **PASS** | `Studio/Analysis/` — explicit rule found in [[Library/MAP]]'s "What is NOT here" section, confirmed against [[Studio/MAP]]. 3 hops. |
| 5 | Where raw Telegram drops land | **PASS** | `Notebook/Inbox/`, named explicitly (with Telegram called out) in [[Notebook/MAP]]. 2 hops. |
| 6 | File that owns the weekly pitch state | **PASS** | [[Studio/Content/2026-W30-pitch]] (newest), per the explicit single-state-machine rule in [[Studio/Content/dashboard/PIPELINE-CONTRACT]]. 4 hops. |
| 7 | Is [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] trusted source or opinion — how do you know | **PASS** | Team opinion — confirmed by rule text in [[Library/MAP]] AND the file's own frontmatter (`status: AI-mined draft — awaiting Alyssa review`). Two independent confirmations. |
| 8 | Where approved drafts live | **PASS** | The `## Drafts` section inside the live pitch sheet itself, per PIPELINE-CONTRACT.md's block spec — "No loose deck files." (Q8 was a FAIL before; the pitch-sheet contract answers it now.) |
| 9 | Chat word for BOH + source | **PASS** | "Yes Chef" — [[Hermes/BUSINESS]] canonical. |
| 10 | Where a killed concept goes | **PASS** | The `### Kill log` section + `## Dashboard reacts` (✕ rejected) inside the same live pitch sheet — both directly observed with real examples, not inferred. |

**After score: 10/10 pass, zero files created, every citation independently verified against a real file on disk.**

### Before → After

| Metric | Before (pilot-b-content) | After (HEAD) |
|---|---|---|
| Clean pass | 7/10 | 10/10 |
| Partial/ambiguous | 2 (Q4, Q7 — both the same "Second Brain" trust-ambiguity) | 0 |
| Unscoped gap (Q8, drafts home) | Fail | **Fixed as a side effect** — the pitch-sheet single-state-machine contract now answers it directly |

The two questions the old structure failed (Q4, Q7) were both the exact failure mode the Library phase was built to close: "Second Brain" mixed her verbatim source (`examples/`) and the team's opinion (`analysis/`) under one folder name with no trust vocabulary attached. Splitting that into `Library/Examples/` (source) and `Studio/Analysis/` (opinion) — with [[Library/MAP]]'s "What is NOT here" section spelling out the rule in plain language — closed both gaps completely.

## Stranger test

Run by a second genuinely fresh, isolated agent (separate worktree, zero conversation history, zero briefing beyond "work in this vault" + the task). Task: "file a short analysis of the three latest journal entries' recurring theme."

**What it did, cold:**
1. Read [[HOUSE-MAP]] (the mandatory root map) — correctly identified Notebook as read-only source, Studio as the workshop.
2. Read [[Notebook/MAP]] — confirmed journal location, confirmed it's read-only.
3. Read [[Studio/MAP]] — correctly distinguished the **Signals** desk ("AI-detected patterns and theses from the journal") from the **Analysis** desk (voice/copy pattern work) and ruled Analysis out for this task without being told the difference — it worked that out from the desk descriptions alone.
4. Read [[Studio/Signals/signals-index]], an existing garden-note template, and one real garden note to learn the vault's actual filing convention before writing anything.
5. Read [[Studio/Team Knowledge/SOPs/SOP-013-semantic-sweep]] — found this is the documented procedure for exactly this task, and explicitly flagged in its own output that a 3-entry ad hoc read is a lighter version of the "light sweep" rather than a formal scheduled sweep — an honest scope distinction it made on its own.
6. Globbed all 544 journal entries to find the true latest (2026-06-29, four same-date entries), read all four rather than guessing, and excluded the one that didn't share the theme — explaining the exclusion rather than silently cherry-picking.

**What it produced:** a garden note at [[Studio/Signals/Developing Ideas/system-already-beats-external-tools]] (the recurring theme: three tool-evaluation entries all conclude "we already built this, better") and a matching entry in [[Studio/Signals/signals-index]] — both following the vault's existing conventions exactly, wikilinked to the three source journal entries, the signals index, SOP-013, and one adjacent existing signal so nothing is an orphan.

**Pass/fail against the handoff's criteria:**

| Criterion | Result |
|---|---|
| Navigates by maps | **Pass** — HOUSE-MAP → Notebook/MAP → Studio/MAP → Signals desk, in order |
| Writes to the correct Studio desk | **Pass** — correctly chose Signals over Analysis by reasoning from the desk descriptions, not by being told |
| Links to Notebook sources without editing them | **Pass** — read-only on all three journal entries, wikilinked from the Studio side only |
| Creates no duplicates | **Pass** — checked the existing index and an existing garden note for format before writing |
| Cites only existing files | **Pass** — every citation in its output traces to a real file it had actually opened |

**Disposition of the test artifact:** the garden note and index edit were created in the agent's isolated worktree, not the live vault — since this was a validation run, not a real content request, I removed both test worktrees rather than merge the content in as if it were real signal work. The theme itself (three AI/PKM tool evaluations all landing on "skip, we built this better") is plausible and could be worth a real pass later, but that's a call for the actual weekly sweep on 2026-07-17, not something to backdoor in via a validation test.

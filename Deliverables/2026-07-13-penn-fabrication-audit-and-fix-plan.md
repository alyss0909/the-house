---
title: Penn Fabrication Audit + Fix Plan — Journal Connections, Tags, Commentary
date: 2026-07-13
owner: Larry
source_class: output
status: LARGELY EXECUTED 2026-07-16 — Alyssa approved (chat) and merged this with the journal orphan backfill ([[tsk-2026-07-11-001-journal-connection-backfill]]). Fix plan items 1-4 done for all 218 flagged entries (dead links repaired or removed, tags fixed per GL-004, commentary stripped with her verbatim text verified intact). Remaining: item 5 (mechanical librarian close-checklist for Penn sessions, needs wiring) and item 6 plus the ~290 already-connected entries not yet commentary-checked.
---

# What's actually broken

Alyssa's ask, verbatim: "the connections are made up, there are NO related notes, and penn made up every fucking new hashtag."

Checked against real evidence, not vibes.

## Real scope: this is not a 2-month problem

Original check was `Notebook/Journal/2026/05`, `/06`, `/07` (89 files) — link-verified in detail, see Section 1. Alyssa then asked to check further back. Result: **the `Connections:`/`Related notes` footer pattern is present on nearly every file in the entire Journal, all 568 files, back to 2019.** This traces to the (paused) historical backfill project, not April drift specifically — April is just where it happened to get noticed.

**Important calibration — not everything is fake.** In the 89 files actually link-checked, 77% of link targets (89 of 115) were real and correct. 23% were fabricated. So the honest read is "a meaningful, unacceptable fraction is fake, mixed into mostly-real footers" — not "all connections are fabricated." The 2019–2025 files (479 additional files) have the same footer pattern but have **not yet been individually link-checked** — same generation mechanism, so a similar-ish fabrication rate is plausible, but that is a guess until actually verified, not a finding to act on yet.

## 1. Fabricated / dead `Connections` and `Related notes` links

Pulled every `[[wikilink]]` from the 89 files and checked which targets actually exist. **26 of ~115 unique link targets are dead** — cited as if real, don't exist anywhere in the vault:

- Hallucinated sibling journal entries: `[[2026-04-13-easiest-emails-to-send]]`, `[[2026-04-30-hooks]]`, `[[2025-07-07-boh-upgrades]]`, `[[2025-01-25-boh-idea]]` — none of these files exist. Made up whole-cloth as "related."
- People mentioned, entity never created (violates Penn's own contract — WS-001 Step 4 requires a stub): `[[Peter Yang]]`, `[[Ruben Hassid]]`.
- Topic pages linked as if they exist, don't: `[[emails]]`, `[[automation]]`, `[[back-of-house]]`, `[[rush-order]]`, `[[thrivecart]]`, `[[instagram]]`, `[[hooks]]`, `[[business-ops]]`, `[[brand-world]]`, `[[rebrand]]`, `[[wikilinks]]`, `[[launch-2026]]`.
- Tasks cited, never created: `[[tsk-2026-06-01-001-obsidian-home-page]]`, `[[tsk-2026-06-01-002-second-brain]]`.
- Stale pre-restructure paths, wrong syntax: `[[PKM/Second Brain/analysis/voice-archive.md]]` (vault moved off `PKM/` on 2026-07-09, link never fixed; also wrongly includes `.md` in the wikilink).

**Note — Connections themselves are not the problem.** The [[2026-07-10-journal-integrity-audit|July 10 audit]] already established Alyssa herself designed the wikilink/Connections footer as part of her own capture workflow. The problem is specifically that ~23% of link targets in this footer are fake, not that the footer exists.

## 2. Tags outside GL-004

Checked every `tags:` field in scope against [[GL-004-tag-taxonomy]]:

- `ai-tools` (13x) — not approved; `ai` is the approved tag.
- `personal`, `tools`, `signal` — not in GL-004 at all. Invented.
- `launch` (1x) — GL-004 explicitly retired this in favor of `promo`. Used anyway.

**Not a violation, but worth knowing:** the `#ac` tag Alyssa flagged isn't a Penn tag — it's her own Instagram caption hashtag block (`#alyssacolemanca #ac #softceo...`) sitting verbatim inside Studio test/analysis files. Obsidian auto-indexes any inline `#word` in body text as a tag, so real IG hashtags from captured examples are bleeding into the same tag pane as PKM tags. Separate problem, not journal contamination — flagged here so it isn't mistaken for the same bug.

## 3. Interpretive commentary inside Notebook (separate from the July 10 dispatch-stamp issue)

Example, [[2026-06-26-hook-you-get-what-you-get]]:

> Raw hook idea captured. Strong reframe energy — plays on the kindergarten phrase, could work as an email opener around expectations, delivery, or what BOH actually gets you.

This is Penn's own analysis, not Alyssa's words, written inline in her capture. **The good news: her verbatim quote is still intact above it** (`"you get what you get and you don't get upset"`) and the Original Keep note link is preserved. Checked several files in this pattern — in every one sampled, the raw captured text survived; Penn added commentary around it rather than replacing it. **This means a full Keep re-download is very likely not necessary** — the fix is stripping the added sentences back out, same mechanical operation already run once this session on the 17 newest entries. Not yet confirmed across all 89 files; needs the full pass to be sure no file has actual verbatim loss.

## Root cause — why this keeps happening

Two existing rules, both already written, both not enforced:

1. **WS-001 Step 4** already says: "If no file exists, Penn creates a stub at the right path... then wikilinks to it. When in doubt, create the stub. A stub costs nothing. A missing reference costs the wiki its connectivity." Penn is skipping the stub-creation step and just writing the wikilink on faith that something with that name is plausible.
2. **WS-001 Step 5** already assigns Larry a "Librarian pass at session close" that explicitly includes "Confirms `[[wikilinks]]` resolve." This has not actually been running — that's the safety net that should have caught every one of these 26 dead links the same session they were created, not two months later.

Separately, Penn's own house-rule addendum (`Studio/Team/Penn - Journal Writer/AGENTS.md`) already bans interpretive commentary in Notebook ("only capture-transcription"). That rule is being ignored, not missing.

**This is not a missing-SOP problem. It's an unenforced-SOP problem.** The fix isn't new policy — it's making the existing Step 5 audit and the stub-creation step actually mandatory and mechanical, not something that quietly gets skipped under time pressure.

## Fix plan (not yet executed — needs Alyssa's go-ahead + budget)

1. **Full sweep, all 568 Journal files:** for every dead `Connections`/`Related notes` link — either create the missing legitimate target (Person entity, Topic stub) if it should exist, or delete the fake citation if it shouldn't.
2. **New requirement (Alyssa, 2026-07-13):** every entry must end up with **at least one real `Related notes` link and at least one real `Connections` link** — there is always at least one area/project it genuinely relates to. For files that currently have zero real connections, this means an actual search for genuine relation, not a lookup — the more expensive and higher-fabrication-risk half of this job, so it gets the strictest verify-before-write discipline.
3. **Strip interpretive commentary** from every file that has it (same mechanical strip already run on the 17 newest captures), verifying her verbatim text survives in each case before removing anything.
4. **Fix the 5 confirmed tag violations** (found in the May–July sample; full sweep may surface more): `ai-tools` → `ai`, remove/reclassify `personal`/`tools`/`signal` (add to GL-004 properly if genuinely needed, otherwise strip), `launch` → `promo`.
5. **Process fix so this doesn't recur:** Larry's WS-001 Step 5 Librarian pass becomes a literal mechanical checklist run at every session close that touches Notebook — Glob-check every new wikilink target, confirm it exists or was stubbed, confirm no tag outside GL-004 was introduced. Penn's return format to Larry gets a required line: "Wikilinks verified: N/N resolve." No session closes clean without it.
6. **Widen scope check:** also worth a pass of `Notebook/Life/CRM` and `Notebook/Life/Topics`, since the same stub-skipping would show up there as orphaned entity mentions.

## Sizing for a swarm run

- 568 files total, batched ~40 files per subagent (amortizes the GL-001/002/004 + WS-001 contract-loading overhead) → roughly 14 batches, run in parallel.
- Rough estimate: **1–2 million tokens** for the full sweep. Real uncertainty here — the "find a genuine relation where none exists" step is the expensive, fabrication-risk-heavy part.
- Model: Sonnet for the bulk batches — this is a discipline problem (verify before you link), not a reasoning-difficulty problem, so Opus isn't needed for volume. Recommend a second, smaller Sonnet QA pass afterward specifically auditing for fabricated links, same idea as a code review second pass.
- Not something to run on a near-empty weekly budget. Schedule as its own dedicated block.

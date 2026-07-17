---
name: content-run
description: The production run, version 3 (2026-07-17). Takes every option Alyssa tapped on the Content Studio board, writes a one-line brief per post, pulls her verbatim copy fresh from the Library, hands each post to a clean writer whose reading is mostly her real writing, runs a checker that cannot be sweet-talked, delivers in her julia-child page format, and leaves a run receipt. Harvests her picks and edits back into the taste ledger as positive signal.
user_invocable: true
---

# /content-run v3 — approved options become finished posts

Rebuilt 2026-07-17 on Alyssa's go, after the research-backed diagnosis: models imitate what they are reading, so the writer reads HER, not rules about her. One clean writer context per post. A separate checker verifies with receipts. (v2 history: `Archive/content-desk-retired-2026-07-16/PIPELINE-LADDER.md` and the 2026-07-16 content-desk-rebuild session log.)

## Stage 0 — Harvest her signal FIRST (never optional)

Read the Content Studio board (IDs in /saves-sweep Cache). Before anything else:
- Every option whose status she changed (approved, killed, edited) since the last run: log verbatim in `Studio/Content/taste-ledger.md`. Approvals and edits go under Positive signal AS BEFORE-AND-AFTER PAIRS (her edit is the lesson, capture both versions). Kills go under Reacts with her words.
- Any shipped post with numbers available (Composio Instagram connection): append reach, saves, comments, shares to Shipped results.
- **Taste compounding law: a failure becomes an example, not a rule, whenever possible.** If a lesson can be shown by pointing at a real before-and-after or a real slide, do that instead of adding a rule line. METHOD has a hard size cap of one page of rules per section; adding a rule means merging or removing one.

## Stage 1 — Build the run list

Run list = board rows with Status "Approved" plus any slot Alyssa names. Hard cap: 3 posts (6 versions) per run, oldest picks first. The board holds state; nothing is lost by waiting.

## Stage 2 — The brief (one line, on the page, before any writing)

For each post, write at the top of its board page:
`BRIEF: offer + buying belief (from the pack header) + framework (House Report / Old Way New Way / How To + version / Hot Take / For The Girls) + content role (freebie, product, class, paid, waitlist, affinity) + hook direction`
Framework choice comes from the framework card's "when to choose" test, with one variety guard: check the last run receipts in `Studio/Content/runs/`; if 3 of the last 4 built posts used the same framework, choose the second-best fit instead. A month of twelve posts should not be nine How Tos. Nobody writes until this line exists. Alyssa can veto it in five seconds.

## Stage 3 — The copy pull (mechanical, no judgment, nothing stored)

Read ONLY this offer's brief at `Studio/Content/briefs/<offer-slug>.md` (slug matches the offer's folder in `Library/Offers/`; do not load the whole briefs folder). The brief already holds her curated VERBATIM lines sorted by job (belief, pain, teaching, product, CTA), her real chat word and price, and the proof subject lines. Slide bodies are assembled from those verbatim lines, re-broken into slide grammar. When the angle needs more than the brief holds, open the full sales page or deliverable named in the brief and pull additional verbatim lines. Never paraphrase her lines into cleaner versions; that is the named failure mode. If the offer has no brief yet, BUILD ONE FIRST in the verbatim-bank shape (copy her actual lines from the sales page, sorted by job, quoted exactly, beliefs flagged for her react), save it to `Studio/Content/briefs/`, add a row to `briefs/INDEX.md`, then continue. A brief that summarizes her instead of quoting her is not done.

## Stage 4 — The clean writer (one fresh context per post, no exceptions)

Dispatch one writer subagent per post. Its reading list is EXACTLY this, nothing more (kept lean on purpose — this is the token fix, 2026-07-17):
1. `Studio/Content/writer-kit.md` — the rules (spine, framework, signature). Do NOT load full METHOD or hook-forensics; deep reference only.
2. `Studio/Content/her-carousel-voice.md` — her CAROUSEL register, from real slides. This is the voice target. Sales-page copy is substance; this is how it sounds on a slide. Match her short punchy headers and her reporter-with-receipts body register.
3. The framework card (`Studio/Analysis/Frameworks/carousels/<framework>.md`).
4. The offer's brief (`Studio/Content/briefs/<slug>.md`) plus the one sales page or deliverable it names. Substance and verbatim lines, but re-voiced to the carousel register in point 2.
Do NOT open `carousel-slide-by-slide.md` or slide images by default; the card carries the calibration. Open them only if the card explicitly says the calibration is insufficient for this post.
The writer FIRST produces a slide plan on the Carousel Spine (writer-kit): every deck guarantees all seven spine jobs (cover hook, second hook, old way/problem, proof or validation, teaching, turn, CTA), then maps the chosen framework's forward sequence onto them. Each slide is tagged with its spine job AND its framework step. A deck missing a spine job (usually proof/validation, which How To drops) or not marching the sequence gets rejected at the gate.
The writer's context must be mostly her words. It produces TWO structurally different versions (different bit, different arc), each with 2 covers, 5 hooks (10-word cap, named shapes), slide bodies assembled from the pack's verbatim lines re-broken into slide grammar (25 to 65 words on teaching slides, 9 to 11 slides on education and offer decks), caption, CTA with the verbatim chat word from the Products DB or "manual selection needed."
Per slide, the writer records its source: the pack section each body line came from. Claims without the trace do not count.
Never batch two posts in one writer. Never write in a context that did other work first.

## Stage 5 — The checker (separate fresh context, cannot be sweet-talked)

The checker never asks the writer anything. It receives the drafts, the pack, and the named sources, and runs:
1. **Source trace:** every teaching slide body must contain at least one run of 8 or more consecutive words found verbatim in a named source. Slides that fail get flagged by name.
2. **Density:** word count per teaching slide (25 to 65), slide count (9 to 11 for education and offer decks), hook length (10 words max, all 5 options).
3. **Banned strings:** em dashes, arrows, "unlock," "elevate," "game-changer," "it's not X it's Y" symmetry, question-mark covers, reframe covers.
4. **Spine + framework execution:** confirm all SEVEN spine jobs are present (cover hook, second hook, old way/problem, proof or validation, teaching, turn, CTA) AND each framework step appears. The usual miss is spine job 4 (proof/validation), which How To's sequence drops. A missing spine job or framework step is a fail, not a nitpick.
5. **The three gates** from METHOD section 7: lineup test against two real posts, stranger test (name the bit), value test (name what a non-buyer walks away with).
5. **Product facts:** price, chat word, link against the live Products DB row.
Failures get one rebuild in the same writer context with the failure named, then ship WITH the flag visible in "Before it ships." Failed versions are KEPT (paste under a toggle "earlier version, failed: [reason]" on the page) — her verdicts on failures are the eval set.

## Stage 6 — Deliver in HER format (the julia-child standard)

Every version lands on the Content Studio board as its own page, Status "Ready for Alyssa," matching the format she built on the "sry julia child" page (3a0c8b43e56581e5b5b5d9b943661a4f):
purple callout sections in this order — **The Framework** (forward sequence + beliefs, from the card) / **The Concept** (idea in one line + the value a non-buyer gets) / **Pick a cover** (2) / **Hook Options (5)** / **The slides** (each slide a headline heading, body below, divider between slides, functional image ideas in parentheses) / **Caption** / **Before it ships** (flags only: missing chat word, checker flags, anything needing her).
Offer property = RELATION to the live Products DB row. Report to Alyssa: one line per post naming its bit, plus flags. Say "ready for your picks," never "final."

## Stage 7 — The receipt (every run, no exceptions)

Write `Studio/Content/runs/YYYY-MM-DD-run.md`: which posts, which frameworks, which pillar/area each post served, exact files each writer loaded (including image files), checker results per version, flags shipped, and a blank "her reacts" section that Stage 0 of the NEXT run fills in. If quality dips, this file shows which stage cheated; if a month skews to one area or one framework, the receipts show it before Alyssa has to feel it.

## The orchestrator never writes slides (her ruling 2026-07-17)

Larry (or whatever orchestrates) NEVER writes or hand-patches slide copy, not even a "quick fix" to one slide. Every draft and every rewrite goes through a clean writer subagent whose context is mostly her copy. Proven 2026-07-17: an orchestrator hand-patch of the 5MN teaching slides flattened her voice ("it doesn't sound like me"); the clean-writer redo restored it. If a slide needs changing, brief the writer and route it. The orchestrator only briefs, checks (mechanically), and delivers.

## Hard rules carried forward

- Taste ledger anti-patterns are law. Her reactions logged verbatim, typos included, same session.
- Never invent product facts. Products DB is canonical at ship time. (5 Minute Newsletter price is settled: $11. Do not ask her again.)
- No re-skins of published posts (`Library/Examples/Carousels/INDEX.md` is the check), no artifact reuse (METHOD section 5).
- Never CTA to Unignorable Subject Lines. Slowly Viral has no live CTA until she says so.
- FTG posts run METHOD section 8 and the for-the-girls card; source trace and density checks do not apply to FTG, the stranger test does.
- Anything Alyssa reads is written in plain complete sentences. No em dashes, no arrows, no team jargon.

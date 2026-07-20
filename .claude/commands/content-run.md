---
name: content-run
description: The production run, version 3 (2026-07-17). Takes every option Alyssa tapped on the Content Studio board, writes a one-line brief per post, pulls her verbatim copy fresh from the Library, hands each post to a clean writer whose reading is mostly her real writing, runs a checker that cannot be sweet-talked, holds each version for a 15-30 minute human voice-edit seat where Alyssa rewrites the flagged dead lines (or skips with one word), delivers in her julia-child page format, and leaves a run receipt. Harvests her picks and edits back into the taste ledger as positive signal.
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
`BRIEF: offer + buying belief (her verbatim belief line from the brief, never a paraphrase) + framework (House Report / How To + version / Old Way New Way / Hot Take / For The Girls — five cards, House Report reinstated by Alyssa 2026-07-17) + content role (freebie, product, class, paid, waitlist, affinity) + hook direction`
Framework choice comes from the framework card's "when to choose" test, with one variety guard: check the last run receipts in `Studio/Content/runs/`; if 3 of the last 4 built posts used the same framework, choose the second-best fit instead. A month of twelve posts should not be nine How Tos. Nobody writes until this line exists. Alyssa can veto it in five seconds.

## Stage 2.5 — The sequence fill (from [[Studio/Content/carousel-dispatch]] Step 1; ONE artifact, simplified 2026-07-17 on her "too much up front work" ruling)

Before any writer is dispatched, the orchestrator fills one block on the board page under the brief line: this post argues (her verbatim belief line or a brief argument lane) / villain, exactly one / NOT about / the chosen card's forward sequence in plain language, each teaching step naming its source line.

Rules:
- Inventing an adjacent belief broke the julia v1 deck; the argument comes from the brief or a proposed lane proven with her source lines (dispatch Step 1 new-lane rule).
- Two villains means kill or split. Example: 5MN argues "gourmet email is out" OR "six burners going when one will do," never both in one deck.
- No separate carousel outline, concept lock, framework outline, or source receipt. The fill does all four jobs; the spine is the checker's rubric.

## Stage 3 — The copy pull (mechanical, no judgment, nothing stored)

Read ONLY this offer's brief at `Studio/Content/briefs/<offer-slug>.md` (slug matches the offer's folder in `Library/Offers/`; do not load the whole briefs folder). The brief already holds her curated VERBATIM lines sorted by job (belief, pain, teaching, product, CTA), her real chat word and price, and the proof subject lines. Slide bodies are assembled from those verbatim lines, re-broken into slide grammar. When the angle needs more than the brief holds, open the full sales page or deliverable named in the brief and pull additional verbatim lines. Never paraphrase her lines into cleaner versions; that is the named failure mode. If the offer has no brief yet, BUILD ONE FIRST in the verbatim-bank shape (copy her actual lines from the sales page, sorted by job, quoted exactly, beliefs flagged for her react), save it to `Studio/Content/briefs/`, add a row to `briefs/INDEX.md`, then continue. A brief that summarizes her instead of quoting her is not done.

## Stage 4 — The clean writer (one fresh context per post, no exceptions)

Dispatch one writer subagent per version. The writer load is defined in [[Studio/Content/carousel-dispatch]] (the ONLY owner of the load list): writer-kit + her-carousel-voice (non-negotiable) + the brief + one framework card. Open a sales page or deliverable the brief names only when the angle needs more verbatim lines than the brief holds. Do NOT open `carousel-slide-by-slide.md` or slide images by default.
The writer also receives, pasted into its prompt: the Stage 2 brief line and the Stage 2.5 sequence fill. The argument is not negotiable inside the writer.
The card's forward sequence IS the slide plan; the writer tags each slide with its sequence step. The seven-job spine is verified by the checker, not written out by the writer.
The writer's context must be mostly her words. Each writer produces ONE full version (reconciled with [[Studio/Content/carousel-dispatch]] 2026-07-17: one writer, one version, full depth). For each post, dispatch TWO writers; Version B must differ from Version A by framework, buying belief, pressure, or content role, never by hook alone. Each version carries 2 covers, 5 hooks (10-word cap, named shapes), slide bodies assembled from the brief's verbatim lines re-broken into slide grammar (25 to 65 words on teaching slides, 9 to 11 slides on education and offer decks), caption, CTA with the verbatim chat word from the Products DB or "manual selection needed."
Per slide, the writer records its source: the brief section each body line came from. Claims without the trace do not count.
The writer also self-flags its dead-line candidates for the Stage 5.5 seat: any body line it wrote as NEW connective tissue (no verbatim source of hers behind it) and any line it is least confident sounds like her get tagged `DEAD?` with a three-word reason. These are the AI's own words by definition, the lines most likely to read flat. Flagging them here is what makes her 15-30 minutes get spent rewriting, not hunting.
Never batch two posts in one writer. Never write in a context that did other work first.

## Stage 5 — The checker (separate fresh context, cannot be sweet-talked)

The checker never asks the writer anything. It receives the drafts, the offer brief, the concept lock, and the named sources, and runs:
1. **Source trace:** every teaching slide body must contain at least one run of 8 or more consecutive words found verbatim in a named source. Slides that fail get flagged by name. Every line that fails the trace (no verbatim run behind it), plus every writer `DEAD?` tag and every line the stranger/lineup test in step 6 (the three gates) dinged as "could belong to ten other creators," is collected into that version's **dead-line punch-list** and handed to Stage 5.5. The checker names the lines; it does not rewrite them.
2. **Density:** word count per teaching slide (25 to 65), slide count (9 to 11 for education and offer decks), hook length (10 words max, all 5 options).
3. **Banned strings:** em dashes, arrows, "unlock," "elevate," "game-changer," "it's not X it's Y" symmetry, question-mark covers, reframe covers.
4. **Spine + framework execution:** confirm all SEVEN spine jobs are present (cover hook, second hook, old way/problem, proof or validation, teaching, turn, CTA) AND each framework step appears. The usual miss is spine job 4 (proof/validation), which How To's sequence drops. A missing spine job or framework step is a fail, not a nitpick.
5. **Concept fidelity:** the deck argues the concept lock's belief (her verbatim line from the brief, not an adjacent invention), has exactly ONE villain, and names what the product IS (a Notion planner, a template, a campaign), not just what it feels like. Drift to a second villain or an invented belief is a fail, not a nitpick.
6. **The three gates** from METHOD section 7: lineup test against two real posts, stranger test (name the bit), value test (name what a non-buyer walks away with).
7. **Product facts:** price, chat word, link against the live Products DB row.
Failures get one rebuild in the same writer context with the failure named, then ship WITH the flag visible in "Before it ships." Failed versions are KEPT (paste under a toggle "earlier version, failed: [reason]" on the page) — her verdicts on failures are the eval set.

## Stage 5.5 — The human voice-edit pass (her seat, added 2026-07-20)

The recurring #1 pain is that content doesn't sound like Alyssa. Research is settled: even a writer saturated with her exemplars reads flatter than she does. The fix is not more AI rules — it is a short HUMAN seat where she rewrites the dead lines before a piece ships. This stage runs AFTER the checker passes and BEFORE the version is delivered to picks or marked done.

- **Surface, don't hunt.** For each passed version, the orchestrator takes the Stage 5 dead-line punch-list and trims it to the ~5-8 lines most likely to read flat (connective tissue with no verbatim source first, then writer `DEAD?` tags, then stranger-test dings). Present it on the board page as a **"Dead lines — 15 min"** block at the top of "Before it ships": one row per line, quoting the exact line and its slide, with an empty space beneath each for her rewrite. Nothing else — no suggested rewrites, no art direction. The orchestrator never writes the replacement line (the hand-patch ban still holds); it only points.
- **Hold, lightly.** The version sits at Status **"Voice-edit"** (not yet "Ready for Alyssa"). Delivery to picks waits until she has rewritten the flagged lines OR skips. This is a seat, not a wall: **one word releases it** — "skip," "ship it," "fine," "as is" — and a skip on one version or the whole run advances everything immediately. It never blocks indefinitely and one version's seat never holds the others.
- **Route her rewrites, never patch.** When she rewrites a dead line, the new line goes back through a clean writer subagent to re-seat it in slide grammar if it needs reworking (per the orchestrator-never-writes rule); a straight drop-in of her exact words needs no writer. Then the version advances to Stage 6.
- **Harvest (compounding).** Every line she rewrites in this seat is gold and logs to `Studio/Content/taste-ledger.md` as a before-and-after pair under Positive signal, same session — her rewrite IS the lesson. If her rewrite gives the offer a reusable verbatim line, add it to the offer brief so the next writer has it as source. Stage 0 of the next run also sweeps these.

## Stage 6 — Deliver in HER format (the julia-child standard)

Every version reaches this stage only after its Stage 5.5 voice-edit seat has cleared (rewritten or skipped). It then lands on the Content Studio board as its own page, Status flipped from "Voice-edit" to "Ready for Alyssa," matching the format she built on the "sry julia child" page (3a0c8b43e56581e5b5b5d9b943661a4f):
purple callout sections in this order — **The Framework** (forward sequence + beliefs, from the card) / **The Concept** (idea in one line + the value a non-buyer gets) / **Pick a cover** (2) / **Hook Options (5)** / **The slides** (each slide a headline heading, body below, divider between slides — copy only, no image ideas or art direction, her rule 2026-07-17) / **Caption** / **Before it ships** (flags only: missing chat word, checker flags, the Stage 5.5 dead-lines block with her rewrites or a "voice-edit: skipped" note, anything needing her).
Offer property = RELATION to the live Products DB row. Report to Alyssa: one line per post naming its bit, plus flags. Say "ready for your picks," never "final."

## Stage 7 — The receipt (every run, no exceptions)

Write `Studio/Content/runs/YYYY-MM-DD-run.md`: which posts, which frameworks, which pillar/area each post served, exact files each writer loaded, checker results per version, flags shipped, the Stage 5.5 outcome per version (how many dead lines were flagged, how many she rewrote, or "skipped"), and a blank "her reacts" section that Stage 0 of the NEXT run fills in. If quality dips, this file shows which stage cheated; if a month skews to one area or one framework, the receipts show it before Alyssa has to feel it.

## The orchestrator never writes slides (her ruling 2026-07-17)

Larry (or whatever orchestrates) NEVER writes or hand-patches slide copy, not even a "quick fix" to one slide. Every draft and every rewrite goes through a clean writer subagent whose context is mostly her copy. Proven 2026-07-17: an orchestrator hand-patch of the 5MN teaching slides flattened her voice ("it doesn't sound like me"); the clean-writer redo restored it. If a slide needs changing, brief the writer and route it. The orchestrator only briefs, checks (mechanically), and delivers.

## Hard rules carried forward

- Taste ledger anti-patterns are law. Her reactions logged verbatim, typos included, same session.
- Never invent product facts. Products DB is canonical at ship time. (5 Minute Newsletter price is settled: $11. Do not ask her again.)
- No re-skins of published posts (`Library/Examples/Carousels/INDEX.md` is the check), no artifact reuse (METHOD section 5).
- Never CTA to Unignorable Subject Lines. Slowly Viral has no live CTA until she says so.
- FTG posts run the for-the-girls card and its FTG checker (in the card): named felt pressure, one concrete little detail, a reclassification, one principle line, FTG line style, no tactical steps, no hard CTA, no explained business point, and the repost test ("would someone send this to say me"). Source trace and density do not apply; the stranger test does.
- Anything Alyssa reads is written in plain complete sentences. No em dashes, no arrows, no team jargon.

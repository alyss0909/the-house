# SOP-041 — Content Production (the post-restructure pipeline, any host)

- **Status:** Active (Alyssa-ordered rebuild, 2026-07-16; supersedes WS-011 and SOP-033 through SOP-038).
- **Owner:** Larry (routing) — but the point of this SOP is that ONE writer context does the whole job.
- **Host note:** In Claude Code the flows are the `/saves-sweep` and `/content-run` commands. In any other host (Codex, Cursor, Gemini, plain chat), run the identical steps below by hand. This file is the LLM-agnostic contract.

## The thinking (read first — this is how to think like the model that built it)

1. **Her taste is the scarce resource; everything else is volume.** Never spend her attention on fragments (one-line concepts, hook lists, outlines). She reacts to FINISHED posts, several at once, and her picks and edits are the training data. Two structurally different versions per concept, five hooks per version, always.
2. **One context per post.** Never split a post across specialist handoffs; every handoff loses the nuance that makes it sound like her. Load everything (METHOD, ledger, sources, real slide images) into one context and write the whole post there.
3. **Positive signal beats kill lists.** Log what she picks and edits (verbatim, in the taste ledger's Positive signal section) with more care than what she rejects. Her Instagram saves are positive signal too — that's why the daily sweep exists.
4. **Real material only.** Her sales pages, deliverables, transcripts, journal entries, and published posts are the ingredient supply. Minimum three real sources per post, one of them her verbatim writing. Nothing invented, ever: no stats, no anecdotes, no prices, no chat words.
5. **Every post gives before it asks (her law, 2026-07-16, verbatim: "even offer posts have MAD value every post should blow someone away with something useful THEN that earns the ask").**

## Flow A — the daily sweep (options from her saves AND the engine's ideas)

Follow `.claude/commands/saves-sweep.md` verbatim (it is host-readable markdown): light boot (METHOD.md, carousel-hook-forensics.md, taste-ledger.md, BUSINESS.md, FUNNEL.md — nothing else), pull from BOTH upstream trays of the Inspo to Idea pipeline — new Instagram Saves rows AND "Not started" Content Ideas rows (the unattended ideation worker's output) — extract the MECHANIC (never the text; engine hooks get rewritten into her shapes), pair with a live offer, deliver 3 to 5 five-part options (Spark, Concept, The value, Offer relation, 5 hooks) to the Content Studio board as Status "Option" with Inspo/Idea relations back to the source rows, then close the trays (saves → Reviewed, ideas → In progress).

**The pipeline layers, so nobody re-litigates this:** Instagram Saves (raw taste signal, auto-synced) and Content Ideas (raw machine ideation, auto-written) are the UPSTREAM trays — the existing Inspo to Idea automation keeps writing to them untouched. Content Studio is the DOWNSTREAM curated board: only options that passed the taste ledger, the Method, and the value law, wired to Products by relation. Nothing was replaced; the sweep is the judgment layer that connects them.

## Flow B — the production run (picks become posts)

Follow `.claude/commands/content-run.md` verbatim: harvest her board reactions into the taste ledger FIRST, build the run list from "Picked" rows, load each post's full sources, LOOK at two real exemplar posts' slide images, write per METHOD §4 slide grammar (two versions, two cover variants, five hooks, functional design slots only), run the three gates once at the end (lineup, stranger, value), push to the board as "Ready for Alyssa," report with one line per post naming its bit.

## Key addresses

- Craft law: `Studio/Content/METHOD.md` · desk map: `Studio/Content/MAP.md`
- Taste: `Studio/Content/taste-ledger.md` (Positive signal + Shipped results sections are the learning layer)
- Board: Notion data source `collection://89047304-dac5-4668-ac16-a6eaf8721123` (under the Inspo to Idea page)
- Products (canonical price/status/chat word + the board's Offer relation target): Notion data source `collection://2f4c8b43-e565-8149-a25f-000b38310c24`
- Her real posts: `Library/Examples/Carousels/` (images) + `Studio/Analysis/carousel-slide-by-slide.md` (the study)

## What NOT to do (each of these was tried and failed before 2026-07-16)

- No maker relay (concept person, hook person, substance person, writer). Retired.
- No approval gates on fragments. Gates run once, on finished posts, and a gated-out post still goes to her as a flagged option.
- No pitch sheets, no dashboard state machines, no /loop.
- No new summary/digest files of her source (map, don't digest). No new rules files — taste goes in the ledger, craft changes go in METHOD.
- No heavy house boot for content sessions; but her reactions ALWAYS get logged, same session.

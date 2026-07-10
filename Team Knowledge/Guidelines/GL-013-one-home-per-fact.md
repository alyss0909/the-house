# GL-013 - One Home Per Fact (Link, Don't Re-Derive)

- **Status:** DRAFT — awaiting Alyssa approval. Not yet wired into AGENTS.md or Guidelines INDEX.
- **Owner:** Larry
- **Applies to:** every agent, every session, every file created anywhere in the vault.
- **Why this exists:** The 2026-07-05 root-cause audit found the content calendar built five independent times in one week, prices/chat words re-typed into research files, live documents citing files that don't exist (`Hermes/CALENDAR.md`, `Hermes/PITCH.md`), and indexes promising folders that were never filled. None of this was a folder problem. It was a behavior problem: workers re-derived knowledge instead of linking to it. This guideline makes that behavior illegal.

## The one-line rule

**Every fact has exactly one home. Everything else links to it. If you are typing a fact that already lives somewhere, you are building drift — stop and link.**

This extends [[GL-009-source-boundaries-and-promotion]] (which says what source IS) with the law of how knowledge may MOVE.

## The five laws

### 1. Look before you write

Before creating ANY file or section, search for the existing home (Glob/Grep, check the canonical registry below). If a home exists: link to it, or edit it. Creating a parallel version of existing knowledge is never acceptable — not for a research pass, not for a synthesis, not "just for this session." A second copy of a fact is a bug the moment it is written.

### 2. Facts are typed once

Prices, chat words, offer statuses, calendar slots, framework definitions, taste reacts — these get typed into their canonical home ONE time. Every other file that needs them uses a wikilink to the home. Never a copied table, never a "convenience" restatement. One Notion change must never be able to silently desync two files.

### 3. No paraphrase files

If the file you are writing restates, summarizes, or re-organizes content that exists in source or in a canonical file, you are building a duplicate brain. Allowed alternatives, in order (per [[GL-008-ponytail-lazy-senior-dev-philosophy]]): don't create the file; add a pointer to an existing map; extend the canonical file itself. Deliverables research passes may QUOTE source with citation for a dated report — but the report becomes history at session close (GL-009 reconciliation), never a live reference.

### 4. Cite only what exists

Never reference a file path you have not verified on disk THIS session. A citation to a nonexistent file is fabrication. If the file you want to cite doesn't exist, either create it properly (through law 1) or point at the closest real file and say so.

### 5. Alyssa's raw territory is write-locked

No agent writes, edits, appends, or "improves" anything in `PKM/Journal/`, raw `Team Inbox/` drops, or any Alyssa-raw capture — except Penn performing capture-transcription itself (WS-001). All interpretation, analysis, signals, theses, and commentary about her raw material lives OUTSIDE it (Signals, analysis, Deliverables) and links back with a wikilink. Her incoming ideas stay hers, byte for byte. This is effective immediately, ahead of any restructure.

## Canonical registry (the "one home" table)

| Fact | Its ONLY home |
|---|---|
| Offer facts: price, status, chat word, funnel position, positioning | `PKM/My Life/Offers/<offer>.md` — one home per offer, mirroring Notion (the upstream truth). After the restructure: `Finished/Offers/<offer>/`. |
| Offer directory (which offers exist) | `PKM/My Life/Offers/INDEX.md` |
| Content calendar / slot map | `Hermes/MAP.md` §3 |
| Named-framework registry (BOH terms) | `Hermes/MAP.md` §4 |
| Voice/style/anti-AI rules | `Hermes/SOUL.md` + `STYLE.md` + `TASTE.md` + `ANTI-AI.md` |
| Alyssa's taste reacts (long-term) | `Team Inbox/pitches/taste-ledger.md` |
| Weekly pitch state | newest `Team Inbox/pitches/YYYY-Www-pitch.md` |
| Alyssa's actual words | `PKM/Journal/`, `PKM/Second Brain/examples/`, `programs/` — quoted with citation, never restated |

New fact types get a row here BEFORE the fact is written anywhere. Larry owns this table. If two files claim the same fact, the one in this table wins and the other gets stripped to a wikilink immediately (fix-don't-flag).

## Hermes is judgment, not a brain

`Hermes/` may contain only: judgment (SOUL/STYLE/TASTE/ANTI-AI), craft, operating logic (FABLE), learning, and maps that POINT at source. It may not own facts. `Hermes/BUSINESS.md` demotes to a pointer table (offer name → wikilink to the offer's home, zero values) as part of adopting this guideline — Hermes still loads it as its entry point to facts, but a file with no values cannot desync. Any fact found living inside `Hermes/` that exists elsewhere is a GL-013 violation and gets stripped to a link.

Note: the calendar/slot map and framework registry stay in `Hermes/MAP.md` for now because they are genuinely map-layer (routing knowledge, not business facts) — but they are candidates to move to the Content OS map and the Finished shelf respectively during the restructure.

## Enforcement

- **Session close (SOP-011):** the reconciliation pass adds one check — "did this session type any fact that already had a home?" Violations get stripped to links before the log is written.
- **Weekly review (WS-006):** 5-minute lint — grep for known fact strings (a price, a chat word) appearing outside their home; grep for citations to nonexistent paths; any hit gets fixed in the review session.
- **Mean Alyssa check (GL-009) gains one question:** "Would Alyssa find this same information in two places and stop trusting both?"

## What this does NOT ban

- Wikilinks and pointers everywhere — that's the point.
- Quoting source verbatim WITH citation in dated Deliverables.
- Hermes learning distillations (LEARNING.md loop) — those refine the canonical judgment files themselves, which is editing the home, not copying it.
- Alyssa duplicating whatever she wants. These laws bind agents, not her.

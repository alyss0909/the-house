---
# Identity
id: tsk-2026-06-01-002
title: "Build the Second Brain — index and systematize all work assets for Claude to reference"

# Ownership & priority
assignee: alyssa
priority: 1

# Status
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-06-01T00:00:00Z
updated: 2026-06-01T00:00:00Z
due: null

# Provenance
created_by: larry
source: inbox-processing
parent: null

# Cross-references
linked_sops: []
linked_workstreams: [WS-002-import-external-knowledge-base]
linked_guidelines: []
linked_my_life: [systematize-socials, back-of-house, pkm]
linked_session_logs: []
linked_journal_entries: [2026-06-01-second-brain-assets, 2026-04-27-claude-notes, 2026-05-10-camila-onboarding, 2026-06-02-saved-instagram-reels]

# Tagging
tags: [ai, second-brain, content-system]
---

# Build the Second Brain — index and systematize all work assets for Claude to reference

## What this is

Alyssa has a large body of existing work — BOH workbooks, video transcripts, Notion content, slides, sales pages, emails, Soft Sundays, Simmers, carousels, hooks, sequences, templates — that Claude currently cannot reference. The goal is to build a Second Brain: a structured index of everything she's created, so that Larry and Penn can draw from her actual voice and frameworks instead of generating from scratch.

Once built, the daily AI routine becomes: Input inspo (saved email / saved IG) → Framework-ize it → Recreate using Alyssa's own inputs.

This is the foundation that makes systematize-socials actually work.

## Context one click away

- Planning note: [[2026-06-01-second-brain-assets]]
- Claude setup + wishlist: [[2026-04-27-claude-notes]]
- Camila's big project (Keep + IG → Claude → Notion pipeline): [[2026-05-10-camila-onboarding]]
- Import workstream: [[WS-002-import-external-knowledge-base]]
- Project: [[systematize-socials]]

## Connected tasks — build these together or in sequence

- [[tsk-2026-06-01-004-telegram-claude-automation]] — Telegram capture feeds into the Second Brain's daily input routine
- [[tsk-2026-06-01-003-semantic-recurrence-layer]] — the semantic daily routine runs on top of the Second Brain's indexed assets
- **WS-002 Notion import** — Notion content (BOH modules, content vaults, templates) is a core Second Brain source; import or link before the Second Brain is usable
- **Obsidian file exclusion** — exclude Team/, .claude/ etc. from Obsidian index (safe for the team — they access via filesystem, not Obsidian UI)

## Asset inventory (from Alyssa's planning note)

**What she has:**
- All BOH workbooks
- All videos (transcripts)
- All Notion content
- All slides
- Sales page copy — BOH + other products
- Sales emails from other products
- About me + home page copy
- 5 good Soft Sundays
- 5 good Simmers
- 10 good carousels
- Top subjects + previews
- 2 x Webinars
- CTC full workbook

**Content system already built:**
- YOE email concepts
- Editorial calendar concepts
- Pinterest blog concepts
- Promo planner reframe
- Sequence prompts
- Hook vault
- Segmentation vault
- Right Time Offer (RTO) vault
- P.S. vault

**Also needed:**
- Writing style analysis (dos + don'ts, carousel copy analysis, workshop/webinar analysis)
- Templates: opt-in, delivery, tripwire, oops, sales page, sales email, book-a-call, simmer, push-to-buy, push-to-show, push-to-register
- BOH module index (map for LMS)
- me.md
- Overall map of all of this

## Success criteria

- All major asset categories indexed and accessible to Larry/Penn
- Writing style analysis doc exists with enough depth that Claude can write like Alyssa, not like Claude
- Daily AI content routine is wired: input → framework → Alyssa-voice output
- me.md written and in vault

## Updates

- 2026-06-01 (larry) — created from Alyssa's Second Brain planning note
- 2026-06-01 (larry) — Full Second Brain skeleton built and aligned with Alyssa. Structure confirmed: programs/ · examples/ · analysis/ · templates/ · frameworks/. Checklist separated into BUILD-PLAN.md, INDEX.md kept as clean orientation. All files interconnected with nav links.
- 2026-06-01 (larry) — BOH fully indexed: master INDEX with quick-scan course map, phase folders (welcome/, phase-one/ through phase-four/), all asset slots named and ready for content drops. Pretty links converted to full alyssacoleman.ca URLs. NotebookLM flagged for slides throughout.
- 2026-06-01 (larry) — Pax research complete at Deliverables/2026-06-01-second-brain-research.md. 3-level map structure confirmed correct. Import path confirmed: Notion API method, NotebookLM Chrome extension (Medium confidence — test first), local files direct drop.
- **Next session:** Alyssa drops BOH content (workbooks, transcripts, Notion dashboards) one at a time. Larry formats as MD, files in correct phase subfolder, flips status to ✅. me.md to be rebuilt after examples/ is populated.

## Outcome

_(filled when status flips to done)_

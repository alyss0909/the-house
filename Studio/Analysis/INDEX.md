---
name: Analysis — Index
type: index
last_updated: 2026-07-05
---

# Analysis — Index

> Built from examples. Do not start this section until Phase 2 (examples) is populated. The analysis is only as good as the real copy it's built from.

---

## What lives here

Patterns extracted from Alyssa's real work — how she writes, what makes her carousels work, how she structures a workshop or webinar. This is what tells an LLM the difference between writing "like Alyssa" and writing like a generic content creator.

| File | What it covers | Status |
|---|---|---|
| [[[Studio/Analysis/copy-task-routing]]](copy-task-routing.md) | **LLM routing map** — what to read and when for every copy task type. Start here if you don't know which file to open. | ✅ 2026-06-03 |
| [[[Studio/Analysis/voice-profile]]](voice-profile.md) | **AI-ready compressed voice profile (XML, ~3,000 tokens)** — load at the start of any copy session. Built from 100-question evidence pass. AI-mined draft; Alyssa reviewing. | 🔶 draft |
| [[[Studio/Analysis/voice-archive]]](voice-archive.md) | Full 100-question voice interview answered from evidence — sources + confidence ratings (HIGH/MED/LOW). Human-readable. Alyssa annotates gaps, then Larry recompiles voice-profile.md. | 🔶 draft |
| [[[Studio/Analysis/writing-style]]](writing-style.md) | 14-section voice analysis — patterns, metaphor system, humor, pain point architecture, swipe file | ✅ 2026-06-03 |
| [[[Studio/Analysis/sales-page]]](sales-page.md) | Section-by-section BOH sales page map — persuasion logic, CTA catalog, build template | ✅ 2026-06-03 |
| [`about-page.md`](about-page.md) | Deep reverse-engineering of the about page — personal brand architecture, origin story structure, trust-building mechanics, dos/don'ts for first-person copy | ✅ 2026-06-03 |
| [`home-page.md`](home-page.md) | Deep reverse-engineering of the home page — cold conversion architecture, marquee mechanics, lifestyle framing, anti-brand positioning, top-of-funnel dos/don'ts | ✅ 2026-06-03 |
| [`audience/`](audience/INDEX.md) | Client intelligence — survey data, BOH buyer profile | 🔶 building |
| [[[Studio/Analysis/subject-line]]](subject-line.md) | Subject line + preview text patterns — 11 named patterns, decision framework, template banks, confirmed top performers from 351 broadcasts, preview text rules, email-type formulas, and what not to do. | ✅ v2.1 — 2026-06-04 |
| [[[Studio/Analysis/carousel]]](carousel.md) | Performance data + patterns from 9 top IG carousels Jan–Mar 2026 — archetype → metric mapping, voice signatures, design patterns | ✅ 2026-06-03 |
| [[[Studio/Analysis/carousel-slide-by-slide]]](carousel-slide-by-slide.md) | Full slide-by-slide breakdown of the 9 top IG carousels — copy, visual, tactic, voice notes, and cross-post synthesis. Imported from Claude OS source file. | ✅ source import — 2026-07-04 |
| [[[Studio/Analysis/workshop-webinar-analysis]]](workshop-webinar-analysis.md) | Teaching structure, voice patterns, pitch architecture, cross-webinar synthesis (Out of Office + Slowly Viral), and LLM routing guide for the clone writer (Hermes) | ✅ 2026-06-04 |
| [[[Studio/Analysis/soft-sunday]]](soft-sunday.md) | Voice patterns, formatting rules (emoji/bold/CAPS), dos and DO NOT EVERS, topic framing, CTA architecture, and formatting rules specific to Soft Sunday newsletters. Built from 6 real examples. | ✅ 2026-06-05 |
| [[[Studio/Analysis/boh-teaching-index-phases-0-2]]](boh-teaching-index-phases-0-2.md) | Module-by-module teaching index of BOH Phases 0-2 — what each module teaches, named frameworks, key quotes | ✅ (added to INDEX 2026-07-05) |
| [[[Studio/Analysis/boh-teaching-index-phases-3-5]]](boh-teaching-index-phases-3-5.md) | Module-by-module teaching index of BOH Phases 3-5 + webinars | ✅ (added to INDEX 2026-07-05) |
| [[[Studio/Analysis/carousel-flow-and-weird-hooks]]](carousel-flow-and-weird-hooks.md) | Carousel narrative flow patterns + unconventional hook analysis | ✅ (added to INDEX 2026-07-05) |
| [[[Studio/Analysis/carousel-hook-forensics]]](carousel-hook-forensics.md) | Hook-level forensics across real carousel covers | ✅ (added to INDEX 2026-07-05) |
| [[[Studio/Analysis/email-microstyle-forensics]]](email-microstyle-forensics.md) | Punctuation/emphasis/formatting micro-patterns across real emails (periods, dots, caps, bold density) | ✅ (added to INDEX 2026-07-05) |
| [[[Studio/Analysis/simmer-opening-forensics]]](simmer-opening-forensics.md) | Cold-open patterns across real Simmer emails | ✅ (added to INDEX 2026-07-05) |

---

## How to build new analysis files

1. The relevant examples must be in `Library/Examples/` first (carousels → carousel, webinar transcripts → workshop-webinar-analysis)
2. Start a session: "Read Library/Examples/[folder] and write the [analysis-type] analysis"
3. Larry reads all examples and extracts patterns with specific citations
4. Alyssa reviews and adds anything Larry missed
5. Update status above to ✅

**Do not guess.** Analysis built from real content. Analysis built from assumptions is wrong. Every observation in an analysis file should cite a real line from a real example.

---

## How a team member uses this

**Not sure which file to open?** Start with [[Studio/Analysis/copy-task-routing]] — it maps every copy task type to the exact files to read, in priority order.

**Before writing anything in Alyssa's voice:** Read [[Studio/Analysis/writing-style]] first. It's the calibration layer.

**Before writing a sales page:** Read [[Studio/Analysis/sales-page]] for the structural map and CTA catalog. Then read the actual BOH sales page in `Library/Examples/sales-pages/`.

**Before writing for the BOH audience:** Read [[Studio/Analysis/audience/back-of-house-2025-survey-client-profile]] to understand who you're writing for.

**Rule:** analysis + examples together. Never use analysis alone without reading at least one real example first.

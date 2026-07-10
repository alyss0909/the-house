---
agent_id: larry
session_id: carousel-source-import-and-order-fix
timestamp: 2026-07-04T17:26:00-04:00
type: mid-session-insight
linked_sops: []
linked_workstreams: []
linked_guidelines: ["GL-001-file-naming-conventions"]
---

# Carousel source import and order fix

## Context

Alyssa provided the real Claude OS carousel source files after identifying that the generated brief bank had polluted the Second Brain carousel layer. She also noticed the carousel examples were out of order, which could teach Wren the wrong slide sequence.

## What we did

- Silas imported the real slide-by-slide breakdown to `PKM/Second Brain/analysis/carousel-slide-by-slide.md`.
- Silas imported the external carousel framework note to `PKM/Second Brain/frameworks/carousel-external-frameworks.md` as secondary context only.
- Silas renamed the 9 carousel example folders to date-prefixed kebab-case so they sort chronologically.
- Silas renamed all carousel images to `slide-01.jpg`, `slide-02.jpg`, etc., preserving the intended read order.
- Larry updated the Second Brain index, COMPASS, carousel routing, analysis index, frameworks index, quickref, and carousel brief generator references.

## Decisions made

- **Question:** Should generated brief banks teach carousel structure?
  **Decision:** No. The real source of truth is the actual carousel images plus `carousel-slide-by-slide.md` and `carousel.md`.

- **Question:** How should carousel examples be named?
  **Decision:** Date-prefixed folders plus `slide-NN.jpg` images. This makes both chronological post order and intra-carousel slide order obvious to humans and LLMs.

## Insights

- Example order is part of the data. If carousel slides or folders are sorted wrong, an LLM may learn the wrong pacing and persuasion sequence even if every image is present.

## Realignments

- Alyssa clarified that the brief bank "just kinda messed up" and provided the actual source file that should have been used.

## Open threads

- [ ] If more source files arrive from Claude OS, import them as source documents first, then derive frameworks/templates from them. Do not skip straight to generated examples.

## Next steps

- For carousel work, use `analysis/voice-profile.md`, `frameworks/carousel-quickref.md`, `templates/carousel-brief.md`, and add `analysis/carousel-slide-by-slide.md` when studying real examples or building a new concept.

## Cross-links

- [[2026-07-04-17-01_larry_retired-invalid-carousel-brief-bank]] - retired the invalid brief bank
- [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]] - original carousel system build

---
agent_id: larry
session_id: carousel-ingestion-lightweight-rule
timestamp: 2026-07-04T19:02:00-04:00
type: proactive
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# Carousel Ingestion Lightweight Rule

## Context

Alyssa clarified that adding more carousels slide by slide into the Second Brain sounds painful, and asked how much heavy lifting the existing top 9 carousel analysis can do on its own.

## What we did

- Larry captured the operational preference before creating any new carousel workflow.

## Decisions made

- **Question:** Should every new carousel be imported slide by slide into the Second Brain?
  **Decision:** No. The top 9 analyzed carousels should remain the deep calibration layer. Future carousel intake should be lightweight by default: add a small summary row/card for each useful new carousel, and only do slide-by-slide ingestion when a post introduces a new repeatable format, outperforms, or fills a known example gap.

## Insights

- The existing top 9 can do most of the structural heavy lifting: archetypes, arcs, CTA mechanics, visual rules, caption patterns, and conversion logic.
- The current gap is coverage, not depth. The Second Brain needs just enough new examples to cover missing lanes, especially Productivity and offer-led education, without creating busywork.
- A low-friction intake path should ask Alyssa for the carousel folder/screenshots plus one sentence: "why I care about this one." Larry/Wren can handle the rest.

## Realignments

- Alyssa's constraint, verbatim: adding more carousels slide by slide "seems like a pain in my butttt but i'll do it if we need it."

## Open threads

- [ ] Create a lightweight carousel intake template if Alyssa wants this formalized.
- [ ] Use top 9 as canonical deep calibration unless a new carousel meets the escalation criteria.

## Next steps

- For future carousel ingestion, start with a minimum viable intake: screenshots/folder, caption if available, metrics if available, and Alyssa's note on why it matters.

## Cross-links

- [[PKM/Second Brain/examples/Carousels/INDEX]]
- [[PKM/Second Brain/frameworks/carousel-framework]]
- [[PKM/Second Brain/examples/Carousels/captions]]

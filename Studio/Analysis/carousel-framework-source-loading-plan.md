---
title: Carousel Framework Source Loading Plan
type: implementation-plan
status: executed 2026-07-17 (cards built)
date: 2026-07-17
owner: Larry
related:
  - "[[Studio/Analysis/carousel-winning-flow-report]]"
  - "[[Studio/Analysis/carousel-slide-by-slide]]"
  - "[[Library/Examples/Carousels/INDEX]]"
---

# Carousel Framework Source Loading Plan

Executed 2026-07-17. The five framework cards now exist in Studio/Analysis/Frameworks/carousels/: [[Studio/Analysis/Frameworks/carousels/house-report]], [[Studio/Analysis/Frameworks/carousels/old-way-new-way]], [[Studio/Analysis/Frameworks/carousels/how-to]], [[Studio/Analysis/Frameworks/carousels/hot-take]], [[Studio/Analysis/Frameworks/carousels/for-the-girls]].

Goal: keep carousel-writing agents from loading the whole carousel corpus when they only need the right examples for the chosen framework.

This plan was executed 2026-07-17. The section below is kept as the original rationale.

## The Problem

The current source stack is useful but heavy.

If a writer loads the full report, the full slide-by-slide analysis, all carousel folders, the offer MAP, voice files, and craft references, the context gets bloated. The agent starts summarizing instead of writing.

The fix is not more analysis. The fix is a source router.

## Proposed Shape

Keep [[Studio/Analysis/carousel-winning-flow-report]] as the main writer-facing report.

Add short framework cards only if needed later:

- `Studio/Analysis/Frameworks/carousels/house-report.md`
- `Studio/Analysis/Frameworks/carousels/old-way-new-way.md`
- `Studio/Analysis/Frameworks/carousels/how-to.md`
- `Studio/Analysis/Frameworks/carousels/hot-take.md`
- `Studio/Analysis/Frameworks/carousels/for-the-girls.md`

Each card should stay short. It should not become another analysis report.

## Card Format

Each card should include:

- when to choose this framework
- 1 primary example to load
- 1 backup example to load only if needed
- exact section to read in [[Studio/Analysis/carousel-slide-by-slide]]
- dedicated writing-style file, if the lane has one
- content-role cautions: freebie, product/template, webinar/class, paid offer, waitlist, or affinity
- offer/CTA cautions
- failure modes
- optional visual reference note

## Loading Rules

Default writing load:

1. [[Studio/Analysis/carousel-winning-flow-report]]
2. the relevant offer MAP
3. the chosen framework card, if it exists
4. the primary example folder for that framework
5. only the matching section of [[Studio/Analysis/carousel-slide-by-slide]]

The writer should decide content role before writing the CTA. Same framework, different role, different timing:

- Freebie: the final ask can be simple if the deck already taught the first useful move.
- Product/template: reveal early only when the product itself is the teaching surface.
- Webinar/class: leave room for the class to carry the full method.
- Paid offer: earn the ask with stronger belief-building first.
- Waitlist: sell the world and future payoff more than immediate action.
- Affinity: skip the forced CTA.

Do not load [[Studio/Analysis/Frameworks/carousel-framework]] for normal writing. Use it only for debugging taxonomy or old craft notes.

Do not load every carousel folder. Choose the closest framework example.

Do not load external craft references unless the draft has a mechanics problem.

## First Source Map

House Report:
Primary example: [[Library/Examples/Carousels/2026-01-15-slow-marketing-trends-pt-1]]
Backup example: [[Library/Examples/Carousels/2026-01-29-smart-founders-going-low-maintenance]]
Slide-by-slide section: Jan 15 or Jan 29 only.

Old Way / New Way:
Primary example: [[Library/Examples/Carousels/2026-02-24-swapped-instagram-for-pinterest]]
Backup example: [[Library/Examples/Carousels/2026-01-20-whats-actually-shifting-in-2026-pt-2]]
Slide-by-slide section: Feb 24 first.

How To:
Primary depends on version.
Metaphor Plan: [[Library/Examples/Carousels/2026-02-10-get-clients-from-pinterest]]
Product Plan: [[Library/Examples/Carousels/2026-02-06-pinterest-marketing-for-beginners]]
Proof-First Plan: [[Library/Examples/Carousels/2026-02-19-pinterest-sugar-mama]]
Clock-In Plan: [[Library/Examples/Carousels/2026-03-01-80-days-until-summer-90d-clock-in]]

Hot Take:
Primary example: [[Library/Examples/Carousels/2026-03-03-organic-marketing-is-dying]]
Backup example: none until another receipt-heavy post exists.

For The Girls:
Primary example: [[Library/Examples/Carousels/2026-01-22-wasting-time-for-the-girls]]
Backup example: [[Library/Examples/Carousels/2026-02-14-valentines-for-the-girls]]
Required style load: [[Hermes/craft/for-the-girls-posts]]
Required evidence load: [[Library/Examples/Carousels/for-the-girls-slide-copy]]

## Open Questions Before Execution

- Should framework cards exist as separate files, or should the source map stay inside the main report?
- Should each card include a small contact sheet image, or only link to the real carousel folder?
- Should the router require a How To version before writing?
- Should the source map include captions and metrics by default, or only slide copy?

## Current Recommendation

Build cards only if agents still over-load context after the main report is stabilized.

Do not copy slide-by-slide analysis into the cards. Link to exact sections instead.

Do not add screenshots as required context. Keep them optional for visual planning.

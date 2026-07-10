---
agent_id: larry
session_id: ws011-calendar-chip-refinement
timestamp: 2026-07-07T18:00:00Z
type: close-session
linked_sops: []
linked_workstreams: [WS-011-weekly-carousel-pitch]
linked_guidelines: [GL-003-design-system]
---

# WS-011 calendar — chip design iteration, GL-003 graduation

## Context

Continuation of today's WS-011 Content Command Center build ([[2026-07-07-16-00_larry_ws011-command-center-shipped]]). Alyssa didn't love the calendar's week-theme/day-type chip styling and put Iris through ~8 live iteration rounds until landing on a final approved pattern. Session closes with that pattern graduated into GL-003.

## What we did

- Iris iterated the 05 Approved calendar's week-theme and day-type chips through multiple passes: modern outlined tag → solid folder-color fill → gridded/stretched-to-cell → back to fixed uniform size with the folder-fill look, landing on a final combined spec.
- Larry made two precise fixes directly (no subagent needed) after live-DOM-measuring the actual mismatch: day-type chip width (was 88px vs the 188px day cell below it) and applying `var(--db-terracotta)` text color + unified size/weight across both chip types.
- Larry verified every round live via the Obsidian CLI (`getBoundingClientRect`/`getComputedStyle`, not screenshots-only) after repeated correction from Alyssa for eyeballing instead of measuring.
- Dispatched Iris (background, running at close) to graduate the final approved pattern into `GL-003-design-system.md`, cross-checked against the live `dashboard.css` values.

## Decisions made

- **Question:** How should repeating chips of the same type be sized? **Decision:** uniform size = the largest chip in the group (never individual content-based floating widths — reads as "weird spacing").
- **Question:** Category chips vs. metadata chips — same treatment? **Decision:** No. Category/identity chips (folders, day-types) = solid fill + dark `#1a1a1a` text. Metadata chips (week themes) = same fill, but unbolded, smaller (10.5px), terracotta `#8b4a2f` text — a quieter sibling.
- **Question:** What happens when a fill is too dark for the standard text color? **Decision:** case-by-case exception (white text), not a blanket rule — lavender was the only offender.
- **Question:** How many "approved" signals should a card carry? **Decision:** exactly one (full-card recolor) — corner labels/chips stacked on top of an already-colored card get removed every time this comes up.

## Insights

- **Measure, don't paraphrase.** Larry mis-transmitted Alyssa's visual references to Iris twice ("outline" meant solid-fill-with-hairline-border, not hollow-bordered) by describing screenshots in words instead of measuring/reading the actual reference. Live-DOM measurement (`getBoundingClientRect`, `getComputedStyle`) resolved every subsequent round in one pass.
- A stray blank Obsidian screenshot (`v17-retry.png`, `v18-repaint.png`) was a capture-timing artifact, not a real bug — confirmed via `dev:errors` (clean) and `dev:dom ... text` (correct content present) before re-shooting. Don't assume a blank screenshot means broken CSS; check the DOM/console first.
- The "Ship It" button (solid pink, Draft tab) is a keeper — Alyssa explicitly loved it and it's now the house pattern for primary commit actions vs. quieter mark/react buttons.

## Realignments

- "no this is not that hard lol wtf are you looking at the screenshots i sent you? ... tell me teh size" — Larry was eyeballing/describing images instead of measuring; corrected to live-DOM measurement for the rest of the session.
- "girl stop adding python you know the size of the calendar cells" — Larry over-engineered a pixel-sampling detour when the Obsidian CLI already had the exact live numbers; dropped Python entirely.
- Multiple "no/nonono" corrections across the chip rounds (hollow-outline misread, solid-fill-too-flat, stretched-to-row-too-heavy) — see decisions above for where it landed.

## Open threads

- [ ] **Home page redesign** — still Alyssa's call (Mission Control / Big Calendar / Cockpit / mash-up), carried from the prior log.
- [ ] Phase 2 headless action buttons — unchanged, still pending daily use.
- [ ] W28 Wednesday A/B pick + FTG interview — still open on the live dashboard.
- [x] GL-003 chip pattern graduation — dispatched to Iris, running in background at session close; verify next session it landed cleanly.

## Next steps

- Confirm Iris's GL-003 update on next session open.
- Resume home-page direction conversation.

## Cross-links

- `[[2026-07-07-16-00_larry_ws011-command-center-shipped]]` — the session this directly continues.
- `[[2026-07-07-00-00_iris_ws011-week-theme-chip-redesign]]` — Iris's own log of the chip iteration rounds.

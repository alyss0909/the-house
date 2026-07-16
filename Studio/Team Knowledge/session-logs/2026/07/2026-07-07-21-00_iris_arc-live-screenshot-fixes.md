---
agent_id: iris
session_id: arc-live-screenshot-review
timestamp: 2026-07-07T21:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
mined: true
---

# 02 Arc live-screenshot fixes: nav-title spacing, day-heading duplication, cover-box redesign

## What happened

Alyssa reviewed a live screenshot of [[Studio/Content/dashboard/02 Arc]] and gave three direct execution instructions — no options, ship it:

1. **Spacing above the page title.** Large gap between the nav pill row and the "02 Arc" H1.
2. **Day-heading row duplication.** "Monday   The Email That Wakes Up A Dead List" — she wants only "Monday," never the post title, since the title already shows in the cover box.
3. **Cover box redesign.** The full-width bordered box with a small "COVER" label and one line of large serif text felt "ugly," "huge," "long" — empty-placeholder feeling from excess vertical padding and centered text on a stretchy full-width card.

## What I changed

**Fix 1 — nav/title spacing (`.obsidian/snippets/dashboard.css`):**
Root cause found via reading Minimal theme's `theme.css`: `--p-spacing: 1.75rem` (28px) governs vertical rhythm between top-level preview blocks, and stacked with `.db-nav`'s own `margin: 0 0 18px 0` between the nav dataviewjs block and `.db-page-title`. `.db-page-title`'s existing `margin-top: 4px` was losing to the theme rule (no `!important`). Fixed by forcing `.db-page-title`'s top margin to win with `!important`, and collapsing the default bottom margin on the block wrapping the rendered nav. Fix is global to `.dashboard` scope — the nav→title markup pattern is identical on all five sub-pages (01–05), not Arc-specific.

**Fix 2 — day-heading row ([[Studio/Content/dashboard/02 Arc]]):**
Removed `<h2>${title}</h2>` from the day-heading row's markup entirely (not CSS-hidden). Row now emits only `<span class="db-day-name">${dayFullLabel[dayKey] || dayKey}</span>`. This meant the title needed a new render location — moved into the redesigned cover box (fix 3).

Also fixed, same file: `dayFullLabel` lacked a bare `WED` key (only `WED-A`/`WED-B`, `MON`, `FRI`), so a lone non-split Wednesday arc would have fallen through to the raw "WED" abbreviation via the `|| dayKey` fallback. Added `WED: "Wednesday"`. Checked [[Studio/Content/dashboard/03 Hook]] for the same map — it had the identical gap — fixed there too for parity (WED-key fix only; Hook's day-heading still shows day+title inline via its own `.db-who` span, untouched, out of scope for this pass since Alyssa named Arc specifically).

**Fix 3 — cover box redesign ([[Studio/Content/dashboard/02 Arc]] + `dashboard.css`):**
Kept the oat/hairline-border/no-solid-fill grammar locked in the prior redesign pass (see GL-003 §5 "Cover / callout box convention," first pass) — that fixed the color problem (`--db-ivory` yellow fill), not the shape problem Alyssa is calling out now. Redesigned the shape: padding cut from `18px 20px` to `10px 16px`, text-align changed from centered to left, layout changed from a tall centered column to a single compact inline row (new `.db-sb-cover-row`: label + title on one baseline-aligned line). Title font trimmed 20px → 18px to sit comfortably inline. An optional genuine `**Cover:**` description (rare in source) now renders as a quieter second line (`.db-sb-cover-desc`) under the hero row.

Since the day-heading `<h2>` was deleted (fix 2), the title now renders inside this cover row instead — `<span class="db-serif">${title}</span>` beside the "Cover" label. One render location, just relocated.

## Downstream impact

- [[Studio/Content/dashboard/04 Draft]] shares `.db-storyboard-cover` — visually affected by the tighter padding (smaller box) but not functionally broken; its usage (label only, no title span, no description) still renders correctly at the new compact size.
- [[Studio/Content/dashboard/03 Hook]] picked up the WED-key parity fix only. It was not touched for day-heading duplication — still shows day name + title inline via `.db-who`. Flagged as an open thread if Alyssa wants the same fix there later.
- GL-003 §5 updated with three new locked subsections: "Day-heading row: day name only," "WED day-key fallback gap," "Nav-to-page-title spacing," plus a superseding addendum to "Cover / callout box convention" documenting the shape redesign and the render-location rule reversal (title moved from section-head to cover box).

## Files touched

- `.obsidian/snippets/dashboard.css`
- [[Studio/Content/dashboard/02 Arc]]
- [[Studio/Content/dashboard/03 Hook]] (WED-key parity only)
- `Team Knowledge/Guidelines/GL-003-design-system.md`

## What the next agent should know

If Alyssa later asks for the same day-heading-duplication fix on [[Studio/Content/dashboard/03 Hook]] (day name + title currently render inline via `.db-who`), the pattern to follow is documented in GL-003 §5 "Day-heading row: day name only" — delete the duplicate title render, relocate it into whatever cover/preview element that page has (Hook doesn't currently have one; would need scoping first).

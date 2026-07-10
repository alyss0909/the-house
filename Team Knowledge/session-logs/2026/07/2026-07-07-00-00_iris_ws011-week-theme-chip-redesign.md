---
agent_id: iris
session_id: ws011-cal-chip-redesign
timestamp: 2026-07-07T00:00:00Z
type: mid-session-insight
linked_sops: []
linked_workstreams: [WS-011]
linked_guidelines: [GL-003-design-system]
---

# WS-011 dashboard — week-theme chip redesign (pending Alyssa review)

## What I did
Redesigned the left-gutter week-rotation chips on the `05 Approved.md` calendar.
CSS-only change in `.obsidian/snippets/dashboard.css` (`.db-cal-week-pill` block,
scoped under `.dashboard`). No markup change, no render-logic change — the
existing `.db-cal-week-tag` + `.db-cal-week-theme` spans and the `.sage/.peach/
.pink/.lavender` color classes already carried everything I needed.

## The problem
Old chips read like warning labels: four heavy solid pastel fills, black
borders, one inconsistent light-text exception (lavender), and flat hierarchy
(W-tag 9px vs theme 11px, near-equal weight). They sat on top of the oat/linen
calendar as foreign stickers.

## The redesign
- Oat card body (matches every other calendar surface) with a soft per-theme
  tinted wash (`color-mix` ~20% pastel into oat) instead of a saturated block.
- Pastel identity moved to a rounded 4px left accent bar ("spine") + a small
  color dot by the W-tag — distinct weeks without four heavy blocks.
- Real hierarchy: W-tag = small terracotta mono label; theme name = larger,
  ink-dark heading. Consistent dark text on all four (killed lavender's
  light-text exception).
- Rounder (16px), hairline linen-toned border (not black), soft shadow lift.

## Downstream impact
None outside this chip. Calendar data/logic, day-type headers, posts, and other
tabs untouched. No in-flight Charta/Pixel deliverable references these chips.

## Follow-up
GL-003 is still placeholder (all `<your brand X>`). Once Alyssa runs the
authoring session, GL-003 should capture a "dashboard chip" pattern token set
(tinted-oat body + accent-bar + mono label) so this treatment is reusable and
queryable rather than living only in the snippet. Not blocking.

## Realignment (v2 — Alyssa's live direction, same session)
First pass read too "designed / AI-coded" (tinted washes, accent-bar spines,
dots, shadows). Alyssa's instinct: the calendar already has a label system —
the DOW header row. Make BOTH the week chips AND the day-type labels
(Education/Offer/For The Girls) formatted like the DOW labels: same Roboto-Mono
restraint, centered, aligned to the grid, only lightly chip-ified. Restraint
is the brief.

v2 changes (CSS-only, `.dashboard`):
- Stripped all ornamentation: no color-mix oat washes, no accent-bar spine,
  no shadow, no dot.
- Week chip + day-type label now share one restrained treatment: oat pill,
  hairline border, thin 2px colored bottom-border underline as the only chrome,
  quiet darkened-pastel colored text as the only chromatic cue. Centered,
  DOW-scale mono. Four weeks still distinguishable via text + underline color.
- Day-type labels: removed the solid pastel fill + nowrap/ellipsis truncation;
  now wrap fully, centered, matching the same system.
- `.db-cal-gutter` now `justify-content: center` so week chips center under
  the column, aligned with the DOW row above.
- Full theme names still fully visible (no truncation).
- GL-003 follow-up now: "dashboard label/chip" pattern = oat pill + hairline
  border + thin colored underline + quiet colored mono text (NOT filled block).

## Realignment (v3 — Alyssa's live direction, same session — LANDED HERE)
Alyssa rejected v2 ("not this pastel shit" re: the quiet underline/tinted-text
treatment). Her actual want: mirror the sidebar FOLDER CHIPS she already loves
(DELIVERABLES / PKM / TEAM / TEAM INBOX / TEAM KNOWLEDGE) defined in
`.obsidian/snippets/folder-colors.css`. That treatment: SOLID pastel fill,
`border-radius: 4px`, dark `var(--text-normal)` text, Roboto-Mono uppercase.

v3 changes (CSS-only, `.dashboard`) — this is the current state on disk:
- Week chips (`.db-cal-week-pill`) + day-type labels (`.db-cal-type`) both now
  = SOLID folder-palette fill, `border-radius: 4px`, dark text, mono caps.
  Exactly the folder-chip look.
- Week themes map to her folder colors via the existing render logic (unchanged):
  W1 Email = sage, W2 Pinterest = peach, W3 BoH Systems = pink,
  W4 Productivity = lavender. Day-types: Education = sage, Offer = peach,
  For The Girls = pink.
- Lavender (W4) is the one dark-ish fill; text nudged to #241a33 to stay
  legible (folder chips face the same lavender; dark text holds).
- Full theme names still wrap fully (no truncation); chips centered in the
  gutter / under their column (gutter `justify-content: center` retained).
- Removed all v1/v2 ornamentation (washes, spines, dots, shadows, underlines).

## GL-003 follow-up (revised, non-blocking)
The reusable house pattern is now clearly "folder-chip": SOLID pastel fill +
4px radius + dark text + Roboto-Mono caps, using the folder palette
(sage/peach/pink/lavender/ivory). When GL-003 is populated, capture this as the
dashboard chip/label token — it's Alyssa's established, beloved aesthetic and
already lives canonically in `folder-colors.css`.

## v4 — sizing/spacing (Alyssa approved v3 look; only the box model was wrong)
v3 colors/style APPROVED. Problem: chips floated as little pills with margins,
so spacing looked random. Alyssa wants them gridded to the calendar — sized to
the cells, equal, symmetric, no floating pills.

v4 changes (CSS-only, `.dashboard`; v3 fills/caps/palette untouched):
- Day-type chips (`.db-cal-type`) = header BAND sized to the column. Parent
  `.db-cal-dow` switched to `align-items: stretch`; chip is `width: 100%`,
  `box-sizing: border-box`, thinner bar (`padding: 3px 6px`), removed
  `max-width`/auto-centering. Full column width, flush over the day cells.
  All three identical size.
- Week chips (`.db-cal-week-pill`) = side BAND sized to the row. Parent
  `.db-cal-gutter` switched to `align-items: stretch` + `justify-content:
  stretch` (side padding `0 10px` for a narrower inset strip); chip has
  `margin: 0`, `box-sizing: border-box`, removed `align-self`/`margin:0 auto`.
  Full row height, flush to the row. All four identical size.
- Symmetric: chips now lock to the grid's own column/row dimensions; the grid's
  8px gap carries the consistent spacing. No free-floating pills.

## v5 — combine cool styling + uniform sizing; two chip types diverge (CURRENT)
v4 was wrong two ways: stretching week chips to row height made them all
different sizes ("spacing still super weird"), and the flat solid block lost the
styling she liked. She clarified she wants BOTH the cooler look AND uniform
sizing, and that the two chip types should be styled DIFFERENTLY.

Final v5 (CSS-only, `.dashboard`):
- WEEK chips (`.db-cal-week-pill`, left gutter): the modern look she liked —
  OUTLINED tag (1.5px theme-color border, oat body, 8px radius), TEXT-SIZE
  HIERARCHY (8px muted W# tag over 11px theme name), INSIDE TEXT COLOR
  VARIATION (theme name in a darkened theme color, W# muted). UNIFORM FIXED
  size for all four = 98x46px (W4 Productivity's footprint), centered in each
  gutter row (`.db-cal-gutter` back to align/justify center; no stretch).
- DAY-TYPE chips (`.db-cal-type`, over M/W/F): small SOLID-fill rounded pills
  (sage/peach/pink, dark text, mono caps, pill radius) — NOT outlined tags,
  NOT full-width bars. UNIFORM size across all three = fixed 84px width
  ("For The Girls" footprint), centered over their column (`.db-cal-dow` back
  to align-items: center).
- Two types intentionally different; each uniform within its own type; both
  neat/equal and grid-aligned. No stretching, no random spacing.
- Fixed sizes (98x46 / 84px) are the tuning dials if Alyssa wants a touch
  bigger/smaller.

## v6 — corrected to match Alyssa's reference screenshots exactly (CURRENT)
Coordinator flagged v5's "outlined tag" (hollow oat + colored border + colored
text) as its own misread of Alyssa's screenshots, not her direction. She'd
shown reference images twice; this pass matches them directly instead of
another verbal reinterpretation.

Final v6 (CSS-only, `.dashboard`):
- WEEK chips (`.db-cal-week-pill`, left gutter): back to v3's SOLID
  folder-color fill (sage/peach/pink/lavender), filling the whole pill — no
  hollow background, no border-outline. Taller pill radius (14px). Kept the
  two-size hierarchy: small W# label (8px) on top, larger bold theme name
  (10.5px, tuned down from 12px to guarantee one-line fit for "PRODUCTIVITY")
  below, centered. Dark text on every fill (lavender nudged to #241a33).
  Fixed uniform size 100x44px, all four identical, centered in the row.
- DAY-TYPE chips (`.db-cal-type`, over Mon/Wed/Fri): small solid-fill rounded
  pill (sage/peach/pink), dark text, mono caps — switched `white-space` from
  `normal` to `nowrap` so "FOR THE GIRLS" no longer wraps to two lines.
  Font-size dropped to 7.5px and letter-spacing to 0.01em so it fits on one
  line; fixed width 88px (sized to that longest label) shared by all three,
  centered over their column.
- Both chip types remain their own established look (v3 solid-fill family for
  both) — no more hollow/outlined treatment anywhere in this component.

## State
Pending coordinator screenshot-compare against Alyssa's three reference images
before her next look (v6 — solid-fill two-line week pills + one-line day-type
pills; current on disk).

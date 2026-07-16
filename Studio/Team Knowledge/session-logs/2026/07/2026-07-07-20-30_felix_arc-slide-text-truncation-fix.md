---
agent_id: felix
session_id: 2026-07-07-arc-truncation
timestamp: 2026-07-07T20:30:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
mined: true
---

# Fix: slide-preview card text truncation blocked Approve/Redo on 02 Arc.md

Alyssa flagged from a live screenshot that the numbered slide-preview mini-cards
(Frame/Proof/Step/Step/CTA under each arc's cover box) show text cut off with an
ellipsis, with no way to read the full line before deciding Approve or Redo. Her
words: "the text is getting cut off on the arc and so .. how can i approve it" —
a real usability blocker, not cosmetic.

## Root cause

Pure CSS, not JS. `.db-slide-text` in `.obsidian/snippets/dashboard.css` (line
~417-419) applies `-webkit-line-clamp: 4` with `overflow: hidden`. The full
untruncated slide text was already in the DOM the whole time — it's rendered
into a `title="${full}"` attribute on the card in [[Studio/Content/dashboard/02 Arc]]
(dataviewjs, `renderArcCard`) — so it was reachable via hover tooltip, but that
wasn't discoverable/reliable enough for a real approve/redo decision. No JS
`.slice()`/`.substring()` truncation anywhere in the render path.

## Fix implemented

Click-to-expand toggle per card, native tooltip kept as a zero-JS hover
fallback (no existing expand/collapse pattern existed elsewhere in the
dataviewjs codebase to reuse — checked 01 Concepts and others, none found —
so this establishes the pattern, matching the file's existing `dbWire*`
wiring convention).

- [[Studio/Content/dashboard/02 Arc]]:
  - Slide card markup now adds `tabindex="0" role="button" aria-expanded="false" aria-label="..."` and a `.db-slide-expand-hint` ("read more" / "show less") span, keeping `title="${full}"` as-is.
  - New `dbWireSlideExpand(container)` function: click or Enter/Space toggles `.db-slide-expanded` on that card, flips `aria-expanded`, updates the hint text. Uses the same `dataset.wired` double-bind guard as the file's other wiring functions.
  - Called alongside `dbWireArcReacts(dv.container)` at render time.
- `.obsidian/snippets/dashboard.css`:
  - `.db-slide-card` cursor changed from `default` to `pointer`, added `:hover` and `:focus-visible` states.
  - New `.db-slide-card.db-slide-expanded` rule: `grid-column: 1 / -1` so an expanded card spans the full storyboard grid width instead of colliding with neighbors, `min-height: 0`.
  - New `.db-slide-card.db-slide-expanded .db-slide-text` rule lifts the clamp (`overflow: visible; display: block; -webkit-line-clamp: unset`).
  - New `.db-slide-expand-hint` label style (small caps, muted, bottom-right of card).

No grid layout breakage: expanded cards take the full row width rather than
stretching within a fixed-height cell, so long text doesn't distort sibling
cards.

## States / accessibility

- Default (collapsed): clamped to 4 lines, "read more" hint visible.
- Expanded: full text, full-width, "show less" hint, `aria-expanded="true"`.
- Keyboard: card is `tabindex="0"` + `role="button"`, Enter/Space toggles, matches the existing approve/redo button pattern for interactive elements in this file.
- Hover: native `title` tooltip still works as a fallback, unchanged.

## Val handoff

Ready for QA gate. Suggest Val verify: click-toggle on a long slide (the
"cold list" example from Alyssa's screenshot), keyboard toggle via Tab+Enter,
and that expanding one card in a grid row doesn't clip/overlap neighboring
cards at narrow breakpoints (storyboard grid goes `repeat(auto-fill,
minmax(120px, 1fr))` under the existing mobile breakpoint in dashboard.css).

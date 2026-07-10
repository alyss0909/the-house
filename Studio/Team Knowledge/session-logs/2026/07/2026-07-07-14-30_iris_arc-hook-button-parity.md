---
agent_id: iris
session_id: arc-hook-button-parity-2026-07-07
timestamp: 2026-07-07T14:30:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
---

# Arc/Hook legacy icon-circle buttons converted to the locked labeled-pill system

## What happened

Alyssa rejected the icon-only circle buttons (`.db-react-btn.yes/.no/.redo`) on [[Studio/Content/dashboard/02 Arc]] and [[Studio/Content/dashboard/03 Hook]] outright — "ugly," no options requested, straight execution. This closes the Version A/B fork I'd flagged in GL-003 §5 last pass (recolor-only vs. full pill conversion) — Alyssa picked full conversion, no further discussion needed.

## What changed

- [[Studio/Content/dashboard/02 Arc]] and [[Studio/Content/dashboard/03 Hook]]: the shared `dbReactRow()` helper function (identical in both files) now emits `class="db-react-btn week yes"` / `class="db-react-btn reject no"` / `class="db-react-btn idea redo"` with visible text labels **Pick / Kill / Redo**, replacing the old icon-only `&#10003;` / `&#10005;` / `&#8635;` circles.
- Kept the original `.yes/.no/.redo` classes alongside the new `.week/.reject/.idea` classes so `dbWireReacts`'s existing class-detection click logic (`btn.classList.contains("yes")`, etc.) and the verdict strings it writes (`✓ picked` / `✕ killed` / `↻ redo`) were untouched — this was a markup/label change only, not a logic change.
- **No CSS changes.** `.dashboard .db-react-btn.week/.reject/.idea` and the `--db-react-btn-w` uniform-width token in `dashboard.css` were already written generically (not scoped to `01 Concepts`), so Arc and Hook inherit the locked pink/peach/sage color mapping, pill shape, uniform width, hover states, and `box-shadow: none` automatically just by adopting the same classes.
- `GL-003-design-system.md` §5: closed the "Legacy pick/kill/redo icon-circle buttons on 02 Arc / 03 Hook" open thread — now reads RESOLVED with the full mapping documented (Pick=pink, Kill=peach, Redo=sage, shared `--db-react-btn-w`, no new CSS needed). Updated the pass-history summary line at the end of §5 to record the sixth pass.

## Why this matters for next time

This is the second time in this dashboard build that a shared CSS class turned out to already be page-agnostic, meaning a "new" visual treatment on a second/third page required zero new CSS — just markup adoption of the existing class. (First time: `--db-cal-type-w` extending from the calendar to Concepts.) When a locked pill/chip/button treatment exists on one dashboard page, always check whether the CSS rule is already scoped broadly (`.dashboard .foo`) before writing a new one-off rule for the next page that wants the same look — it usually already applies.

## Downstream impact

None outstanding — Arc and Hook were the only two pages still carrying the pre-lock button treatment. All three dashboard pages with action-button rows (`01 Concepts`, `02 Arc`, `03 Hook`) now share one pill system, one color mapping, one width token. No in-flight Charta/Pixel deliverables reference this section.

## Next design-system action

None pending on this thread. Remaining open items in GL-003 "Still open / parked": calendar sizing (low priority), tiny corner-gap cosmetic issue, Concepts/Calendar day-of-week chip-style divergence (flagged, revisit only if Alyssa asks), and the "truer orange" token option for Reject/Kill (currently peach, a new token if she wants a dedicated orange later).

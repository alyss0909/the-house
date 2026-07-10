---
agent_id: iris
session_id: 2026-07-07-arc-cover-duplicate-and-spacing-fix
timestamp: 2026-07-07T21:30:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
---

# 02 Arc — duplicate cover title line removed, react-row spacing tightened

## What I did

Two direct fixes on [[Studio/Content/dashboard/02 Arc]] + `.obsidian/snippets/dashboard.css`, both executed without a pitch per Alyssa's instruction (obvious fixes).

**1. Duplicate title line under the cover box.** Root cause: [[Studio/Content/dashboard/02 Arc]]'s `renderArcCard()` derived `coverText` from the source's `**Cover:**` line whenever *any* such line existed, with no check against `title`. Every real pitch sheet's `**Cover:**` line is the title repeated verbatim (confirmed in [[Studio/Content/2026-W29-pitch]] — `### MON — The Email That Wakes Up A Dead List` / `**Cover:** The Email That Wakes Up A Dead List`), so the compact cover row (label + title) always got a second, muted `.db-sb-cover-desc` line underneath repeating the same title. Fixed by adding a case/whitespace-insensitive compare (`normFold`) between the cover line and the title — `coverText` (and its render) is now `null` unless the source copy is genuinely distinct. Applies to every card via the shared `renderArcCard()` function (Monday, Wednesday A/B, Friday).

**2. Spacing before "add arc notes" input.** Root cause: Arc's react-row markup uses its own class, `.db-arc-react-row` (via `dbArcReactRow()`), which is distinct from the generic `.db-react-row` class that already had the correct tightened spacing (`border-top` hairline + `margin-top/padding-top: 10px` + flex-column `gap: 8px`). `.db-arc-react-row` had zero spacing rules of its own in `dashboard.css`, so the gap between the Approve/Redo button row and the note input fell back to default stacked-`<div>` spacing — visibly looser than the card's established 6-10px rhythm (sources-strip, arc-note, etc.). Fixed by giving `.db-arc-react-row` the identical rule set as `.db-react-row`. Applies to every arc card via the same shared function — Monday/Wednesday(A/B)/Friday all affected uniformly, confirmed by reading the single `renderArcCard()`/`dbArcReactRow()` code path (no per-card duplication existed to chase).

## GL-003 changes

Added two entries under §5:
- A "CORRECTED same day (third pass)" addendum to the existing "Cover / callout box convention" entry, documenting the removal of the duplicate-title fallback and superseding the prior "genuine description renders as a second line" language (that description is now gated on an actual-difference check, not "a `**Cover:**` line exists at all").
- A new "Arc react-row spacing convention" entry documenting the `.db-arc-react-row` fix.

No downstream Charta/Pixel deliverables reference either of these sections — this is dashboard-chrome CSS/JS (WS-011 Content Command Center), not brand-content design tokens, so no re-render obligations elsewhere.

## What the next agent should know

- `.db-sb-cover-desc` CSS itself is untouched and still valid for the rare case where source `**Cover:**` copy genuinely differs from the arc title — only the JS gate deciding whether it ever renders changed. Don't re-introduce an unconditional render.
- `.db-arc-react-row` and `.db-react-row` are now visually identical rule sets but remain separate classes (different markup call sites: [[Studio/Content/dashboard/02 Arc]]'s `dbArcReactRow()` vs. other cards' generic react zone). If a future spacing tweak targets one, check whether the other needs the same edit — they're twins by convention, not by shared selector.

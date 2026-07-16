---
agent_id: iris
session_id: arc-draft-fix-2026-07-07
timestamp: 2026-07-07T15:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [[GL-003-design-system]]
mined: true
---

# Fixed the solid-yellow cover box, duplicate title, mismatched day chip, and sources-line readability on 02 Arc and 04 Draft

## What happened

Alyssa reviewed screenshots of [[Studio/Content/dashboard/02 Arc]] and [[Studio/Content/dashboard/04 Draft]] and gave direct execution instructions, no options requested:

1. Kill the solid yellow/peach "COVER" box on Arc ("i dont like the yellow box").
2. Remove the duplicate concept title (rendered once in the section head, again inside the cover box).
3. Fix Arc's Monday day chip to visually match Concepts' bare-serif day-name convention — she explicitly overruled my prior "legitimate structural difference" ruling that kept `.db-day-chip` alive on Arc/Hook/Draft.
4. Flag and fix the raw-path "Sources:" line — long file paths as inline link text, wrapping awkwardly.
5. Full redesign of Draft's big yellow cover box ("the big yellow boxes are a hard no draft is ugo") — same pattern as Arc's, reuse one fix across both pages.

## What I did

- **Cover box (`.db-storyboard-cover` in `dashboard.css`):** changed fill from `--db-ivory` (solid peach/yellow) to `--db-oat` + standard `--db-border` hairline — matches every other card in the system instead of being the one heavy-fill exception. [[Studio/Content/dashboard/02 Arc]]'s dataviewjs no longer falls back to the concept `title` when there's no explicit `**Cover:**` line — it omits the box entirely rather than duplicating the title. [[Studio/Content/dashboard/04 Draft]] now emits `.db-storyboard-cover` directly (reusing Arc's fixed class) instead of its own separately-broken `.db-draft-cover`; the old `.db-draft-cover` rule is retired (fill corrected defensively, left dead in CSS, not deleted).
- **Day chip → day name:** [[Studio/Content/dashboard/02 Arc]] and [[Studio/Content/dashboard/04 Draft]]'s MON/FRI section heads now render `.db-day-name` (bare AT KING serif, sentence case, no pill/fill/border — the same class Concepts uses) instead of `.db-day-chip` (solid sage pill). Layout differs from Concepts (inline beside the `<h2>` in a flex row, not stacked above a post-type oval) but no new CSS was needed — `.db-day-name`'s existing `display: block` resolves correctly as a flex child. 03 Hook was NOT touched — out of scope for this pass, still uses `.db-day-chip`, flagged as the likely next parity ask.
- **Sources footer:** rewrote the sources-strip renderer in [[Studio/Content/dashboard/02 Arc]] to compute a humanized display label (basename, no extension, dashes/underscores → spaces, capitalized) while keeping the full raw path as the `data-source` attribute the click handler already resolves through `app.workspace.openLinkText` — link targets are untouched, only the visible text changed. Capped to 4 visible sources + a "+N more" tag. Restyled `.db-sources-strip` and friends in `dashboard.css` into a quieter, smaller, muted-Mono footer register with a hairline `border-top`, matching `.db-who`/`.db-note-hint` elsewhere on the dashboard rather than reading as body copy.

## What changed in GL-003

Added three new locked conventions under §5 (Component conventions):
- **Cover / callout box convention** — the oat+border, no-title, single-label pattern that replaces the solid-fill box everywhere; canonical for any future callout.
- **Sources footer convention** — the label≠target pattern (humanized display label, full path preserved as the link's actual navigation target) plus the 4-visible-max/"+N more" cap.
- **Day-name convergence** — documents that Alyssa directly overruled the prior "legitimate structural difference" reasoning; Arc and Draft now match Concepts, Hook does not yet.

Also corrected the older "day-label audit" paragraph in §5 to mark it superseded rather than silently leaving contradictory guidance live in the same file.

## Downstream impact

- **03 Hook** still uses `.db-day-chip` and was not touched. Next time Hook is opened for any dashboard work, it should get the same `.db-day-name` conversion — GL-003 now flags this explicitly so it isn't missed or re-litigated.
- Any future callout/preview box anywhere in the dashboard must start from `.db-storyboard-cover`, not a new solid-fill class — this is now an explicit anti-pattern in GL-003, not just tribal knowledge.
- No Charta/Pixel content-brand deliverables are affected — this is vault-chrome dashboard CSS, not GL-003's content-facing color/type/imagery sections. Scope confirmed against my 2026-06-13 journal entry before starting.

## Forward move

Next natural ask is converting 03 Hook's day label to match, closing the loop Alyssa opened. Not actioning without a fresh instruction, per scope discipline, but GL-003 now names it so no future agent re-argues the retired structural-difference case.

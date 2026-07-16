---
agent_id: felix
session_id: arc-hook-button-correction
timestamp: 2026-07-07T20:00:00Z
type: realignment
linked_sops: []
linked_workstreams: []
linked_guidelines: []
mined: true
---

# Arc/Hook button correction — Alyssa's verdict-set fix (realignment)

Alyssa reviewed the just-shipped Arc/Hook button work with real screenshots and corrected an assumption I flagged in the previous pass but shipped anyway (Pick/Kill/Redo on both pages via one shared `dbReactRow` helper). Corrections executed this session, no re-pitch.

## What was wrong

1. **02 Arc.md** had three buttons (Pick/Kill/Redo) copy-pasted from a shared helper. Arc's own subtitle says "skim the slides, then approve or send back" — a binary decision. Three buttons never matched the page's own stated verdict set.
2. **02 Arc.md**'s card recolored sage/green unconditionally for single-arc days (MON/FRI), via `renderArcCard(..., {locked: true})` hardcoded regardless of actual approval state. Violates the locked "one signal only" rule — full-card green is reserved for the actual approved state, confirmed by Alyssa's red-circled screenshot.
3. **03 Hook.md** also inherited Pick/Kill/Redo from the same shared helper. Alyssa: "the buttons on the hook page should match concepts because I'm choosing from 3" — Hook presents 3 hook variants per arc, same semantic shape as Concepts' choose/reject/save, not Arc's binary.

## What I changed

**[[Studio/Content/dashboard/02 Arc]]:**
- Removed the shared `dbReactRow`/`dbWireReacts` helper entirely from this file. Arc now has its own `dbArcReactRow` / `dbWireArcReacts` — Arc and Hook no longer share unmodified duplicate logic where their behavior actually differs.
- Two buttons only: **Approve** / **Redo**. Approve uses the locked pink token (`.week`), Redo uses peach (`.reject` class, reused for its "send back" semantic rather than sage which reads as a second positive action).
- New persistence: `dbSetArcApproved(dayKey, title, approved)` writes a `[approved]` suffix tag directly onto the arc's own `### DAYKEY — Title` heading line in the pitch sheet — same file-based suffix-tag pattern Concepts uses for `[saved]`/`[rejected]`, just applied to Arc's heading line since arcs aren't numbered list items. `dbArcIsApproved(raw, dayKey, title)` reads it back.
- `renderArcCard` no longer accepts a hardcoded `locked: true` for single-arc days. Every call site (MON, FRI, WED-A, WED-B, and the WED-A-only edge case) now passes `approved: dbArcIsApproved(raw, dayKey, title)` — green is gated strictly on the persisted flag, never assumed from "this day only has one arc." Cards start neutral/oat by default.
- The A/B "Pick this one" button now also calls `dbSetArcApproved(dayKey, title, true)` and greens that card live — picking an option IS approving it, so it uses the same underlying mechanism as the Approve button (one signal, one write path) instead of only writing to the reacts log.
- Approve button disables and reads "Approved" once persisted, matching the Concepts/Save "locked, quiet" pattern (`db-state-locked`), surviving reload.

**[[Studio/Content/dashboard/03 Hook]]:**
- Cloned Concepts' 3-button pattern exactly: **✓ Choose / ✕ Reject / ☆ Save**, same classes (`week`/`reject`/`idea`) so it inherits the locked pink/peach/sage token mapping already correct from the prior pass.
- New persistence keyed off a hook's own quoted text (hooks have no individual numbered line the way concepts do): `dbSetHookState(dayKey, hookText, tag)` scans to the arc's own `### DAYKEY —` block, finds its `Hooks:` line, and rewrites the specific hook's trailing tag in place — e.g. `Hooks: "hook one" [chosen] · "hook two" [rejected] · "hook three"`. `dbParseHookTokens`/`dbSerializeHookTokens` handle the round-trip.
- Chosen -> green card (`db-card-locked`) + disabled "Chosen" button, mirroring Concepts' Choose. Saved -> lavender-fill "Saved" button (`db-state-locked` + `.idea`). Rejected -> hollow-peach "Rejected" button (`db-state-locked` + `.reject`). All three persist on reload via `dbApplyHookRowState` reading the parsed tag at render time, same as Concepts' `dbApplyRowState`.
- Render loop switched from the old naive `hooksRaw.split("·")` (which stripped any future state tag) to `dbParseHookTokens`, the same tag-aware parser the writer uses — single source of truth for the Hooks: line format.

## Confirmation: no more unmodified shared logic where behavior differs

Arc and Hook each now have their own react-row render function, wiring function, and persistence function:
- Arc: `dbArcReactRow` / `dbWireArcReacts` / `dbSetArcApproved` / `dbArcIsApproved`
- Hook: `dbReactRow` (Hook-local, 3-button) / `dbWireHookReacts` / `dbSetHookState` / `dbApplyHookRowState`

They still share the generic, page-agnostic `dbNewestPitchFile` / `dbAppendReact` (the append-only reacts-log writer) — that's correct to share since it has no verdict-set-specific behavior, same as Concepts also uses it unmodified.

## States handled

- Arc: default (neutral/oat), approved (green card, disabled "Approved" button), redo (clears approval, reverts to neutral).
- Hook: default, chosen (green card, disabled "Chosen"), saved (lavender "Saved"), rejected (hollow-peach "Rejected") — all persist across reload.

## Accessibility

Every state-locked button keeps a distinct `aria-label` reflecting its current state ("Already approved" / "Already chosen" / "Already saved" / "Already rejected"), `disabled` attribute set so screen readers and keyboard nav skip it correctly, consistent with Concepts' existing pattern.

## Val handoff

Ready for QA gate — recommend Val verify in-browser: Arc card stays neutral until Approve is clicked (MON/FRI and both A/B options), Hook's three buttons/colors match Concepts pixel-for-pixel, and both pages' persisted states survive an Obsidian reload against [[Studio/Content/2026-W29-pitch]].

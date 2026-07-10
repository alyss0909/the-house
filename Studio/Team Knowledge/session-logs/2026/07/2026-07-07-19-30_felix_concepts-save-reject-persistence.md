---
agent_id: felix
session_id: 2026-07-07-concepts-save-reject-persistence
timestamp: 2026-07-07T19:30:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
---

# Save/Reject persistence fix — 01 Concepts

## What I found

- **Choose** already had a real persistence story: `dbMarkConceptChosen()` writes a `✓` prefix onto the concept's own numbered line in the pitch sheet, and the render loop reads that `✓` back on every load (`db-card-locked` green recolor). Correct, unchanged.
- **Save** persisted real data (`dbSaveToIdeaBank()` appends an entry to [[Studio/Content/idea-bank]]) but had **zero read-back**. Nothing on the concept's own line recorded that it had been saved. `showSaved()` only fired a 2.5s fade message — after reload the button always came back as "☆ Save" regardless of history.
- **Reject** wrote to the reacts log (`dbAppendReact`) and called `dbMarkConceptChosen(title, false)` — which **clears** the `✓` if present but does not add any rejected-state marker of its own. A rejected concept rendered byte-for-byte identical to a never-touched one. Confirmed live: [[Studio/Content/2026-W29-pitch]]'s reacts log shows "You're Allowed To Email Like A Person, Not A Brand" rejected at 19:01, but its numbered line had no marker at all before this fix.
- No separate "kill record"/footer convention exists for concept-level rejects specifically (the locked kill-record convention in the memory note applies to Larry pulling a whole concept off the slate entirely — a different, coarser action from a per-card Reject click on a still-listed concept). So Reject needed the same fix as Save, not a different one.

## What I built

Added a `[saved]` / `[rejected]` suffix tag on the concept's own numbered line, parallel to the existing `✓` prefix — same file, same line, no new database:

```
3. How I'd Get Sales This Week Without A Single New Follower [saved]
8. You're Allowed To Email Like A Person, Not A Brand [rejected]
```

New functions in [[Studio/Content/dashboard/01 Concepts]]:
- `dbSplitStateTag(rawTitle)` — strips/reads the `[saved]`/`[rejected]` suffix off a title string (used both when writing and when parsing the pitch sheet at render time).
- `dbSetConceptStateTag(title, tag)` — writes the tag onto the matching line (skips lines that are already `✓` chosen — chosen is the higher-priority, mutually exclusive state).
- `dbApplyRowState(row, stateTag)` — reflects the state on the row's buttons in the live DOM, both at initial render (via a `data-state-tag` attribute baked into the row's HTML from the parsed pitch sheet) and immediately after a click (no reload needed to see it flip).
- `dbMarkConceptChosen()` now also strips any `[saved]`/`[rejected]` tag when a concept is chosen (mutually exclusive states).
- `doReject()` (renamed from the inline `doReact("✕ rejected", false)` call) now also calls `dbSetConceptStateTag(title, "rejected")`.
- `doIdea()` now also calls `dbSetConceptStateTag(title, "saved")` after a successful idea-bank write.

Render-time parse: the numbered-line regex match now runs through `dbSplitStateTag` to pull `stateTag` off the title before it's ever compared/displayed, and that tag rides through to `reactRow()` as a `data-state-tag` HTML attribute so `dbWireReacts()` can apply it the instant the row is wired.

## Visual states (three, mutually exclusive with chosen)

- **Chosen** — unchanged: full card green recolor (`db-card-locked`). One-signal rule untouched.
- **Saved** — button reads **"Saved"**, solid **lavender** fill (`--db-lavender`), white text, disabled/no-hover. Lavender chosen specifically because it isn't used on any of these three buttons elsewhere, so it reads as a genuinely distinct third state rather than a dimmed Choose/Reject/Save.
- **Rejected** — button reads **"Rejected"**, hollow/outline peach (`--db-oat` fill, `--db-peach` border, `--db-terracotta` text) — deliberately not a solid fill, so it reads "quietly closed" rather than "still an active reject button."
- **None** — default: all three buttons active, original labels.

Deliberately did NOT reuse the green card recolor for Saved/Rejected — that's reserved for chosen per GL-003's locked "one signal" rule. New CSS lives under a new `.db-state-locked` class (+ `.idea.db-state-locked` / `.reject.db-state-locked` variants) in `dashboard.css`, same pill footprint so the row never reflows when a state locks in.

## Design tokens used

No new tokens. Reused `--db-lavender` (previously "no longer used on Concepts action buttons" per GL-003 §2 — now back in play for a genuinely new purpose) and `--db-peach`/`--db-oat`/`--db-terracotta` (existing reject-family tokens, just recombined into an outline instead of solid fill).

## GL-003 update

Logged the full convention under a new §5 subsection ("Saved / Rejected persisted state") in `Team Knowledge/Guidelines/GL-003-design-system.md`, and closed out the previously-open "Save-button click feedback" flag — this persisted-state mechanism supersedes it (Alyssa's actual complaint was about persistence across reloads, not the momentary click feedback, which `showSaved()` already covered).

## Backfill

Retroactively tagged the one concept in the live [[Studio/Content/2026-W29-pitch]] that was already rejected before this fix existed ("You're Allowed To Email Like A Person, Not A Brand") with `[rejected]`, so the dashboard reflects real history immediately rather than only going forward.

## Accessibility

Locked Saved/Rejected buttons get a real `disabled` attribute (not just `pointer-events: none` in CSS) plus an updated `aria-label` ("Already saved to idea bank" / "Already rejected") so they drop out of tab order and screen readers announce the true state instead of reading a live, clickable button that silently does nothing.

## Val handoff

Ready for QA gate. Suggest verifying: (1) reload dashboard after Save/Reject — button state persists; (2) click Choose on a previously-Saved/Rejected concept — tag clears, button reverts to default, card goes green; (3) click Save then Reject (or vice versa) on the same concept — only the latest tag wins, previous one clears; (4) tab through a card with a locked Saved/Rejected button — confirm it's skipped in tab order and the aria-label reads correctly via screen reader.

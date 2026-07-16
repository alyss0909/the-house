---
agent_id: felix
session_id: concepts-green-turn-bugfix
timestamp: 2026-07-07T16:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
mined: true
---

# Concepts dashboard "chosen = green" write-back — bug fix

## What was broken (root cause)

In [[Studio/Content/dashboard/01 Concepts]], clicking **Choose** (or **Reject**) only ever called
`dbAppendReact()`, which appends a line to the `## Dashboard reacts` log in the newest
pitch sheet. It never touched the concept's own numbered line in that pitch sheet.

The green "locked" card state is driven entirely by the render-time parser:
`line.match(/^(\d+)\.\s*(✓\s*)?(.+)$/)` → `approved = !!numMatch[2]` → applies the
`db-card-locked` CSS class (already correct and unchanged, in
`.obsidian/snippets/dashboard.css`).

Since the click handler never wrote a `✓` onto that numbered line, `approved` was always
false on re-render, so the card never turned green even though the react was logged
successfully. CSS and render/parse logic were both already correct — this was purely a
missing write-back in the click handler.

## What I changed

File: [[Studio/Content/dashboard/01 Concepts]]

1. Added `dbMarkConceptChosen(title, chosen)` helper (adapted directly from the design
   brief at [[Deliverables/2026-07-07-concepts-green-turn-design-brief]], no material
   changes needed — the brief's helper matched the current code as-is). It:
   - Finds the newest pitch sheet via existing `dbNewestPitchFile()`.
   - Reads the file, finds the numbered line whose title matches (string equality on
     normalized/bold-stripped text, not regex — titles can contain periods).
   - Prepends `✓ ` after the `N. ` prefix when `chosen` is true, strips it when false.
   - Persists via `app.vault.modify(file, lines.join("\n"))` — same vault-write API
     already used elsewhere in this dataviewjs block, consistent with the codebase's
     write pattern (reacts log uses `app.vault.append`; idea bank uses
     `app.vault.append`; this is the only in-place line edit, which the brief flagged
     as an intentional, scoped exception to the "append-only" comment).

2. Updated `doReact(verdict, chosen)` inside `dbWireReacts` to accept an optional third
   arg. When `chosen !== undefined`, it now also calls `dbMarkConceptChosen(title, chosen)`
   after the existing `dbAppendReact` call.

3. Wired the two buttons that determine chosen-state:
   - `week`/Choose button: `doReact("✓ this week", true)`
   - `reject`/Reject button: `doReact("✕ rejected", false)`
   - `idea`/Save button and the Enter-key note handler (`doReact("✎ note")`) were left
     untouched — they don't pass a third arg, so `chosen` stays `undefined` and no
     concept-line edit fires for those paths (confirmed by re-reading the wired code
     after the edit).

## Scope discipline

Only the matching concept's numbered line is ever edited (loop breaks on first match).
The reacts log append is untouched and still fires identically. No CSS changes — brief
confirmed CSS was already correct, and I didn't touch `.obsidian/snippets/dashboard.css`.

## Not done (out of scope, brief flagged as nice-to-have only)

[[Studio/Content/dashboard/02 Arc]]'s `dayChipClass`/`dayFullLabel` maps are missing a bare `WED` key (only has
`WED-A`/`WED-B`), which causes a lone-Wednesday arc to render an uncolored "WED" label.
Brief explicitly calls this out as not part of this fix. Left alone.

## Verification

Could not click-test inside actual Obsidian from this environment (static file edit
only). Verified by re-reading the full wired-up code path end to end: helper is defined
before `dbWireReacts`, `doReact` signature and both call sites match, and the Enter/idea
paths don't accidentally trigger the write. Recommend Alyssa (or Vera at QA gate) do one
live click-through: Choose a concept -> confirm card turns green and pitch sheet line
gets `✓ ` -> Reject it -> confirm card reverts and `✓ ` is stripped from the line.

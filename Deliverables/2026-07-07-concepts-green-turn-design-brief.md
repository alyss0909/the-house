---
title: Design brief — Concepts dashboard "chosen = green" write-back
date: 2026-07-07
for: Alyssa's design resource (relayed by Alyssa)
owner: Larry
scope: dashboard/01 Concepts.md (dataviewjs only — no CSS change needed)
---

# Fix: choosing a concept doesn't turn the card green

## Symptom
On the Concepts dashboard (`dashboard/01 Concepts.md`), clicking **✓ Choose** saves the react but the card does **not** turn green/locked. Alyssa chose 3 concepts on 2026-07-07 and none turned green.

## Root cause (confirmed by reading the code)
The green state is **already fully built** — this is NOT a styling bug:
- **CSS exists and is correct:** `.dashboard .db-card.db-card-locked` in `.obsidian/snippets/dashboard.css` (~line 201) already recolors the whole card green (sage-mix background + darker border). No CSS change needed.
- **Render logic exists and is correct:** in `01 Concepts.md`, a concept renders green when its numbered line in the pitch sheet starts with a `✓`. The parser is `line.match(/^(\d+)\.\s*(✓\s*)?(.+)$/)` and sets `approved = !!numMatch[2]`, which applies the `db-card-locked` class.

**The one missing piece:** the **✓ Choose** click handler (`doReact("✓ this week")` → `dbAppendReact`) only *appends a line to the `## Dashboard reacts` log*. It never writes the `✓` back onto the concept's own numbered line — so the flag that drives the green state is never set. Choosing logs the react but leaves the concept line unmarked, so it stays oat-colored.

## The fix (dataviewjs, scoped to 01 Concepts.md)
When **✓ Choose** is clicked, in addition to appending the react, **rewrite the matching concept's numbered line in the newest pitch sheet to insert `✓ ` right after the `N. `** (so `4. The Easiest Email...` becomes `4. ✓ The Easiest Email...`). When **✕ Reject** is clicked, **remove** any leading `✓ ` from that concept's line, so toggling corrects the state.

Suggested shape — a small helper called from the button handlers:

```js
// Add/remove the ✓ approval flag on a concept's numbered line in the newest pitch sheet.
async function dbMarkConceptChosen(title, chosen) {
  const file = dbNewestPitchFile();
  if (!file) return false;
  const raw = await app.vault.read(file);
  const lines = raw.split("\n");
  const want = String(title).replace(/\s+/g, " ").trim();
  let changed = false;
  for (let i = 0; i < lines.length; i++) {
    const m = lines[i].match(/^(\d+\.\s*)(✓\s*)?(.+?)\s*$/);
    if (!m) continue;
    const lineTitle = m[3].replace(/\*\*/g, "").replace(/\s+/g, " ").trim();
    if (lineTitle !== want) continue;          // string compare — titles contain periods, don't regex them
    const marked = `${m[1]}✓ ${m[3].trim()}`;  // chosen
    const bare   = `${m[1]}${m[3].trim()}`;     // rejected / cleared
    const next = chosen ? marked : bare;
    if (lines[i] !== next) { lines[i] = next; changed = true; }
    break;
  }
  if (changed) await app.vault.modify(file, lines.join("\n"));
  return changed;
}
```
Then in the existing handlers: on the `week`/Choose button call `dbMarkConceptChosen(title, true)` after the react append; on the `reject` button call `dbMarkConceptChosen(title, false)`. (`title` is already available in `dbWireReacts` as `row.getAttribute("data-title")`, which equals the rendered concept title.)

## Acceptance criteria
1. Click **✓ Choose** on a concept → that card renders **green** (dataviewjs re-runs automatically when the pitch sheet changes).
2. Click **✕ Reject** on a previously-chosen concept → card reverts to normal.
3. The `## Dashboard reacts` log still appends exactly as it does today (unchanged).
4. Only the one matching concept's numbered line is edited; the description, footer, other concepts, and reacts log are untouched.

## Gotchas
- **Match titles by string equality, not regex** — some titles contain periods (e.g., "Big Lists Are Cute. Engaged Lists Make Money.").
- The rendered title has `**bold**` stripped and whitespace collapsed; normalize the same way when matching (see helper).
- This introduces a **modify** (in-place line edit) alongside the existing append-only reacts write. That's fine — same file — but worth knowing since the current code comment says "append-only."
- No CSS work required. If you also touch `02 Arc.md`: a single-Wednesday arc currently has no `WED` entry in that file's `dayChipClass`/`dayFullLabel` maps (only `WED-A`/`WED-B`), so a lone Wednesday arc shows the label "WED" with no color — adding a `WED` key there is a nice-to-have, not part of this fix.

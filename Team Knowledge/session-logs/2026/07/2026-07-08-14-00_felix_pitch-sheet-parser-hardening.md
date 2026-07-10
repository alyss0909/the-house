---
agent_id: felix
session_id: pitch-sheet-parser-hardening-2026-07-08
timestamp: 2026-07-08T14:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-008-ponytail-lazy-senior-dev-philosophy]
---

# Pitch-sheet parser hardening — Concepts panel blank fix

Root cause of the reported blank Concepts panel: `dashboard/01 Concepts.md`'s
concept-render block does a sequential line-by-line walk over the pitch sheet,
and its footer/section-stop check (`line.match(/^---\s*$/)`) fires on the
*first* line of a leading YAML frontmatter fence — the loop `break`s before it
ever reaches `## Monday`. Combined with a case-sensitive day-header regex
(`## (Monday|Wednesday|Friday)`), an ALL-CAPS-header sheet with frontmatter
was doubly guaranteed to render nothing.

## What I checked first

Swept every block in `dashboard/*.md` that loads a `YYYY-Www-pitch.md` file
to find every caller with the same fragility (GL-008: fix the shared bug at
its root, not just the reported path). Only `01 Concepts.md` does a raw
sequential-line walk with a `---`-as-stop-marker. Every other block
(`00 Content Command Center.md`, `02 Arc.md`, `03 Hook.md`, `04 Draft.md`,
`05 Approved.md`, `Parked.md`) locates its target section via `raw.indexOf(marker)`
/ `raw.match(...)` against the whole string (or with the `/m` flag), which
scans past a leading frontmatter fence with no special handling needed — they
were already safe. No fix required there beyond one CTA-parsing parity edit
in `04 Draft.md` (see below).

## What changed

- **`dashboard/01 Concepts.md`**
  - Strip a leading `---\n...\n---\n` YAML frontmatter fence from the raw
    sheet text before splitting into lines, so the footer `---` check can
    never fire on the frontmatter fence itself. Footer-delimiter behavior for
    a correctly-formatted sheet (real `---` before the "For Alyssa" section)
    is untouched — it's the same regex, just running against frontmatter-free
    text now.
  - Day-header match is now case-insensitive (`/^##\s*(monday|wednesday|friday)\s*[—-]\s*(.+)$/i`)
    and the captured name is normalized to Title-case before it's used for
    the `dayChipClass` lookup and display — an ALL-CAPS or any-case sheet
    parses identically to a correctly-cased one.
  - CTA parsing now also accepts a `CTA: comment WORD for/→ Offer` labeled
    clause anywhere in the description (previously only a trailing
    `— comment ...` / `— no cta` em-dash clause at the very end of the
    paragraph). `dbParseCta`'s freebie extraction now tolerates a bare
    `for X` in addition to `for the X`.
  - The "found sheet but nothing parsed" warning (`db-warn`) is unchanged —
    still the fallback when a sheet is off-format enough that zero concepts
    parse.
- **`dashboard/04 Draft.md`** — mirrored the same `for X` / `for the X`
  tolerance fix in its own copy of `dbParseCta` (this file carries a
  duplicate of the Concepts CTA-parsing function; kept both in sync rather
  than refactoring them into one shared module, since GL-008 says smallest
  diff, no unrequested abstraction).
- **`dashboard/parser-check.mjs`** (new) — the GL-008-mandated runnable check.
  Extracts the Concepts parser logic verbatim (frontmatter strip, day-header
  match, CTA split, `dbParseCta`, `dbSplitStateTag`) and asserts against:
  W29 (regression baseline, must still parse 9 concepts / 3 per day /
  correct state tags / correct freebie — unchanged from before this fix),
  W30 (the real current sheet, frontmatter-free, 9 concepts), and an
  in-memory torture fixture (YAML frontmatter + ALL-CAPS day headers +
  both a mid-line `CTA: comment X for Y` clause and a trailing
  `— comment X → Y` clause). 14/14 assertions pass. Run: `node dashboard/parser-check.mjs`.

## Verification method

obsidian-cli was not available in this environment (checked `where obsidian-cli`,
`where obsidian` — neither resolved), so I used the task's explicit fallback:
a Node harness (`dashboard/parser-check.mjs`) running the extracted parser
logic against real sheet files on disk (W29, W30) plus a temporary
`2026-W99-pitch.md` torture sheet I created, ran the check against, confirmed
it parsed 4/4 concepts correctly, then deleted per the task's instructions
(confirmed gone via glob after deletion). I could not visually confirm the
live Obsidian render (no obsidian-cli/screenshot path available), so the
"looks right in the actual dataviewjs-rendered note" step is unverified by
screenshot — only by the logic-equivalent harness.

## Not touched

Write/append logic (react-append helpers, idea-bank, ✓/state-tag mutation
functions) — untouched everywhere, per hard constraint. Also left
`04 Draft.md`'s `dbFindConceptCta` alone — it's a pre-existing mismatch
against the current single-line concept-title format (looks for
`Title — desc — CTA` all on one physical line, which no longer matches how
concepts are written), but it fails gracefully (returns null, draft CTA pills
just don't render) rather than blanking anything, and fixing it wasn't part
of this ticket's reported symptom or scope.

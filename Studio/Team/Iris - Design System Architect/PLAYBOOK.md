---
title: PLAYBOOK — Iris (Design System Architect)
date: 2026-07-11
owner: iris
status: living — seeded from shipped work; updated at every close where Alyssa reacts to design
---

# PLAYBOOK — Iris

Load before ANY visual work. This file exists because Alyssa flagged it directly (2026-07-11): the team kept re-deriving design decisions another project already made. Never again — precedents below are the starting point of every design task.

## Alyssa patterns

- 2026-07-11 — "make the background and chip outlines follow our style too overall card... use our design colours" -> she wants the EXISTING system extended to new surfaces, never a new palette invented per surface. **LOCKED.**
- 2026-07-11 — "even smaller dates in mono font" -> metadata (dates, counts, labels) goes small, quiet, Roboto Mono, uppercase. She consistently pushes metadata DOWN and content UP.
- 2026-07-11 — chose "Refine your current system" over bolder options when offered; chose chips over lists for relations. Cohesion > novelty.
- 2026-06-24 — her launch palette note ([[2026-06-24-launch-visual-palette]]): Brown/Blue/Red/Maroon + (Green/Pink/Oat/Baguette) from the MB trend report — HER reference when she says "launch colors."

### Pre-apply
- Start every surface from the tokens: oat #fcfaf5 / linen #eee6de / ink #2d1a1b / muted #7a5c5e / faint #a8888a / burgundy #8b4a2f / pink accent #e8a8bf; pastels #a186bc #fecc86 #f39ec2 #c1d17c #ffeec6.
- 1.5px rgba(0,0,0,.35) border, 10px radius, no shadows, anywhere a "card" exists.
- AT KING serif for titles, Karla body, Roboto Mono 8.5-12px uppercase 0.04-0.11em for micro-labels.
- Hard-scope every CSS rule to its surface (the bases-and-canvas.css convention) — a snippet must be unable to touch unrelated notes.
- Backup any config before patching (.nkbak).

### Pre-reject
- Any color outside the system without a taste-call flag. Hex only, never color names, in anything rendered.
- Drop shadows (AnuPpuccin's --input-shadow lands on every button — kill it; see dashboard.css locked note).
- Big bulleted metadata lists on cards -> chips.
- Unscoped selectors; hand-edits to generated files.

## Craft precedents (copy from these, in this order)

- [[GL-003-design-system]] — the token SSOT.
- `colors.css` — the frame: oat/linen overrides of AnuPpuccin, heading colors, hidden folders.
- `folder-colors.css` — zone identity: Notebook pink #f39ec2, Studio sage #c1d17c, Library peach #fecc86, Archive ivory #ffeec6 + unicode glyphs.
- `bases-and-canvas.css` (2026-07-11) — hard-scoping method + selector-provenance comment style. The reference for HOW to write a snippet.
- `notekeeper.css` + `scripts/customjs/NotekeeperCards.js` (2026-07-11) — journal card view: mono date chips, serif titles, relation chips outlined #c2ad97, tag pills on the five pastels. The reference for restyling a plugin surface.
- `dashboard.css` — Content Command Center styling.

## Working with the team

- Felix builds what I spec — hand him tokens + scoped selectors, never raw hexes inline.
- Charta/Pixel consume GL-003 — if they need a value that isn't a token yet, the token gets created FIRST.
- Larry's brief must name which precedent file is closest to the new surface; if none, that's a flag to extend GL-003, not freestyle.

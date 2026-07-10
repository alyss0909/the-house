---
title: Provenance Frontmatter Backfill — Migration Plan
date: 2026-07-09
owner: Silas
source_class: output
status: plan — not executed
---

# Provenance Frontmatter Backfill — Migration Plan

A plan only. No files were moved or backfilled in producing this. The `source_class`,
`promoted_by`, and `promoted_date` fields are now specified in
[[GL-002-frontmatter-conventions]] (provenance section) and pre-seeded into the eight
entity templates. Existing files still lack the field. This describes how a later
restructure phase would stamp them, zone by zone.

## Principle

Zone determines default `source_class`. The address already implies the trust level
([[GL-013-the-house-rules]], [[VAULT-MAP]]); backfill makes each file self-declare it.
Backfill is additive metadata only — it never moves a file. Physical re-homing is a
separate restructure task and is out of scope here.

## Ordering (by zone, safest first)

1. **Notebook** (`PKM/Journal/`, `Team Inbox/` raw drops, `PKM/My Life/`, `PKM/CRM/`).
   Stamp `source_class: raw`. Highest confidence, lowest ambiguity — Alyssa-original by
   definition. Penn is the only writer that ever touches these, so a batch stamp is safe.
   Exception to watch: business-truth files (offers, prices) that are really `facts`, not
   `raw` — flag those for step 3 rather than blanket-stamping.

2. **Deliverables** (`Deliverables/`). Stamp `source_class: output`. Also low ambiguity —
   this is the session-product pile by definition. Files already promoted elsewhere are
   handled in step 5, not here.

3. **Studio facts layer** (VAULT-MAP-registered fact homes — offer/price/calendar files).
   Stamp `source_class: facts`. Requires the registry to name which file owns which fact
   (GL-013 Rule 3). Do this after the registry is confirmed, not before.

4. **Studio** (`PKM/Second Brain/analysis|frameworks|templates/`, `PKM/Signals/`,
   `PKM/Developing Ideas/`, `Hermes/` judgment/craft, `Team/`, `Team Knowledge/`).
   Default `source_class: derived`, with `map` for INDEX/COMPASS/routing/registry files.
   Highest per-file judgment cost — a derived-vs-map call per file — so it goes late.

5. **Library** (`PKM/Second Brain/examples/`, `programs/`, offer sales pages, promoted work).
   Two sub-passes:
   - Alyssa-verbatim work → `source_class: raw`, no stamp needed (Library-native).
   - Anything `derived`/`facts` physically on the shelf → must gain `promoted_by` +
     `promoted_date`. Because no agent may promote its own work (GL-013 Rule 2), each such
     file is surfaced to Alyssa for an explicit promotion decision — it is not auto-stamped.
     Files that cannot earn a stamp move back to the Studio.

6. **Archive** (`Deliverables/_archive/`, `Team Inbox/_archive/`). Stamp with whatever class
   the file held when archived, or `output` if unknowable. Lowest priority — cold storage.

## Deferral

This backfill runs inside the later restructure phases (when zones become physical folders),
not now. Sequencing it with the physical re-home avoids stamping a file's zone twice. Until
then, only new files carry the field, via the templates.

## Enforcement handoff

Once backfilled, the Library stamp gate is linted at the weekly review
([[WS-006-weekly-review]]): any Library file whose `source_class` is not `raw` and that
lacks `promoted_by` is promoted properly or returned to the Studio.

## Related

- [[GL-002-frontmatter-conventions]] — provenance field spec (the contract this backfills to)
- [[GL-013-the-house-rules]] — the trust-not-birthplace constitution
- [[GL-009-source-boundaries-and-promotion]] — the source classes this refines
- [[VAULT-MAP]] — current physical → conceptual zone mapping

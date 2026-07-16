---
agent_id: larry
session_id: retired-invalid-carousel-brief-bank
timestamp: 2026-07-04T17:01:00-04:00
type: mid-session-insight
linked_sops: []
linked_workstreams: []
linked_guidelines: []
mined: true
---

# Retired invalid carousel brief bank

## Context

Alyssa flagged [[Library/Examples/Carousels/brief-bank]] as completely inaccurate and asked where it came from.

## What we did

- Silas traced local provenance: the file was created on 2026-06-05 and was cross-linked into active carousel docs.
- Silas found no usable Git history in the current folder, but did find June 4 session notes saying the intended output was "10 new carousels" / "10 ready-to-write briefs."
- Larry retired the invalid [[Library/Examples/Carousels/brief-bank]] content and replaced it with a warning/provenance note.
- Larry removed active references to the brief bank and downgraded current Second Brain docs from "10 ready briefs" to "brief generator."

## Decisions made

- **Question:** Can generated carousel briefs live in `examples/` as completed examples?
  **Decision:** No. Real examples must be actual Alyssa-authored or Alyssa-approved source material. Generated concepts belong in `Deliverables/` as drafts until Alyssa approves them.

## Insights

- Generated briefs can accidentally create false provenance when filed under `examples/`. Any future Wren/Silas workflow should keep draft/generated copy separate from real source examples unless Alyssa explicitly approves and labels it.

## Realignments

- Alyssa's correction: the [[Library/Examples/Carousels/brief-bank]] contents were "literally 100% wrong" and should not be treated as true.

## Open threads

- [ ] Consider graduating this into a Second Brain guideline if similar source/provenance mistakes appear again.

## Next steps

- Use [[Studio/Analysis/carousel]], [[Studio/Analysis/Frameworks/carousel-quickref]], [[Studio/Analysis/Frameworks/carousel-framework]], [[Studio/Analysis/Templates/carousel-brief]], and the real carousel folders under `examples/Carousels/` for carousel work.

## Cross-links

- [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]] - original carousel system build

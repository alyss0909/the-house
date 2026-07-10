---
agent_id: silas
session_id: 2026-07-10-notebook-link-fixes
timestamp: 2026-07-10T09:17:00Z
type: end-of-session
linked_sops: []
linked_workstreams: [WS-008-content-activation]
linked_guidelines: [GL-013-the-house-rules, GL-009-source-boundaries-and-promotion]
---

# Silas — Notebook link fixes + ready-queue audit

Alyssa-requested mechanical link repairs after the Phase 2 move (GL-013 Rule 1 requested-edit exception). Path prefixes only; no words or meaning touched.

## What changed (30 wikilinks, 16 files)

- `Notebook/Life/{Goals,Habits,Key Elements,Projects,Topics}/INDEX.md` — 12 links `PKM/My Life/...` → `Notebook/Life/...`
- `Notebook/Journal/2026/06/2026-06-27-sustainable-creative-biz-signal.md` — 2 links `PKM/Developing Ideas/...` → `Studio/Signals/Developing Ideas/...`
- `PKM/Second Brain/ready-queue.md` — 13 links `PKM/Journal/...` → `Notebook/Journal/...`
- brand-world links → `Notebook/Life/Key Elements/Business/brand-world` in: `me.md` (2), `examples/{about-page,home-page,meta-copy}.md` (1 each), `analysis/{home-page,writing-style}.md` (1 each)
- `frameworks/social-hooks.md` — 1 link `PKM/Journal/...` → `Notebook/Journal/...`

Sweep-verified: zero remaining `[[PKM/Journal`, `[[PKM/My Life` (non-Offers), `[[PKM/Developing Ideas`, `[[PKM/Signals` links in Notebook/ or PKM/Second Brain/.

## What I learned

- `PKM/My Life/Offers/...` links are NOT broken — Offers stayed put per the VAULT-MAP transition table. Never bulk-rewrite `PKM/My Life` without excluding `Offers` and `INDEX`.
- `PKM/My Life/INDEX.md` still exists as a stale non-stub index; `Notebook/Life/` has no INDEX.md. Flagged to Larry.
- GL-009 gives the `task` class two homes (tasks/ + ready-queue) — structural one-home-per-fact violation. Audit with A/B recommendation at [[Deliverables/2026-07-10-ready-queue-audit.md]]; my pick is dissolve (B), Alyssa decides.

## When this does NOT apply

- No content edits were authorized or made; this carve-out covers this batch only.

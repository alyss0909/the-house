---
agent_id: larry
session_id: vault-restructure-fable-handoff
timestamp: 2026-07-09T19:41:08-04:00
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-009-source-boundaries-and-promotion]
---

# Vault restructure goal and Fable handoff

## Context

Alyssa wanted to continue the folder-structure rethink from the recent PKM / ICOR / Hermes / Content OS conversations. The core issue is trust and usability: raw Alyssa notes, AI interpretation, active team work, maps, deliverables, dashboards, and trusted source material are currently too blended.

The session ended with a clean Fable 5 handoff written to `Deliverables/2026-07-09-vault-restructure-fable-handoff.md`.

## What we did

- Larry helped articulate the restructure goal as a trust architecture, not a cosmetic folder cleanup.
- Larry clarified the proposed top-level model: `Thinking` = raw Alyssa, `Building` = team/AI workshop, `Finished` = trusted reusable shelves.
- Larry emphasized that the new structure needs more map work, not less: visible folders for Alyssa, `MAP.md` rails for agents.
- Larry identified major red flags for Fable to research: big-bang migration, `Building` becoming a junk drawer, AI analysis becoming source, Team Inbox path confusion, Hermes path dependency, Offers/Programs merge complexity, dashboard hardcoded paths, and multiple competing brains/maps.
- Larry created the Fable handoff doc at `Deliverables/2026-07-09-vault-restructure-fable-handoff.md`.
- Larry provided Alyssa with a copy-paste Fable prompt in her preferred `Task / Current situation / Intended result / Main goal` shape.

## Decisions made

- **Question:** Should the vault restructure happen immediately?
  **Decision:** No. Fable should research and stress-test first. No file movement yet.

- **Question:** What is the main goal of the restructure?
  **Decision:** Make the vault simpler for Alyssa to live in and more explicit for agents to operate inside.

- **Question:** What is the proposed top-level model?
  **Decision:** `Thinking = my mind`, `Building = the workshop`, `Finished = the shelf`, `Maps = the rails`.

- **Question:** Should visible ICOR taxonomy be preserved if Alyssa does not use it?
  **Decision:** Not by default. Useful ICOR logic can survive in maps/guidelines, but visible folders should follow Alyssa's actual use.

- **Question:** Should Offers and Programs remain split?
  **Decision:** This is a major research question for Fable. Current working hypothesis: they should likely merge conceptually under `Finished/Offers`, because Back of House is both offer and program.

## Insights

- Alyssa's real pain is not "too many folders" in the abstract. It is uncertainty about provenance: "Is this my thought, AI's take, team work, or trusted source?"
- The three-folder model only works if `Building` has a strong map layer. Otherwise it becomes the new junk drawer.
- `Team Inbox/pitches` is a live Content OS workspace, not an inbox. Any restructure must split raw capture from operational workflow space.
- The folder names should reduce Alyssa's cognitive load; the maps should reduce agent confusion.
- The source-boundary rule from `GL-009-source-boundaries-and-promotion` should become visible in the architecture, not just written as a rule agents may forget.

## Realignments

- Alyssa corrected that the handoff should be a clean document, not a strangely formatted chat block.
- Alyssa asked for the prompt in a specific structure: Task, Intended result, Main goal, Current situation. Larry reframed the Fable prompt accordingly.

## Open threads

- [ ] Alyssa to send the Fable prompt with the handoff path:
  `C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\Deliverables\2026-07-09-vault-restructure-fable-handoff.md`
- [ ] Fable to return a research-backed architecture stress test, not a migration.
- [ ] After Fable's response, Larry should compare it against the current handoff and identify what needs to become a real pilot plan.
- [ ] The first likely pilot area remains Content OS, but this is not final until Fable returns.

## Next steps

- Wait for Fable 5's architecture plan.
- Do not move files yet.
- When Fable returns, evaluate against:
  - source-boundary trust
  - Larry/team routing survival
  - Hermes source-loading survival
  - Content OS workflow survival
  - automation/dashboard path risk
  - Alyssa 10-second human usability

## Cross-links

- `[[2026-07-09-vault-restructure-fable-handoff]]` - Fable handoff deliverable.
- `[[GL-009-source-boundaries-and-promotion]]` - source-boundary law this restructure must preserve.
- `[[2026-07-05-14-45_larry_root-cause-and-one-brain-consolidation]]` - prior root-cause session on map-don't-digest, one-brain consolidation, and reconciliation drift.

---
agent_id: larry
session_id: content-os-master-plan-build-and-root-cause-fix
timestamp: 2026-07-05T15:30:00Z
type: close-session
linked_sops: ["SOP-001-how-to-add-a-new-specialist"]
linked_workstreams: []
linked_guidelines: ["GL-002-frontmatter-conventions"]
mined: true
---

# Content OS master plan build + root-cause consolidation

## Context

Alyssa opened the session to begin the Content OS Master Plan (Deliverables/2026-07-05-content-os-master-plan.md): build a "Fable Brain" so lower models can run her weekly content workflow autonomously. The session grew into a full architecture correction after three of her course-corrections exposed that the build was drifting from her actual goal (a single Alyssa clone, not a second knowledge project) and that the wider vault had systemic drift (things in wrong places, dead routing, orphaned links).

## What we did

- Larry deep-learned the calendar spec, planning grid, product index, and carousel corpus; spawned a 4-persona Test Kitchen pitch swarm for a Week 1 (Email) pilot batch.
- Larry built a `Team Knowledge/content-os/` knowledge layer (fable-brain, relations-map, carousel-codex, teaching-voice) — **later corrected and merged**, see Realignments.
- Larry drafted `mean-alyssa` agent and `WS-011-weekly-content-batch` (both staged in Deliverables/2026-07-05-content-os-brain/, awaiting Alyssa's install approval — host classifier correctly blocked writing to `.claude/agents/` without her review).
- Larry ran a 5-worker full-vault deep-learn (programs, examples+analysis, My Life/goals, journal+signals, system-state) producing `Deliverables/2026-07-05-vault-learn/` + a synthesis.
- **Consolidation pass 1:** merged `Team Knowledge/content-os/` into `Hermes/` as one clone brain (CALENDAR/RELATIONS/CODEX/TEACHING/PITCH → Hermes root files), per Alyssa's correction that Hermes IS the clone, not a parallel project.
- **Consolidation pass 2:** demoted those digest files to `Deliverables/2026-07-05-vault-learn/` and built [[Hermes/MAP]] — a pointer-only atlas (task→source recipes, 12-slot calendar map, framework→path registry, exemplar index, seed bank) — per Alyssa's correction to map her source, never re-digest it. [[Hermes/FABLE]] rewritten around the 4-part architecture (JUDGMENT/FACTS/MAP/OPERATING).
- **Root-cause investigation** (4 parallel workers): duplication register, misplacement evidence (webinar folders, stale renames, INDEX-vs-disk gaps, broken `[[operations]]` links), Offers-folder wiki build, and Nolan-executed Wren→Hermes succession.
- Hired Hermes formally onto the team roster (`Team/Hermes - Alyssa Clone Writer/AGENTS.md`); retired Wren (banner + agent-index row, matching the existing Remi pattern); rewired ~20 live routing references (Workstreams, SOPs, ready-queue, signals-index, garden notes) from Wren to Hermes with semantic care.
- Built the Offers wiki: all 25 `PKM/My Life/Offers/` files now link sales page + [[Hermes/BUSINESS]] (facts) + BOH teaching module + real carousel posts + funnel neighbors; `[[operations]]` swept to `[[business]]` vault-wide (Journal, Topics, Guidelines, Templates — 39 files).
- Reconciled two lying INDEXes: `programs/INDEX.md` (webinar transcripts were imported into `back-of-house/webinars/`, not the empty placeholder folders; CTC/YOE genuinely never imported) and `analysis/INDEX.md` (6 real files were missing from the list).
- Fixed stale `carousel-analysis.md` → [[Studio/Analysis/carousel]] references vault-wide.
- Installed a retired-address README at `Team Knowledge/content-os/` after a parallel session/window wrote two new files there mid-restructure (unresolved — see Open threads).
- Added **the Reconciliation Rule** to Larry's Librarian duty in root [[AGENTS]]: no import/rename/retirement/restructure is finished until the same session diffs every INDEX/table/link that references the change.

## Decisions made

- **Question:** Is Content OS its own project or part of the Hermes clone?
  **Decision:** One project. Content OS = Hermes/ modules + agent hats + MAP. No parallel knowledge folder, ever.
- **Question:** How does new source-derived knowledge get captured going forward?
  **Decision:** Never as a new digest file. Either a judgment-rule graduation (via [[Hermes/learning/inbox]], Alyssa-approved) or a [[Hermes/MAP]] pointer. Her own `analysis/` folder is the one distillation layer.
- **Question:** Wren or Hermes?
  **Decision:** Hermes, hired properly through Nolan/SOP-001 with a real team contract, not an ad-hoc swap.
- **Question:** Where do Offers live?
  **Decision:** Stay in `PKM/My Life/Offers/` (Alyssa's explicit preference) — Hermes reads them via a wiki layer added to each file, not by relocating anything.
- **Question:** `[[operations]]` Key Element — create it or repoint?
  **Decision:** Repoint every reference to `[[business]]` now; leave the option of a future formal `operations` Key Element as a noted suggestion, not built.

## Insights

- **The map-not-digest failure mode is structural, not incidental.** Two build sessions in one day independently re-created the same calendar/relations/pitch knowledge because nothing forced a check against existing distillations first. This is now a named failure mode in FABLE.md (#6) and a Prime Rule.
- **Vault drift has one root mechanism, not many.** Empty placeholder folders, stale renames, dead routing tables, and orphaned links are all downstream of the same missing step: nothing reconciles an INDEX/table/link against disk after the thing it describes changes. Fixed as a standing rule, not a one-time cleanup.
- **Concurrent sessions are a live risk to this architecture.** The content-os retirement was undermined within the same day by another window still working from the old map. Any future large restructure should confirm no parallel session is active first.

## Realignments

- Alyssa, on the first content-os build: *"why are the different projects they should be the same the goal is to have a alyssa clone to do work and create agents from i said that from start."* → Corrected to one project (Hermes/).
- Alyssa, on the digest layer: *"do not make more source material for the llm to digest, instead make it easier for the agent to understand and get around the source material."* → Corrected to a map-only architecture ([[Hermes/MAP]]); prior digests demoted to Deliverables as build history.
- Alyssa, on the vault as a whole: *"ive spent weeks and months making the second brain... why would that not be the most valuable part of my entire vault"* → Corrected Larry's earlier framing of Second Brain as a passive "library"; it is the crown asset, read-only, and the clone's entire job is to read it well, not replace it.
- Alyssa, closing instruction: *"find the deeper root cause of these issues before we try to execute this... dont come back till you can confidently say that the entire folder is ready to build on."* → Root-cause investigation run before any further feature work; verdict delivered: structurally ready, with a named remainder list that is purely her calls, not open engineering.

## Open threads

- [ ] Two stray files ([[Deliverables/_archive/content-os/content-evidence-system]], [[Deliverables/_archive/content-os/evidence-table]]) landed in the retired `Team Knowledge/content-os/` address from an unidentified parallel session (~12:52 PM) — awaiting Alyssa triage per the retired-address README.
- [ ] Install approval needed: `mean-alyssa` agent + `WS-011-weekly-content-batch` (staged in `Deliverables/2026-07-05-content-os-brain/`).
- [ ] BOH Summer Launch email sequence (Ready Queue #1) — reassigned from Wren to Hermes in routing docs; Hermes has not yet been asked to write it. Alyssa's call on write-order (launch first vs. Week 1 pilot batch first).
- [ ] Gold-standard designation needed per content lane (feeds the Hermes lineup test).
- [ ] 13 chat words still "manual selection needed" in [[Hermes/BUSINESS]] — need verbatim words from Notion.
- [ ] Two price conflicts unresolved (Quarter in a Day $2,000 vs $111; CEO Year Planner $79 vs $27-47).
- [ ] PIN vs "Pinterest" chat-word discrepancy for Pin Planner — needs Alyssa's call.
- [ ] CTC and Year of Emails course content never imported (folders empty by design until she provides exports).
- [ ] Week 1 Email pitch slate (from the earlier Test Kitchen swarm) still awaiting Alyssa's react/pick.
- [ ] Weekly semantic sweep (due 2026-07-04) is overdue; June monthly review never ran.

## Next steps

- On next session start, Larry surfaces the Daily Pulse and checks whether Alyssa wants the launch sequence or the Week 1 batch run first.
- Whichever she picks, invoke the pipeline via Hermes/FABLE.md load protocol — no new knowledge files, only MAP pointers or judgment-rule graduations.
- Weekly review is due — flag per the close-session nudge rule below.

## Cross-links

- [[2026-07-05-14-45_larry_root-cause-and-one-brain-consolidation]] — the root-cause fix this session executed
- [[2026-07-05-23-30_larry_hermes-rebuild-and-content-os-genesis]] — the original Hermes brain build this session built on top of
- [[2026-07-04-18-22_larry_carousel-notion-taxonomy-rule]] — the taxonomy lock referenced throughout MAP.md

---
mined: true
---
﻿---
agent_id: larry
session_id: 2026-06-04-07-38_larry_claude-routines-automation-research-wrap
timestamp: 2026-06-04T11:39:19Z
type: close-session
linked_sops: [SOP-004-create-task]
linked_workstreams: []
linked_guidelines: [GL-001-file-naming-conventions]
---

# Claude Routines Automation Research Wrap

## Context

Alyssa shared a public Notion page of "Claude Routines Use Cases + Prompts" and asked whether the routines were applicable to her business based on current open tasks and business context. The original Notion page was external to Alyssa's workspace, so Larry first created a private Notion index page preserving the routine list and links.

## What we did

- Mack-style connector pass: Larry fetched the external Notion parent page and created Alyssa's private Notion index copy at [Claude Routines Use Cases + Prompts](https://app.notion.com/p/375c8b43e56581648f34c8e963f13693).
- Pax read all 29 linked routine pages from the public Notion source.
- Pax cross-checked the routines against open tasks, active projects, active goals, offers, and the Second Brain build plan.
- Pax identified initial merged routines instead of recommending separate one-by-one automations:
  - Weekly Second Brain Digest
  - Weekly Content Kitchen
  - Weekly Vault and Business Drift Check
- Alyssa then revised the shortlist toward:
  - Weekly Vault Formatting and Drift Sweep
  - Personal Knowledge Base Opportunity Digest
  - Weekly Status and Pattern Report
  - Listening and Research Aggregator
  - Video Watcher
- Pax wrote the full linked report to [[Deliverables/2026-06-04-claude-routines-automation-fit-report]].
- Larry created follow-up task [[tsk-2026-06-04-001-review-claude-routines-automation-report]] so Alyssa can review and decide on June 5 or June 6.

## Decisions made

- **Question:** Should the external Notion page be duplicated as-is?
  **Decision:** No. Notion's duplicate tool only works for pages inside Alyssa's workspace, so Larry created a private index with source links instead.

- **Question:** Should all interesting routines become separate automations?
  **Decision:** No. Pax recommends merging the useful ideas into three Alyssa-specific routines to avoid creating a pile of small maintenance obligations.

## Insights

- The most valuable routines are the ones that reuse local markdown and existing myPKA context, not the ones that require more connector setup.
- The strongest first pilot after Alyssa's follow-up is likely Weekly Vault Formatting and Drift Sweep because it protects the vault immediately and can run on local markdown.
- Content automation should not jump straight to publishable drafts until Simmer and Soft Sunday examples are filed in the Second Brain.
- Video Watcher should start as a manual Pax skill before becoming part of a larger weekly listening automation.

## Realignments

- Alyssa realigned the work from "duplicate this page into my Notion" to "look through these one-by-one links and decide what applies to my business."
- Alyssa then asked Pax to create a full report, link every routine, wrap the session, and put the decision back in her court for tomorrow or the next day.
- Alyssa later clarified she already wants to seriously consider #21, #27, #09, a merged listening/research routine, and an added Video Watcher skill.

## Open threads

- [ ] Alyssa to review [[Deliverables/2026-06-04-claude-routines-automation-fit-report]].
- [ ] Alyssa to decide whether Weekly Vault Formatting and Drift Sweep should report only or make safe structural fixes automatically.
- [ ] Alyssa to decide whether Personal Knowledge Base Opportunity Digest should become the Semantic Recurrence pilot.
- [ ] Alyssa to decide whether Weekly Status and Pattern Report should become a standing weekly rhythm.
- [ ] Alyssa to name first sources for Listening and Research Aggregator.
- [ ] Alyssa to decide whether Video Watcher starts as a manual Pax skill.

## Next steps

- Alyssa reviews [[tsk-2026-06-04-001-review-claude-routines-automation-report]] by June 6.
- Larry picks up from the decision task once Alyssa chooses which routine or skill to design first.

## SSOT / Structural Fixes

- Created one Pax deliverable in `Deliverables/`.
- Created one task in `Team Knowledge/tasks/open/`.
- Updated `Team Knowledge/tasks/INDEX.md` so the follow-up appears in the open task list.
- Updated the Pax report and decision task with Alyssa's revised shortlist and Video Watcher skill idea.

## Cross-links

- [[2026-06-04_larry_full-loop-audit-and-task-cleanup]]
- [[2026-06-01_larry_second-brain-build]]
- [[2026-06-01_larry_idea-garden-and-semantic-recurrence-layer]]

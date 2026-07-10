---
agent_id: larry
session_id: podcast-guesting-reference-and-mara
timestamp: 2026-06-04T15:26:00-04:00
type: close-session
linked_sops:
  - SOP-001-how-to-add-a-new-specialist
linked_workstreams: []
linked_guidelines:
  - GL-001-file-naming-conventions
  - GL-002-frontmatter-conventions
---

# Session Log - 2026-06-04 - Podcast Guesting Reference and Mara

## Context

Alyssa brought in a downloaded deep research report on podcast pitching and guesting and wanted Larry to find the right specialist path, rename and file the report, add interlinks and amendments, and keep it ready for a future weekly workflow possibly involving AI plus [[camila]].

The work became both a filing job and a future-team design question: should this be owned by an existing specialist, Camila, AI, or a new team member?

## What we did

- Larry routed the work to Pax, Silas, and Nolan as subagents because Alyssa explicitly asked to spawn subagents.
- Pax reviewed the report conceptually and advised that the workflow spine is operationally useful now, but vendor/tool claims, pricing, conversion stats, platform coverage, audience metrics, and contact routes need fresh verification before purchase or scaled outreach.
- Silas recommended the SSOT filing structure: the full report belongs in `Deliverables/`, with a Project note and Topic note linking back to it rather than duplicating it.
- Nolan recommended hiring a future dedicated **Podcast Guesting Producer** rather than assigning end-to-end ownership to an existing specialist.
- Larry copied the downloaded report into [[2026-06-04-podcast-guesting-pitching-research]], renamed it from `deep-research-report.md`, and added a frontmatter block, filing note, workflow summary, AI plus Camila split, Mara recommendation, and verification warning.
- Larry created [[podcast-guesting-workflow]] as a planning Project and [[podcast-guesting]] as a durable Topic.
- Larry linked the new Project, Topic, and Deliverable from their relevant index/readme files.
- Larry deleted the original downloaded file from `D:/Alyssa/Downloads/deep-research-report.md` after Alyssa asked for Downloads cleanup.
- Larry answered Alyssa's question about Mara: Mara is currently a recommended future specialist, not a hired team member with a full contract yet.

## Decisions made

- **Question:** Where should the full podcast pitching report live?
  **Decision:** Keep it as the canonical research reference in [[2026-06-04-podcast-guesting-pitching-research]], not scattered across Project or Topic notes.

- **Question:** Is this an active project or future-project runway?
  **Decision:** File it as [[podcast-guesting-workflow]] with `status: planning`, so it is findable as a future Project without implying it is already operational.

- **Question:** Who should own the end-to-end workflow if it becomes recurring?
  **Decision:** Nolan recommends hiring **Mara - Podcast Guesting Producer**. Existing team members support pieces of the work, but no current specialist should own the full pipeline.

- **Question:** What is Camila's likely role?
  **Decision:** [[camila]] is a strong execution partner for tracker hygiene, contact verification, approved pitch sending, reply logging, and follow-up discipline, while AI drafts and organizes.

## Insights

- Podcast guesting should be treated like account-based business development with media mechanics: positioning, criteria, target list, episode-specific personalization, follow-up, prep, repurposing, and outcome tracking.
- The most useful first-pass weekly rhythm is Monday positioning/list building, Tuesday qualification, Wednesday pitching, Thursday follow-ups/prep, Friday tracking.
- The anti-pattern is treating podcast pitching as only copywriting or only research. It needs one accountable producer.
- Future tool/vendor research for podcast guesting must be refreshed before buying because platforms, pricing, outreach rules, and directory quality change quickly.

## Realignments

- Alyssa asked why Larry referenced a git repo. Correction: for myPKA filing sessions, future summaries should focus on the actual vault files and avoid repo/git-style status notes unless Alyssa asks for them.
- Alyssa asked Larry to delete what needed to be deleted in Downloads after filing. Larry deleted the original report from Downloads and kept the vault copy.
- Alyssa clarified that `github-resources` should not be a Topic. Larry removed it from the Topics index and deleted the stub he had created during the close-session librarian pass.

## Open threads

- [ ] If Alyssa wants Mara to become real, route to Nolan to run [[SOP-001-how-to-add-a-new-specialist]] and create `Team/Mara - Podcast Guesting Producer/AGENTS.md`.
- [ ] If Alyssa starts the podcast guesting project, build a tracker with fit, contact route, pitch angle, status, follow-up date, booked date, and repurposing status.
- [ ] Before purchasing any podcast pitching tools, route to Pax for current verification of pricing, coverage, deliverability, and best fit for Alyssa's niche.
- [ ] Decide whether [[camila]] should help run a small pilot before Mara is hired.

## Next steps

- Start from [[podcast-guesting-workflow]] when Alyssa returns to the project.
- Use [[2026-06-04-podcast-guesting-pitching-research]] as the working reference, especially the top Larry sections before the original report.
- If the team proceeds, define Alyssa's first 3 to 5 podcast topic angles and build a starter list of 25 shows.

## SSOT / structural fixes

- Created [[podcast-guesting-workflow]] as the planning Project and linked it from `PKM/My Life/Projects/INDEX.md`.
- Created [[podcast-guesting]] as the evergreen Topic and linked it from `PKM/My Life/Topics/INDEX.md`.
- Added [[2026-06-04-podcast-guesting-pitching-research]] to [[Deliverables/README]].
- Reversed the attempted `github-resources` Topic stub after Alyssa clarified it should not be a Topic; removed the Topics index entry and deleted the stub.
- Confirmed `[[business]]` already resolves through `PKM/My Life/Key Elements/Business/business.md`; no duplicate Business stub was created.
- `Team Inbox/_Processed/` had no files to clear.

## Cross-links

- [[2026-06-04-11-15_larry_camila-role-fit-wrap]] - closest prior Camila role-fit context.
- [[2026-06-04-15-15_larry_mojibake-root-cause-and-repair]] - relevant context for why older index files may still show encoding artifacts.

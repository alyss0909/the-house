---
agent_id: larry
session_id: 2026-07-18-larry-house-control-room-cleanup
timestamp: 2026-07-18T05:30:00Z
type: end-of-session
mined: true
linked_sops: [SOP-011-write-session-log, SOP-040-the-compounding-loop, SOP-041-content-production]
linked_workstreams: [WS-011-weekly-carousel-pitch]
linked_guidelines: [GL-010-content-pitch-operating-brain, GL-011-substance-arc-contract, GL-012-content-os-strategy-lead-charter, GL-013-the-house-rules]
linked_tasks: [tsk-2026-07-16-004-content-command-center-cleanup]
linked_journal_entries: []
---

# House Control Room cleanup, rogue files removed, retired ladder dead-stamped

## Context

Alyssa asked me to review the House Control Room in Notion and the full house folder, find old unnecessary and unused SOPs, skills, routines, and rogue files, explain how the leaks happened, then implement the cleanup. She explicitly approved both the local vault cleanup and the Notion Control Room sync.

The working constraint that mattered: Notekeeper is still used in Obsidian. I confirmed `scripts/customjs/NotekeeperCards.js` is live and left it alone. The `.nkbak` backup also stays.

## What I shipped

- Rebuilt the active/retired separation in [[Studio/Team Knowledge/SOPs/INDEX]], [[Studio/Team Knowledge/Workstreams/INDEX]], [[Studio/Team Knowledge/Guidelines/INDEX]], and [[Studio/Team Knowledge/tasks/INDEX]].
- Retired the old content ladder entry points: `.claude/commands/loop.md`, `.agents/skills/source-command-loop/SKILL.md`, and the `.claude/agents/angus.md`, `.claude/agents/reeve.md`, and `.claude/agents/cass.md` shims now redirect to current content production instead of runnable old roles.
- Updated Suki's local contract and [[GL-012-content-os-strategy-lead-charter]] so the current machine is [[Studio/Content/MAP]], [[Studio/Content/METHOD]], [[Studio/Content/carousel-dispatch]], and [[SOP-041-content-production]].
- Dead-stamped [[WS-011-weekly-carousel-pitch]] and [[GL-011-substance-arc-contract]] so opening the retired files shows "do not run" before any historical procedure.
- Removed approved rogue/open files: `Team.md`, `back-of-house.md`, `_backfill-mirror.tgz`, `orphan_list.txt`, and `graphify-out/`.
- Removed empty placeholder skill folders under `.agents/skills`: `brand-brief`, `content-coach`, `post-grader`, `post-scheduler`, `post-writer`, `repurpose`, and `viral-hooks`.
- Updated `.claude/skills/README.md` so it no longer claims those placeholder skills exist.
- Synced the Notion House Operations Board: duplicate `understand-open-source` row retired, canonical row checked, Content Command Center current, `/loop` retired, retired maker rows updated, empty skill stub rows marked removed, Hermes cleaned of stale `/loop` language, and WS-011, GL-010/011/012, SOP-033 through SOP-038 checked with current retired/current status.

## Tasks touched

- Updated [[tsk-2026-07-16-004-content-command-center-cleanup]] frontmatter from `status: open` to `status: done` because it already lived in done and the body already recorded completion. Fate: [[Studio/Team Knowledge/tasks/done/tsk-2026-07-16-004-content-command-center-cleanup]].

## Root cause / decisions worth recording

- Decision: A retired system must be dead-stamped across every entry point in the same pass, not only in the index or dashboard. Fate: [[PRECEDENT-INDEX]].
- Insight: The leak began when the old weekly content ladder was replaced on 2026-07-16, but retirement happened unevenly. Some surfaces said retired, while old files still contained runnable instructions and some Notion rows still pointed at old paths. Fate: [[WS-011-weekly-carousel-pitch]], [[GL-011-substance-arc-contract]], [[Studio/Team Knowledge/Workstreams/INDEX]], [[Studio/Team Knowledge/Guidelines/INDEX]].
- Insight: Empty skill folders are worse than absent skills because they imply a capability exists. The prevention rule is to remove the empty folder and mark the Control Room row as retired/removed. Fate: [[.claude/skills/README]].
- Decision: Notekeeper is not part of this cleanup. The live Obsidian script and its `.nkbak` backup remain. Fate: [[Studio/Team/TEAM-BRAIN]].
- Realignment: Alyssa asked me to skip the midstream detail and come back at the end, then corrected the Notion-access/status ambiguity. Future mixed-tool cleanup reports must plainly say local done, Notion done, and open items. Fate: [[Studio/Team/Larry - Orchestrator/PLAYBOOK]], [[Studio/Team/TEAM-BRAIN]].

## Daily knowledge metabolism

**Today's larger objective:** Make the House Control Room match the actual house, so old routines cannot keep running just because one surface forgot they were retired.

**What connected:** The cleanup connected [[SOP-041-content-production]], `/content-run`, `/saves-sweep`, the Notion House Operations Board, [[GL-012-content-os-strategy-lead-charter]], [[WS-011-weekly-carousel-pitch]], [[GL-010-content-pitch-operating-brain]], [[GL-011-substance-arc-contract]], and [[tsk-2026-07-16-004-content-command-center-cleanup]] into one current/retired picture.

**What changed in source maps / tasks / Hermes / Ready Queue:** SOP, Workstream, Guideline, and task indexes now separate active from retired. The completed Content Command Center task now has `status: done`. No Hermes source file changed.

**What was superseded, demoted, archived, or deleted:** Old content ladder files were demoted to retired history. Empty skill stubs and rogue root files were deleted. Notion rows were retired/annotated because the Notion connector does not support page deletion.

**What still needs Alyssa, Pax, Mack, or source access:** No cleanup decision is waiting on Alyssa. Existing open threads remain unchanged: KeepSidian reauth, Keep capture planning, disabling the old ideation cron, and wiring sent emails into offer briefs.

**Tomorrow starts with:** If the next session is content-related, use [[SOP-041-content-production]] and `/content-run`, not `/loop` or the old maker ladder.

## SSOT / structural fixes

- Fixed a status mismatch in [[tsk-2026-07-16-004-content-command-center-cleanup]].
- Deleted the empty duplicate task file at `Studio/Team Knowledge/tasks/done/2026/07/tsk-2026-07-16-004-content-command-center-cleanup.md`.
- Verified the deleted rogue files are gone and Notekeeper still exists.
- Added the reusable retirement precedent to [[PRECEDENT-INDEX]].

## Journal duty receipt

Read [[2020-11-17-wildling]], [[2026-06-17-mb-trend-report-wedding-filmmaking-2026]], and [[2025-09-13-moe-painting]]. No new backlinks added because they do not genuinely feed this cleanup, and recent close logs already reached the same no-forced-link verdict.

## Open threads

- [ ] `own-keep-capture` remains in planning. First real move when it activates: decide the raw-pull source, then build the smallest pull plus tagging plus watchdog slice.
- [ ] [[tsk-2026-07-16-001-keepsidian-google-reauth]] remains open by Alyssa's call.
- [ ] [[tsk-2026-07-17-001-disable-ideation-cron]] remains open for Mack.
- [ ] [[tsk-2026-07-17-002-wire-sent-emails-into-briefs]] remains open for Mack.

## What I did NOT touch

- Did not remove or edit live Notekeeper: `scripts/customjs/NotekeeperCards.js`.
- Did not remove `scripts/customjs/NotekeeperCards.js.nkbak`.
- Did not touch Notebook journal entries beyond reading them for the close duty.
- Did not revert or clean unrelated dirty worktree changes already present outside this cleanup.

## Cross-links

- [[2026-07-16-21-30_larry_content-desk-rebuild]]
- [[2026-07-17-23-30_fable_content-engine-rebuild-and-voice-diagnosis]]
- [[2026-07-17-21-25_larry_carousel-compiler-fable-handoff]]

---
# Identity
id: tsk-2026-06-02-001
title: "Automate Meetily meeting capture pointers into Notebook/Inbox"

# Ownership & priority
assignee: mack
priority: 2

# Status (mirrors folder location)
status: done
blocked_reason: null
blocked_by: null

# Time
created: 2026-06-02T18:25:00Z
updated: 2026-06-02T18:25:00Z
due: null

# Provenance
created_by: larry
source: user-session-2026-06-02
parent: null

# Cross-references
linked_sops: []
linked_workstreams: [WS-005-meeting-capture-processing, WS-004-inbox-processing]
linked_guidelines: [GL-001-file-naming-conventions, GL-002-frontmatter-conventions]
linked_my_life: []
linked_session_logs: []
linked_journal_entries: [2026-06-02-samir-creative-assistant-intro]

# Tagging
tags: [automation, meetily, meeting, inbox]
---

# Automate Meetily meeting capture pointers into Notebook/Inbox

## What this is
Build the lowest-friction Mack automation for Alyssa's bot-free meeting capture flow. Meetily should keep raw meeting folders outside the vault, while **Daily Meeting Clean** creates a tiny pointer note in `Notebook/Inbox/Meeting Captures` whenever a completed recording appears. The mechanical job should also delete bulky audio/video after 7 days and keep transcripts only as temporary source until processed meeting memory exists. **Weekly Meeting Processing** can then turn those pointers into Journal/CRM/Project notes and task links.

## Context one click away
- Workstreams: [[WS-005-meeting-capture-processing]], [[WS-004-inbox-processing]]
- Guidelines: [[GL-001-file-naming-conventions]], [[GL-002-frontmatter-conventions]]
- First successful manual run: [[2026-06-02-samir-creative-assistant-intro]]

## Success criteria
- New completed Meetily folders are detected without Alyssa manually pasting the folder path.
- A pointer note is created in `Notebook/Inbox/Meeting Captures/` with date, source, raw path, status, cleanup fields, and any detected meeting/person label.
- Raw audio/transcript files remain outside myPKA.
- Audio/video files are deleted automatically after 7 days.
- Transcripts are retained temporarily, then retired only after the meeting pointer is marked processed.
- Processed pointers can be cleaned up after the Journal note is written.
- Raw source cleanup supports either immediate deletion after approval or quarantine in `_ready-to-delete`.

## Updates
- 2026-06-02 18:25 (larry) - created after the first successful Samir meeting-processing run.
- 2026-07-10 11:10 (larry/mack) - updated for house restructure: `Team Inbox` -> `Notebook/Inbox`; added media-delete-after-7-days and transcript-as-temporary-source policy; built `Team Knowledge/Automations/meetily-inbox-prep.ps1` as **Daily Meeting Clean** and dry-run verified it finds 2 completed meetings, 0 missing pointers, and 75.78 MB of old media eligible for deletion.
- 2026-07-17 11:45 (mack) - repair pass, triggered by a mailroom sweep flagging `Daily Meeting Clean` failing (`LastTaskResult 4294770688`). Diagnosed and fixed two stacked path bugs, both caused by the same later `Team Knowledge` -> `Studio/Team Knowledge` folder move that isn't reflected in [[2026-07-10 11:10]]'s update line above (that move happened after this automation was built, so nothing here flagged it at build time):
  1. **Scheduled Task definition was stale.** `Get-ScheduledTask -TaskName 'Daily Meeting Clean'` had `-File "C:\...\the-house\Team Knowledge\Automations\meetily-inbox-prep.ps1"` (missing `Studio\`) - that file no longer exists there, so `powershell.exe -File <missing-path>` fails to launch at all, which Task Scheduler logs as `LastTaskResult 4294770688 (0xFFFD0000)`. Confirmed by reproducing the exact action string manually (`Test-Path` false on the old path, true on the current one). Compared against `Meetily Weekly Launcher`'s task definition, which already had the corrected `Studio\Team Knowledge\...` path and ran clean (`LastTaskResult 0`) - that's why one job was healthy and the other wasn't.
  2. **The script's own vault-root detection was one folder short**, independent of the Task Scheduler bug. `meetily-inbox-prep.ps1` derived `$VaultRoot` by climbing two parents from `$PSScriptRoot` (correct when `Team Knowledge/Automations` sat directly under the vault root); after the restructure it needs three parents. Uncaught, this would have written every future pointer note to `Studio/Notebook/Inbox/Meeting Captures/` instead of `Notebook/Inbox/Meeting Captures/` - confirmed by dry-running the unpatched script directly (logged the wrong `Studio\Notebook\...` pointer dir) even once the Task Scheduler path was fixed. This second bug would not have surfaced as a scheduler failure code; it's a silent-wrong-location bug that only a real dry-run catches, so it's called out here explicitly rather than left for a future session to rediscover.
  - **Fix 1:** updated the `Daily Meeting Clean` Scheduled Task's action (`Set-ScheduledTask -Action`) to the correct current script path. No script content changed for this half of the fix - the file was always in the right place, only the task pointed at the wrong one.
  - **Fix 2:** edited `meetily-inbox-prep.ps1`'s `$VaultRoot` auto-detection to climb one more parent (`Automations` -> `Team Knowledge` -> `Studio` -> vault root).
  - **Verification:** dry-run confirmed the pointer dir now resolves to `Notebook/Inbox/Meeting Captures/`; a real run created exactly 3 pointer notes (for the 3 currently-completed Meetily folders - one more than the 2026-07-10 baseline, since a 2026-07-15 meeting has since completed); no media was deleted this pass (the two June meetings' audio was already cleaned up in the 2026-07-10 run per the existing log, and the July 15 media is only 2 days old, inside the 7-day retention window - both are correct, not a bug). Then triggered the job the same way Task Scheduler will (`schtasks /run /tn "Daily Meeting Clean"`) and confirmed `LastTaskResult 0` and idempotency: the second run found the same 3 completed folders and created 0 new pointers (matched existing ones by raw path), touching nothing outside `Notebook/Inbox/Meeting Captures/` and the Meetily raw folders it's scoped to.
  - Left `meetily-weekly-launcher.ps1` untouched - its task definition and internal paths were already correct; confirmed via the same inspection, not modified.
  - No Alyssa-side action needed for this task. Flagging one adjacent thing for awareness, not blocking this repair: `meetily-weekly-launcher.ps1`'s in-file "FIRST-TIME TASK SCHEDULER REGISTRATION" reference block (bottom of the script) still shows the pre-restructure-style path variable being built from `$PSScriptRoot`-relative logic in comments only - it's inert documentation, not executed code, so it didn't need a fix, but a future re-registration copy-paste from that block should use the current `Studio\Team Knowledge\Automations\` path (it already does, on inspection - just noting it was checked).

## Outcome
_(filled when status flips to done)_

**Verified fix ready for review (2026-07-17, mack):** both root causes patched (stale Scheduled Task action path + short vault-root climb in [[Studio/Team Knowledge/Automations/meetily-inbox-prep.ps1]]), and re-verified clean via a real Task-Scheduler-triggered run (`LastTaskResult 0`, idempotent second pass). Pointer notes for all 3 currently-completed meetings now exist correctly in `Notebook/Inbox/Meeting Captures/`. `Meetily Weekly Launcher` was inspected only, not changed - it was already healthy. Leaving `status` and file location for Larry to close out and sync to the Notion tracker per this task's own instruction.

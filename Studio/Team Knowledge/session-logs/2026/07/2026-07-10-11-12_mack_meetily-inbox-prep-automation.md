---
agent_id: mack
session_id: meetily-inbox-prep-automation
timestamp: 2026-07-10T15:12:00Z
type: end-of-session
linked_sops: [SOP-012-codex-windows-sandbox-recovery]
linked_workstreams: [WS-004-inbox-processing, WS-005-meeting-capture-processing]
linked_guidelines: [GL-013-the-house-rules, GL-005-team-inbox-protocol]
mined: true
---

# Daily Meeting Clean automation

Built **Daily Meeting Clean**, the mechanical Meetily layer, so **Weekly Meeting Processing** can stay a judgment workflow instead of carrying low-level cleanup.

## What changed

- Added `Team Knowledge/Automations/meetily-inbox-prep.ps1`.
- Registered Windows Scheduled Task `myPKA - Meetily Inbox Prep`. Rename requested later to **Daily Meeting Clean**.
- Schedule: daily at 4:00 PM America/Toronto.
- Action: runs `powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "C:\Users\accol\OneDrive\Desktop\the-house\Team Knowledge\Automations\meetily-inbox-prep.ps1"`.
- Updated `[[WS-004-inbox-processing]]` to split mechanical Meetily prep from Larry-led Closing Shift review.
- Updated `[[WS-005-meeting-capture-processing]]` with the new source policy:
  - audio/video deletes after 7 days,
  - transcript remains temporary source,
  - transcript retires only after processed memory exists,
  - high-leverage transcript extraction is the point.
- Updated `[[tsk-2026-06-02-001-automate-meetily-capture-inbox]]` from Team Inbox to Notebook/Inbox and added media/transcript retention criteria.
- Patched `[[SOP-012-codex-windows-sandbox-recovery]]` so it no longer tells agents to verify the old scaffold path for Closing Shift.
- Updated `[[Team Knowledge/INDEX]]` to list the new automation script.

## First run

Dry run found:

- Completed folders: 2
- Missing pointers: 0
- Old media eligible for deletion: 2 files, 75.78 MB

Live run deleted:

- `D:\Alyssa\Music\meetily-recordings\Meeting 2026-06-02_13-33-25_2026-06-02_17-33\audio.mp4` (46.39 MB)
- `D:\Alyssa\Music\meetily-recordings\Meeting 2026-06-03_13-30-10_2026-06-03_17-30\audio.mp4` (29.39 MB)

Verified after cleanup: each folder still contains `metadata.json` and `transcripts.json`; pointer notes now mark `media_cleanup_status: deleted` and `transcript_cleanup_status: retained`.

## Design decision

Meeting processing should not be a cron job that tries to think unattended. The durable split is:

- **Daily Meeting Clean** handles repeatable plumbing: create pointers, delete bulky media, retire processed transcripts.
- **Weekly Meeting Processing** handles judgment: read transcript source, extract meeting memory, connect Projects/CRM/tasks, and update the pointer to `status: processed`.

This follows the house rule and Bitter Lesson analysis: automate stable mechanics, keep taste/judgment/gates in the team workflow.

## Next

- Pause/delete the two broken Codex Closing Shift automations.
- Delete/archive the exhausted one-time `deep-vault-automation-opportunity-analysis` Codex automation.
- During the next actual meeting-processing run, update the pointer with `status: processed`, `processed_at`, and `processed_note` so transcript retirement can happen automatically after the retention window.

## Naming update

- 2026-07-10 11:30 (Larry/Mack) — Alyssa named the layers:
  - **Daily Meeting Clean** — the scheduled mechanical task.
  - **Weekly Meeting Processing** — the Larry/Penn judgment layer.
- Renamed the Windows Scheduled Task from `myPKA - Meetily Inbox Prep` to `Daily Meeting Clean`.

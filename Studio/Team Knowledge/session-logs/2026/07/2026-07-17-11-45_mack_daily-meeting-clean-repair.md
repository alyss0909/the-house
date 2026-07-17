---
agent_id: mack
session_id: 2026-07-17-daily-meeting-clean-repair
timestamp: 2026-07-17T11:43:41Z
type: end-of-session
linked_sops: []
linked_workstreams: [WS-005-meeting-capture-processing]
linked_guidelines: []
---

# Daily Meeting Clean repair

Dispatched from a parked task: [[tsk-2026-06-02-001-automate-meetily-capture-inbox]]. A mailroom sweep flagged the `Daily Meeting Clean` Scheduled Task failing (`LastTaskResult 4294770688 / 0xFFFD0000`), while `Meetily Weekly Launcher` kept succeeding.

## What I found

Two stacked path bugs, both downstream of the `Team Knowledge` -> `Studio/Team Knowledge` folder move that happened after this automation was originally built:

1. **The Scheduled Task's action itself was stale.** Its `-File` argument still pointed at `...\the-house\Team Knowledge\Automations\meetily-inbox-prep.ps1` (missing the `Studio\` segment). That file doesn't exist there anymore, so `powershell.exe -File <missing-path>` can't even launch - Task Scheduler logs that as `4294770688 (0xFFFD0000)`. Confirmed by reproducing the exact action string manually and by `Test-Path` on both the old and current paths.
2. **The script's own vault-root auto-detection was one folder short**, independent of #1. `meetily-inbox-prep.ps1` computed `$VaultRoot` by climbing two parents from `$PSScriptRoot` - correct when `Team Knowledge/Automations` sat directly under the vault root, wrong now that it sits under `Studio/`. Left unpatched, every future pointer note would have landed at `Studio/Notebook/Inbox/Meeting Captures/` instead of `Notebook/Inbox/Meeting Captures/` - a silent wrong-location bug, not a scheduler failure code, so it would never have shown up in `LastTaskResult`. Only caught this by dry-running the script directly after fixing #1 and reading its logged pointer-dir path.

`Meetily Weekly Launcher`'s task definition already had the corrected path (it must have been re-registered after the restructure) - that's the whole reason one job kept succeeding while the other didn't. Its script was inspected, not touched.

## What I fixed

- `Set-ScheduledTask -TaskName 'Daily Meeting Clean' -Action <corrected>` to point at the live script location.
- Edited `[[Studio/Team Knowledge/Automations/meetily-inbox-prep.ps1]]`'s `$VaultRoot` detection to climb three parents (`Automations` -> `Team Knowledge` -> `Studio` -> vault root) instead of two.

## Verification

- Dry run after both fixes: pointer dir logged correctly as `Notebook/Inbox/Meeting Captures/`.
- Real run: created exactly 3 pointer notes (3 Meetily folders are currently `completed` - one more than the 2026-07-10 baseline of 2, since a 2026-07-15 meeting has since finished). No media deleted this pass - correctly so: the two June meetings' audio was already cleaned up on 2026-07-10 per the existing log, and the July 15 media is only 2 days old (inside the 7-day retention window).
- Triggered the job exactly as the scheduler will (`schtasks /run /tn "Daily Meeting Clean"`) and confirmed `LastTaskResult 0`. Re-ran a second time to confirm idempotency: same 3 completed folders detected, 0 new pointers created (matched existing ones by raw path). Nothing touched outside `Notebook/Inbox/Meeting Captures/` and the Meetily raw folder it's scoped to.

## Insight for the team

**A folder restructure that moves an automation's own script isn't done until every Scheduled Task action AND every script's internal path-climbing logic is re-audited against the new location.** This is the same class of gap Larry's Reconciliation Rule already names for wikilinks/INDEXes/plan rows - it applies just as hard to Windows Scheduled Task definitions and any script that derives paths relative to its own location (`$PSScriptRoot` climbs), since neither shows up in a vault-wide wikilink sweep. Worth a line in whatever checklist governs future vault restructures: **when a folder moves, grep every `.ps1`/script for `$PSScriptRoot`-relative climbs and check `Get-ScheduledTask` action paths against anything that lives in the moved subtree.**

## Next

Task file `[[tsk-2026-06-02-001-automate-meetily-capture-inbox]]` updated with full `## Updates` and `## Outcome` detail; status frontmatter left as `open` per the requesting brief - Larry closes it out and syncs the Notion tracker.

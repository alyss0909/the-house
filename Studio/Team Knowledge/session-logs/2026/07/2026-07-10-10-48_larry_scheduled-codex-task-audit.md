---
agent_id: larry
session_id: scheduled-codex-task-audit
timestamp: 2026-07-10T14:48:00Z
type: end-of-session
linked_sops: [SOP-012-codex-windows-sandbox-recovery]
linked_workstreams: [WS-004-inbox-processing, WS-005-meeting-capture-processing, WS-006-weekly-review]
linked_guidelines: [GL-005-team-inbox-protocol, GL-013-the-house-rules]
---

# Scheduled Codex task audit

Alyssa asked for a review of scheduled Codex tasks after the house restructure, using Silas for broken-link/path analysis and the new house protocol plus Bitter Lesson lens for judgment.

## What I checked

- Confirmed `[[HOUSE-MAP]]` is the active root map. Root `AGENTS.md` still says `[[VAULT-MAP]]`, so old prompts that ask for VAULT-MAP may fail or start from stale assumptions.
- Read `[[GL-013-the-house-rules]]`, `[[Team/Silas - Database Architect/AGENTS]]`, `[[Notebook/MAP]]`, `[[Studio/MAP]]`, `[[GL-005-team-inbox-protocol]]`, `[[WS-004-inbox-processing]]`, and `[[WS-005-meeting-capture-processing]]`.
- Inspected Codex automation definitions under `C:\Users\accol\.codex\automations\`.

## Findings

Three Codex automations exist:

1. `daily-mypka-inbox-triage`
2. `daily-mypka-inbox-triage-c07927bc105d`
3. `deep-vault-automation-opportunity-analysis`

The two daily inbox automations are duplicate active jobs with the same name and prompt. Both still say "Team Inbox" and use the obsolete `Team Inbox/Meeting Captures` path, while current canon is `Notebook/Inbox/` and `Notebook/Inbox/Meeting Captures/`.

`daily-mypka-inbox-triage` and `deep-vault-automation-opportunity-analysis` target `C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)`, which is no longer present on disk. The current project is `C:\Users\accol\OneDrive\Desktop\the-house`.

`daily-mypka-inbox-triage-c07927bc105d` targets the Meetily recordings project and uses `D:\Alyssa\Music\meetily-recordings` as cwd. That is valid as a raw source, but invalid as the main working root for a myPKA inbox run. It risks creating vault-relative paths in the raw recording folder instead of in the house.

`deep-vault-automation-opportunity-analysis` has a one-time schedule dated 2026-07-05 with `COUNT=1`, so it should not be treated as an active recurring future task. If manually revived, it is stale: it references Team Inbox, Ready Queue, and a broad list of surfaces instead of reading the house map and zone maps.

`[[SOP-012-codex-windows-sandbox-recovery]]` still contains an outdated Closing Shift automation check that says to verify the old scaffold path plus the Meetily folder. That supporting SOP should be patched before it is used as recovery guidance again.

## Judgment

Silas structural verdict: the daily inbox automation should be consolidated into one active cron rooted in `C:\Users\accol\OneDrive\Desktop\the-house`, with Meetily treated only as an external source path. The prompt should use `Notebook/Inbox`, load `[[HOUSE-MAP]]`, `[[Notebook/MAP]]`, `[[GL-005-team-inbox-protocol]]`, `[[WS-004-inbox-processing]]`, and `[[WS-005-meeting-capture-processing]]`, and stop at Alyssa's approval report.

Bitter Lesson verdict: do not revive broad "scan everything and find the 10 automations" routines as standing scheduled jobs. That prompt encodes too much method and too many transient file lists. The durable goal is weekly/monthly source-trust metabolism, already represented by `[[WS-006-weekly-review]]`, `[[WS-007-monthly-review]]`, and `[[WS-009-monthly-intelligence-update]]`.

## Recommended next action

Patch or replace the Codex automations:

- Keep one daily Closing Shift job, rename it `Closing Shift: Notebook/Inbox Processing`, root it in `C:\Users\accol\OneDrive\Desktop\the-house`, and update the prompt to current paths and maps.
- Pause or delete the duplicate daily job rooted in Meetily.
- Delete or archive the exhausted one-time deep-vault analysis job unless Alyssa wants a new, map-led recurring review.
- Patch `[[SOP-012-codex-windows-sandbox-recovery]]` so it no longer instructs agents to verify the old scaffold path.

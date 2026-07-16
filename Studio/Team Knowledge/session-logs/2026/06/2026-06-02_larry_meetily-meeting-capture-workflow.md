---
mined: true
---
﻿---
agent_id: larry
session_id: meetily-meeting-capture-workflow
timestamp: 2026-06-02T18:36:00Z
type: close-session
linked_sops: ["SOP-003-keep-notes-to-journal", "SOP-004-create-task", "SOP-008-rebuild-task-index"]
linked_workstreams: ["WS-004-inbox-processing", "WS-005-meeting-capture-processing"]
linked_guidelines: ["GL-001-file-naming-conventions", "GL-002-frontmatter-conventions"]
---

# Meetily Meeting Capture Workflow

## Context

Alyssa wanted a free, easy, bot-free way to capture meeting transcripts, process them into myPKA, and avoid hoarding raw audio/transcripts. The session moved from tool selection into a working Meetily capture flow, then into task routing and daily automation.

## What we did

- Larry and Mack evaluated bot-free meeting capture options and chose Meetily Community Edition as the first test because it is free, local-first, and does not add a meeting bot.
- Mack/Larry read Alyssa's first Meetily recording folder at `D:/Alyssa/Music/meetily-recordings/Meeting 2026-06-02_13-33-25_2026-06-02_17-33`.
- Penn processed the Samir intro call into [[2026-06-02-samir-creative-assistant-intro]].
- Penn created the CRM stub [[samir]].
- Larry created `Team Inbox/Meeting Captures/` as the lightweight pointer lane for raw meeting folders.
- Larry authored [[WS-005-meeting-capture-processing]] as the canonical meeting capture workflow.
- Larry updated [[WS-004-inbox-processing]] so meeting capture pointers are part of regular Team Inbox processing.
- Larry created [[tsk-2026-06-02-001-automate-meetily-capture-inbox]] for Mack to build the fuller Meetily folder watcher.
- Larry created [[tsk-2026-06-02-002-send-samir-follow-up-email]] so the Samir action item lives in the task system, not only in the meeting note.
- Larry updated [[tsk-2026-06-01-001-obsidian-home-page]] so the Obsidian dashboard should surface Alyssa-owned and team-owned tasks.
- Larry created the daily Codex automation **Closing Shift: Team Inbox Processing** at 4 PM local time.
- Larry merged the KeepSidian sync automation plan into **Closing Shift: Team Inbox Processing**: the automation now triggers the KeepSidian Obsidian URI first, then scans Meetily folders, then runs WS-004 triage.
- Larry cleaned mojibake in [[WS-004-inbox-processing]], [[Team Knowledge/Workstreams/INDEX]], and [[PKM/CRM/INDEX]] after Obsidian showed garbled punctuation.

## Decisions made

- **Question:** Where should finished meeting notes live?
  **Decision:** Finished meeting notes belong in `PKM/Journal/YYYY/MM/`, linked to CRM, Projects, Offers, and tasks. Team Inbox is only the landing pad.

- **Question:** Should raw meeting audio/transcripts go into Obsidian?
  **Decision:** No. Meetily raw folders stay outside the vault. `Team Inbox/Meeting Captures/` stores only pointer notes with source paths.

- **Question:** How does "Meetily records -> pointer lands" happen right now?
  **Decision:** The 4 PM automation scans `D:/Alyssa/Music/meetily-recordings` for completed Meetily folders and creates missing pointer notes. The instant folder-watcher version remains Mack future work.

- **Question:** Should KeepSidian sync and Meetily meeting capture be separate routines?
  **Decision:** No. They are both Step 0 source refresh actions for [[WS-004-inbox-processing]]. **Closing Shift: Team Inbox Processing** runs KeepSidian sync first, then Meetily pointer creation, then inbox triage.

- **Question:** Should Closing Shift trigger Obsidian URI commands?
  **Decision:** No. After a restart/automation issue, KeepSidian refresh is manual-only. Closing Shift must not auto-launch Obsidian or trigger `obsidian://` URIs. It records "KeepSidian sync not confirmed" and continues.

- **Question:** What should meeting processing extract?
  **Decision:** Summary, action items, task routing, exact-word excerpts when Alyssa says reusable copy/positioning/creative direction, CRM/project memory, client follow-up capture, and raw cleanup status.

- **Question:** Where do follow-up tasks go?
  **Decision:** Action items that require follow-up become task files in `Team Knowledge/tasks/open/`, assigned to Alyssa or the relevant specialist, so they can appear on the Obsidian dashboard.

- **Question:** What should the daily automation be called?
  **Decision:** Rename it to **Closing Shift: Team Inbox Processing**.

## Insights

- Bot-free meeting capture needs two layers: local/raw capture outside the vault, and clean myPKA processing inside the vault.
- Meeting notes are not enough on their own; the useful outputs are memory plus reminders. Journal notes preserve context, while task files make commitments visible again.
- Client calls may need a client-facing output layer too: what Alyssa sent after the meeting, what the client is supposed to do short-term/long-term, and links to Trello or other external task lists.
- Exact wording matters selectively. Summaries are fine for most meeting content, but Alyssa's own copy, positioning, creative direction, or how-she-would-write-it language should be preserved verbatim.
- PowerShell/encoding drift can make Obsidian display punctuation as mojibake. Workflow docs should prefer clean ASCII punctuation unless there is a strong reason not to.

## Realignments

- "Okay, what are all these MDs that you just sent me?" - Alyssa needed a clearer explanation of note types: Journal memory, CRM source of truth, Workstream rulebook, and task reminders.
- "How is this happening though? Meetily records -> pointer lands in Meeting Captures" - Alyssa caught that the automation was not truly defined until the 4 PM scan step was added.
- "also whats up with the mojibake punctuation" - Alyssa flagged garbled characters in Obsidian, prompting cleanup and a preference for plain readable Markdown.
- "Closing Shift: Team Inbox Processing" - Alyssa renamed the daily automation.
- "k ran into an issue fix it and re-run at 345 automation" - Alyssa reported the Obsidian URI automation was unsafe after a restart; Larry removed URI triggering from WS-004 and rescheduled Closing Shift to 3:45 PM.

## Open threads

- [ ] Mack to build or refine [[tsk-2026-06-02-001-automate-meetily-capture-inbox]] if Alyssa wants near-instant pointer creation rather than the 4 PM scan.
- [ ] Alyssa to send Samir the follow-up email tracked in [[tsk-2026-06-02-002-send-samir-follow-up-email]].
- [ ] Decide whether raw Meetily folders should be deleted immediately after approval or quarantined for 7 days in `_ready-to-delete`.
- [ ] Build the Obsidian dashboard/home page so Alyssa can see her tasks, team tasks, meeting follow-ups, and daily processing state.
- [ ] Find the best place/tool for client-facing action lists, likely Trello at first, and link those lists back into meeting notes.
- [ ] Test **Closing Shift: Team Inbox Processing** at 3:45 PM: confirm it does not launch Obsidian or fire `obsidian://` URIs, creates any missing Meetily pointer notes, records KeepSidian as manual/not confirmed when appropriate, and produces the WS-004 approval table.

## Next steps

- Let the 4 PM automation run and confirm it creates pointer notes correctly.
- During the next inbox processing pass, review the approval table and decide how much can be processed automatically versus with explicit approval.
- Process or clean up the current Samir raw source folder once Alyssa approves deletion or quarantine.

## Cross-links

- [[2026-06-01_larry_inbox-processing-and-ws004-design]] - prior inbox processing architecture.
- [[2026-06-02_larry_boh-transcript-filing]] - related transcript filing/session processing work.

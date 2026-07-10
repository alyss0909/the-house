---
agent_id: larry
session_id: meetily-autolaunch-and-website-kickoff
timestamp: 2026-06-03T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: [WS-005-meeting-capture-processing, WS-004-inbox-processing]
linked_guidelines: [GL-001-file-naming-conventions, GL-002-frontmatter-conventions]
---

# Meetily Auto-Launch Automation + Website Kickoff Processing

## Context

Alyssa opened the session having forgotten to record two meetings that morning. She wanted a foolproof system so Meetily launches automatically before meetings — without polling every few minutes, and without a bot joining calls. The session moved through GitHub research, an initial Windows-Calendar-based script, a pivot to Google Calendar API, filter refinement, and then processed the day's website kickoff recording through the standard WS-005 flow.

## What we did

- **Larry + Pax** researched Meetily on GitHub. Found that: the Community Edition has no recording API (recording is entirely UI-controlled in the Tauri frontend); the backend FastAPI runs on localhost:5167 with only transcript-processing endpoints; Meetily Pro's "auto-detection" is hardware-level audio detection, not calendar integration.
- **Mack** built `Team Knowledge/Automations/meetily-weekly-launcher.ps1` v1 using the Windows WinRT Calendar API. Registered "Meetily Weekly Launcher" in Task Scheduler (every Monday 8 AM). Verified Meetily exe path: `C:\Users\accol\AppData\Local\meetily\meetily.exe`.
- **Larry** pulled Alyssa's Google Calendar via MCP to confirm the week's meetings and surfaced the two missed meetings from that morning (Adél – Haus of Daughter at 10 AM, House Call at 11:30 AM).
- **Mack** updated the script to use Google Calendar API v3 (OAuth 2.0 installed-app flow) replacing the WinRT block. Added explicit filter rules based on Alyssa's clarifications.
- **Penn** processed the Gillian x Andrew website design kickoff transcript (June 3, 1:30 PM) into a journal note, CRM stub, two task files (Alyssa's only), and a Meeting Captures pointer.
- **Larry** updated `PKM/CRM/People/andrew-web-designer.md` with email (`andrew@fiftyoneeight.com`) and company (`Fifty One Eight`) sourced from the calendar invite.
- **Larry** created two setup tasks for tomorrow: `tsk-2026-06-03-004` (Google Calendar API credentials) and `tsk-2026-06-03-005` (first OAuth run).

## Decisions made

- **Question:** Poll calendar every 5 minutes or pre-schedule the whole week?
  **Decision:** Weekly batch on Monday morning. Reads the full week, creates one Task Scheduler task per meeting, each fires 2 minutes before start. No background polling.

- **Question:** Auto-launch + auto-click record, or auto-launch only?
  **Decision:** Auto-launch only. Simpler, more reliable, doesn't break if Meetily updates its UI.

- **Question:** Which calendar source for the script?
  **Decision:** Google Calendar API v3 (OAuth 2.0), not Windows Calendar. Alyssa's meetings live in TidyCal and Google Calendar — she does not use the Windows Calendar app.

- **Question:** Which meetings should trigger a Meetily launch?
  **Decision:** Explicit filter rules:
  - EXCLUDE: anything with "Stacia" in the title (coworking)
  - EXCLUDE: "Camila x Alyssa" on Tuesdays (coworking)
  - INCLUDE: "Camila x Alyssa" on Mondays (biweekly recorded sessions)
  - INCLUDE: any event with a video link or external attendees
  - EXCLUDE: all-day events always

- **Question:** For processed meeting transcripts, should all action items become task files?
  **Decision:** No. Only Alyssa's own action items become task files. Other parties' items live in the journal/transcript note only.

## Insights

- Meetily Community Edition has no programmatic recording API. Any automation must work at the OS level (launching the app) rather than the app level.
- Meetily Pro's "auto-meeting detection" is audio-activity-based, not calendar-based — Pro doesn't cleanly solve the "forgot to open it" problem either.
- A weekly pre-schedule approach is far cleaner than recurring polling for this use case: one Monday run, zero background processes, each Task Scheduler task self-deletes 2 hours after firing.
- Google Calendar event invites often contain the attendee's email address, which is a fast path to enriching CRM stubs without needing to ask on the call.

## Realignments

- "your dates are off bc camila & samir were on tuesday" — the initial calendar table showed those meetings under the wrong day. Corrected.
- "all my meetings are in tidycal OR my google calendar not windows" — the first script version used the Windows Calendar WinRT API. Mack rebuilt it around the Google Calendar API after this correction.
- "the camila x alyssa on tuesdays is coworking and same with anything with stacia in it so i'll never need that" — filter rules updated to exclude both patterns.

## Open threads

- [ ] Alyssa to complete Google Calendar API credential setup (tsk-2026-06-03-004) — create Google Cloud project, enable Calendar API, download client_secret.json to `C:\Users\accol\.config\google-calendar-client.json`
- [ ] Alyssa to run the launcher script once manually in PowerShell to complete OAuth flow (tsk-2026-06-03-005) — blocked by above
- [ ] Andrew's last name unknown — `PKM/CRM/People/andrew-web-designer.md` should be renamed when confirmed
- [ ] The two missed meetings from this morning (Adél – Haus of Daughter 10 AM, House Call 11:30 AM) — decide if either needs to be recorded/processed; no Meetily recording exists for them

## Next steps

- Complete the two setup tasks (004 + 005) and confirm the launcher works on the next Monday run (June 8)
- Check Meetily recordings after any remaining this-week meetings (Stacia on Friday is excluded, so nothing until June 8 Camila)
- Update Andrew's CRM stub filename when his last name is known

## Cross-links

- [[2026-06-03-14-00_mack_meetily-weekly-launcher]] — Mack's prior session log for the initial Windows Calendar version of this script (now superseded by the Google Calendar build)
- [[2026-06-02_larry_meetily-meeting-capture-workflow]] — prior session that established the full Meetily capture flow, WS-005, and the 4 PM Closing Shift automation

---
agent_id: larry
session_id: meetily-ical-launcher-hardening
timestamp: 2026-07-10T15:24:00Z
type: close-session
linked_sops: []
linked_workstreams: [WS-005-meeting-capture-processing]
linked_guidelines: [GL-013-the-house-rules]
mined: true
---

# Meetily iCal launcher hardening

## Context

Alyssa came in with Mack's instruction to paste the private Google Calendar iCal link for Meetily, but the local config location was unclear. The task quickly expanded into validating the full Meetily weekly-launch flow against the private `Alyssa Coleman` calendar without exposing the secret URL in the vault.

## What we did

- Larry found the Meetily launcher at `Team Knowledge/Automations/meetily-weekly-launcher.ps1`.
- Larry created the local secret config file outside the vault at `C:\Users\accol\.config\meetily-calendar.json` and opened it for Alyssa to paste the iCal URL.
- Mack-voice validation confirmed the config was valid and the launcher could fetch the calendar feed while masking the private URL.
- Mack-voice added a `-WeekOfDate` test handle so the launcher can safely dry-run a future Mon-Sun window before the Monday sweep.
- Mack-voice fixed Windows Task Scheduler registration by adding an `EndBoundary` for one-shot tasks that auto-delete after expiry.
- Mack-voice hardened recurrence handling so weekly recurring events with `COUNT` no longer recur forever in 2026.
- Mack-voice added timezone mappings for `America/Detroit` and `Asia/Kolkata` to reduce noisy fallback behavior.
- Mack-voice removed the overly broad "duration >= 30 minutes" inclusion rule after it pulled in stale solo/project blocks.
- Mack-voice added `alyssacoleman.ca/zoom` as a recognized video/meeting link.
- Mack-voice added an explicit exclusion for `Review BOH Qs`, which Alyssa identified as internal and not recordable.
- Larry verified the final Windows task list: only `House Call`, `Alyssa x Maude`, and `Alyssa x Alex` are queued for the week of 2026-07-13.
- Larry dry-ran the following week, 2026-07-20 through 2026-07-26, without scheduling anything.

## Decisions made

- **Question:** Where does the private iCal URL live?
  **Decision:** Outside the vault only, in `C:\Users\accol\.config\meetily-calendar.json`. The secret is never committed or logged in full.
- **Question:** Should Meetily auto-start recording?
  **Decision:** No. The automation opens Meetily two minutes before qualifying meetings; Alyssa still clicks Start/record.
- **Question:** What counts as a recordable meeting?
  **Decision:** Use explicit meeting signals: recognized video links, external attendees, and named exceptions like Monday `Camila x Alyssa`. Do not use duration alone.
- **Question:** Does Alyssa's own Zoom redirect count?
  **Decision:** Yes. `alyssacoleman.ca/zoom` is Alyssa's common meeting-location pattern and should include those events.
- **Question:** Should `Review BOH Qs` be included?
  **Decision:** No. It is internal and explicitly excluded; Alyssa said she would move it to Ops.

## Insights

- Google Calendar's private iCal feed can include very old recurring events and edited exception instances. The launcher must honor recurrence limits like `COUNT` and `UNTIL` before trusting a candidate.
- A broad rule like "any 30+ minute block" is too risky on Alyssa's real calendar because it captures old course-creation blocks and solo work.
- The durable shape for this automation is "open Meetily for likely meeting contexts, let Alyssa decide to record."

## Realignments

- Alyssa flagged the bad test immediately: "wait wait wait Alyssa + EHM i havent met with them since like 2018 lol and LGGL COURSE CREATION thats from like 2021? whats happening"
- Alyssa clarified the inclusion rule: "zoom is my most used link for location so DEF include that lols"
- Alyssa clarified the exclusion pattern: "BOH Qs is internal for me so dont include it"

## Open threads

- [ ] Watch the first real automatic Monday sweep after 2026-07-13 to confirm it recreates the same kind of task list without manual `-WeekOfDate`.
- [ ] If more false positives appear, add explicit subject/location exclusions only after Alyssa confirms the pattern.
- [ ] Consider reducing monthly-recurring warning noise in the launcher logs; it is not blocking, but the output is loud.

## Next steps

- Monday 8:00 AM weekly sweep remains the normal schedule.
- Meetily opens two minutes before queued meetings; Alyssa clicks Start/record.
- Current queued tasks for the week of 2026-07-13: `House Call`, `Alyssa x Maude`, `Alyssa x Alex`.

## Daily knowledge metabolism

**Today's larger objective:** turn Meetily from a fragile manual reminder into a low-friction calendar-driven assist that respects Alyssa's actual meeting patterns.

**What connected:** the private Google Calendar iCal feed, the Windows weekly scheduled task, Meetily launch timing, and [[WS-005-meeting-capture-processing]].

**What changed in source maps / tasks / Hermes / Ready Queue:** `Team Knowledge/Automations/meetily-weekly-launcher.ps1` now has safer recurrence handling, future-week dry runs, stricter meeting inclusion, and Alyssa-specific Zoom-link handling.

**What was superseded, demoted, archived, or deleted:** the accidental test-created launch tasks for stale/incorrect candidates were deleted. No secret calendar URL was stored in the vault.

**What still needs Alyssa, Pax, Mack, or source access:** Alyssa only needs to click Start when Meetily opens. Mack may later quiet the monthly-RRULE warnings if the logs become annoying.

**Tomorrow starts with:** trust the queued next-week test, then let the Monday 8:00 AM sweep handle the ongoing weekly flow.

## SSOT / structural fixes (Librarian pass)

- Created this close-session log instead of extending [[2026-07-10-11-12_mack_meetily-inbox-prep-automation]], because that log covers a different Meetily inbox-prep automation.
- Confirmed the private iCal URL lives outside the vault and is not copied into this log.

## Cross-links

- [[2026-07-10-11-12_mack_meetily-inbox-prep-automation]]
- [[2026-06-03-14-00_mack_meetily-weekly-launcher]]
- [[WS-005-meeting-capture-processing]]

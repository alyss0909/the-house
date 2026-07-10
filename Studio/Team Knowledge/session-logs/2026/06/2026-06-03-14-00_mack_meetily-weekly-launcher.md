---
agent_id: mack
session_id: meetily-weekly-launcher-2026-06-03
timestamp: 2026-06-03T14:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# Meetily Weekly Launcher — Session Log

## What I did

Built and registered a weekly Meetily auto-launcher for Alyssa on Windows 11.

### Reconnaissance

- Meetily.exe confirmed at `C:\Users\accol\AppData\Local\meetily\meetily.exe` (NOT the `Programs` subfolder — the path in the brief was incorrect).
- No Google API credentials found on the machine (checked `~/.config/`, `AppData/Roaming/gcloud/`, recursive JSON search).
- Windows Calendar app (`microsoft.windowscommunicationsapps`) AND Outlook for Windows are both installed — either can sync Google Calendar locally, bypassing the need for a Google API key entirely.

### What was built

- `Team Knowledge/Automations/meetily-weekly-launcher.ps1` — the main script.
- Task Scheduler entry "Meetily Weekly Launcher" registered, state: Ready, next run: 2026-06-08 08:00 AM (Monday).

### How the script works

1. Loads the WinRT `Windows.ApplicationModel.Appointments` API via inline C# to read from the local Windows Calendar store (all synced accounts).
2. Computes the current week window (Mon 00:00 – Sun 23:59).
3. Filters events using meeting heuristics: video-link pattern in subject/location/body, invitee count >= 1, or duration >= 15 min.
4. Deletes all existing `MeetilyLaunch-*` Task Scheduler tasks (idempotent re-run safe).
5. Registers a one-shot Task Scheduler task per qualifying meeting, firing 2 minutes before start.
6. Skips events whose launch window is already in the past.
7. Logs everything to `C:\Users\accol\AppData\Local\Temp\meetily-launcher.log`.

### Auth model

None — reads local Windows Calendar store. No tokens, no OAuth, no API keys.

### Calendar setup required (action for Alyssa)

The script works immediately IF a Google account is already linked in the Windows Calendar app. If no meetings are found, Alyssa needs to:
- Open Windows Calendar app -> Settings -> Manage Accounts -> Add account -> Google.

Full instructions are embedded in the script's comment block.

## What I learned

- Meetily installs to `AppData\Local\meetily\` (lowercase, flat), not `AppData\Local\Programs\Meetily\`.
- WinRT appointment API is the cleanest no-auth path on Windows 11 for calendar reads — avoids Google OAuth entirely when the Windows Calendar app is used as the sync layer.
- The `DeleteExpiredTaskAfter` setting on individual meeting tasks handles self-cleanup — tasks auto-delete 2 hours after they fire, keeping Task Scheduler tidy.

## Next steps / hand-off

No hand-off required — this is a standalone automation. No PKM writes needed.

If Alyssa reports "no meetings found," the fix is adding her Google account to the Windows Calendar app (Option A in the script comments). If she wants headless/server operation without the Calendar app, Option B (Google Calendar API with OAuth) and Option C (Outlook COM) are documented in the script.

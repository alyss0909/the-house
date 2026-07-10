---
# Identity
id: tsk-2026-06-03-005
title: "Run Meetily launcher script once to complete Google OAuth"

# Ownership & priority
assignee: alyssa
priority: 2

# Status (mirrors folder location)
status: open
blocked_reason: Needs tsk-2026-06-03-004 completed first
blocked_by: tsk-2026-06-03-004

# Time
created: 2026-06-03T00:00:00Z
updated: 2026-06-03T00:00:00Z
due: 2026-06-04

# Provenance
created_by: larry
source: user-session-2026-06-03
parent: null

# Cross-references
linked_sops: []
linked_workstreams: [WS-005-meeting-capture-processing]
linked_guidelines: []
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [setup, meetily, automation, powershell]
---

# Run Meetily launcher script once to complete Google OAuth

## What to do

After completing tsk-2026-06-03-004 (Google Calendar API credentials), run the script once manually to authorize it. After this, every Monday 8 AM run is fully automatic.

### Steps

1. Open **PowerShell** (normal window — NOT as administrator)
2. Paste and run:

```powershell
& "C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\Team Knowledge\Automations\meetily-weekly-launcher.ps1"
```

3. A browser window will open → sign in with your Google account → grant calendar read access
4. Script will save a token and immediately schedule this week's remaining meetings
5. Done — every Monday 8 AM it runs silently from here on

## Context
- Blocked by: tsk-2026-06-03-004
- Script: `Team Knowledge\Automations\meetily-weekly-launcher.ps1`
- Token saved to: `C:\Users\accol\.config\google-calendar-token.json`

## Updates
- 2026-06-03 (larry) - created after Meetily automation build session

## Outcome
_(filled when status flips to done)_

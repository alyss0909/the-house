---
# Identity
id: tsk-2026-06-03-004
title: "Set up Google Calendar API credentials for Meetily launcher"

# Ownership & priority
assignee: alyssa
priority: 2

# Status (mirrors folder location)
status: closed
blocked_reason: null
blocked_by: null

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
tags: [setup, meetily, google-calendar, automation]
---

# Set up Google Calendar API credentials for Meetily launcher

## What to do

One-time setup so the Meetily weekly launcher can read your Google Calendar directly.

### Steps

1. Go to [https://console.cloud.google.com/](https://console.cloud.google.com/)
2. Create a new project (name it anything, e.g. "Meetily Launcher")
3. In the left menu: **APIs & Services → Library**
4. Search for **Google Calendar API** and click **Enable**
5. Go to **APIs & Services → Credentials**
6. Click **Create Credentials → OAuth 2.0 Client ID**
7. Application type: **Desktop app** → name it anything → click Create
8. Click **Download JSON** on the credential that appears
9. Save the downloaded file as:
   `C:\Users\accol\.config\google-calendar-client.json`
   (create the `.config` folder if it doesn't exist)

## Context
- Script: `Team Knowledge\Automations\meetily-weekly-launcher.ps1`
- This unlocks task tsk-2026-06-03-005 (first manual run)

## Updates
- 2026-06-03 (larry) - created after Meetily automation build session
- 2026-07-10 (larry) - CLOSED. Superseded by Meetily Version B rebuild — the launcher now reads the calendar via its private secret iCal (.ics) URL over plain HTTPS, so the Google Cloud project + OAuth desktop credentials are no longer needed.

## Outcome
Superseded, not completed. Google Cloud OAuth path retired in favor of the headless secret-iCal launcher (`Team Knowledge/Automations/meetily-weekly-launcher.ps1`, rebuilt by Mack 2026-07-10). No Google Cloud console setup required anymore.

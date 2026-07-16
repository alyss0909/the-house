---
# Identity
id: tsk-2026-07-16-001
title: "Re-authorize Google for KeepSidian sync"

# Ownership & priority
assignee: alyssa
priority: 2

# Status
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-16T00:00:00Z
updated: 2026-07-16T00:00:00Z
due: null

# Provenance
created_by: larry
source: notion-migration-session-2026-07-16
parent: null

# Cross-references
linked_sops: []
linked_workstreams: []
linked_guidelines: []
linked_my_life: [pkm]
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [obsidian, keepsidian, sync, google-keep]
---

# Re-authorize Google for KeepSidian sync

## What this is

The KeepSidian plugin (Google Keep to Obsidian sync) has been stale since about June 8. The Google connection has expired or been revoked, so no new Keep notes have landed in the vault since then. Alyssa needs to re-connect Google in the KeepSidian plugin settings.

## Steps

1. Open Obsidian Settings, then Community Plugins, then KeepSidian.
2. Run the Google re-authorization flow in the plugin settings (sign in and grant access again).
3. Trigger a manual sync and confirm new Keep notes arrive.
4. Confirm the 1-hour sync interval is still set (it was configured 2026-07-11).

## Success criteria

- A Keep note created today lands in the vault after sync.
- The sync keeps running on its own afterward.

## Updates

- 2026-07-16 (larry) — created; sync verified stale since about June 8 during the Notion task migration session.

## Outcome

_(filled when status flips to done)_

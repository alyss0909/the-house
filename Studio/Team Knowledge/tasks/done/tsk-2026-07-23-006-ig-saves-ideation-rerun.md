---
id: tsk-2026-07-23-006
title: "Re-run instagram-saves-ideation against the now-durable backlog"
assignee: Larry
priority: 3
status: done
blocked_reason: null
blocked_by: null
created: 2026-07-23T13:20:00Z
updated: 2026-07-23T15:40:00Z
due: null
created_by: Larry
source: session
parent: null
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-008-ponytail-lazy-senior-dev-philosophy]
linked_my_life: []
linked_session_logs: ["2026-07-23-09-20_larry_ig-saves-ideation-blocked-then-resolved", "2026-07-23-15-40_mack_ig-saves-image-viewing-fix"]
linked_journal_entries: []
tags: [content, instagram, saves]
---

# Re-run instagram-saves-ideation against the durable backlog

## What this is
Carried forward from [[2026-07-23-09-20_larry_ig-saves-ideation-blocked-then-resolved]] — an open thread that leaked from that session. Re-run the IG saves ideation now that the backlog is durable, so the saved-post inspiration actually produces content options.

## Context one click away
- Birthed in: [[2026-07-23-09-20_larry_ig-saves-ideation-blocked-then-resolved]]

## Success criteria
- Ideation re-run against the current durable saves backlog; tap-ready options delivered to the Content Studio board.

## Updates
- 2026-07-23 13:20 (Larry) — created to close the leak flagged by house-check at end of the Alex/Horizon session.
- 2026-07-23 15:40 (Mack) — root cause was different from what the durability fix addressed: images were durably stored in Notion, but the ideation session's Notion MCP tool couldn't resolve the file property to a viewable image at all (returned only an internal `attachment:...` reference). Confirmed by testing 3 paths (MCP fetch, raw SQL query, WebFetch on the underlying Instagram URL) — all failed to surface real pixels. Built `C:\Users\accol\instagram-saves-engine\view_saved_image.py`: reuses sync.py's existing `notion_token`/`notion-client` SDK to call Notion's real API directly, gets the actual signed download URL, downloads to the OS temp dir, ideation session Reads that path to view it, then deletes it (`--cleanup` mode) — zero permanent local storage, per Alyssa's explicit "not clogging my computer" requirement. Verified live: resolved, viewed, and cleaned up 8 real images with no leftover files. Wired into `C:\Users\accol\.claude\scheduled-tasks\instagram-saves-ideation\SKILL.md` step 1 so tomorrow's unattended run uses it automatically, and updated `memory/project_instagram_saves_engine.md` with the full record.

## Outcome
Fixed and verified end to end, not just patched. Ran the real ideation pipeline against the top 8 queued saves (of 140 backlogged): viewed each cover image for real, wrote 8 grounded Content Ideas to the Notion board (checked each against the last-14-days board first, one true near-duplicate found and flagged `[dup?]`/Priority=Low per protocol), flipped all 8 processed saves to Status=Used, and confirmed the temp download folder was empty afterward. 132 saves remain queued at Status=New — expected, the pipeline's 8/day cap will clear them over time, not a bug. Tomorrow's scheduled run will use the same fixed path automatically.

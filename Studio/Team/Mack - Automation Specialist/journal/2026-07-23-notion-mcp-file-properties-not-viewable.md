---
agent_id: mack
type: journal-entry
created: 2026-07-23T15:40:00Z
updated: 2026-07-23T15:40:00Z
topic: notion-mcp-file-properties
tags: [notion, mcp, images, claude-code]
linked_session_logs: [2026-07-23-15-40_mack_ig-saves-image-viewing-fix]
linked_tasks: [tsk-2026-07-23-006]
related_journal_entries: []
status: durable
---

# Notion's MCP tools can't resolve a file-type property to a viewable image — call Notion's API directly instead

## Context
The Instagram Saves ideation pipeline durably stores each save's cover image in Notion (fixed 2026-07-22), but the daily unattended ideation session still couldn't produce grounded ideas — it kept hitting a wall trying to actually look at the stored image.

## What I learned
The Notion MCP's `fetch` tool collapses a Files & media property to an internal `attachment:...` reference (or, via SQL query, a bare Notion file ID) — neither is a URL any tool can open or download. There is no MCP tool in this environment that resolves a file property to real bytes. WebFetch on the underlying source URL (e.g. the original Instagram post) doesn't help either — it returns text/metadata, not the image. The real fix: use the official `notion-client` Python SDK with a Notion internal integration token (bypassing the MCP layer entirely) and call `notion.pages.retrieve(page_id)` — the raw REST response's file property includes the actual signed download URL (`properties[prop]["files"][0]["file"]["url"]`, ~1hr TTL for Notion-hosted files). Download that URL to a local temp path and Read it to view it.

## When this applies
- Any Claude Code session (via the Notion MCP connector) needs to visually inspect an image stored in a Notion Files & media property.
- A Notion integration token already exists for the workspace (reuse it — don't create a second integration).

## When this does NOT apply
- Text-only Notion properties (the MCP handles these fine).
- External-URL-mode file properties that already point at a real public CDN link — the MCP may expose those adequately since the pointer itself is a normal URL (check `properties[prop]["files"][0]["type"]`: `"external"` vs `"file"`).
- If Notion's MCP tool is ever updated to surface the real signed URL instead of an internal reference, this workaround becomes unnecessary — check that before reaching for a raw API call again.

## Evidence
- [[2026-07-23-15-40_mack_ig-saves-image-viewing-fix]] (session log)
- `C:\Users\accol\instagram-saves-engine\view_saved_image.py` (the fix, reuses `sync.py`'s existing `notion_token`)
- [[tsk-2026-07-23-006-ig-saves-ideation-rerun]] (task, done)

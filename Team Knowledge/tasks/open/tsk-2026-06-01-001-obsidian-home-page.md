---
# Identity
id: tsk-2026-06-01-001
title: "Build Obsidian home page using Dashboard++ method"

# Ownership & priority
assignee: alyssa
priority: 2

# Status
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-06-01T00:00:00Z
updated: 2026-06-01T00:00:00Z
due: null

# Provenance
created_by: larry
source: inbox-processing
parent: null

# Cross-references
linked_sops: []
linked_workstreams: []
linked_guidelines: []
linked_my_life: [pkm]
linked_session_logs: [2026-06-01_larry_idea-garden-and-semantic-recurrence-layer]
linked_journal_entries: [2026-06-01-dashboard-plus-plus, 2026-05-29-vault-setup-ideas]

# Tagging
tags: [obsidian, pkm, home]
---

# Build Obsidian home page using Dashboard++ method

## What this is

Create a home page in the Obsidian vault that serves as the navigation hub — a simple pinned note with quick capture, a view of what's active/ripe, and links to active work areas. Dashboard++ is the method: a CSS snippet + markdown lists that render as columnar dashboards in Reading view. No complex plugins required.

Two sources pointing at the same need: the Dashboard++ article (how-to) and the idea garden session (confirmed this is a wanted thing).

## Context one click away

- How-to: [[2026-06-01-dashboard-plus-plus]]
- Vault setup ideas: [[2026-05-29-vault-setup-ideas]]
- Birthed in: [[2026-06-01_larry_idea-garden-and-semantic-recurrence-layer]]
- GitHub sample vault: https://github.com/TfTHacker/DashboardPlusPlus

## Success criteria

- A `HOME.md` (or equivalent) file exists at the vault root or PKM root
- Opens by default when Obsidian launches (Homepage plugin or equivalent)
- Contains at minimum: active projects, recent captures, links to Key Elements
- Contains a user-facing view of open tasks, including Alyssa-owned tasks and team-owned tasks
- Can surface meeting follow-ups created by [[WS-005-meeting-capture-processing]]
- Uses Dashboard++ CSS snippet for columnar layout

## Design principles (Alyssa's preference)

Style it however you want visually — but don't embed anything in the note content itself that would be obsolete or unreadable if you switched platforms in 5 years.

**Safe (viewing layer only, doesn't touch .md files):**
- CSS snippets and theme settings (Anuppucchin, Dashboard++ snippet, etc.) — purely visual, lives in `.obsidian/`, zero impact on note content
- Plugin settings, workspace layouts

**Also safe (PKM-portable):**
- Wikilinks `[[file]]` — not standard CommonMark but supported across Obsidian, Logseq, Roam, Foam, Dendron; still human-readable as plain text

**Avoid embedding in note content:**
- Dataview inline queries
- Obsidian callout syntax (`> [!note]`) if portability matters for that file
- Anything that only renders inside one specific tool

Rule of thumb: if deleting the entire `.obsidian/` folder would change the note's *content*, it's too platform-specific. If it just changes how the note *looks*, you're good.

## Updates

- 2026-06-01 (larry) — created from Dashboard++ inbox clip + idea garden session open thread
- 2026-06-12 (larry) — added design principles from Alyssa's portability preference (chat clarification)

## Outcome

_(filled when status flips to done)_

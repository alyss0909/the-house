---
agent_id: larry
session_id: 2026-06-01_larry_obsidian-ui-hiding
timestamp: 2026-06-01T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
mined: true
---

# Obsidian UI hiding — CSS snippets, excluded files, ribbon

## Context

Alyssa came in wanting to find an open task about "hiding things in Obsidian" and get it done fast. The closest open task was tsk-2026-06-01-001 (Dashboard++ home page). The hiding work was adjacent — cleaning up vault UI clutter. Session became a focused Obsidian cosmetic pass: hide system UI chrome and root-level non-PKM files from the sidebar.

## What we did

- **Larry** searched for the hiding task — found tsk-2026-06-01-001 (Dashboard++ home page) as the closest match; no dedicated "hiding" task existed yet.
- **Larry** created `.obsidian/snippets/hide-ui.css` with: status bar hidden, scrollbars thinned, ribbon drag handle removed, file pane label headers removed.
- **Larry** updated `appearance.json`: set `showRibbon: false`, added `enabledCssSnippets: ["hide-ui"]`.
- **Larry** captured two parking lot items (date-in-filename migration; folder exclusions) — user flagged those tasks already existed so Larry deleted the duplicates.
- **Larry** updated `app.json` with `userIgnoreFilters` to exclude root-level system files from search/graph/properties panel.
- **Larry** added CSS to hide root-level system files from the file explorer sidebar (ADAPTER-PROMPT, CHANGELOG, CHANGELOG-MIGRATION, CLAUDE, CONTRIBUTING, NOTICE, README, WAY-FORWARD, Team folder) — keeping AGENTS visible per Alyssa's preference.
- **Larry** debugged wrong CSS selector (`nav-file` → `nav-file-title`, `nav-folder` → `nav-folder-title`) after first attempt didn't work.

## Decisions made

- **Question:** Should AGENTS.md be hidden with the other root-level system files?
  **Decision:** No — Alyssa wants it visible in the sidebar because it's interesting to browse.

- **Question:** Should the Team folder be hidden?
  **Decision:** Yes, hidden via CSS. It's system/ops content, not PKM browsing content.

## Insights

- Obsidian's `userIgnoreFilters` (app.json) hides files from search, graph, and properties — but NOT from the file explorer sidebar. CSS snippet on `.nav-file-title[data-path]` is required for sidebar hiding. These two mechanisms must be used together for complete exclusion.
- The `data-path` attribute in Obsidian's file explorer is on `.nav-file-title` (inner element), not on `.nav-file` (wrapper). Same pattern applies to folders: `.nav-folder-title[data-path]`.

## Realignments

- Alyssa flagged that the two parking lot tasks I created already existed — I created duplicates and had to delete them. Next time: check the tasks/open/ folder before creating any task from a parking lot drop.

## Open threads

- [ ] tsk-2026-06-01-001 — Dashboard++ home page still open (not started this session)
- [ ] Date-in-filename migration — confirmed worth doing, needs its own session (existing task)
- [ ] `appearance.json` ribbon was reset to `showRibbon: true` by Obsidian during the session (system-reminder noted this) — verify ribbon is still hidden after reload

## Next steps

- Start Dashboard++ home page build (tsk-2026-06-01-001) — CSS snippet is now in place, Homepage plugin already installed
- Verify hide-ui.css is still active after a full Obsidian restart

## Cross-links

- `[[2026-06-01_larry_inbox-processing-and-ws004-design]]` — prior session same day, Obsidian setup context
- `[[2026-05-29-obsidian-design]]` — Alyssa's design inspo note with theme/CSS snippet research
- `[[tsk-2026-06-01-001-obsidian-home-page]]` — Dashboard++ task, next logical step after this session

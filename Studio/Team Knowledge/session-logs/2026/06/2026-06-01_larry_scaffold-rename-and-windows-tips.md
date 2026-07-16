---
agent_id: larry
session_id: scaffold-rename-and-windows-tips
timestamp: 2026-06-01T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
mined: true
---

# Scaffold folder rename feasibility + Windows housekeeping

## Context

Alyssa came in with a practical question: can the mypka scaffold folder be renamed without breaking internal references? Session stayed in Larry-only territory — no PKM imports, no specialist routing. Also covered a Windows "Folder In Use" blocker and an Obsidian taskbar icon change.

## What we did

- **Larry** audited the scaffold for hardcoded absolute paths. Found them only in `.claude/settings.local.json` (cached permission allowlists) and a handful of session logs/CHANGELOG.md — not in AGENTS.md, CLAUDE.md, or any functional files.
- **Larry** clarified that Claude Code's file-based memory (local `.md` files under `.claude/projects/`) is separate from Claude's cloud-based built-in memory feature — renaming the folder would create a new memory path; contents need to be manually copied over.
- **Larry** explained that the memory path can't be "edited" inside the files — Claude Code calculates it from the project folder path automatically.
- **Larry** diagnosed the Windows "Folder In Use" error when trying to rename: top suspect OneDrive sync process, plus Windows Search Indexer, lingering `node.exe` (Claude Code), or File Explorer reference. Recommended pausing OneDrive sync as the quickest fix.
- **Larry** walked Alyssa through changing the Obsidian taskbar icon on Windows (unpin → shortcut → Properties → Change Icon → re-pin; `.ico` format required).

## Decisions made

- **Question:** Is it safe to rename the scaffold folder?
  **Decision:** Yes — rename freely. After renaming: (1) copy memory folder to new encoded path, (2) re-approve any bash permission prompts that come up (the old allowlist entries won't match the new path strings).

## Insights

- The `.claude/settings.local.json` allowlist entries are cached command strings, not critical references — losing them on a rename just means one-time re-approval prompts, not breakage.
- OneDrive is the most likely culprit for "Folder In Use" errors on files under `OneDrive\Desktop`, even with all apps closed.

## Realignments

- _(none this session)_

## Open threads

- [ ] Alyssa to actually rename the scaffold folder when ready — remember to: pause OneDrive sync first, copy memory folder to new encoded path after.

## Next steps

- If Alyssa renames the folder next session: confirm new folder name so Larry can calculate the new memory path and provide the exact copy command.

## Cross-links

- `[[2026-06-01_larry_idea-garden-and-semantic-recurrence-layer]]` — same date, separate session

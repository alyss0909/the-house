# GL-005 - Team Inbox Protocol

> **This Guideline governs the Notebook/Inbox structure and processing.** Every agent that reads from or writes to `Notebook/Inbox/` reads this Guideline first.

This is the source of truth for how the inbox works — what subfolders exist, who processes what, and how the inbox stays clean.

**Location note (2026-07-10):** the raw-drops inbox moved from `Team Inbox/` to `Notebook/Inbox/` as part of the Notebook assembly. A redirect stub remains at [[Team Inbox/MOVED]]. This Guideline uses the new path throughout.

## What the inbox is for

`Notebook/Inbox/` is a landing zone for raw inputs — screenshots, voice memos, article clippings, braindumps, business cards, half-formed ideas. Drop it in, say "Larry, process the inbox," and the team routes it.

If you already know where something belongs, write it directly into PKM. The inbox is for *"I have something, not sure where, just take it."*

## Subfolder structure (frozen)

```
Notebook/Inbox/
├── Meeting Captures/     ← WS-005 drops meeting notes here
├── _Processed/           ← Larry moves processed files here after routing
└── _KeepSidianLogs/      ← Keepsidian plugin output; agent read-only
```

The 2026-07-10 migration archived the backlog that had accumulated in `_Processed/` and `_KeepSidianLogs/` under Team Inbox to `Archive/Team Inbox/_Processed/` and `Archive/Team Inbox/_KeepSidianLogs/`. The subfolders themselves stay part of the frozen pattern above and continue under `Notebook/Inbox/` going forward.

**This structure is frozen.** No new subfolders without a GL-005 amendment. Any agent that creates a subfolder not on this list is violating SSOT.

### Why frozen

Every new subfolder is a new decision surface — agents have to decide where to look and where to put things. Three allowed subfolders means three places to check, ever.

### Folder purposes

**`Meeting Captures/`** — WS-005 (meeting capture processing) drops `.md` files here after a meeting. Larry routes them through Penn to the Journal and to the relevant Project file.

**`_Processed/`** — Larry (or any routing agent) moves files here after they have been filed. This is the cleanup mechanism while bash delete permissions are restricted. A file in `_Processed/` means "done — safe to delete."

Larry clears `_Processed/` at every session close as part of Librarian duty. If Larry cannot delete files (permission restriction active in the current session), files remain until the next session when permissions allow, or Alyssa manually clears them.

**`_KeepSidianLogs/`** — Written by the Keepsidian Obsidian plugin. Agents may read these to process captured content but must not rename, delete, or restructure them. The plugin owns this folder.

## Processing rules

### Who routes what

- **Penn** is the default router for: raw braindumps, voice memo transcripts, article clippings, quick notes, business cards
- **Pax** picks up links dropped for research
- **Hermes** picks up copy fragments (subject line ideas, IG captions)
- **Larry** assigns when content clearly fits a specific specialist; Penn processes everything unassigned

### Timing

Every file in Notebook/Inbox root gets processed within the same session it's noticed. An unprocessed file in inbox root at session close means Larry missed it — flag and fix next session.

### After routing

Move the processed file to `_Processed/`. Do not delete (permission restriction). Do not leave processed files in inbox root.

## What does NOT belong in inbox root

- Files you already know where to file — write them directly in PKM
- Files waiting to be deleted — move to `_Processed/`
- Team output artifacts (research briefs, session logs, deliverables) — those go to `Deliverables/` or `Studio/Team Knowledge/session-logs/`

---

## Updates to this Guideline

If the `Meeting Captures/` → Journal pipeline changes, or if delete permissions are resolved (removing the `_Processed/` workaround), update this file. Do not add subfolders without amending this Guideline.

# WS-004 - Inbox Processing

- **Status:** Active
- **Type:** Workstream - multi-agent composition
- **Owners:** Larry (triage + cleanup), Alyssa (approval gate), Penn (execution)
- **References:** [[SOP-003-keep-notes-to-journal]], [[WS-001-daily-journaling]], [[GL-001-file-naming-conventions]], [[GL-002-frontmatter-conventions]]
- **Triggered by:** "process the inbox" / "what's in the inbox" / "let's process" / start of session when inbox has items / KeepSidian sync detected in logs

## Relationship to other workstreams

- **WS-001** handles live in-session input. Alyssa drops something in conversation right now; Penn writes it immediately, no inbox involved.
- **WS-004** handles batch items sitting in `Notebook/Inbox/`: Keep exports, web clips, meeting capture pointers, manually dropped files, and future Telegram captures.
- **WS-005** handles meeting capture processing specifically. WS-004 routes meeting pointers to WS-005.
- **SOP-003** is Penn's execution procedure. WS-004 calls SOP-003 at Step 3 after Alyssa approves routing.

## Step 0 - Source Refresh (Mack + Larry)

Before triage, refresh the capture sources that feed `Notebook/Inbox/`.

Current refresh actions:

- **KeepSidian:** manual-only refresh. Do not auto-launch Obsidian. Do not trigger `obsidian://` URIs. If sync state cannot be confirmed, record "KeepSidian sync not confirmed" and continue.
- **Meetily:** **Daily Meeting Clean** is handled by `Studio/Team Knowledge/Automations/meetily-inbox-prep.ps1`. It scans `D:/Alyssa/Music/meetily-recordings` for completed meeting folders, creates missing lightweight pointer notes in `Notebook/Inbox/Meeting Captures/`, deletes audio/video after 7 days, and retires transcripts only after processed meeting memory exists.

Source refresh does not interpret inbox items or write final notes. Meetily media cleanup is the one mechanical exception: old audio/video deletes after the retention window because transcripts remain available as temporary source.

Inbox processing must not fail just because KeepSidian sync was not triggered or could not be confirmed.

## Step 1 - Triage (Larry)

Larry reads every file in `Notebook/Inbox/` and builds a routing table.

For each item:

1. **Identify source type:** Keep export with `GoogleKeepCreatedDate` frontmatter / meeting capture pointer in `Notebook/Inbox/Meeting Captures/` / web clip / manual note / image.
2. **Concept-level duplicate check:** search key terms across `Notebook/Journal/` and running docs. Check for the same idea at any date, not just the same day.
3. **Determine output:** see Output Types below.
4. **Propose routing:** tags, connections, related notes, and proposed action.

Duplicate outcomes:

- **No duplicate:** propose new standalone note.
- **Duplicate, nothing new:** propose discard.
- **Duplicate, new content exists:** propose update to existing note.

## Action Tier (assign BEFORE routing)

Every inbox item gets an action tier. Filing is not an action. The tier determines what actually happens, not just where the note goes.

| Tier | What it means | What happens |
|---|---|---|
| `archive` | Truly reference-only — saved for future use, no immediate action | Files to journal. No brief. Done. |
| `read + synthesize` | Content worth actually consuming — article, video, framework | Assigned specialist reads it in the current or next session and produces a synthesis note. NOT "file and review someday." |
| `dispatch now` | Time-sensitive or launch-adjacent — the moment passed this it's stale | Brief written and specialist starts immediately. Does not go into the queue to wait. |
| `evaluate` | Tool, app, or resource that might change how we work | Mack (integrations) or Silas (vault structure) gets a yes/no evaluation task in the same session. |

**Larry assigns the tier during Step 1 triage. The tier appears in the approval table. Alyssa can override.**

Signals that something is `dispatch now`:
- Note contains "for launch" / "recreate" / "use this" / an explicit instruction
- The item is design or copy inspo during an active launch window
- The save is within 48 hours of a deadline

Signals that something is `read + synthesize`:
- It's a long-form article or video saved because the topic is directly relevant to current work
- It references our own system, process, or tools
- It contains frameworks or patterns worth pulling into the Second Brain

Signals that something is `evaluate`:
- A URL to a tool, plugin, or service
- Something involving automation, integrations, or vault structure

---

## Output Types

| Output | When to use |
|---|---|
| **New standalone note** | Default. Every capture gets its own note unless it is a pure duplicate. |
| **Meeting capture processing** | A pointer in `Notebook/Inbox/Meeting Captures/` references a raw Meetily folder. Run [[WS-005-meeting-capture-processing]] and create any follow-up tasks before cleanup. |
| **New standalone note + append to running doc** | Content belongs in an existing file such as a project, Key Element, or running notes file. Create the note first, then append with a wikilink back to it. |
| **New standalone note + new task** | Capture is actionable with a finish line. Create the note, then create a task file linking to it. |
| **Update existing note** | New content adds to a note that already exists. Append only; never overwrite unless Alyssa approves replacement. |
| **Discard** | Exact duplicate with nothing new. Confirm before deleting. |

Key rule: the standalone note always comes first. Running doc appends and task files are secondary outputs that reference the note; they never replace it.

## Step 2 - Approval (Alyssa)

Larry presents the routing table. Alyssa reacts in one message: approve rows, tweak connections, redirect to a different doc, or flag a duplicate Larry missed.

Table format:

| Note | Tags | Connections | Related notes | Proposed action | Team brief |
|---|---|---|---|---|---|
| Note title | `tag1` `tag2` | `[[ke]]` `[[project]]` | related-note-1, related-note-2 | New standalone note - one line description | — |
| Another note | `inspo` | `[[socials]]` | ... | New note + append to [[claude-notes]] | Hermes → carousel angles |
| Third note | `good-idea` | `[[pkm]]` | ... | New note + new task | — |

**Team brief column rules:**
- If the item has a clear content type AND has Alyssa's kind of energy (check taste-log.md), propose a specific brief: `Hermes → [content type]` or `Pax → [research question]` or `Charta → [design type]`
- If Alyssa approves the row AND a team brief is proposed: Larry creates the brief automatically — a task file in `Studio/Team Knowledge/tasks/open/` per [[SOP-004-create-task]] (or the weekly pitch loop for social content) — no separate ask required
- If Alyssa approves the row AND overrides the team brief column: honor the override, update the queue accordingly
- A blank `—` in the team brief column means Larry assessed it and found no immediate activation opportunity. Alyssa can override this too.

Larry does not proceed until Alyssa responds. If Alyssa is unavailable, leave inbox items in place and note the open routing in the session log.

## Step 3 - Execute (Penn + Larry)

After approval:

Penn, following [[SOP-003-keep-notes-to-journal]]:

- Writes each new standalone note to `Notebook/Journal/YYYY/MM/YYYY-MM-DD-slug.md`.
- Strips source-specific frontmatter where present.
- Writes clean body content. If the source is Alyssa's own writing, preserve her words exactly and clean formatting only.
- Adds `**Related notes**` with wikilinks to related journal entries.
- Adds `**Connections:**` with entity wikilinks.
- Adds source line at bottom.
- Updates existing notes when output is "Update existing".

Larry:

- Appends to running docs where approved, always with a wikilink back to the standalone note.
- Creates task files where approved.
- Routes meeting capture pointers through [[WS-005-meeting-capture-processing]].
- Sweeps orphaned images into `Notebook/Images/YYYY/MM/`.

## Step 4 - Cleanup (Larry)

After all approved items are processed:

1. Delete each processed inbox file.
2. Delete all processed `Notebook/Inbox/_KeepSidianLogs/YYYY-MM-DD.md` files.
3. Verify inbox is clean except for `README.md`, `_archive/`, known held files, and anything Alyssa explicitly flagged.
4. Check `media/` for leftovers.
5. Confirm no orphaned image files remain at the vault root.

Do not delete any inbox file that appears empty before confirming; it may have a pending image embed.

For meeting captures, do not delete raw Meetily folders unless WS-005 cleanup approval has been granted.

## Step 5 - Session Wrap-Up Capture

At the end of any session that ran WS-004, Larry checks for and logs:

- Scheduled or recurring actions surfaced.
- New running doc appends.
- Open threads left unresolved.
- Any raw meeting source folders pending deletion or quarantine.

## Tag Vocabulary

| Tag | Use for |
|---|---|
| `inspo` | Visual inspo, links, examples to draw from |
| `ai` | AI tools, Claude setups, prompts, automations |
| `copy` | Email/social copy frameworks, templates, formulas |
| `good-idea` | Strategic ideas worth developing into projects/goals |
| `musings` | Personal reflections, identity, mindset |
| `recipes` | Food |
| `montessori` | Parenting / Norah activities |
| `meetings` | Meeting captures and follow-up notes |

## What Not To Do

- Do not merge multiple captures into one note. One capture equals one note.
- Do not skip the approval step.
- Do not rewrite Alyssa's original concepts when the source is her own writing.
- Do not create CRM stubs for family (Norah) or team members (Camila). Mention by name in prose.
- Do not delete inbox files that appear empty before confirming with Alyssa.
- Do not append to a running doc without also creating the standalone note first.
- Do not store raw meeting audio or full raw transcripts in myPKA unless Alyssa explicitly asks.

## Oversized Files

If a file exceeds readable size:

1. Read what you can.
2. Propose a distilled standalone note.
3. If the content is Alyssa's own writing, preserve her words exactly and clean formatting only.
4. Note the limitation in the session log.

## Capture Channels

This workstream is channel-agnostic. Current channels:

- **KeepSidian:** Google Keep to Notebook/Inbox via Obsidian plugin.
- **Meetily:** bot-free meeting recordings stay outside the vault; pointer notes land in `Notebook/Inbox/Meeting Captures/` and process through [[WS-005-meeting-capture-processing]].
- **Manual drop:** web clips, Notion exports, screenshots, files, and notes Alyssa drags in.

Current scheduled routine:

- **Daily Meeting Clean:** Windows scheduled job / cron-style mechanical job. It creates meeting pointers and handles raw media cleanup. It does not interpret meetings or write final notes.
- **Closing Shift: Notebook/Inbox Review:** Larry-led judgment pass run on request. It reads `Notebook/Inbox`, performs Step 1 triage, then presents the approval table. It does not bypass Alyssa's approval gate.
- **Weekly Meeting Processing:** Larry/Penn meeting-memory pass, usually run during weekly review. It reads retained transcripts from meeting pointers, extracts decisions/action items/Alyssa language/client language, updates the durable notes, and marks pointers processed.

Planned:

- **Telegram:** once wired via Mack ([[tsk-2026-06-01-004-telegram-claude-automation]]), messages route to Notebook/Inbox and process via this WS.

When a new channel is added, update the source-type check in Step 1 and note any channel-specific frontmatter or format differences.

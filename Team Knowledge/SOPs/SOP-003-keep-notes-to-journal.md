# SOP-003 — Note Formatting & Execution

- **Type:** SOP — atomic step-by-step procedure
- **Default owner:** Penn (writing), Larry (image sweep)
- **Called from:** [[WS-004-inbox-processing]] Step 3 — this SOP is Penn's execution procedure within the inbox processing workstream. Do not run this SOP standalone; triage and approval happen in WS-003 first.
- **Trigger:** WS-003 approval received — Penn executes for each approved note

## Purpose

Write properly formatted standalone notes from approved inbox items. Any source type (Keep export, web clip, manual note) — this SOP normalises them all into clean, connected PKM entries. Triage, duplicate checking, and routing decisions are handled upstream in [[WS-004-inbox-processing]] before this SOP runs.

## Journal entry format (canonical)

Every journal entry must follow this structure:

```markdown
---
date: YYYY-MM-DD
tags:
  - tag1
  - tag2
---
# Title

Body content here.

**Related notes**
- [[YYYY-MM-DD-slug|Display Name]]

**Connections:** [[entity-1]] [[entity-2]]
```

- `**Related notes**` — wikilinks to other journal entries on the same subject. Penn scans existing journal for related entries and links them. Omit section if no related entries exist yet.
- `**Connections:**` — wikilinks to PKM entities (Key Elements, Projects, Offers, Goals, Topics, People). At least one required. These are the routing targets from the triage pass.

## Steps

### Step 1 — Image sweep (Larry, before Penn runs)

KeepSidian drops images at the vault root as `Pasted image YYYYMMDDHHMMSS.png`. These are orphaned.

1. Run `Glob` for `*Pasted image*` at vault root.
2. Also check `Team Inbox/media/` for files with no extension (Keep exports lose file type — use `file` command to confirm they are PNG/JPG).
3. Move all to `PKM/Images/YYYY/MM/` with kebab-case names.
4. Update `![[...]]` embeds in inbox notes to point to new paths.

### Step 2 — Penn writes each approved note

For each approved note (routing already confirmed in WS-003):

1. Read the inbox file.
2. Extract source URL — `GoogleKeepUrl` for Keep exports, `source:` frontmatter for web clips, or note manually.
3. Strip all source-specific frontmatter: `GoogleKeepCreatedDate`, `GoogleKeepUpdatedDate`, `GoogleKeepUrl`, `KeepSidianLastSyncedDate`, `author`, `published`, `clippings` tag, etc.
4. Write standalone note at `PKM/Journal/YYYY/MM/YYYY-MM-DD-slug.md`. Auto-create folders. One note per capture — never merge.
5. Add clean frontmatter: `date:` and `tags:` only.
6. Write body content — distilled and clean. If source is Alyssa's own writing, preserve her words exactly; clean formatting only.
7. Add `**Related notes**` — scan `PKM/Journal/` for related entries. Link any found.
8. Add `**Connections:**` line with all entity wikilinks from approved routing.
9. Add source line as last line: `*[Original Keep note](URL)*` or `*[Source](URL)*`
10. Do NOT delete the inbox file — Larry handles cleanup in WS-003 Step 4.

### Step 3 — Special cases

- **Existing entry at same date:** Append a new `## [Section]` to the existing file. Never overwrite unless Alyssa explicitly confirms the inbox version replaces it.
- **Append-only updates** (e.g. Norahisms): Read existing file, confirm new content isn't already there, append to bottom.
- **Replace** (e.g. Service pros — inbox version is more current): Replace file content entirely. Keep filename.

### Step 4 — Hand back to Larry

After all notes are written, Penn signals completion. Larry runs WS-003 Step 4 (cleanup): deletes inbox files, clears KeepSidian logs, verifies inbox state.

## Tag vocabulary

| Tag | Use for |
|-----|---------|
| `inspo` | Visual inspo, links, examples to draw from |
| `ai` | AI tools, Claude setups, prompts, automations |
| `copy` | Email/social copy frameworks, templates, formulas |
| `good-idea` | Strategic ideas, things to develop into projects/goals |

## What NOT to do

- Do not merge multiple captures into one note. One capture = one note.
- Do not create CRM stubs for family members (Norah) or team members (Camila). Mention by name in prose.
- Do not rewrite Alyssa's own writing — preserve her words exactly, clean formatting only.
- Do not delete inbox files — that's Larry's job in WS-003 Step 4.
- Do not run this SOP without an approved routing table from WS-003.

## Cross-references

- [[WS-004-inbox-processing]] — parent workstream; triage and approval happen there before this SOP runs
- [[WS-001-daily-journaling]] — for live in-session captures (not inbox batch)
- [[GL-001-file-naming-conventions]] — slug and date rules
- [[GL-002-frontmatter-conventions]] — entity frontmatter schemas

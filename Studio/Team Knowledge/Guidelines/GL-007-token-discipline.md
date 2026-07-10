---
name: GL-007 — Token Discipline
type: guideline
description: Rules for keeping context lean across all team work. Applies to every agent, every session, every new file created. Context bloat is a performance issue and a cost issue.
last_updated: 2026-06-05
tags: [token-discipline, context, performance]
---

← [[Studio/Team Knowledge/Guidelines/INDEX|Guidelines]]

---

## Why This Exists

Context compounds. Every file loaded costs tokens before any work starts. Message 30 costs Claude 30× the tokens of message 1 — it re-reads the entire conversation. A 20-message session burns ~105,000 tokens. A 30-message session burns ~232,000.

Token discipline is not optional. It is a team performance standard. Every agent follows these rules on every task.

---

## Rule 1 — Entry Points, Not Dumps

**Every folder that a team member might navigate has one entry point. Load the entry point. Nothing else until you know what the task requires.**

| Area | Entry point | Max lines |
|---|---|---|
| Second Brain (copy tasks) | [[Studio/Analysis/COMPASS]] | ~100 lines |
| Second Brain (full routing detail) | [[Studio/Analysis/copy-task-routing]] | 545 lines (reference only) |
| Team Knowledge | [[Studio/Team Knowledge/INDEX]] | ~45 lines |
| PKM | [[PKM/INDEX]] | per INDEX standard |
| Guidelines | [[Studio/Team Knowledge/Guidelines/INDEX]] | ~26 lines |

**Do not enter `Studio/Analysis/`, `Library/Examples/`, `Studio/Analysis/Frameworks/`, or `Library/Programs/` directly.** Route through the entry point first.

---

## Rule 2 — Load Only What the Task Requires

If you are loading more than 4 files for a task:
1. Stop.
2. Return to the entry point.
3. Ask: does this task actually require all of this, or am I loading speculatively?

Most tasks need 1–3 files. 4+ is a signal something is wrong with the route.

**Speculative loading** ("just in case I need it") is prohibited. If you don't know if you'll need a file, don't load it. You can always load it later.

---

## Rule 3 — Second Brain Navigation Standard

For any copy task:

1. Load [[Studio/Analysis/voice-profile]] first, every time. (~3,000 tokens, contains everything from [[Library/me]] + the most critical sections of [[Studio/Analysis/writing-style]])
2. Identify task type → consult [[Studio/Analysis/COMPASS]] routing table → load only the files listed for that task
3. Never load [[Studio/Analysis/writing-style]] in full for Level 1–2 tasks. Load by section number only (e.g., "§12 and §14 only")
4. Load at least 1 example file for Level 2+ tasks. Load it before writing, not after

---

## Rule 4 — Session Hygiene

- **New topic = new session.** Don't carry copy work context into a system/journaling task. Each work type gets its own session.
- **`/compact` at natural breakpoints** — after a task completes, before starting a new task in the same session
- **At 15–20 messages**, ask yourself: is this session getting expensive? If yes — summarize key decisions, open a new session, paste the summary as the first message
- **Level 3 tasks** (sales pages, webinar scripts, full about pages) require a dedicated session. Don't run them as part of a multi-task session

---

## Rule 5 — File Size Limits for New Content

Every new file created by any team member must stay within these limits. If the content won't fit, split it or summarize.

| File type | Max lines | Notes |
|---|---|---|
| COMPASS / entry point | 120 lines | If it grows past this, something is wrong — split the content, not the COMPASS |
| Index files | 100 lines | INDEXes are navigation, not content |
| Analysis files | 600 lines | [[Studio/Analysis/writing-style]] at 716 lines is the historical ceiling — do not exceed it in new files |
| Framework files | 400 lines | |
| Routing guides | 300 lines | COMPASS is the model; [[Studio/Analysis/copy-task-routing]] at 545 lines is the detailed reference ceiling |
| Templates | 200 lines | |
| Memory files | 150 lines | If a memory file exceeds 200 lines, split into sub-files and add a pointer |
| Session logs | No hard limit | But keep to what's essential — not a word-for-word transcript |

**If a new file would exceed its limit:** split the content into a primary file (within limit) and a linked detail file. The primary file is the entry point; the detail file loads on demand.

---

## Rule 6 — Larry's Startup Cost

Larry reads [[CLAUDE]] (brief pointer) + [[AGENTS]] (~292 lines) on every session. This is the unavoidable floor.

To keep the floor from growing:
- [[AGENTS]] should not grow beyond 300 lines without a structural review
- Memory files (in `.claude/projects/.../memory/`) should each stay under 150 lines
- `MEMORY.md` index should stay under 50 lines — it's a table of contents, not a summary

When a memory file approaches 150 lines, flag it for Larry to consolidate or split.

---

## Rule 7 — Adding to the Second Brain

When adding analysis, examples, or frameworks:

- **If the new content fits within an existing file's scope:** add a new section to that file. Do not create a new file.
- **If the new content genuinely needs its own file:** create it, update the relevant INDEX.md, and update [[Studio/Analysis/COMPASS]] if it's a commonly-used task type
- **Any new file over 300 lines** at creation triggers a review: could this be split? Could the most-loaded content be a lean entry point file with a detail file behind it?
- **Never add content to [[Studio/Analysis/COMPASS]] beyond 120 lines.** If the compass is growing, the routing logic belongs in [[Studio/Analysis/copy-task-routing]], not the compass itself

---

## Rule 8 — MCP and Tool Schema Overhead

MCP tools inject their full schema into context on both sides — tool definitions going in, raw output coming back. Each active MCP server adds to the session floor cost.

- **Don't activate MCPs speculatively.** Only use MCP tools when the task genuinely requires them
- **Batch MCP calls** — 3 separate tool calls vs. 1 batched call = 3× the context reload overhead
- **When a CLI alternative exists**, prefer it over MCP (it uses fewer tokens and is faster)

---

*This guideline applies to all agents. Larry enforces it at session close as part of the Librarian role.*

*See [[Studio/Analysis/COMPASS|COMPASS.md]] for Second Brain-specific navigation rules.*

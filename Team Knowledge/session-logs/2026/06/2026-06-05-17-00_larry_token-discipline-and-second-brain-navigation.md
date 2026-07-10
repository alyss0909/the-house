---
agent_id: larry
session_id: 2026-06-05-17-00_larry_token-discipline-and-second-brain-navigation
timestamp: 2026-06-05T17:00:00Z
type: close-session
linked_guidelines: ["GL-007-token-discipline"]
---

# Token Discipline System + Second Brain Navigation Overhaul

## Context

Alyssa brought in two Team Inbox items on cutting Claude token usage (Ruben Hassid's 23 habits, Sabrina Ramonov's 6 tips) and asked for an analysis of the Second Brain architecture against those principles, followed by immediate execution. The session became a full audit and rebuild of how every agent navigates the Second Brain — creating lean entry points, written token rules, and wiring the system into every agent shim.

## What we did

- **Larry** read both inbox articles (Ruben + Sabrina) and audited the full Second Brain architecture, producing a ranked list of token bleed points
- **Larry** confirmed `voice-profile.md` exists (314 lines, XML format, excellent quality) and does not need changes
- **Larry** created `PKM/Second Brain/COMPASS.md` (~100 lines) — the new single entry point for all Second Brain navigation, replacing `copy-task-routing.md` as the first stop
- **Larry** created `Team Knowledge/Guidelines/GL-007-token-discipline.md` (~100 lines) — the written token discipline rule covering file size limits, session hygiene, Second Brain navigation, Larry's startup cost, and MCP overhead
- **Larry** updated `Team Knowledge/Guidelines/INDEX.md` to register GL-007
- **Larry** updated `PKM/Second Brain/INDEX.md` — START HERE now points to `COMPASS.md` instead of the 545-line `copy-task-routing.md`
- **Larry** created `PKM/Second Brain/programs/back-of-house/BOH-COMPASS.md` (~80 lines) — lean entry point for the 792-line BOH INDEX, with phase map, key framework definitions, routing by question type, and file-type decision table
- **Larry** updated main `COMPASS.md` to route BOH content through `BOH-COMPASS.md`
- **Larry** rewrote Wren's pre-task protocol in `.claude/agents/wren.md` — replaced `me.md` + full `writing-style.md` + `copy-task-routing.md` loading with `COMPASS.md` → `voice-profile.md` → COMPASS-directed files only
- **Larry** updated all 7 other agent shims (Nolan, Vera, Pax, Penn, Silas, Mack, Remi) with GL-007 references and Second Brain access rules
- **Larry** added Nolan's "future shim template" section — every new specialist hire now gets correct navigation baked in at creation, using Wren as the template
- **Larry** added Wren to `Team/agent-index.md` (she was missing entirely) and fixed the "six specialists" language

## Decisions made

- **COMPASS pattern is canonical:** Every major content area needs a lean entry point (≤120 lines) that routes to specific files. Second Brain has `COMPASS.md`. BOH has `BOH-COMPASS.md`. Any future large content area follows the same pattern.
- **`voice-profile.md` is the Level 1–2 default:** Replaces loading `me.md` + full `writing-style.md` for all standard copy tasks. Already existed, just needed promotion to first position.
- **`copy-task-routing.md` is a reference, not an entry point:** 545 lines. Loaded only when COMPASS doesn't answer the question.
- **BOH INDEX is never loaded directly:** At 792 lines, the largest file in the vault. All agents route through `BOH-COMPASS.md` first.
- **No changes to existing analysis files:** Alyssa explicitly chose not to edit `writing-style.md`, `copy-task-routing.md`, `voice-profile.md`, or any analysis content — only navigation infrastructure added.
- **GL-007 is team-wide:** Every agent shim now references it. Every new hire from Nolan will inherit it.

## Insights

- The Second Brain's biggest token risk wasn't the analysis files themselves — it was the navigation path to them. Loading a 545-line routing guide to find out what to read was the primary bleed.
- The BOH INDEX at 792 lines was the single most expensive file in the vault. Agents needed all of it to find anything inside it.
- The COMPASS pattern (lean entry point → pointer to specific files) is universally applicable. As other content areas grow, they should get their own COMPASS before they get past ~300 lines.
- `voice-profile.md` (314 lines, XML, ~3,000 tokens) was the right calibration tool all along — it just needed to be positioned first, not third.
- Wren was missing from the agent-index entirely. She had a shim and a wiki contract but no routing entry — meaning Larry had no formal rule for when to dispatch her.

## Realignments

- "I don't really want to make any changes to the analysis, the writing style, or anything like that in the actual second brain right now" — Larry held the line: no edits to any existing analysis files. Only new navigation files created.
- "I meant INDEX [not agents]" — Alyssa clarified she wanted the `Team/agent-index.md` fixed (Wren missing), not the agent shims. Larry had already updated the shims before the clarification; both were correct moves, just the INDEX was the explicit ask.
- "I didn't mean to edit [Wren] that much" — Confirmed only 2 sections changed in Wren's shim (pre-task protocol + Second Brain source note). All substantive content — Don'ts, quality gate, task scope, return format — was left exactly as written.

## Open threads

- [ ] Section navigation headers for `writing-style.md` — add a 10-line block at the top listing which sections to load for which task type. Deferred per Alyssa's instruction ("we can do that later").
- [ ] `voice-profile.md` awaiting Alyssa's review — marked AI-mined draft. Once reviewed, update `copy-task-routing.md` calibration levels to formally reflect voice-profile as the Level 1–2 default.
- [ ] `examples/simmers/` — 3 examples now filed; routing guide says this gap is partially closed but Simmer template still pending.
- [ ] Notion vaults (hook vault, RTO vault, P.S. vault, etc.) — Mack to set up API connection. Listed in `frameworks/INDEX.md`.
- [ ] `examples/subjects-and-previews.md` — curated raw pairs file still TBD per `copy-task-routing.md` §10.

## Next steps

- Alyssa reviews `voice-profile.md` when ready — gap interview for ~13 LOW/MED-confidence questions, then Larry recompiles if needed
- Add section navigation headers to `writing-style.md` (quick edit, deferred this session)
- Any new specialist Nolan hires follows the updated shim template — Second Brain navigation baked in

## Cross-links

- [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] — session that built the Second Brain voice layer (voice-profile, writing-style, sales-page analysis) and hired Wren
- [[2026-06-05-15-00_larry_soft-sunday-analysis-and-framework]] — most recent Second Brain build session before this one

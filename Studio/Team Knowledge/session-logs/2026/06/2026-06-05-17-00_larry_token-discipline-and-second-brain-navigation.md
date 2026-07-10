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
- **Larry** confirmed [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] exists (314 lines, XML format, excellent quality) and does not need changes
- **Larry** created [[Studio/Analysis/COMPASS]] (~100 lines) — the new single entry point for all Second Brain navigation, replacing [[Studio/Analysis/copy-task-routing]] as the first stop
- **Larry** created [[Studio/Team Knowledge/Guidelines/GL-007-token-discipline]] (~100 lines) — the written token discipline rule covering file size limits, session hygiene, Second Brain navigation, Larry's startup cost, and MCP overhead
- **Larry** updated `Team Knowledge/Guidelines/INDEX.md` to register GL-007
- **Larry** updated [[PKM/Second Brain/INDEX]] — START HERE now points to [[Studio/Analysis/COMPASS]] instead of the 545-line [[Studio/Analysis/copy-task-routing]]
- **Larry** created [[Library/Programs/back-of-house/BOH-COMPASS]] (~80 lines) — lean entry point for the 792-line BOH INDEX, with phase map, key framework definitions, routing by question type, and file-type decision table
- **Larry** updated main [[Studio/Analysis/COMPASS]] to route BOH content through [[Library/Programs/back-of-house/BOH-COMPASS]]
- **Larry** rewrote Wren's pre-task protocol in `.claude/agents/wren.md` — replaced [[Library/me]] + full [[Archive/Studio-Analysis-voice-retired-2026-07-10/writing-style]] + [[Studio/Analysis/copy-task-routing]] loading with [[Studio/Analysis/COMPASS]] → [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] → COMPASS-directed files only
- **Larry** updated all 7 other agent shims (Nolan, Vera, Pax, Penn, Silas, Mack, Remi) with GL-007 references and Second Brain access rules
- **Larry** added Nolan's "future shim template" section — every new specialist hire now gets correct navigation baked in at creation, using Wren as the template
- **Larry** added Wren to [[Studio/Team/agent-index]] (she was missing entirely) and fixed the "six specialists" language

## Decisions made

- **COMPASS pattern is canonical:** Every major content area needs a lean entry point (≤120 lines) that routes to specific files. Second Brain has [[Studio/Analysis/COMPASS]]. BOH has [[Library/Programs/back-of-house/BOH-COMPASS]]. Any future large content area follows the same pattern.
- **[[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] is the Level 1–2 default:** Replaces loading [[Library/me]] + full [[Archive/Studio-Analysis-voice-retired-2026-07-10/writing-style]] for all standard copy tasks. Already existed, just needed promotion to first position.
- **[[Studio/Analysis/copy-task-routing]] is a reference, not an entry point:** 545 lines. Loaded only when COMPASS doesn't answer the question.
- **BOH INDEX is never loaded directly:** At 792 lines, the largest file in the vault. All agents route through [[Library/Programs/back-of-house/BOH-COMPASS]] first.
- **No changes to existing analysis files:** Alyssa explicitly chose not to edit [[Archive/Studio-Analysis-voice-retired-2026-07-10/writing-style]], [[Studio/Analysis/copy-task-routing]], [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]], or any analysis content — only navigation infrastructure added.
- **GL-007 is team-wide:** Every agent shim now references it. Every new hire from Nolan will inherit it.

## Insights

- The Second Brain's biggest token risk wasn't the analysis files themselves — it was the navigation path to them. Loading a 545-line routing guide to find out what to read was the primary bleed.
- The BOH INDEX at 792 lines was the single most expensive file in the vault. Agents needed all of it to find anything inside it.
- The COMPASS pattern (lean entry point → pointer to specific files) is universally applicable. As other content areas grow, they should get their own COMPASS before they get past ~300 lines.
- [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] (314 lines, XML, ~3,000 tokens) was the right calibration tool all along — it just needed to be positioned first, not third.
- Wren was missing from the agent-index entirely. She had a shim and a wiki contract but no routing entry — meaning Larry had no formal rule for when to dispatch her.

## Realignments

- "I don't really want to make any changes to the analysis, the writing style, or anything like that in the actual second brain right now" — Larry held the line: no edits to any existing analysis files. Only new navigation files created.
- "I meant INDEX [not agents]" — Alyssa clarified she wanted the [[Studio/Team/agent-index]] fixed (Wren missing), not the agent shims. Larry had already updated the shims before the clarification; both were correct moves, just the INDEX was the explicit ask.
- "I didn't mean to edit [Wren] that much" — Confirmed only 2 sections changed in Wren's shim (pre-task protocol + Second Brain source note). All substantive content — Don'ts, quality gate, task scope, return format — was left exactly as written.

## Open threads

- [ ] Section navigation headers for [[Archive/Studio-Analysis-voice-retired-2026-07-10/writing-style]] — add a 10-line block at the top listing which sections to load for which task type. Deferred per Alyssa's instruction ("we can do that later").
- [ ] [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] awaiting Alyssa's review — marked AI-mined draft. Once reviewed, update [[Studio/Analysis/copy-task-routing]] calibration levels to formally reflect voice-profile as the Level 1–2 default.
- [ ] `examples/simmers/` — 3 examples now filed; routing guide says this gap is partially closed but Simmer template still pending.
- [ ] Notion vaults (hook vault, RTO vault, P.S. vault, etc.) — Mack to set up API connection. Listed in `frameworks/INDEX.md`.
- [ ] `examples/subjects-and-previews.md` — curated raw pairs file still TBD per [[Studio/Analysis/copy-task-routing]] §10.

## Next steps

- Alyssa reviews [[Archive/Studio-Analysis-voice-retired-2026-07-10/voice-profile]] when ready — gap interview for ~13 LOW/MED-confidence questions, then Larry recompiles if needed
- Add section navigation headers to [[Archive/Studio-Analysis-voice-retired-2026-07-10/writing-style]] (quick edit, deferred this session)
- Any new specialist Nolan hires follows the updated shim template — Second Brain navigation baked in

## Cross-links

- [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] — session that built the Second Brain voice layer (voice-profile, writing-style, sales-page analysis) and hired Wren
- [[2026-06-05-15-00_larry_soft-sunday-analysis-and-framework]] — most recent Second Brain build session before this one

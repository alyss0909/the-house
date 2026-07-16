---
date: 2026-07-16
agent: larry
topic: Claude usage autopsy and the Control Room build
mined: false
---

# 2026-07-16 — The usage autopsy and everything it caused

## Context

Alyssa asked for a full autopsy of her Claude Code usage as far back as the data goes, then gave permission to build everything it recommended, then kept pulling the thread until the house had a real oversight layer. One session, one arc: diagnose how we work, then fix how we work. This is the same compounding move as the harness autopsy days: find the leaks, turn each leak into a permanent structure, wire the structure into the loop so it never needs remembering.

## The autopsy (the root of everything below)

Larry mined all 93 sessions (2026-06-03 to 2026-07-16, 769 of her messages, about 6,700 tool calls) directly from the transcript files. Four findings drove the whole day:

1. Design sessions were her biggest frustration source: guessed values, unbatched fixes, no saved tokens.
2. She was the continuity system: hand-carrying handoff paths, sessions left open for weeks hitting compaction.
3. Machine waste: edit-before-read errors, 574 needless cd prefixes, python3-on-Windows failures, Unicode crashes, a 92-entry junk permission list.
4. Lots happens behind the scenes with no place she can see it.

Full report: [[Deliverables/2026-07-16-claude-code-insights]].

## What we built, each piece traced to its autopsy finding

- Finding 1 (design pain) became the /design-loop command: measured values only, one batch one render, tokens saved same session.
- Finding 2 (continuity) became /pickup (resume newest handoff, no path hunting) and the session hygiene lessons in the report.
- Finding 3 (machine waste) became the bash-guard PreToolUse hook (blocks python3 and needless cd, tested live when it blocked Larry himself mid-session), the UTF-8 environment line, and the cleaned permission lists. /install codifies the repo-intake convention so future installs stop repeating old mistakes.
- Finding 4 (no oversight) became the House Control Room in Notion: the House Operations Board (all 134 commands, skills, SOPs, workstreams, guidelines, engines, routines, and agents, with filtered views for the team, SOPs, workstreams, engines, and a needs-attention tab) plus the Agent Tasks database (every open task, tagged by Room and Desk, related to real agent rows, with links that open the vault note).

## The oversight layer grew teeth as she used it

Her reacts kept upgrading it, which is the loop working as designed:

- "Tasks to Notion but call them something else" became the Agent Tasks database.
- "Can I get a do-it button" became the Do it checkbox plus the twice-daily sweep lane (folded into the mailroom sweep, which already runs on her clicks).
- "Can I add notes, can I add tasks myself" became the two-way sync contract, now law in [[AGENTS]]: her Notes for the team field is a ruling, a Status she sets to done closes the vault file no questions asked, a new row she types becomes a real vault task on the next sweep.
- Obsidian links refused to open from Notion, so the vault-links redirector went up on her own GitHub Pages (alyss0909.github.io/vault-links), chosen over the community Vercel app because hers cannot vanish. Larry fixed her upload (missing .html extension) and deployed it live.

## Loops closed the same day (the autopsy applied to the backlog)

- Signals had silently stalled since June 27. Catch-up sweep ran (30 entries; new thesis-ready signal ai-workflow-collecting awaits her react; boosting-proven-posts-as-ads on radar) and the sweep is now a permanent step of the Sunday housekeeping patrol. A layer that depended on memory now runs on schedule: the compounding fix, not the one-time fix.
- Larry's own sweep closed 8 open tasks that today's builds or earlier decisions had already made obsolete (Notion button triggers = built today; clickable links = delivered today; WS-011 command center = live; semantic sweep review, routines report review, voice profile interview, telegram bot research = superseded; Rush Order = merged into the offer factory plan). Open tasks went from 23 to 15 (12 stale by tonight's count, down from 13).
- Hermes deep read: the live 4:20am voice study is healthy; the "expired cron" was a paused duplicate, deleted. Carried open thread resolved, nothing for Mack.
- Slack listener retired, 7 dead skill stubs and one dead script deleted, KeepSidian re-auth became a real task on her board.

## Decisions made

- Approve-before-execute honored: hooks and settings shipped only after her explicit yes.
- Notion is her control surface; vault files stay the working source of truth (two-way sync contract in AGENTS.md).
- The official Notion plugin was installed skills-only (4 cookbook skills); its MCP server and 9 wrapper commands were skipped as redundant.
- The numbers board (weekly Kit + IG + sales row on the Control Room) is designed but deliberately NOT built; her call.
- New standing fact: her Notion can embed HTML directly; future Notion surfaces can use hosted HTML embeds (pattern: GitHub Pages, like vault-links).

## Insights (durable)

- The autopsy-then-build arc is the highest-leverage session shape we have: measure the system, let her approve the fixes, wire every fix into a schedule or a law so it compounds. This session is the template.
- A guard hook that blocks the agent's own bad habit (the cd prefix) proved itself within hours by firing on Larry. Automated enforcement beats remembered rules.
- Her oversight needs are click-shaped: checkbox, note field, status change. Every surface that asks her to type a command instead of click has been friction; every click surface (mailroom, taste ledger, now the task board) gets used.

## Open threads

- [ ] She clicks Run now once on mailroom-daily-sweep to pre-approve Notion access for the Do it lane.
- [ ] North star draft (tsk-2026-07-16-002, larry, priority now): team drafts, she reacts, nobody asks her questions.
- [ ] Offer factory plan (tsk-2026-07-16-003, suki): pilot Rush Order.
- [ ] Command center cleanup (tsk-2026-07-16-004): candidate for her Do it checkbox.
- [ ] ai-workflow-collecting thesis awaits her react in [[Studio/Signals/Developing Ideas/ai-workflow-collecting]].
- [ ] Untitled.md in tasks/open: ask her if draft or trash.
- [ ] Numbers board: designed, parked at her request.

## Cross-links

[[2026-07-16-14-00_fable_wave2-wraps-and-boot-path-fix]] (same-day predecessor), [[Deliverables/2026-07-16-claude-code-insights]], [[AGENTS]], [[Slash commands]].

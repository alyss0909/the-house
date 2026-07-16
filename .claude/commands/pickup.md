---
description: Resume work from the newest handoff without Alyssa hunting for the file path
---

# /pickup: resume from the latest handoff

Alyssa starts many sessions by pasting a full file path to a handoff document. This command removes that step. When she says "/pickup" (optionally with a topic, like "/pickup content os"):

1. Gather candidates, newest first:
   - `Deliverables/*handoff*.md` and `Deliverables/YYYY-MM-DD-*.md` from the last 7 days
   - `Notebook/Inbox/*handoff*.md` and `Notebook/Inbox/Handoff*.md`
   - The newest 3 session logs in `Team Knowledge/session-logs/` (or the current session-log home per [[AGENTS]])
2. If a topic was given, filter to matches. If exactly one strong candidate remains, read it in full and start executing it. Do not ask her to confirm the obvious one.
3. If several candidates are equally fresh, list them with one line each and ask which one, using AskUserQuestion.
4. Before executing, follow the boot order in CLAUDE.md ([[HOUSE-MAP]] then [[NOW]]) if not already done this session.
5. If the handoff lives in `Notebook/Inbox/`, move it to its proper archive home once picked up, per the vault convention (check how past handoffs were archived before choosing a destination).
6. Confirm in one short paragraph what the handoff says to do and start doing it. Plain language, no jargon.

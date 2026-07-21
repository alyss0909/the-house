---
name: close-session
description: Run the end-of-session protocol — sweep open items, write the session log, run the Librarian pass, and optionally graduate insights. Mirrors the canonical close-session trigger defined in AGENTS.md.
user_invocable: true
---

# Close Session Protocol

This command is a Claude Code convenience wrapper. The canonical protocol lives in `AGENTS.md` ("Session-Log Triggers" section). If the two ever disagree, `AGENTS.md` wins.

## Steps

1. **Sweep open items.** Larry reviews everything worked on this session. Identify any unresolved threads, open tasks, or pending decisions. List them in the session log under "Open threads."

2. **Write the session log.** Larry writes a new file at `Studio/Team Knowledge/session-logs/YYYY/MM/YYYY-MM-DD-<slug>.md` following the schema in `Studio/Team Knowledge/session-logs/_template.md`. The slug is derived from the session's main theme (kebab-case). If the `YYYY/` or `YYYY/MM/` folder does not exist, Larry creates it first. The log must include:
   - Context (what the session was about)
   - What we did (bulleted, specialist-attributed)
   - Decisions made
   - Insights
   - Realignments (verbatim if the user corrected course)
   - Open threads (checkboxes)
   - Next steps
   - Cross-links to related prior session logs

3. **Journal gate.** For each specialist who was active this session: did they surface a durable insight — something a future instance of that agent should know before starting a similar task? If yes, route to [[SOP-009-write-journal-entry]] for that specialist and cross-link the new entry in today's session log. If no, skip. One durable insight per agent per session is a ceiling, not a floor. This step fires regardless of whether any task files were created or closed.

4. **Librarian pass.** Larry scans the myPKA for structural drift:
   - SSOT violations (same fact in two files) — pick canonical home, replace duplicates with `[[wikilinks]]`
   - Broken `[[wikilinks]]` — fix or stub
   - Orphaned files — add to appropriate `INDEX.md` or flag
   - Missing `INDEX.md` entries for files created this session — add them

5. **Graduate insights (optional).** If any insight captured during the session has reached "this is now a permanent rule" status, propose graduating it from the session log into an SOP, Guideline, or Workstream. Ask the user before writing.

6. **Run the house check, and clear what it finds.** Run `python3 scripts/house-check.py`. This is not advisory. Every line it prints must be cleared before you write the hand-off:
   - **LEAK** — an open thread vanished between session logs without becoming a task or being resolved. This is the leak that lost roughly 75 pieces of committed work before 2026-07-20. Each one gets a task file via [[SOP-004-create-task]], or an explicit line in today's log saying why it died. Never both silence and nothing.
   - **UNCAPTURED** — NOW.md is carrying an item with no task file behind it. Same rule: file it or kill it in writing.
   - **DRIFT** — a task file's status disagrees with its folder. Run `python3 scripts/rebuild-task-index.py`.
   - **STALE** — an open task is 14 days or older. Say something about it in the hand-off, even if that something is "still parked, still fine."

   The check writes nothing and fixes nothing. Clearing it is the closing agent's job, and the point is that it makes the failure visible instead of trusting anyone to remember.

7. **Control Room sync (mechanical, not optional).** The vault is the source of truth; Notion mirrors it. Run `python3 scripts/house-check.py --json` to get the canonical open-task list, query the Agent Tasks database in Notion (data source `collection://c435003e-92d4-4f61-9696-1b86feb46556`), and diff the two. They must match exactly:
   - a task file in `tasks/open/` with no Notion row gets a row (Room and Desk tags plus the "Open in vault" link)
   - a Notion row not open in the vault gets its Status corrected
   - killed work is marked done with a "Notes for the team" line saying it was killed and why, so the board never implies something was finished when it was abandoned

   Then, if this session created, changed, paused, or retired any slash command, skill, SOP, workstream, guideline, engine, routine, or agent, update the matching row in the House Operations Board (data source `collection://fc40825c-e3fc-401a-aa72-73b285604f4c`) and set "Last checked" to today. This board is Alyssa's window into everything running behind the scenes. Do the diff every time. The old version of this step let you skip when "nothing changed," and that clause is exactly how the board drifted for days without anyone noticing.

8. **Weekly review nudge.** Check whether a weekly wrap exists for the current ISO week at `Studio/Team Knowledge/Weekly Reviews/YYYY/YYYY-WNN-weekly-wrap.md`. If no wrap exists and today is ≥5 days into the current ISO week (Thursday, Friday, Saturday, or Sunday), append one line to the sign-off: `Weekly review pending for week WNN — run /weekly-review to wrap the week.`

9. **Sign off.** Confirm the session log path, list any structural fixes made, and name any open threads the next session should pick up first.

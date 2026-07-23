# WS-006 — Weekly Review (Redesigned 2026-06-29)

- **Status:** Active
- **Type:** Workstream — single trigger, full loop
- **Owner:** Larry (orchestration, sweep, synthesis, queue)
- **Triggered by:** `/weekly-review` / "do the weekly review" / "weekly wrap" / "close session" nudge when ≥5 days since last weekly wrap
- **References:** [[SOP-013-semantic-sweep]], [[WS-004-inbox-processing]], [[WS-008-content-activation]], [[WS-010-daily-pulse]], [[Studio/Signals/Developing Ideas/INDEX.md]], `Studio/Team Knowledge/tasks/open/`, [[Studio/Content/idea-bank.md]], [[Studio/Content/taste-ledger]]

---

## This is one trigger. Everything runs.

When you say "weekly review" (or any trigger phrase), Larry runs all five phases in sequence without stopping to ask. No separate inbox command. No separate sweep command. No separate brief dispatch. One word → everything runs → wrap note delivered.

The chain:

```
Trigger → Phase 0 (Inbox Clear)
        → Phase 1 (The Brew — semantic sweep)
        → Phase 2 (The Thread — garden check)
        → Phase 3 (The Queue — content activation)
        → Phase 4 (The Hand-Off — team assignments + wrap note)
        → Phase 5 (Grand Metabolism — source-trust digestion across the week)
        → Done. Alyssa gets the wrap.
```

Larry does not pause between phases. If something needs a decision, it goes in the "For Alyssa" section of the wrap note — not a mid-process interruption.

---

## Phase 0 — The Clear (Inbox Processing)

**What:** Run WS-004 across everything in Notebook/Inbox before sweeping. A sweep of unfiled content is noise — clear the inbox first so the sweep reads clean journal entries.

**Steps:**
1. Check `Notebook/Inbox/` for any unprocessed files (excluding [[README]], `_KeepSidianLogs/`, `_Processed/`, `media/`, `Ignore.md`)
2. For each item: read content, determine category (signal, inspo, tool, personal, meeting capture, task)
3. Route each item:
   - **Signal / content idea** → file to `Notebook/Journal/YYYY/MM/` + flag for sweep in Phase 1
   - **Inspo / reference** → file to `Notebook/Journal/YYYY/MM/` with appropriate tags
   - **Meeting capture** → file to journal, flag for WS-005 processing
   - **Personal** → file to journal
   - **Duplicate / already filed** → discard
   - **Clearly trash** → discard
4. If an item has a clear content type AND passes the taste check → propose a team brief inline in the Phase 4 hand-off (do not interrupt the process)
5. Note all discards and new files for the wrap note

**Output:** Inbox is empty (minus held items). All new journal entries tagged and ready for Phase 1 sweep.

**If inbox is already clear:** Skip Phase 0. Note "Inbox clear" in the wrap. Move to Phase 1.

---

## Phase 1 — The Brew (Semantic Sweep, Light Version)

**What:** Run SOP-013 (light sweep) across the past 7 days — including anything filed in Phase 0.

**Steps:**
1. Glob `Notebook/Journal/YYYY/MM/` for entries from Mon-Sat of the current week
2. Read all entries — what themes appeared? What showed up more than once?
3. Cross-reference signals-index.md — did anything bump a recurrence count?
4. Cross-reference developing ideas — did any garden note get new entries?
5. Did anything cross the 6-recurrence threshold? If yes, write or update the thesis draft now
6. Identify any content-ready captures (hooks, stories, frameworks) → flag for Phase 3

**Output:** A "What brewed this week" section in the weekly wrap note. Not a list. A paragraph or two in Larry's plain voice. What showed up, what connected, what surprised him.

---

## Phase 2 — The Thread (Developing Ideas Check)

**What:** Review the state of the idea garden. What's developing, what's stalled, what's ready.

**Steps:**
1. Open [[Studio/Signals/Developing Ideas/INDEX]]
2. For each idea with status `thesis-ready` or `becoming`: check when it was last touched. If 2+ weeks with no Alyssa reaction, surface it in the wrap with a "this one is waiting for you" note
3. For each idea with `developing` status: check if new source entries from Phase 1 should be wikilinked in
4. Check `check-back` dates on all garden notes. Flag any that are overdue
5. Identify 1 idea to highlight in the wrap — the one with most momentum or most time-sensitive opportunity

**Output:** A "Where the ideas stand" section. What's ready for Alyssa to react to, what's developing on its own, the one highlighted idea for this week.

---

## Phase 3 — The Queue (Content Activation)

**What:** Review the two queue sources — the task system and the idea bank — and confirm what moves this week. (The Ready Queue file was dissolved into these 2026-07-10 per Alyssa; history at [[Archive/ready-queue-retired-2026-07-10]].)

**Steps:**
1. Glob `Studio/Team Knowledge/tasks/open/` for open content-related tasks; open [[Studio/Content/idea-bank.md]] for backburner concepts worth activating
2. Check status of open items: anything blocked? Anything newly ready from Phase 1?
3. Cross-reference [[Studio/Content/taste-ledger]] — anything to reprioritize based on approval patterns?
4. Confirm #1 priority item for the week. Is the assignee clear? Source material all there?
5. Route new content activation opportunities from Phase 1: social content → the Content Studio board in Notion, produced by `/content-run` per [[SOP-041-content-production]] (WS-011's weekly pitch loop retired 2026-07-16); everything else → a task file per [[SOP-004-create-task]]
6. Run WS-008 automatically for anything ready to dispatch that hasn't been dispatched yet

**Output:** A "What's moving this week" section. Max 3 items. The #1 item is the thing the team should complete before next Sunday.

---

## Phase 4 — The Hand-Off (Team Assignments + Wrap Note)

**What:** Write any new briefs, record decisions, deliver the wrap.

**Steps:**
1. Write any new team briefs that surfaced in Phases 0-3 as task files in `Studio/Team Knowledge/tasks/open/` per [[SOP-004-create-task]] (social-content briefs go to the weekly pitch loop instead)
2. Update `team_brief_dispatched` and `team_brief_status` fields in relevant garden notes
3. Confirm Hermes has clear next steps and everything he needs to start
4. Identify ONE thing that needs Alyssa's input (if anything). Never more than one decision per weekly review. If the decision is taste/strategy and cannot be proven from source, present two versions: A safer/source-close, B more nuanced/higher-upside/needs Alyssa's taste.
5. Write the weekly wrap note (see structure below)
6. Update signals-index.md sweep history with this week's run

**Output:** Completed weekly wrap note. Any new briefs in the queue. One decision for Alyssa (or none).

---

## Phase 5 - Grand Metabolism (Weekly Source-Trust Digestion)

**What:** Read the `## Daily knowledge metabolism` sections from this week's session logs and connect them across the week. This is the weekly layer that prevents July 4 and July 5 style work from staying siloed.

**Steps:**
1. Collect all session logs for the week, prioritizing the daily metabolism sections.
2. Cluster related outputs, failures, corrections, and open loops by objective, not by file location.
3. Identify what the week taught the system: source maps updated, tasks closed or clarified, task/idea-bank movement, Hermes learning candidates, and source-boundary fixes.
4. Identify what was superseded by better work later in the week. Archive, delete, demote, or mark as process evidence instead of leaving it active.
5. Flag trust breaks that need Silas, Hermes, Pax, or Mack. Silas handles source-boundary/index drift; Hermes handles recurring rejection-informed rules; Pax handles external gold-standard proof; Mack handles connector/cron work after the manual behavior works once.
6. Add a concise `## Grand metabolism` section to the weekly wrap. Monthly review should be able to read this instead of reopening raw chaos.
7. **House-keeping light pass — run [[SOP-039-house-keeping]] (~10 min).** The 8 weekly checks (Notebook write-lock, Library stamps, one-home-per-fact lint, ghost citations, orphans, desk hygiene, task truth, capture pulse). Fix mechanical hits immediately; log the `## House check` section into the weekly wrap. This is the weekly guard that keeps the geography honest.

**Output:** The week becomes easier to use: fewer floating reports, clearer source paths, cleaner tasks, and one sharper next-week starting point.

---

## The Weekly Wrap Note

**File:** `Studio/Team Knowledge/Weekly Reviews/YYYY/YYYY-WNN-weekly-wrap.md`

```
# Week of [Mon Date] — Weekly Brew

## Inbox cleared
[What came in, what was filed, what was discarded — 2-3 sentences]

## What brewed this week
[Phase 1 output — 1-2 paragraphs, Larry's plain voice]

## Where the ideas stand
[Phase 2 output — highlighted idea + garden status]

## What's moving
[Phase 3 output — top 1-3 queue items with assignee]

## Grand metabolism
[Phase 5 output - what the week taught the system, what was superseded, what changed in maps/tasks/Hermes/idea bank, what starts next week]

## For Alyssa
[Phase 4 output — one question or decision, nothing else. If this is taste/strategy, show Version A and Version B. If nothing needed: "Nothing — keep going."]

## Session log summary
[Session count, open threads, work done — historical record]
```

If file exists for this week: append a new section, don't overwrite.

---

## What triggers this

| User says | Action |
|---|---|
| `/weekly-review` | Run all 5 phases for current ISO week |
| "do the weekly review" | Same |
| "weekly wrap" / "wrap up the week" | Same |
| "weekly review for [week/date]" | Run all 5 phases for specified range |
| Close-session nudge fires | Suggest running `/weekly-review` |

**Close-session nudge:** At the end of any close-session run, Larry checks whether a weekly wrap exists for the current ISO week. If no wrap exists and the most recent session log is ≥5 days after the last weekly wrap, Larry appends one line: `Weekly review pending for week WNN — run /weekly-review to wrap the week.`

---

## Relationship to other workstreams

- **WS-004** — absorbed as Phase 0. Does NOT need to be run separately before a weekly review.
- **SOP-013** — runs as Phase 1 (light mode). Monthly deep sweep and quarterly full sweep still run separately via WS-009.
- **WS-008** — runs automatically as part of Phase 3 for anything ready to dispatch.
- **WS-007** — monthly review reads the weekly wraps and `Grand metabolism` sections this produces. Never skip WS-006 and read raw session logs in WS-007.
- **WS-009** — runs the deep sweep on the first Sunday of the month, replaces the weekly light sweep for that week.
- **WS-010** — daily pulse fires at every session start and surfaces the #1 item from the most recent Queue output.

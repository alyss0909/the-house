---
agent_id: larry
session_id: weekly-monthly-review-infrastructure
timestamp: 2026-06-04T17:30:00-04:00
type: close-session
linked_sops: []
linked_workstreams:
  - WS-006-weekly-review
  - WS-007-monthly-review
linked_guidelines:
  - GL-001-file-naming-conventions
  - GL-002-frontmatter-conventions
---

# Weekly + Monthly Review Infrastructure Build

## Context

Alyssa flagged that things were getting lost in the mix — 51+ session logs in June alone with no aggregation layer above them. She asked Larry to design and build a recurring review system. This session went from concept → plan → full implementation of the review pyramid in one shot.

## What we did

- Larry explored the session log structure: 71 total logs (51 in June, 18 in May), each 2–10 KB, well-structured, consistent schema. Zero aggregation layer existed above them.
- Larry checked iCOR workstreams API — returned an error (`column wc_workstreams.company_id does not exist`); local scaffold used as source of truth instead.
- Larry designed the review pyramid (Daily/close-session → Weekly → Monthly) and got Alyssa's buy-in before building.
- Larry built all infrastructure files:
  - `Team Knowledge/Weekly Reviews/` — README, `_template.md`, `2026/` subfolder
  - `Team Knowledge/Monthly Reviews/` — README, `_template.md`, `2026/` subfolder
  - `Team Knowledge/Workstreams/WS-006-weekly-review.md` — full workstream with 5-step process
  - `Team Knowledge/Workstreams/WS-007-monthly-review.md` — full workstream, reads weekly wraps only
  - `.claude/commands/weekly-review.md` — `/weekly-review` slash command with `--week` and `--from/--to` override support
  - `.claude/commands/monthly-review.md` — `/monthly-review` slash command with `--month` override
- Larry updated `Team Knowledge/Workstreams/INDEX.md` with WS-006 and WS-007 entries.
- Larry added WS-006/WS-007 trigger section to `AGENTS.md` including the close-session nudge rule.
- Larry updated `.claude/commands/close-session.md` with the weekly review nudge check (step 6).
- Larry updated `Team Knowledge/INDEX.md` to document Weekly Reviews and Monthly Reviews sections.

## Decisions made

- **Question:** Weekly or twice-weekly cadence?
  **Decision:** Weekly. Token cost (~25–55K/run) is fine; twice-weekly doubles infrastructure for marginal benefit.
- **Question:** Auto-scheduled from day one or manual first?
  **Decision:** Manual first. Validate format 2–3 times, then promote to Sunday 8pm cron via `/schedule`.
- **Question:** What does the monthly tier read — raw session logs or weekly wraps?
  **Decision:** Weekly wraps only. The weekly tier already did the extraction work; monthly should be light synthesis, not re-extraction.
- **Question:** How should open threads be organized?
  **Decision:** Grouped by project/theme (Inbox & Capture, Second Brain, Automations, Hiring & Team, Copy & Brand, Other) — not flat. Areas adapt to what actually appeared that week.
- **Question:** How does close-session connect to the weekly review?
  **Decision:** Nudge only — no auto-run. Close-session checks if a weekly wrap exists for the current ISO week and if today is ≥5 days into the week (Thu–Sun). If both true, appends one line to sign-off prompting `/weekly-review`.

## Insights

- The review pyramid pattern (session → weekly → monthly) works cleanly because each tier reads the tier below it — monthly reads weekly wraps, never raw session logs. This prevents redundant extraction and keeps monthly intentionally light.
- Token cost for weekly review is ~25–55K input tokens depending on week density. Comfortably fits one context window even for heavy weeks like this one (51 logs in 4 days).

## Realignments

- Alyssa: "open threads grouped by projects or themes or whatever makes most sense" → Larry added themed grouping (not flat list) to the template, workstream, and slash command.
- Alyssa: "is there a way to make this easier like start the process each time larry does a wrap up close sesh?" → Larry added the nudge check to close-session (step 6), not auto-run.
- Alyssa confirmed: all three output purposes are valid (you read it / Larry loads it / open-threads triage).

## Open threads

- [ ] Backfill run: generate weekly wraps for all weeks since May 2026 scaffold launch (one dedicated session). Use `/weekly-review --from YYYY-MM-DD --to YYYY-MM-DD` week by week.
- [ ] After backfill: run `/monthly-review --month 2026-05` and `/monthly-review` for partial June 2026.
- [ ] After 2–3 validated weekly reviews → promote to Sunday 8pm cron via `/schedule`.
- [ ] After 2–3 validated monthly reviews → promote to last-day-of-month 8pm cron via `/schedule`.
- [ ] iCOR workstreams API returning `column wc_workstreams.company_id does not exist` — not blocking, flag for iCOR support if it recurs.

## Next steps

- Start the backfill session: run `/weekly-review --from 2026-05-05 --to 2026-05-11` (or whatever the first session-log week is) and work forward through all weeks to today.
- After backfill is complete, run both monthly reviews.
- Validate format with Alyssa, then schedule.

## Cross-links

- [[2026-06-04-16-37_larry_closing-shift-team-inbox-processing]]
- [[2026-06-04_larry_full-loop-audit-and-task-cleanup]]

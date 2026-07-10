# Weekly Reviews

Weekly wrap-up documents aggregating all session logs and deliverables from a given calendar week. Part of the review pyramid: close-session (per session) → weekly review (per week) → monthly review (per month).

## Purpose

1. **You read it** — a narrative you can skim on Sunday/Monday to know where the week landed.
2. **Larry loads it** — operational memory at week-start; replaces scanning 40+ individual session logs.
3. **Open-threads triage** — every unchecked `[ ]` from all session logs, grouped by area, in one place.

## How to generate

Run `/weekly-review` at any point during or after a week. Larry reads all session logs and deliverables for the target date range and writes the wrap doc here.

- Default: current calendar week (Mon–Sun)
- Override: `/weekly-review --week 2026-W23`
- Backfill: `/weekly-review --from 2026-06-01 --to 2026-06-07`

## Naming convention

`YYYY/YYYY-WNN-weekly-wrap.md`

Example: [[Studio/Team Knowledge/Weekly Reviews/2026/2026-W23-weekly-wrap]]

Week numbers follow ISO 8601 (Monday starts the week).

## Relationship to other tiers

- Feeds into **monthly reviews** (`Studio/Team Knowledge/Monthly Reviews/`). The monthly review reads weekly wraps, not raw session logs.
- Sourced from **session logs** (`Studio/Team Knowledge/session-logs/YYYY/MM/`).
- Workstream definition: [[WS-006-weekly-review]]

---
name: "source-command-weekly-review"
description: "Generate a weekly wrap-up document from all session logs and deliverables in the target date range. Runs WS-006."
---

# source-command-weekly-review

Use this skill when the user asks to run the migrated source command `weekly-review`.

## Command Template

# Weekly Review

Runs [[Team Knowledge/Workstreams/WS-006-weekly-review]]. The canonical procedure lives there — this file is the Codex slash-command entry point.

## Arguments

| Argument | Default | Description |
|---|---|---|
| *(none)* | Current ISO calendar week | Generates wrap for Mon–Sun of the current week |
| `--week YYYY-WNN` | — | A specific ISO week (e.g. `--week 2026-W22`) |
| `--from YYYY-MM-DD --to YYYY-MM-DD` | — | Arbitrary date range, used for backfill runs |

Examples:
- `/weekly-review` — current week
- `/weekly-review --week 2026-W22` — specific past week
- `/weekly-review --from 2026-05-05 --to 2026-05-11` — backfill range

## Steps

1. **Determine date range** from arguments or default to current ISO week (Monday 00:00 – Sunday 23:59).

2. **Collect session logs.** Glob `Team Knowledge/session-logs/YYYY/MM/` across all months that overlap the range. Collect all `.md` files whose filename date prefix falls within the range.

3. **Collect deliverables.** Glob `Deliverables/` for files dated within the range.

4. **Extract content** from each session log:
   - Decisions (`## Decisions made` sections)
   - Insights (`## Insights` sections)
   - Open threads — every unchecked `- [ ]` checkbox
   - Deliverables referenced in logs (wikilinks to `Deliverables/`)

5. **Group open threads by area.** Default areas: Inbox & Capture, Second Brain, Automations, Hiring & Team, Copy & Brand, Other. Adapt areas to the actual week's content. Remove empty sections.

6. **Determine ISO week number** for the target range. Use the Monday date to derive `YYYY-WNN` (e.g. June 2 2026 → 2026-W23).

7. **Check for existing wrap.** If `Team Knowledge/Weekly Reviews/YYYY/YYYY-WNN-weekly-wrap.md` already exists, confirm with Alyssa before overwriting.

8. **Write the weekly wrap** to `Team Knowledge/Weekly Reviews/YYYY/YYYY-WNN-weekly-wrap.md` following [[Team Knowledge/Weekly Reviews/_template.md]].
   - Set frontmatter: `week`, `date_range`, `session_count`, `open_threads` (count of unchecked items)
   - Fill all sections: week at a glance, what shipped, key decisions (table), insights not yet graduated, open threads by area, next week setup

9. **Confirm.** Report to Alyssa:
   - Path to the written wrap
   - Session count and open thread count
   - Any insights that appear ready to graduate (name them)
   - If any open thread has been unchecked for 2+ weeks, flag it specifically

## Notes

- This command is the manual path. After 2-3 validated runs, promote to a Sunday 8pm cron job via `/schedule`.
- For the full backfill (all prior weeks since scaffold launch), run this once per historical week using `--from`/`--to`.
- The close-session protocol will nudge you to run this when ≥5 days have passed since the last weekly wrap.

---
name: "source-command-monthly-review"
description: "Generate a monthly wrap-up document from all weekly wraps in the target month. Runs WS-007. Reads weekly wraps only — never raw session logs."
---

# source-command-monthly-review

Use this skill when the user asks to run the migrated source command `monthly-review`.

## Command Template

# Monthly Review

Runs [[Team Knowledge/Workstreams/WS-007-monthly-review]]. The canonical procedure lives there — this file is the Codex slash-command entry point.

## Arguments

| Argument | Default | Description |
|---|---|---|
| *(none)* | Current calendar month | Generates wrap for the current month |
| `--month YYYY-MM` | — | A specific past month (e.g. `--month 2026-05`) |

Examples:
- `/monthly-review` — current month
- `/monthly-review --month 2026-05` — backfill for May 2026

## Steps

1. **Determine target month** from arguments or default to current calendar month.

2. **Collect weekly wraps.** Glob `Team Knowledge/Weekly Reviews/YYYY/` for files whose `week:` frontmatter falls within the target month. A week straddling two months belongs to the month holding the majority of its days.

3. **Check for missing weeks.** If a week within the target month has session logs but no weekly wrap, name the gap and offer to run `/weekly-review` for that week before proceeding. Do not skip gaps silently.

4. **Extract from weekly wraps:**
   - `## Week at a glance` narratives
   - `## What shipped` items
   - `## Key decisions` tables
   - `## Insights not yet graduated` items
   - Remaining unchecked `- [ ]` open threads (carry-forwards)

5. **Identify patterns.** Look for themes that appear in 2+ weeks, insights that recur, and open threads open for 2+ consecutive weeks.

6. **Identify graduation candidates.** Insights appearing in ≥2 weekly wraps, or confirmed as standard behavior in a session, are candidates. List them. Mark as "graduated" only if Alyssa confirmed the graduation — otherwise "pending graduation."

7. **Check for existing wrap.** If `Team Knowledge/Monthly Reviews/YYYY/YYYY-MM-monthly-wrap.md` already exists, confirm with Alyssa before overwriting.

8. **Write the monthly wrap** to `Team Knowledge/Monthly Reviews/YYYY/YYYY-MM-monthly-wrap.md` following [[Team Knowledge/Monthly Reviews/_template.md]].
   - Set frontmatter: `month`, `weeks_covered`, `weekly_wrap_count`
   - Fill all sections: month at a glance, big wins, patterns across weeks, insights graduated, open threads carrying forward, goals for next month

9. **Confirm.** Report to Alyssa:
   - Path to the written wrap
   - Weekly wrap count, carry-forward thread count
   - Graduation candidates (confirmed vs. pending)

## Notes

- **Monthly review reads weekly wraps only.** Do not re-read raw session logs — the weekly tier already did that work.
- This command is the manual path. After 2-3 validated runs, promote to a last-day-of-month 8pm cron job via `/schedule`.
- For the backfill, run `/monthly-review --month 2026-05` after all May weekly wraps exist.

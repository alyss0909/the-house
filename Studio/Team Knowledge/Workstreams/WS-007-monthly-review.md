# WS-007 - Monthly Review

- **Status:** Active
- **Type:** Workstream - Larry-led synthesis
- **Owners:** Larry (orchestration + synthesis + writing)
- **References:** [[WS-006-weekly-review]], [[GL-001-file-naming-conventions]], [[GL-002-frontmatter-conventions]]
- **Triggered by:** `/monthly-review` command / "do the monthly review" / "monthly wrap" / "monthly wrap-up"

## Relationship to other workstreams

- **WS-006** (weekly review) produces the weekly wraps this workstream reads. Monthly review NEVER reads raw session logs — that work was already done at the weekly tier.
- **Close-session** is two tiers below. Monthly review is intentionally light because those tiers already extracted the signal.

## Step 0 - Determine month

Default: the current calendar month.

Override: `--month YYYY-MM`

Output destination: `Studio/Team Knowledge/Monthly Reviews/YYYY/YYYY-MM-monthly-wrap.md`

If the destination file already exists, ask Alyssa whether to overwrite or append.

## Step 1 - Collect weekly wraps

Glob all `.md` files in `Studio/Team Knowledge/Weekly Reviews/YYYY/` whose `week:` frontmatter falls within the target month. A week that straddles two months (e.g. W22 = May 25 – May 31) is included in the month that holds the majority of its days.

Note the count of weekly wraps found — this goes into `weekly_wrap_count`.

If a weekly wrap is missing for a week that has session logs, note the gap and offer to run WS-006 for that week before proceeding.

## Step 2 - Extract from weekly wraps

From each weekly wrap, extract:

1. **Narratives** — `## Week at a glance` sections
2. **Shipped items** — `## What shipped` sections
3. **Decisions** — `## Key decisions` tables
4. **Insights not yet graduated** — `## Insights not yet graduated` sections
5. **Open threads** — remaining unchecked `- [ ]` items (carry-forward candidates)

**Before carrying any thread forward, verify vault state.** Do not trust the weekly wrap narrative alone — it was written from session logs, not from the vault. For each open thread:
- Glob/grep for the relevant file or frontmatter signal
- If resolved: update the source weekly wrap's checkbox to `[x]` with a brief resolution note, then exclude from the monthly carry-forward
- If still open: include in the monthly carry-forward and note the origin week (e.g. `(from W22)`)
- If open for 3+ weeks: flag explicitly in Step 3 for Alyssa's attention — these are either stuck or obsolete

This mirrors the carry-forward verification in WS-006. The monthly tier catches anything WS-006 missed.

## Step 3 - Identify patterns

Across the weekly narratives and decision tables, look for:
- Themes that appeared in 2+ weeks (recurring topic areas, persistent blockers)
- Insights that appear in multiple weeks (elevation candidates for graduation)
- Open threads that have been open for 2+ weeks (flag for Alyssa's attention)

## Step 4 - Graduation candidates

Any insight that appears in ≥2 weekly wraps, or that has clearly become standard operating behavior, is a graduation candidate. List these explicitly in `## Insights graduated this month` — but only mark as graduated if Alyssa confirmed the graduation in a session or weekly wrap. Otherwise list as "pending graduation."

## Step 5 - Write the monthly wrap

Write to `Studio/Team Knowledge/Monthly Reviews/YYYY/YYYY-MM-monthly-wrap.md` following the template at [[Studio/Team Knowledge/Monthly Reviews/_template.md]].

Set frontmatter: `month`, `weeks_covered` (list of WNN slugs), `weekly_wrap_count`.

Fill all sections:
- `month at a glance` — 2-3 sentences, higher altitude than weekly; what was the defining arc?
- `big wins` — deliverables and milestones worth remembering
- `patterns across weeks` — recurring themes, momentum, friction
- `insights graduated this month` — confirmed graduations with source links
- `open threads carrying forward` — items that cross into next month's work
- `goals / setup for next month` — 2-3 priorities

## Step 6 - Confirm

Report to Alyssa:
- Path of the written monthly wrap doc
- Weekly wrap count, carry-forward open thread count
- Graduation candidates (pending vs. confirmed)

## Scheduling (future state)

After 2-3 validated manual runs, promote to a last-day-of-month 8pm cron job. Larry writes the wrap silently and sends a notification: "Monthly wrap for YYYY-MM is ready at [[path]]."

## What not to do

- Do not read raw session logs. That is WS-006's job. Monthly reads weekly wraps only.
- Do not graduate insights without Alyssa's confirmation — propose, don't unilaterally file.
- Do not overwrite an existing monthly wrap without confirming with Alyssa.

## Source-trust metabolism overlay

WS-007 prioritizes each weekly wrap's `## Grand metabolism` section. That section is the source-trust summary: what the week taught the system, what was superseded, what changed in maps/tasks/Hermes/Ready Queue, and what should carry forward. Do not reopen raw session chaos unless a weekly wrap is missing or the source-trust trail is broken.

When extracting from weekly wraps, include:

- `Grand metabolism` sections.
- Repeated trust breaks or bloat patterns where the system created new outputs instead of improving source access, tasks, Hermes learning, or Ready Queue movement.
- Superseded outputs that should be archived, deleted, or demoted instead of carried forward.

The monthly wrap should include `source-trust metabolism`: what the month clarified, what was superseded, what got lighter, and what must start next month.

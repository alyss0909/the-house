---
agent_id: mack
session_id: home-actions-watcher-build
timestamp: 2026-07-11T12:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: ["WS-006-weekly-review"]
linked_guidelines: []
mined: true
---

# Home Actions Watcher built -- weekly-review only, real OS cron

## Context

Alyssa gave explicit, parameter-level approval for an always-on watcher that
polls [[HOME.md]]'s `## Actions state` ledger every 5 minutes and runs the
real work behind whichever card she clicked -- but scoped tightly to
`weekly-review` only for now, per the standing rule at
`feedback_no_claude_scheduled_tasks.md` (OS cron, not Claude scheduled tasks).

## What we did

- Built a new standalone project at `C:\Users\accol\home-actions-watcher`
  (outside OneDrive, same reasoning as `C:\Users\accol\instagram-saves-engine`
  -- logs/venv shouldn't cloud-sync).
- `watcher.py` reads HOME.md's ledger (only the plain-markdown `## Actions
  state` / `## Actions reacts` sections -- never the dataviewjs fences above
  them), and for `weekly-review`:
  - Computes the current ISO week (Monday-Sunday).
  - Globs `Studio/Team Knowledge/session-logs/YYYY/MM/` for real logs dated
    in that range.
  - Mechanically regex-extracts `## Decisions made`, `## Insights`, and
    `## Open threads` bullets straight from those real files -- no
    fabrication.
  - Calls the Anthropic API for exactly the two judgment calls that need it:
    the 1-2 sentence "week at a glance" narrative, and sorting open threads
    into WS-006's default areas. Everything fed to the model is real,
    verbatim text pulled from real logs.
  - Writes the real wrap file to `Studio/Team Knowledge/Weekly
    Reviews/YYYY/YYYY-WNN-weekly-wrap.md`, following the same frontmatter +
    section shape as `_template.md` and the manual `/weekly-review` skill
    (`.claude/commands/weekly-review.md`).
  - Flips the ledger line to `handled` and appends a line under HOME.md's
    `## Actions reacts`, matching `/actions`' own logging convention.
  - Writes `health.json` every run (ok/error), same shape as the Saves
    Engine's pattern.
- `monthly-review`, `trend-scout`: skipped, left `queued`, logged to
  `watcher.log` as "seen but not handled (out of scope)" -- no real logic
  built for these yet, per explicit instruction.
- `mailroom-sweep`: skipped, left `queued`, logged as needing a separate
  Gmail OAuth app Alyssa would set up herself -- not built.
- Any unrecognized slug: skipped, left `queued`, logged.
- `register-task.ps1` / `unregister-task.ps1` register/remove a
  `HomeActionsWatcher` Windows Task Scheduler job on a 5-minute repeating
  trigger (`-Once -At (Get-Date) -RepetitionInterval 5min -RepetitionDuration
  MaxValue`), mirroring the Saves Engine's install pattern.
- `config.example.json` holds an Anthropic-API-key placeholder + vault_root
  + model; README tells Alyssa exactly where to get a real key
  (console.anthropic.com) and how to paste it in. No secret was
  entered/generated/fetched by me.
- Verified the ledger parsing, flip, and reacts-append logic, plus the
  mechanical decisions/insights/open-thread extraction and wrap rendering,
  against a scratch fixture built from the real session-log template shape
  (`_template.md`'s two-part `**Question:**/**Decision:**` bullet format) --
  found and fixed a real bug where multi-line decision bullets were getting
  truncated to just the question half, and where an unheaded paragraph of
  checkboxes could bleed into the Insights section (not an issue against the
  real template, which always has a dedicated `## Open threads` heading, but
  fixed the bullet-folding regardless for robustness).

## Decisions made

- **Question:** Should failures notify Alyssa through a new channel (chat
  push, email, a second scheduled task reading health.json)?
  **Decision:** No -- reuse the existing HOME.md "Actions reacts" surface she
  already reads on the dashboard. A FAILED line there, plus health.json for
  future tooling, is enough for this scope. Building a second notifier task
  would be scope creep and would risk repeating the exact Claude-scheduled-
  task fragility this build exists to avoid.
- **Question:** If a weekly wrap already exists for the target week, should
  the watcher overwrite it silently (matching "no draft/approval step")?
  **Decision:** No -- treat an existing wrap as already-done: leave the file
  alone, but still flip the ledger to `handled` so the ledger doesn't loop.
  This preserves the manual skill's "confirm before overwrite" spirit without
  needing an interactive confirmation an unattended script can't give.

## Insights

- Mechanical regex extraction (decisions/insights/open-threads verbatim from
  real files) plus a narrowly scoped API call for the two genuinely
  judgment-shaped pieces (narrative synthesis, area classification) is a
  reusable pattern for "AI reasoning inside an OS-cron script" that keeps
  fabrication risk near zero -- worth reusing for `monthly-review` and
  `trend-scout` if/when those get their own approval round.

## Open threads

- [ ] Alyssa needs to paste her real Anthropic API key into
      `C:\Users\accol\home-actions-watcher\config.json` (copy from
      `config.example.json` first).
- [ ] Alyssa needs to run `register-task.ps1` as Administrator once to
      install the 5-minute Task Scheduler job.
- [ ] `monthly-review`, `trend-scout`, and the mailroom Gmail OAuth app all
      remain explicitly out of scope, pending separate approval rounds.

## Next steps

- Once Alyssa confirms the key is pasted and the task is registered, click
  "Run the weekly review" on HOME.md and watch the ledger flip within 5
  minutes as a live confirmation.

## Cross-links

- [[project_instagram_saves_engine]] -- the reference architecture this
  build copied (config.json/health.json/register-task.ps1 shape).
- [[feedback_no_claude_scheduled_tasks]] -- the standing rule this build
  satisfies.
- [[Studio/Team Knowledge/Workstreams/WS-006-weekly-review]] -- the
  procedure this watcher's weekly-review path replicates.

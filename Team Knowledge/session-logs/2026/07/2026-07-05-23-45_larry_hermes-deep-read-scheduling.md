---
agent_id: larry
session_id: hermes-deep-read-scheduling
timestamp: 2026-07-05T23:45:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# Scheduled Hermes deep-read voice-study tasks

## Context

Alyssa asked Larry to schedule autonomous deep-analysis runs of Second Brain
documents (examples + programs) at 4am, 5am, and 6:45am on 2026-07-05,
2026-07-06, and 2026-07-07, with the goal of synthesizing findings into the
Hermes clone brain (`Hermes/`) to make Hermes measurably more like Alyssa's
actual writing/teaching voice. No specialist subagents were dispatched this
session — Larry handled tool-search, path confirmation, and scheduling
directly.

## What we did

- Larry confirmed the two source trees: `PKM/Second Brain/examples/` +
  `PKM/Second Brain/programs/` (source documents) and `Hermes/` (the clone
  brain: SOUL.md, STYLE.md, TASTE.md, ANTI-AI.md, craft/*.md, learning/).
- Larry drafted a repeatable deep-read prompt: pick one un-studied document
  per run, load Hermes's current brain files first to find gaps, analyze
  sentence structure/punctuation/diction/POV/tone/teaching moves/DO-DON'T
  rules with quoted evidence, then write a full study to
  `Hermes/learning/deep-reads/` and fold only genuinely new insights into
  STYLE.md / ANTI-AI.md / the matching craft file — contradictions go to
  `Hermes/learning/inbox.md` for Alyssa to adjudicate, never auto-overwritten.
- Larry created `hermes-deep-voice-study` (cron `0 4,5 5-7 7 *` — 4am and 5am,
  Jul 5–7) and `hermes-deep-voice-study-645` (cron `45 6 5-7 7 *` — 6:45am,
  Jul 5–7) as two coordinated scheduled tasks sharing the same INDEX-tracked
  document pool, since one cron expression can't mix different minutes across
  different hours.
- Iterated on timing twice per Alyssa's follow-up corrections (see
  Realignments).

## Decisions made

- **Question:** Single scheduled task or split across cron limitations?
  **Decision:** Split into two tasks (`hermes-deep-voice-study` for 4/5am,
  `hermes-deep-voice-study-645` for 6:45am) rather than accepting an
  approximate schedule, since cron can't express {4:00, 5:00, 6:45} in one
  expression.
- **Question:** Should contradictions between new document evidence and
  existing Hermes brain rules be auto-corrected?
  **Decision:** No — contradictions get logged to `Hermes/learning/inbox.md`
  for Alyssa to adjudicate; the scheduled task never overwrites an existing
  brain rule on its own authority.

## Insights

- Scheduled-task cron expressions apply one minute-value across all listed
  hours — irregular per-hour minutes require separate tasks, not a single
  compound expression.
- Tool approvals granted during a scheduled task's first run are stored on
  that task and auto-apply to future runs, so a single supervised "Run now"
  per task clears future permission prompts for unattended firings.

## Realignments

- Alyssa: "edit next scheduled run for 645 instead" — Larry's first read
  collapsed the schedule to one run/day (6:45am only, dropping 4/5am). This
  was a misread of scope; the correction below fixed it.
- Alyssa: "just change all to 4, 5, 645a" — clarified she wanted all three
  daily slots kept (4:00, 5:00, 6:45), not a replacement. Larry restored 4/5am
  on the original task and added a second task for 6:45am to preserve all
  three runs/day.

## Open threads

- [ ] Alyssa may want to click "Run now" on one or both tasks to pre-approve
      file-write permissions before the first unattended 4am firing.
- [ ] After 2026-07-07, both scheduled tasks should be disabled or deleted —
      the cron window is scoped to Jul 5–7 but would technically re-arm next
      July if left enabled.
- [ ] Watch `Hermes/learning/inbox.md` for any contradiction flags the deep-read
      runs surface between document evidence and existing brain rules.

## Next steps

- Let the 9 scheduled runs (3/day × 3 days) execute and produce deep-read
  files under `Hermes/learning/deep-reads/`.
- Review the accumulated `Hermes/STYLE.md` / `ANTI-AI.md` / craft-file
  additions after Jul 7 and decide what graduates to permanent brain rules.

## Cross-links

- `[[2026-07-05-23-30_larry_hermes-rebuild-and-content-os-genesis]]` — prior
  session that rebuilt the Hermes v2 brain this deep-read pipeline now feeds.

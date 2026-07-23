---
# Identity
id: tsk-2026-07-22-003
title: "IG Saves health check: detect a stale health.json, not just a bad status field"

# Ownership & priority
assignee: mack
priority: 1

# Status (mirrors folder location)
status: done
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-22T00:00:00Z
updated: 2026-07-22T13:45:00Z
due: null

# Provenance
created_by: larry
source: tsk-2026-07-22-002-ig-burner-session-stale-collections-list
parent: null

# Cross-references
linked_sops: [SOP-004-create-task]
linked_workstreams: []
linked_guidelines: [GL-014-the-compounding-architecture]
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [instagram-saves-engine, bug, monitoring]
---

# IG Saves health check: detect a stale health.json, not just a bad status field

## What this is

Root-cause follow-up from [[tsk-2026-07-22-002-ig-burner-session-stale-collections-list]].
`sync.py` crashed on 2026-07-19 (uncaught `JSONDecodeError` from the burner
session going stale for `/api/v1/collections/list/`) before it reached the
`write_health()` call for that run. `health.json` was therefore frozen on
its last good 2026-07-19 11:00 UTC entry (`status: "ok"`) for three days
straight, across at least five silently-failed scheduled runs.

The weekly `instagram-saves-health-check` Claude Code scheduled task only
reads `health.json`'s `status` field and stays silent if it says `"ok"`. It
has no way to tell "the process is fine" apart from "the process died before
it could tell me anything" — both look identical: an `"ok"` file sitting
there. So the health check did exactly what it was built to do, and Alyssa
still went three days without knowing sync had stopped.

Mack's fix in tsk-2026-07-22-002 makes *this specific* failure (the
collections-list crash) report accurately going forward — but any *other*
future crash before the health-write step would recreate the identical
silent-staleness hole. That structural gap is what this task closes.

## The fix

Add a staleness check, either in `sync.py`'s own health-writing logic or
(better, since it needs to catch "the process never got that far at all")
in whatever reads `health.json` for the weekly check:

- Compare `health.json`'s `last_run_utc` against wall-clock time.
- Sync runs twice daily (7 AM / 7 PM). If `last_run_utc` is older than
  roughly 18-20 hours (allow slack for one missed run before alarming,
  but not two), treat that as broken regardless of what `status` says —
  message Alyssa the same way a `status: "error"` entry would.
- Keep the existing "silent if genuinely healthy" behavior for the normal
  case; this only adds a second failure mode to check for, not a new
  notification channel.

## Success criteria
- A `health.json` that stops updating (for any reason, not just the
  collections-list bug) gets flagged within one health-check cycle instead
  of reading as healthy indefinitely.
- No new false positives on a single missed run (allow for e.g. one sync
  window slipping without alarming).

## Updates
- 2026-07-22 (larry) — filed after Alyssa asked why the weekly health check
  didn't catch the 3-day silent outage; confirmed the root cause is the
  health check trusting a frozen status field with no staleness check of
  its own. Alyssa approved dispatching Mack on this now.
- 2026-07-22 (mack) — implemented on the reader side, per the brief's lean:
  `C:\Users\accol\.claude\scheduled-tasks\instagram-saves-health-check\SKILL.md`
  now runs a staleness check (step 2) BEFORE the existing status check
  (step 3), independent of what `status` claims. The check shells out to a
  deterministic one-liner (`python -c "..."` comparing `last_run_utc` to
  `datetime.now(timezone.utc)`) rather than asking the agent to eyeball
  elapsed time — this is read by an LLM-executed scheduled task, and a
  wall-clock comparison is exactly the kind of thing that shouldn't be left
  to mental math. Threshold: >20h elapsed = broken regardless of `status`
  (sync cadence is 12h, so this gives ~8h slack for one run landing late
  without a false alarm, while still catching two-in-a-row misses or a
  crash within one weekly check cycle). Also added a "file exists but isn't
  valid JSON" branch (same treatment as missing) since a bad crash could
  corrupt the file, not just freeze it. Also fixed an unrelated but
  adjacent doc bug found in the same file: it said sync runs "9am/9pm,"
  the real Task Scheduler trigger (per `register-task.ps1`) is 7am/7pm.
  **Verified empirically, not by eyeballing the prose:** built a test
  harness that fakes `health.json` at five elapsed times/statuses (2h,
  19.9h, 20.1h, 72h -- the real 2026-07-19 scenario -- and 1h-with-error-
  status) and ran the exact command string from the SKILL.md against each.
  All 5 passed: fresh files don't flag, the 20h boundary behaves correctly
  on both sides, and critically, the real 72h-stale case that actually
  happened this week (5 silently-failed runs, frozen "ok" status) would
  now correctly trigger the staleness branch instead of reading as healthy.
  Also confirmed the literal command string runs correctly via plain
  `python` on PATH (not just the project's venv python), since that's what
  the scheduled-task agent will actually invoke.

## Outcome
Fixed on the reader side: `instagram-saves-health-check`'s SKILL.md now
computes `health.json` staleness independent of the `status` field, using
a deterministic shell-out rather than prose-only time math. Confirmed via
a 5-case test harness (including a replay of the real 72h 2026-07-19
outage) that the exact command in the file correctly distinguishes stale
from fresh at the intended 20h boundary. This closes the structural gap:
any future crash before `write_health()` runs will now self-report within
one weekly check cycle instead of reading as healthy indefinitely.
Files touched: `C:\Users\accol\.claude\scheduled-tasks\instagram-saves-health-check\SKILL.md`.

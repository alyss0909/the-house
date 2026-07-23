---
agent_id: mack
session_id: ig-saves-image-durability-2026-07-22
timestamp: 2026-07-22T15:30:00Z
type: end-of-session
linked_sops: [SOP-004-create-task, SOP-006-close-task]
linked_workstreams: []
linked_guidelines: [GL-014-the-compounding-architecture]
mined: true
---

# IG Saves: closed the whole arc — staleness check, real root cause, live backfill

Continuation of [[2026-07-22-09-15_mack_ig-saves-image-durability-fix]] in the
same session. That entry covers the binary-upload durability fix and the
crash-safety patch. This entry covers the rest of the arc, closed same day.

## tsk-2026-07-22-003 — health-check staleness (done)

Added a staleness check to `C:\Users\accol\.claude\scheduled-tasks\instagram-saves-health-check\SKILL.md`,
on the reader side per the brief (a crashed writer can't self-report, so the
reader has to catch it). It shells out to a deterministic `python -c` one-
liner comparing `last_run_utc` to wall-clock time rather than asking the
LLM-executed skill to eyeball elapsed time — checked before the existing
`status` check, flags anything over 20h old regardless of what `status`
claims. Verified with a 5-case test harness (fresh, both sides of the 20h
boundary, and a replay of the real 72h 2026-07-19 outage) — all 5 passed,
and confirmed the exact command string runs via plain `python` on PATH.
Also fixed an adjacent doc bug in the same file (said sync runs "9am/9pm,"
actually 7am/7pm per `register-task.ps1`).

## tsk-2026-07-22-002 — the cookie-refresh red herring

Alyssa refreshed the burner's `ig_session_id`. I verified the change landed
in `config.json` (values not echoed) and re-ran `sync.py` expecting it to
now work. **It didn't.** `collections/list` still served an HTML shell
instead of JSON with the fresh cookie. That was the tell that "stale
cookies" was never the real diagnosis — `validate_session()` had been
returning genuinely correct account data (`username: ameliegreen09`) the
whole time; only one specific downstream endpoint was failing.

Diagnosed it properly instead of asking Alyssa to refresh cookies again:
compared the outgoing request against what a real browser XHR sends, and
tested three candidate headers/cookies in isolation directly against the
live endpoint:
- A server-issued `mid` cookie picked up from a probe request — no effect.
- A full homepage load before the API call (session warm-up) — no effect.
- `X-ASBD-ID` + `X-IG-WWW-Claim` + `Sec-Fetch-*` together — fixed it.

Bisected that combination down to the single load-bearing header:
`Sec-Fetch-Site: same-origin`. Added it to `build_session()` in `sync.py`
with a comment recording what was tested and ruled out, so the next time
this drifts nobody has to re-derive it. Confirmed live: `list_collections()`
now returns `{'All posts': ..., 'Recreate ': ..., 'AI': ...}` instead of an
empty dict.

## tsk-2026-07-22-001 — closed with real numbers, not the code path existing

With the pipeline actually reachable, ran the real thing:
- `python sync.py`: `5 new | 214 skipped | 219 total | 0 errors`. Verified
  all 5 new pages carry a Notion-hosted Image URL.
- `python backfill_images.py` against the full backlog: `197 fixed | 22
  already ok | 0 no page | 0 no image | 0 unrecoverable | 0 errors | 219
  seen`. Zero unrecoverable — IG's collection feed re-signs image URLs
  fresh at fetch time regardless of the original save's age, as long as
  the post is still in the collection, so nothing was actually lost.
- Whole-database recheck (not a sample): queried all 219 pages, checked
  every Image URL file property's host. 219/219 on
  `prod-files-secure.s3.us-west-2.amazonaws.com`, 0 on `fbcdn.net`.
- 148 pages currently at Status=New, all durable, ready for
  `instagram-saves-ideation` to actually process instead of aborting.

All three tasks in this arc (001, 002, 003) are now in `tasks/done/`.

## Insight for next time

Two failure modes on the same account can present identically (a
lightweight session-check endpoint passing, a heavier private-API endpoint
silently serving HTML instead of JSON) but have completely different
fixes — one is cookie rot, the other is a missing browser-standard header
IG started gating on. Don't assume the first diagnosis that fits is the
right one; re-test after the "obvious" fix (cookie refresh) before
concluding it worked, and isolate candidate header/cookie fixes one at a
time against the live endpoint rather than shotgunning a bundle and
declaring victory.

## Files touched
- `C:\Users\accol\instagram-saves-engine\sync.py` (`build_session` —
  `Sec-Fetch-Site` header)
- `C:\Users\accol\.claude\scheduled-tasks\instagram-saves-health-check\SKILL.md`
- [[tsk-2026-07-22-001-fix-ig-saves-image-durability]] (done)
- [[tsk-2026-07-22-002-ig-burner-session-stale-collections-list]] (done)
- [[tsk-2026-07-22-003-ig-saves-health-check-staleness]] (done)
- `C:\Users\accol\.claude\projects\C--Users-accol-OneDrive-Desktop-the-house\memory\project_instagram_saves_engine.md` (updated to reflect fully-resolved state)

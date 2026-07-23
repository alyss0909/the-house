---
# Identity
id: tsk-2026-07-22-002
title: "Instagram Saves Engine: burner session stale for collections/list, blocks new syncs and backfill"

# Ownership & priority
assignee: mack
priority: 1

# Status (mirrors folder location)
status: done
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-22T13:07:45Z
updated: 2026-07-22T15:20:00Z
due: null

# Provenance
created_by: mack
source: tsk-2026-07-22-001-fix-ig-saves-image-durability
parent: tsk-2026-07-22-001-fix-ig-saves-image-durability
linked_sops: []
linked_workstreams: []
linked_guidelines: []
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [instagram-saves-engine, bug, blocked-on-alyssa]
---

# Instagram Saves Engine: burner session stale for collections/list

## What this is

Discovered 2026-07-22 while verifying the image-durability fix in
[[tsk-2026-07-22-001-fix-ig-saves-image-durability]]. Separate from that
bug entirely.

`sync.py`'s `validate_session()` check (a lightweight call to
`/api/v1/accounts/edit/web_form_data/`) reports the burner session as valid
-- and it genuinely is for that endpoint, it returns real account data for
`ameliegreen09`. But the very next call every run makes,
`ENDPOINT_COLLECTIONS_LIST` (`/api/v1/collections/list/`), now returns HTTP
200 with an HTML login-wall page instead of JSON. Confirmed directly today
by hitting that endpoint with the exact session/headers `build_session()`
builds.

Before today's fix, `list_collections()` called `r.json()` on that response
with no exception handling, which raised an uncaught `JSONDecodeError` and
killed the whole `sync.py` process immediately after logging "Instagram
session OK." That silent-crash signature is visible in `sync.log` on every
scheduled run since 2026-07-19 19:00 (five consecutive runs, each stopping
right after the session-OK line with no "Sync complete" line after it).
`health.json` never updated past its 2026-07-19 11:00 UTC entry because the
crash happens before any `write_health()` call downstream of that point --
so the dashboard/health file has been silently lying about the true state
for three days.

**Practical impact:** no new Instagram saves have synced into Notion since
2026-07-19. This is a second, independent reason (on top of the image-token
expiry bug) that the "New" backlog isn't moving. It also blocks
`backfill_images.py`, which needs the same `list_collections()` call to
resolve the "Recreate" collection name to an id before it can re-fetch any
media -- so the backlog backfill work in tsk-2026-07-22-001 cannot run
until this is fixed.

## What I already fixed (2026-07-22, mack)

Wrapped the unprotected `r.json()` calls in both `list_collections()` and
`iter_collection_media()` in `sync.py` with a `try/except ValueError` that
logs a clear diagnostic (login-wall body, refresh cookies) and returns
gracefully instead of crashing the whole process. Verified: `sync.py` and
`backfill_images.py` now both run to completion and log an honest,
accurate error/warning instead of dying silently. This does NOT fix the
underlying session staleness -- it only makes the failure visible and
non-fatal.

## What's still needed

The burner's `sessionid` / `csrftoken` / `ds_user_id` cookies in
`config.json` need to be refreshed from a live, logged-in browser session
on the `ameliegreen09` account. This is the same remediation path already
documented in the script's own error messages and README -- nothing new,
just needs doing. Once refreshed:

1. Re-run `python sync.py` manually once and confirm `list_collections()`
   returns real collection names (not an empty dict) and the log shows a
   normal "Sync complete: N new | ..." line.
2. Re-run `backfill_images.py` to work through the ~100+ backlog per
   [[tsk-2026-07-22-001-fix-ig-saves-image-durability]] step 4 (now uses
   the binary-upload path, with dead-token rows counted as
   `unrecoverable` rather than retried forever).

## Context one click away
- Parent bug: [[tsk-2026-07-22-001-fix-ig-saves-image-durability]]
- Code: `C:\Users\accol\instagram-saves-engine\sync.py`
  (`list_collections`, `iter_collection_media`, `validate_session`)

## Success criteria
- `sync.py` run manually returns real collection data, not an empty dict.
- A live scheduled run produces a normal "Sync complete: N new | ..." log
  line and an accurate `health.json`.
- `backfill_images.py` can resolve the "Recreate" collection and proceed
  with the backlog repair from tsk-2026-07-22-001.

## Updates
- 2026-07-22 13:07 (mack) — created after discovering the crash while
  verifying the image-durability fix; applied the crash-safety fix
  (graceful degrade + clear logging) same session, filed the cookie-refresh
  remainder here since it needs Alyssa's action.
- 2026-07-22 15:20 (mack) — Alyssa refreshed the burner's `ig_session_id`
  in `config.json` (Larry confirmed `csrftoken`/`ds_user_id` were unchanged
  -- verified against the file directly, values not echoed). Re-ran
  `sync.py`: **the cookie refresh alone did NOT fix it** -- `collections/list`
  still returned an HTML shell instead of JSON with the new session id.
  This disproved the original "stale cookies" theory: `validate_session()`
  continued to return real, correct account data (`username: ameliegreen09`)
  even while `collections/list` failed, meaning the session itself was
  never actually invalid.
  Diagnosed properly instead of re-guessing: compared the exact outgoing
  request headers/cookies against what a real browser XHR sends, tested
  three candidate fixes in isolation against the live endpoint (a
  server-issued `mid` cookie -- no effect; a full homepage warm-up before
  the API call -- no effect; extra bot-detection-adjacent headers --
  effect), then bisected the working combination down to the single
  load-bearing header: **`Sec-Fetch-Site: same-origin`**. IG's private API
  now appears to gate on this header being present (real browsers always
  send it on same-origin fetch/XHR calls; this script's `requests`-based
  session never did). `X-ASBD-ID` and `X-IG-WWW-Claim` were tested and
  ruled out as unnecessary.
  **Fix:** added `"Sec-Fetch-Site": "same-origin"` to `build_session()`'s
  headers in `C:\Users\accol\instagram-saves-engine\sync.py`, with an
  inline comment recording what was tested and ruled out so the next drift
  doesn't require re-deriving this from scratch.
  **Verified live, for real, not against a test page:** ran `sync.py`
  end-to-end against the live burner account and Notion database. Result:
  `Visible collections: All posts, Recreate , AI` (real data, not empty),
  then `Sync complete: 5 new | 214 skipped | 219 total | 0 errors`. All 5
  newly-synced pages carry a durable Notion-hosted Image URL (host
  `prod-files-secure.s3.us-west-2.amazonaws.com`, confirmed by reading the
  pages back), proving both this fix and the tsk-2026-07-22-001 binary-
  upload fix work together end to end on real Instagram data, not just the
  disposable test page from earlier today.

## Outcome
Root cause was never cookie staleness -- the burner session was valid the
entire time. IG's `collections/list` endpoint started requiring the
`Sec-Fetch-Site: same-origin` header (a real-browser XHR header this
`requests`-based script never sent) and silently served the SPA HTML shell
instead of JSON when it was missing, with no error status to signal
anything was wrong. Fixed by adding that one header to `build_session()`.
Verified with a real, live, end-to-end sync: real collections resolved,
5 new saves written, 0 errors, all 5 images landed as durable Notion-hosted
files. This also unblocked the tsk-2026-07-22-001 backlog backfill, run in
the same session: 197 fixed, 22 already durable, 0 unrecoverable, 0 errors
across all 219 existing pages.
Files touched: `C:\Users\accol\instagram-saves-engine\sync.py` (`build_session`).

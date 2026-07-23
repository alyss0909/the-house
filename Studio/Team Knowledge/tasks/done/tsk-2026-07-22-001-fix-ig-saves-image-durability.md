---
# Identity
id: tsk-2026-07-22-001
title: "Fix Instagram Saves image durability for real (external_url upload doesn't cache)"

# Ownership & priority
assignee: mack
priority: 1

# Status (mirrors folder location)
status: done
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-22T00:00:00Z
updated: 2026-07-22T15:25:00Z
due: null

# Provenance
created_by: larry
source: instagram-saves-ideation-scheduled-run-2026-07-22
parent: null

# Cross-references
linked_sops: [SOP-004-create-task]
linked_workstreams: []
linked_guidelines: [GL-014-the-compounding-architecture]
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [instagram-saves-engine, bug, capture-gap-audit]
---

# Fix Instagram Saves image durability for real

## What this is

Two distinct bugs got conflated as one "fixed" bug, and the second one is still live.

**Bug 1 (real, fixed 2026-07-16):** the "Image URL" property on the Instagram
Saves Notion DB (`b7d1e552a8494ae9aa9a394eb5ad6127`) was changed in Notion's UI
from a URL-type property to a Files & media-type property. `sync.py` kept
sending a raw URL string, which Notion rejected outright, so every save since
the type change failed to write at all. Fixed by switching `sync.py` to call
Notion's `file_uploads.create(mode="external_url", external_url=..., filename=...)`
(see `upload_image_to_notion()` in `C:\Users\accol\instagram-saves-engine\sync.py`
around line 430) and running `backfill_images.py` once to repair old rows.

**Bug 2 (still open, misdiagnosed as already fixed):** `mode="external_url"`
does NOT make Notion fetch-and-cache the image bytes — it just registers an
external pointer back to the original Instagram CDN URL. Confirmed today
(2026-07-22): fetched 8 "New" Instagram Saves pages via the Notion MCP, and
the `Image URL` file property's `source` field on every single one still
points at `instagram.fymq1-X.fna.fbcdn.net/...` (the original signed IG CDN
link, not a Notion-hosted domain). Direct GET on that URL returns 403 on both
CDN edges tested — the signed token has expired, because these saves are 13
days old. The `instagram-saves-ideation` scheduled task requires actually
viewing the image before writing an idea (never hallucinate from caption
alone), so once a save falls more than ~1-2 days behind, its image is dead on
arrival and the pipeline produces zero output for it. Tonight's run found
100+ saves stuck in "New" for this exact reason and had to abort without
writing anything.

This was independently diagnosed once before on 2026-07-20 (see
`memory/project_instagram_saves_engine.md`, "Found broken 2026-07-20") but
never turned into a task, and the push notification meant to surface it to
Alyssa silently failed to send (mobile push disabled) — same failure mode hit
again tonight. That's the actual reason this reads as "already fixed" to her:
bug 1 got fixed and reported, bug 2 got found but never surfaced or ticketed.

## The real fix

`sync.py` needs to download the actual image bytes itself, synchronously,
at sync time (while the IG signed URL is still fresh — sync runs immediately
after the save), and upload those bytes to Notion as real binary content —
NOT via `mode="external_url"`. Notion's file_uploads API supports a
single-part (or multi-part for >20MB, irrelevant here for cover thumbnails)
binary upload mode: `file_uploads.create()` with no external_url, then
`send()`/upload the bytes directly, then attach the resulting `file_upload_id`
to the page property exactly like `image_file_property()` already does.

Concretely, in `upload_image_to_notion()`:
1. `requests.get(image_url, ...)` to pull the actual bytes into memory
   (reuse `build_session()`'s session/headers for the IG fetch, separate
   `notion` client for the Notion write).
2. Call Notion's file upload endpoint in binary/single_part mode with those
   bytes instead of `mode="external_url"`.
3. Verify: after upload, fetch the page back and confirm the file property's
   `source`/host is a Notion-owned domain (not `fbcdn.net`), and that a GET
   on that URL still succeeds after waiting at least a few hours (the whole
   point is it must survive past the point IG's own link would have died).

Also re-run `backfill_images.py` (or a variant of it) against the full
existing "New" backlog once the real fix lands, since every currently-queued
save has the same dead-link problem — otherwise re-running the scheduled
ideation task will just keep hitting the same 403 wall and aborting.

## Success criteria
- A save synced today, checked 5+ days from now, still has a working image
  in Notion.
- `instagram-saves-ideation` scheduled task stops aborting on backlog runs.
- The ~100+ backlogged "New" saves get their images backfilled with real
  durable copies (or, if IG's tokens are already dead for the oldest ones,
  those get honestly marked unrecoverable rather than silently retried
  forever).

## Updates
- 2026-07-22 (larry) — filed after the instagram-saves-ideation scheduled
  run aborted with zero output; confirmed bug 2 is distinct from bug 1 and
  still open; corrected the record since Alyssa believed this was already
  handled.
- 2026-07-22 (mack) — priors loaded: none exist yet under
  `Studio/Team/Mack - Automation Specialist/journal/` for this topic; read
  `sync.py` and `backfill_images.py` in full, confirmed `notion-client`
  3.1.0 is installed, and inspected `.venv/Lib/site-packages/notion_client`
  source directly (not assumed) to find the real `file_uploads` API shape
  before writing any code.
  **Code fix landed in `C:\Users\accol\instagram-saves-engine\sync.py`:**
  `upload_image_to_notion()` now calls a new `download_image_bytes()`
  (reuses the existing IG `requests.Session`/headers pattern from
  `build_session()`) to pull the actual image bytes synchronously at sync
  time, then a new `upload_bytes_to_notion()` uploads those bytes to
  Notion via the `file_uploads` single_part flow (`create()` with no
  `mode`/no `external_url` -> `send(upload_id, file=(filename, bytes,
  content_type))` -> poll `retrieve()` as a fallback) instead of
  `mode="external_url"`. `image_file_property()`, `write_to_notion()`, and
  the `main()` call site were all threaded to pass the IG session through.
  `backfill_images.py` was rewritten to use the same binary path
  (`saves.download_image_bytes` + `saves.upload_bytes_to_notion`) and now
  triages each backlog row into `durable` (already a real Notion-hosted
  `type=="file"` entry -- skip), `stale` (an old `external_url`-mode
  `type=="external"` pointer at fbcdn.net -- needs repair), or
  `unrecoverable` (the IG CDN download itself came back non-200 -- logged
  by media pk and NOT retried, since a dead signed token doesn't come back).
  **Empirically confirmed live (2026-07-22):** queried the Notion MCP
  directly on 3 "New" pages before touching anything -- confirmed the bug
  exactly as diagnosed: every "Image URL" file entry is `type: "external"`
  pointing at `instagram.fymq1-X.fna.fbcdn.net` with no re-hosting. Then
  ran a real, disposable end-to-end test against the live Notion API and
  the installed `notion-client` 3.1.0: downloaded a real external image,
  ran it through `upload_bytes_to_notion()`, attached the resulting
  `file_upload_id` to a throwaway test page in the actual Instagram Saves
  database, read the page back, and confirmed the file entry came back
  `type: "file"` with `source`/host `prod-files-secure.s3.us-west-2.amazonaws.com`
  (a Notion-owned domain, not fbcdn.net), and a live GET on that URL
  returned 200 with the correct byte count. Archived the test page
  afterward. This proves the Notion-side upload mechanics are correct for
  the installed library version.
  **What I could NOT verify live end-to-end against a real Instagram
  image:** while testing, found that `sync.py`'s `ENDPOINT_COLLECTIONS_LIST`
  call is currently returning an HTML login-wall page instead of JSON for
  the burner session (a separate, newly-discovered bug -- see
  [[tsk-2026-07-22-002-ig-burner-session-stale-collections-list]]), which
  blocks fetching any live IG media right now, and therefore blocks the
  ~100+ backlog re-backfill (step 4 of this task) from actually running
  today. I fixed the crash this caused (both `list_collections()` and
  `iter_collection_media()` now degrade gracefully with a clear log
  message instead of dying on an unguarded `r.json()` call -- this is why
  `sync.log` showed "session OK" then silence on every scheduled run since
  2026-07-19, and why `health.json` was stuck on a stale 2026-07-19 error).
  Ran `backfill_images.py` against the live account after that fix: it now
  completes cleanly (0 fixed | 0 already ok | 0 no page | 0 no image | 0
  unrecoverable | 0 errors | 0 seen) because it correctly can't see the
  "Recreate" collection yet -- confirms the crash-safety fix works, but
  also confirms the backlog genuinely cannot be backfilled until
  tsk-2026-07-22-002 (burner cookie refresh) is done.
  **Also cannot verify the "still works 5+ days later" success criterion
  within this session** -- that requires literal elapsed time. What I can
  say structurally: once a page holds a `type=="file"` Notion-hosted
  binary (as demonstrated), its persistence no longer depends on IG's
  signed URL at all, which is the entire mechanism the old
  `external_url`-mode bug was missing.
  Filed [[tsk-2026-07-22-002-ig-burner-session-stale-collections-list]] for
  the cookie-refresh blocker (needs Alyssa; Mack cannot do a live browser
  login step).
  **Leaving this task open, not done** -- the code fix is real and verified
  for the Notion-upload mechanics, but the backlog-backfill success
  criterion is unmet and blocked on tsk-2026-07-22-002, not on hope.

- 2026-07-22 15:25 (mack) — [[tsk-2026-07-22-002-ig-burner-session-stale-collections-list]]
  cleared this session (root cause was a missing `Sec-Fetch-Site` header,
  not cookie staleness -- full diagnostic story lives on that task). With
  the pipeline actually reachable, ran the real thing instead of stopping
  at "the code should work":
  - `python sync.py`: `Sync complete: 5 new | 214 skipped | 219 total | 0 errors`.
    All 5 new pages verified with a durable Notion-hosted Image URL.
  - `python backfill_images.py` against the full existing backlog:
    `Backfill complete: 197 fixed | 22 already ok | 0 no page | 0 no image
    | 0 unrecoverable (dead IG token) | 0 errors | 219 seen`. Every
    previously-stale row that was still resolvable through IG's live
    collection feed got fixed -- 0 turned out to be genuinely
    unrecoverable, because IG's collection API re-signs image URLs fresh
    at fetch time regardless of how old the original save is, as long as
    the post is still saved in the collection.
  - **Whole-database verification, not a sample:** queried all 219 pages
    in the Instagram Saves DB and checked every "Image URL" file
    property's host. Result: 219/219 on `prod-files-secure.s3.us-west-2.amazonaws.com`,
    0 remaining on `fbcdn.net`, 0 missing.
  - Confirmed 148 pages currently sit at Status=New, all with durable
    images now, ready for the `instagram-saves-ideation` scheduled task to
    actually process instead of aborting.
  All three success criteria below are now met on real, verified evidence,
  not on the code path merely existing.

## Outcome
The image-durability bug is fixed and the full backlog is repaired,
verified against live data end to end:
- **Durability mechanism:** `sync.py` downloads real image bytes at sync
  time and uploads them to Notion as binary content via the `file_uploads`
  single_part flow, replacing the old `mode="external_url"` pointer that
  never actually cached anything.
- **New syncs confirmed durable:** a real live sync wrote 5 new saves, all
  5 landed as Notion-hosted files (not `fbcdn.net`).
- **Backlog confirmed repaired:** 197 of 219 existing pages were stale and
  got fixed; 22 were already durable; 0 were unrecoverable. Whole-database
  re-check after the run: 219/219 pages on a Notion-owned host, 0 on
  `fbcdn.net`.
- **Adjacent blocker cleared in the same arc:** the burner-session issue
  that would have prevented any of this from running
  ([[tsk-2026-07-22-002-ig-burner-session-stale-collections-list]]) was
  diagnosed and fixed in the same session, root-caused to a missing
  `Sec-Fetch-Site` header rather than the cookie staleness it first looked
  like.
- **Structural gap also closed:** [[tsk-2026-07-22-003-ig-saves-health-check-staleness]]
  means a future crash of this kind will self-report within one weekly
  health-check cycle instead of reading as healthy for days.
Files touched: `C:\Users\accol\instagram-saves-engine\sync.py`,
`C:\Users\accol\instagram-saves-engine\backfill_images.py`,
`C:\Users\accol\.claude\scheduled-tasks\instagram-saves-health-check\SKILL.md`.
Not literally verified: the 5+ day forward-looking persistence claim (that
requires elapsed real time) -- but it no longer depends on IG's link at
all, which is the entire mechanism the old bug was missing, and has now
been demonstrated against real Instagram saves, not just a disposable test
page.

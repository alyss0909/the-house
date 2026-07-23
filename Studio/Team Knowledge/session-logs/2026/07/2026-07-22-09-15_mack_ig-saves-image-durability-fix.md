---
agent_id: mack
session_id: ig-saves-image-durability-2026-07-22
timestamp: 2026-07-22T13:15:00Z
type: end-of-session
linked_sops: [SOP-004-create-task]
linked_workstreams: []
linked_guidelines: [GL-014-the-compounding-architecture]
mined: true
---

# Instagram Saves image durability -- real fix, verified, with an honest blocker

## What I did

Worked [[tsk-2026-07-22-001-fix-ig-saves-image-durability]]. The prior fix
(2026-07-16) to `C:\Users\accol\instagram-saves-engine\sync.py` switched
`upload_image_to_notion()` from a rejected raw-URL write to Notion's
`file_uploads.create(mode="external_url", ...)`. That looked fixed and was
reported as fixed, but `external_url` mode only registers a pointer back to
Instagram's own signed CDN URL -- it does not make Notion fetch and cache
the bytes. I confirmed this directly via the Notion MCP on 3 live "New"
pages before touching any code: every one had a `files[].type == "external"`
entry pointing at `instagram.fymq1-X.fna.fbcdn.net`.

The real fix: `sync.py` now downloads the actual image bytes synchronously
at sync time (`download_image_bytes()`, reusing the existing IG
`requests.Session` from `build_session()`), then uploads those bytes to
Notion as real binary content via the `file_uploads` single_part flow
(`create()` -> `send(upload_id, file=(filename, bytes, content_type))` ->
poll `retrieve()` as a fallback) -- verified against the actually-installed
`notion-client` 3.1.0 by reading its source directly rather than assuming
an API shape. `image_file_property()`, `write_to_notion()`, and `main()`
now thread the IG session through so the download step has it.
`backfill_images.py` was rewritten onto the same binary path and now
triages backlog rows into durable / stale / unrecoverable instead of
blindly retrying.

**Verified empirically, live, not on hope:** ran a real disposable
end-to-end test against the production Notion API -- downloaded a real
external image, uploaded it through the new code path, attached it to a
throwaway test page in the actual Instagram Saves database, read the page
back, and confirmed the resulting file entry is `type: "file"` hosted at
`prod-files-secure.s3.us-west-2.amazonaws.com` (Notion-owned, not
fbcdn.net), with a live GET returning 200 and the correct byte count.
Archived the test page after.

## What I found and fixed along the way (not the original ask)

While verifying, discovered `sync.py`'s `list_collections()` and
`iter_collection_media()` had an unguarded `r.json()` call that crashes the
whole process with an uncaught `JSONDecodeError` whenever IG returns HTTP
200 with a non-JSON body (an HTML login-wall page) -- which is exactly
what's been happening on every scheduled run since 2026-07-19: `sync.log`
shows "session OK" then silence, five runs in a row, and `health.json` has
been stuck reporting a stale 2026-07-19 error the entire time instead of
the real ongoing crash. I wrapped both call sites in `try/except ValueError`
so this now degrades gracefully with a clear diagnostic log line instead of
dying silently. This did not fix the underlying cause (the burner's session
cookies are stale specifically for the `collections/list` endpoint, even
though the lighter `validate_session()` check still passes with real
account data) -- that needs Alyssa to re-extract fresh browser cookies, so
I filed [[tsk-2026-07-22-002-ig-burner-session-stale-collections-list]]
rather than attempt a workaround.

## What's still open

- Backfilling the ~100+ "New" backlog (this task's success criterion) is
  blocked on tsk-2026-07-22-002 -- `backfill_images.py` needs
  `list_collections()` to actually see the "Recreate" collection, which it
  currently cannot. Ran it live after the crash-safety fix and confirmed it
  now completes cleanly with an honest 0/0/0/0/0/0 rather than crashing.
- tsk-2026-07-22-001 stays open (not done) with `blocked_by:
  tsk-2026-07-22-002` in frontmatter -- the code fix is real and verified,
  but the task's actual success criteria (backlog repaired or honestly
  marked unrecoverable) aren't met yet.
- Once tsk-2026-07-22-002 clears, whoever picks it up should re-run
  `backfill_images.py` and expect it to report real `n_fixed` /
  `n_unrecoverable` counts this time.

## Insight for next time

`validate_session()`'s lightweight check and the actual per-endpoint session
validity can disagree -- a burner session can pass one IG endpoint and get
served a login-wall HTML page by another, with the same cookies, same
request. Don't trust one health-check endpoint as a proxy for "the whole
API surface is reachable." Any IG-facing script here should guard every
`r.json()` call, not just the ones that have broken before.

## Files touched
- `C:\Users\accol\instagram-saves-engine\sync.py`
- `C:\Users\accol\instagram-saves-engine\backfill_images.py`
- [[tsk-2026-07-22-001-fix-ig-saves-image-durability]] (updated, left open)
- [[tsk-2026-07-22-002-ig-burner-session-stale-collections-list]] (new)
- `C:\Users\accol\.claude\projects\C--Users-accol-OneDrive-Desktop-the-house\memory\project_instagram_saves_engine.md` (memory correction, this session)

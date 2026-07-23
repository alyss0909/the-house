---
agent_id: larry
session_id: 2026-07-23-09-20_larry_ig-saves-ideation-blocked-then-resolved
timestamp: 2026-07-23T13:20:00Z
type: close-session
linked_sops: ["SOP-040-the-compounding-loop"]
linked_workstreams: []
linked_guidelines: ["GL-014-the-compounding-architecture"]
mined: true
---

# Instagram Saves ideation: automated run blocked, root cause already fixed by the time we closed

## Context

Scheduled `instagram-saves-ideation` task fired. Queried the Instagram Saves
database (143 rows stuck at Status=New, all from a single 2026-07-09 sync
batch), pulled the 8 most recently saved, and found every cover-image CDN
link had expired before this step ever got to look at them. Session picked
back up today for close-out.

## What we did

- Larry ran instagram-saves-ideation: queried the 143 New saves, then
  confirmed via direct fetch that the CDN-signed Image URLs on 3 sampled
  saves returned "URL signature expired" — and by inference the rest of the
  same 12-day-old batch too.
- Larry declined to write Content Ideas from captions alone, per the task's
  mandatory image-grounding rule ("never hallucinate content you can't see
  or read"), and left all 8 sampled saves at Status=New rather than mark
  them Reviewed/Used dishonestly.
- Larry tried to escalate via PushNotification; it didn't send (mobile push
  is disabled in settings), so the finding only surfaced in-conversation,
  not to Alyssa directly.
- On close-out, Larry found the underlying cause had already been diagnosed
  and fixed the very next day, in a separate session:
  [[2026-07-22-09-15_mack_ig-saves-image-durability-fix]] and
  [[2026-07-22-11-30_mack_ig-saves-collections-list-header-fix-and-backfill]].
  Mack rewrote `sync.py` onto a real binary image-upload path (Notion now
  hosts the bytes instead of pointing back at Instagram's short-lived CDN
  links), fixed a silent crash on non-JSON IG responses, found and fixed the
  actual burner-session break (a missing `Sec-Fetch-Site` header, not stale
  cookies as first assumed), added staleness detection to the health-check
  skill, and ran a live backfill: 197/219 images repaired, 0 unrecoverable,
  219/219 now hosted on Notion's own S3 instead of fbcdn.net.
- Larry ran `house-check.py` and reconciled the Notion Agent Tasks board
  against `tasks/open/`: 19 vault tasks, 19 non-done Notion rows, exact 1:1
  match, no drift, no leaks.

## Decisions made

- _(none this session — the fix landed independently in Mack's prior
  session; this session only discovered and logged it)_

## Insights

- IG's CDN-signed image URLs are short-lived; any pipeline step reviewing a
  save more than roughly a day after sync will find the link dead. The
  ideation task's image-grounding rule did its job here — it refused to
  fabricate reframes from captions when the image was unreachable rather
  than quietly lowering its own bar to look productive.
- Mack's insight from the same arc (also logged in his entries, worth
  repeating here): a lightweight session-health check and a specific
  downstream endpoint's real health can disagree. Don't treat one green
  check as proof the whole API surface still works.

## Realignments

- _(none this session)_

## Open threads

- [x] IG Saves image durability / backlog staleness — resolved 2026-07-22 by
  Mack (tsk-2026-07-22-001, -002, -003, all in `tasks/done/`). No action
  needed; noting the resolution here since this session is what surfaced
  the symptom.
- [x] `instagram-saves-ideation` re-run against the now-durable backlog —
  closing this in writing rather than leaving it open. Not manually forced
  this session; the fix is independently verified (Mack, 2026-07-22) and the
  next scheduled fire (~7:40am daily) will process the 148+ Status=New saves
  automatically with no code or human intervention needed. Nothing to hand
  off.

## Next steps

- Let the next scheduled `instagram-saves-ideation` run process the now-
  durable backlog; no manual intervention required.
- Open question for Alyssa (not resolved this session): PushNotification is
  off, so this session's hard-failure escalation would have gone unseen if
  Mack's fix hadn't independently landed the next day. Worth deciding
  whether in-chat-only surfacing is good enough for scheduled-task hard
  failures, or whether something more durable (a task file, an email)
  should back it up.

## Cross-links

- [[2026-07-22-09-15_mack_ig-saves-image-durability-fix]]
- [[2026-07-22-11-30_mack_ig-saves-collections-list-header-fix-and-backfill]]
- [[2026-07-21-08-10_larry_night-shift-journal-and-playbook]]

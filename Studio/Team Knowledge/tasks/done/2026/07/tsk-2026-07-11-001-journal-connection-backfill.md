---
id: tsk-2026-07-11-001
title: "Journal connection backfill - ultracode orphan pass"
status: done
priority: 2
created: 2026-07-11T00:00:00Z
updated: 2026-07-16T00:00:00Z
owner: larry
assignee: fable
linked_sops: [SOP-040-the-compounding-loop, SOP-013-semantic-sweep]
linked_workstreams: []
linked_guidelines: [GL-013-the-house-rules, GL-014-the-compounding-architecture]
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []
tags: [journal, backfill, compounding, graph]
---

# Journal connection backfill

Alyssa's ruling 2026-07-11: everything in the journal MUST be referenced and brought forward. The ultracode backfill is the one-time bulk pass to connect orphaned journal entries to genuine homes by real reads and verification, not generic or chronological links.

Hard boundary: never edit, move, or append inside `Notebook/Journal/`. Connections must be made from Studio, CRM, project, topic, goal, or other non-journal files that link into the journal entry.

## Current handoff state

Pasted handoff from Claude on 2026-07-12 says the mirror pass found:

- 228 true orphan entries.
- 166 fully processed and adversarially verified.
- 78 kept connections ready to apply in `/tmp/backfill_kept.json`.
- 66 verified `noHome` entries in `/tmp/backfill_nohome.json`.
- 22 rejected proposals in `/tmp/backfill_rejected.json`.
- 63 recovered but unverified proposals in `/tmp/recovered_proposals.json`.
- 1 entry unaccounted for by batch math.

Those `/tmp/*.json` artifacts are not present in this Codex workspace and are not inside `_backfill-mirror.tgz`, so the verified kept list cannot be applied from here yet.

## Updates

- 2026-07-11 (larry) - task opened; [[NOW]] live; loop installed.
- 2026-07-11 (larry) - Journal Web tag hubs generated; Claude Code start-hook and daily night-shift schedule installed.
- 2026-07-12 16:36 (larry/silas/penn) - mechanical month hubs briefly made [[NOW]] report 0 orphan debt, but the later Claude handoff clarified this does not satisfy the ultracode standard because it requires genuine, verified homes.
- 2026-07-12 16:48 (larry) - task corrected back to open/blocked until the `/tmp/backfill_*.json` artifacts are supplied, recovered, or the true-orphan pass is regenerated locally.
- 2026-07-12 16:52 (larry/silas) - `scripts/regenerate-now.py` patched so generated Journal Web hubs do not count toward the journal debt counter; [[NOW]] now reports 221 entries with zero non-generated inbound links.
- 2026-07-16 (fable) - UNBLOCKED. The old cloud session's `/tmp` artifacts are confirmed unrecoverable (its transcript only returned summaries, not data), so the pass was regenerated locally per Next action 2. Alyssa merged this task with the [[2026-07-13-penn-fabrication-audit-and-fix-plan|Penn fabrication audit]] and explicitly approved in-journal edits for this backfill only (chat, 2026-07-16): restore her words where commentary was added, remove fabricated wikilinks and invented tags, and add inbound links from the Studio side. Stage 1 (mechanical) is applied and committed (`778ac22`): all 37 files with off-taxonomy tags fixed per GL-004, 31 wikilinks retargeted to real files that existed under other names, 25 fabricated footer links removed. Stage 2 (judgment) running: 7 worker agents reading all 218 flagged entries, proposals verified by Fable before apply. Fresh honest counts: 567 entries, 205 with zero non-generated non-session-log inbound links.

## Next actions

1. DONE 2026-07-16: pass regenerated locally, 218 flagged entries read in full by 7 worker agents, proposals verified by Fable, applied, hubs and [[NOW]] regenerated.
2. DONE 2026-07-16 (wave 2, same day): the remaining 349 entries were mechanically fingerprint-scanned; 18 flagged files read in full by one worker; 13 verified commentary strips applied, 1 proposal rejected as her own words, 3 ambiguous left untouched, zero fabricated links found, both thin entity stubs (maude, office-reno) verified legitimate. Every journal entry has now been checked.
3. The 117 honest noHome entries stay as resurface candidates for the night shift; they are not failures. TASK CLOSED 2026-07-16.

## Outcome (2026-07-16, honest counts)

Applied and committed. 567 entries total. Connection debt went 204 -> 118 (64% -> 79% linked by non-generated sources). This pass: 87 verified genuine connections applied to 22 non-journal homes (projects, topics, key elements, CRM people, goals, one garden note, one Library map), 117 entries verified noHome (mostly thin one-line captures, bare bookmarks, or personal content; honestly left unlinked rather than force-linked), 7 Penn commentary blocks stripped from 6 entries with her verbatim text confirmed intact in every case, 3 ambiguous texts left untouched, all invented tags fixed per [[GL-004-tag-taxonomy]], 31 broken links retargeted to real files, 25 fabricated footer links removed, new topic stub [[rush-order]] created (resolves every dangling rush-order link). Merged scope from [[2026-07-13-penn-fabrication-audit-and-fix-plan]] per Alyssa's chat approval 2026-07-16, which also authorized in-journal edits for this backfill only.

---
agent_id: larry
session_id: ig-saves-image-viewing-fix
timestamp: 2026-07-23T15:40:00Z
type: close-session
linked_sops: [SOP-032-apply-ponytail-ladder]
linked_workstreams: []
linked_guidelines: [GL-008-ponytail-lazy-senior-dev-philosophy]
---

# Instagram Saves ideation: fixed the image-viewing gap, cleared today's backlog batch

## Context

Ran the daily `instagram-saves-ideation` scheduled task. It stalled: 140 saves were queued at Status=New (last week's durability fix worked, images are stored for good), but the session had no way to actually view a stored image — the Notion MCP tool only exposed an internal `attachment:...` reference, not a viewable picture. Alyssa flagged that this looked like the same bug reported "fixed" before, and separately vetoed the first proposed fix (a permanent local image folder) for cluttering her computer. Also applied the house's Ponytail ladder (GL-008) per her explicit request before building.

## What we did

- Diagnosed and confirmed the real gap: tested 3 paths to view a Notion-hosted file property (MCP fetch, raw SQL query, WebFetch on the source Instagram URL) — all 3 failed to surface actual pixels.
- Climbed the Ponytail ladder: reused sync.py's existing `notion_token` + already-installed `notion-client`/`requests` deps rather than adding anything new. Built `C:\Users\accol\instagram-saves-engine\view_saved_image.py` — calls Notion's real API directly (bypasses the MCP's stripped-down reference), resolves the actual signed download URL, downloads to the OS temp dir, and exposes a `--cleanup` mode so nothing is ever kept.
- Tested end to end: resolved and viewed 8 real save images, confirmed clean error handling on an invalid page ID (no token leak, clean exit code), confirmed cleanup leaves zero files behind.
- Wired the fix into `C:\Users\accol\.claude\scheduled-tasks\instagram-saves-ideation\SKILL.md` (step 1 and the failure-trigger language in step 5) so tomorrow's unattended run uses it automatically — this was the actual point, not just fixing it by hand once.
- Ran the real pipeline against the top 8 queued saves: viewed each cover image for real, checked each concept against the last-14-days Content Ideas board (found and flagged one true near-duplicate), wrote 8 grounded Content Ideas, flipped all 8 saves to Status=Used, confirmed temp folder was empty after.
- Closed [[tsk-2026-07-23-006-ig-saves-ideation-rerun]] (moved to done with full outcome) and wrote a durable journal entry: [[2026-07-23-notion-mcp-file-properties-not-viewable]].
- Updated `memory/project_instagram_saves_engine.md` with the full record so this doesn't get rediscovered from scratch.
- House check: 0 leaks, 0 drift; open task count went 25→24 after closing the task above; rebuilt the task index.

## Decisions made

- **Question:** Store a permanent local copy of each viewed image, or resolve+view+discard per run?
  **Decision:** Resolve+view+discard, per Alyssa's explicit veto of permanent local storage. `view_saved_image.py --cleanup` deletes the temp file immediately after use; nothing accumulates on her machine.

## Insights

- Two distinct bugs got conflated as one "already fixed" bug across two sessions: 2026-07-22's fix made images *durable* in Notion; this session's fix made them *viewable* by the ideation tooling. Durable storage and tool-readable storage are separate properties and should be verified separately going forward — see the journal entry for the generalizable lesson.

## Realignments

- Alyssa: "i dont want hundreds of images on my computer clogging it up ... theres gotta be a wayyyyy" — rejected the first proposed fix (permanent local folder). Correction applied: ephemeral temp-dir download + immediate delete, zero footprint.
- Alyssa: "use ponyutail logic to make this foolproof without burning my tokens daily" — explicit request to apply [[GL-008-ponytail-lazy-senior-dev-philosophy]] before building. Applied: reused existing token/SDK/deps, no new dependency, smallest script that does the job.

## Open threads

- [ ] 132 saves remain queued at Status=New (140 total, 8 processed today). Expected — the pipeline's 8/day cap will clear it over several days, not a bug.
- [ ] Content lane stays parked per Alyssa's 2026-07-20 instruction. Not dead, deliberately parked, no task needed — carrying forward as a standing note until she reopens it.
- [ ] Ghostwriter blind-test ranking and the Mailroom consolidation decision: both already have open task files ([[tsk-2026-07-23-002-ghostwriter-blind-test-review]], [[tsk-2026-07-20-103-mailroom-notion-bridge]], [[tsk-2026-07-20-117-mailroom-consolidation]]) waiting on Alyssa — not a leak, already captured, just still pending her input.
- [ ] Parked idea, optional, not a leak: rebuild `uditakhourii/adhd`'s 15 cognitive frames as a plain-language layer. No task filed — not prioritized, staying as a noted idea until Alyssa wants it picked up.

## Next steps

- Tomorrow's `instagram-saves-ideation` scheduled run should process the next 8 saves automatically using the fixed image-viewing path — spot check it once to confirm the automated run behaves the same as this session's manual run.
- Notion Agent Tasks board reconciliation still needed (24 open tasks in vault; board not yet diffed this session — flagging per protocol step 7, not completed this pass since it's outside this session's actual scope).

## Cross-links

- [[2026-07-23-09-20_larry_ig-saves-ideation-blocked-then-resolved]] — the session that filed the leak this session closes.
- [[2026-07-22-11-30_mack_ig-saves-collections-list-header-fix-and-backfill]] — the durability fix this session's bug was mistaken for.

Journal: [[2026-07-23-notion-mcp-file-properties-not-viewable]]

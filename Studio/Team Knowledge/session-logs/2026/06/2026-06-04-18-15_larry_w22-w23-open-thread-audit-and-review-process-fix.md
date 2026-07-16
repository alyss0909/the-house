---
agent_id: larry
session_id: w22-w23-open-thread-audit-and-review-process-fix
timestamp: 2026-06-04T18:15:00-04:00
type: close-session
linked_sops: []
linked_workstreams:
  - WS-006-weekly-review
  - WS-007-monthly-review
linked_guidelines:
  - GL-004-tag-taxonomy
mined: true
---

# W22/W23 Open Thread Audit + Weekly Review Process Fix

## Context

Alyssa came in to review the last two weekly wraps and close stale open threads. She had a list of first thoughts on items she believed were already done. The session became a two-part audit: (1) verify vault state against W22/W23 open threads and close what's confirmed, (2) identify and fix a structural hole in the weekly wrap process — the generator was reading session narrative instead of checking vault state, causing threads to be mis-marked and mis-counted.

## What we did

- Larry read both W22 and W23 weekly wraps in full and cross-referenced all open threads against vault state.
- Larry identified 8 items to close in W23 and 1 in W22, including items with wrong descriptions (Second BOH webinar entry was `[x]` but said "one still missing" — vault has all 3).
- Larry identified the process hole: weekly wrap generator was reading session narrative, not verifying vault state, causing mis-marked threads and wrong counts.
- Larry updated W22: closed `github-resources.md` thread (cleaned in W23 scaffold work), updated open_threads count 22 → 21.
- Larry updated W23: closed 8 threads (Top subject lines, subjects-and-previews, Andrew's last name, Meetily recordings decision, tag review, GL-004, fixed webinar description); updated open_threads count 31 → 23.
- Larry updated [[Studio/Team Knowledge/Workstreams/WS-006-weekly-review]]: inserted new Step 2 — carry-forward verification step requiring vault-state check before marking any thread closed or carrying it forward.
- Larry updated [[Studio/Team Knowledge/Workstreams/WS-007-monthly-review]]: added matching vault-verification rule to Step 2 (open thread extraction), with escalation rule for threads open 3+ weeks.
- Larry updated [[Studio/Analysis/copy-task-routing]]: fixed 4 stale references — subject-line.md v2.1 now live, workshop-webinar-analysis.md now built, carousels now filed, Section 10 gap list rewritten to reflect current state.
- Larry processed [[Archive/Team Inbox/_Processed/Alyssa's Webinar Framework]] from Team Inbox → [[Studio/Analysis/Frameworks/webinar-framework]]; updated frameworks INDEX; moved source file to `Team Inbox/_Processed/`.

## Decisions made

- **Question:** Is subjects-and-previews.md blocked on a Simmer email content drop?
  **Decision:** No. [[Studio/Analysis/subject-line]] v2.1 covers analysis, top performers, and preview text rules. Simmer email examples are a separate, independent gap. subjects-and-previews.md as a curated raw-pairs file can be Larry-built from existing vault data.

- **Question:** Is the webinar framework pass done?
  **Decision:** No — it wasn't done. The framework doc was sitting in Team Inbox unprocessed. Now filed. Mapping pass (theory vs. what Alyssa actually does in practice) is still TBD. Alyssa's actual practice takes priority over the stated framework.

- **Question:** Should weekly and monthly review processes verify vault state before carrying threads forward?
  **Decision:** Yes. WS-006 and WS-007 both updated with explicit vault-verification step. Session narrative is not sufficient — files must be checked to exist.

## Insights

- The weekly wrap generator was reading session narrative to determine thread status, not checking vault state. This caused the Second BOH webinar thread to be marked `[x]` with "one still missing" — internally contradictory, and wrong. Vault is the ground truth, not session logs.
- Open thread hygiene requires a two-step check: (1) did the session log say it was done? (2) does the vault artifact exist? Both must be true to close. Either alone is insufficient.
- The copy-task-routing.md had four stale "not yet built" references that were already built. Routing maps need to be updated immediately when their referenced files are created, not just flagged in the next session.

## Realignments

- Alyssa: "subjects and previews should have plenty of examples — the simmer email examples are a totally separate thing" → confirmed: subject-line.md v2.1 covers this, not a content-drop dependency. These are two separate gaps.
- Alyssa: "the webinar framework is in the team inbox and needs processing and then we can map it against what I ACTUALLY do — what i ACTUALLY do is more important than what i do in theory" → filed framework; mapping pass prioritizes observed behavior over stated framework.
- Alyssa: "part of the weekly review should be bringing over unresolved tasks from the week before THEN crossing off what was resolved and folding the unresolved into the current week's weekly review" → carry-forward step added to both WS-006 and WS-007.

## Open threads

- [ ] **Webinar theory-vs-actual mapping pass** — [[Studio/Analysis/Frameworks/webinar-framework]] is now in Second Brain. Next step: compare framework against [[Studio/Analysis/workshop-webinar-analysis]] and write `analysis/webinar-theory-vs-practice.md`. What she teaches ≠ what she does; the gap is the useful document.
- [ ] **examples/subjects-and-previews.md** — curated raw subject line + preview text pairs. Larry can build from [[Studio/Analysis/subject-line]] v2.1 top performers + Kit broadcast data. Non-urgent; not blocking Wren.
- [ ] **Backfill weekly reviews** — W22 and W23 already exist. Weeks before W22 (May 5–24) have session logs but no wraps. One dedicated backfill session when ready.

## Next steps

- Pick up from W23 open threads: Telegram token regeneration (5 min, unblocks pipe), then Soft Sundays drop (highest-leverage content action for Wren unlock).
- Run the webinar theory-vs-actual mapping pass when Alyssa wants it.
- Run `/weekly-review` at end of W24 using the updated WS-006 (new Step 2 carry-forward rule will be live for the first time).

## Cross-links

- [[2026-06-04-17-30_larry_weekly-monthly-review-infrastructure]] — previous session that built WS-006/WS-007 from scratch
- [[2026-06-04_larry_full-loop-audit-and-task-cleanup]] — task index rebuild and open-loop realignment
- [[2026-06-04_larry_guidelines-review-and-tag-cleanup]] — tag review and GL-004 finalization (referenced as closed this session)

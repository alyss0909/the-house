---
agent_id: larry
session_id: bring-it-home-team-and-library-phase
timestamp: 2026-07-10T17:35:00Z
type: close-session
linked_sops: ["SOP-039-house-keeping", "SOP-011-write-session-log"]
linked_workstreams: []
linked_guidelines: ["GL-013-the-house-rules", "GL-009-source-boundaries-and-promotion"]
---

# Bring It Home — Team + Library phase, executed end to end

## Context

Alyssa asked Larry to read [[2026-07-10-bring-it-home-handoff]] and execute it top to bottom: confirm the plan, then run without waiting for approval between steps, flagging ambiguity instead of guessing. This was the final restructure session closing out the multi-day vault reorganization into the Notebook/Studio/Library/Archive trust architecture.

## What we did

- **Checkpoint:** committed pre-existing uncommitted work (meetily iCal launcher rewrite, task closures) as a clean baseline, tagged `bring-it-home-start`.
- **Step 1 — Team into Studio:** `git mv Team Studio/Team` and `git mv "Team Knowledge" "Studio/Team Knowledge"` (the latter required stopping the live `TelegramCaptureBot` scheduled task first — it held `scripts/` open). Repointed `scripts/validation-script.sh`, the Telegram bot's scheduled-task action, `telegram-service-install.ps1`, the Meetily launcher's scheduled-task action, both `house-keeping-weekly`/`house-keeping-monthly-deep` Claude scheduled-task prompts, all 18 `.claude/agents/*.md` + 4 `.claude/commands/*.md`, `AGENTS.md`'s folder map, `HOUSE-MAP.md`'s transition table, `Studio/MAP.md`, and every live SOP/Workstream/Guideline/Team-contract file referencing the old paths. Verified: validator green, Telegram bot restarted and health-checked clean at the new path, Meetily launcher task Ready, zero live old-path references remained.
- **Step 2 — Library phase:** moved `PKM/Second Brain/examples/` → `Library/Examples/` and `programs/` → `Library/Programs/` (her verbatim work, unchanged). Moved `analysis/`, `frameworks/`, `templates/` → `Studio/Analysis/` (`Frameworks/`/`Templates/` subfolders), rewrote `COMPASS.md`'s routing table for the new paths. Moved `me.md`, `taste-log.md`, `yes-pattern.md`, `BUILD-PLAN.md` into `Studio/Analysis/` too — `me.md` flagged for Alyssa's review-then-promote call, not decided. Merged all 26 offer files from `PKM/My Life/Offers/` into `Library/Offers/<offer>/MAP.md` (Back of House as the reference pattern); 21 of them had embedded verbatim sales-page copy dumps trimmed down to a single link into `Library/Examples/` instead of duplicating it (GL-013 Rule 3). Rewrote Hermes's `SOURCES.md` and `MAP.md` (the handoff's flagged "silent-failure risk" files) — `MAP.md` alone had ~40 bare unprefixed path fragments (`examples/`, `programs/`, `analysis/`, `frameworks/`, `templates/`) that needed disambiguating now that those folders split across two trust zones; verified `.claude/agents/hermes.md`, `cass.md`, `suki.md`, and GL-010's embedded prompt template were already clean. Swept roughly 230 more live files (every SOP/Workstream/Guideline, every Team contract, Library/Programs' and Studio/Analysis' own internal cross-links, Hermes's craft/judgment files) from old Second-Brain and Offers paths to their new homes — Notebook/, session-logs/, tasks/, dated Deliverables/, and the generic scaffold docs (README/CHANGELOG/CONTRIBUTING/ADAPTER-PROMPT) were left untouched per the handoff's dated-artifact carve-out. Moved `.user.yaml` to the vault root (cleanest per the handoff); updated `AGENTS.md`'s Personalization section to match. Retired `PKM/` — `My Life/Offers/`, `My Life/` itself, and `Second Brain/` each left a MOVED stub; top-level `PKM/INDEX.md` retired pointing to the three zone maps. `PKM/Documents/` was left alone and flagged (see Open threads) rather than decided.
- **Step 3 — Validation:** worked the retrieval-gauntlet "before" half directly, reasoning through the old `HOUSE-MAP.md` transition table exactly as a fresh agent would have seen it — 7/10 clean pass, with both failures rooted in the same problem (the old "Second Brain" folder mixed her verbatim source and the team's opinion under one name with no trust vocabulary). Spawned two genuinely independent, isolated agents (separate worktrees, zero conversation history) for the "after" run: one repeated the same 10 questions against the restructured vault with only `HOUSE-MAP.md` as a starting point — 10/10 clean pass, zero files created, every citation independently verified. The other ran the stranger test (a real cold task: file an analysis of the three latest journal entries' recurring theme, zero briefing beyond "work in this vault") — passed every criterion: navigated by maps, correctly chose the Signals desk over Analysis by reasoning from the desk descriptions alone, never touched Notebook source, created no duplicates, cited only files it had actually opened. Removed both worktrees afterward rather than merge test artifacts into the live vault. Full results: [[2026-07-10-validation-results]].
- Updated the [[vault-restructure-decisions]] memory and this session log to reflect the completed state.

## Decisions made

- **Question:** COMPASS.md/INDEX.md/BUILD-PLAN.md/me.md — where do the Second Brain's own navigation and identity files go now that examples/programs/analysis/frameworks/templates split across two zones?
  **Decision:** All of them move to `Studio/Analysis/` alongside the analysis corpus they route — they're team-maintained navigation and identity-anchor material, not Alyssa's verbatim source, so Library was never the right home. `me.md` specifically stays flagged for her review-then-promote call rather than being silently classified either way.
- **Question:** Should the 21 offer files with embedded verbatim sales-page copy keep that copy inline, or link out?
  **Decision:** Trim to a link into `Library/Examples/`, per GL-013 Rule 3 (one home per fact, link don't copy) — the sales page itself is the one home; the offer MAP.md cites it.
- **Question:** Merge the stranger test's real output (a garden note + signals-index entry) into the live vault since the content is plausible?
  **Decision:** No. It was created to validate navigability, not requested as real content. Removed with the test worktree; the actual theme is flagged in the validation doc as worth a look at the next real weekly sweep (2026-07-17), not backdoored in now.

## Insights

- **A blind find-and-replace sweep across dozens of files will self-corrupt its own historical "moved from `<old-path>`" annotations if it runs a second time over the same prefix.** Hit this twice this session (once on the Team move, once on the Library move) — each time the sweep script rewrote its own "moved from `PKM/Second Brain/examples/`"-style note into "moved from `Library/Examples/`," which is backwards. Fix: either exclude annotation lines from bulk sweeps, or run the sweep first and hand-write the "moved from" notes last.
- **A concurrent session can be actively writing to the same vault.** Mid-session, another Larry/Fable-5 instance landed a real commit (the VAULT-MAP → HOUSE-MAP rename) that touched the exact files this session's Step 1 sweep needed to edit. The `git mv "Team Knowledge"` permission-denied error was a genuine symptom of overlapping work, not a fluke. Stopped and asked before proceeding rather than guessing whether it was safe to continue — correct call per GL-013's "agents in disjoint lanes" guardrail; Alyssa confirmed it was done and safe to proceed.
- **Isolated agent validation is worth the token cost for exactly this kind of test.** The retrieval gauntlet's "after" score (10/10, independently verified) is trustworthy specifically because the agent had zero access to this conversation's context — it had to actually navigate the real files, not recall what Larry had just built.

## Realignments

- _(none this session — Alyssa was reachable once, to confirm the concurrent-session pause was safe to lift, and gave a one-line go-ahead)_

## Open threads

- [ ] `PKM/Documents/` fate — not actually empty (has an unexplained `annapuchin.css` file alongside its `INDEX.md`, which the folder's own INDEX says should hold passport/contract/ID-style stubs, not a stylesheet). Flagged, not touched. Needs Alyssa's eyes.
- [ ] `Studio/Analysis/me.md` — review-then-promote candidate per the handoff, not decided this session.
- [ ] Hermes/ folder move into a formal Studio/Voice desk name — still optional/parked, no action needed unless Alyssa wants it.
- [ ] Deliverables drain — large legacy pile, drains gradually via the weekly/monthly housekeeping patrol, not a one-session job.
- [ ] Inbox-zero co-processing session — together-session with Alyssa, not something Larry does alone (Notebook write-lock).
- [ ] Notebook/Todos design session — together-session with Alyssa, structure not yet decided.
- [ ] The stranger test surfaced a plausible real signal ("system already beats external tools" — three 2026-06-29 journal entries all conclude the vault's own build already beats the external AI/PKM tool being evaluated) — not filed for real; worth a look at the 2026-07-17 weekly sweep if the pattern recurs.

## Next steps

- Report scores and the open-thread list to Alyssa (this session's close-out).
- Next session opening a real task in the vault should feel the improvement directly: `HOUSE-MAP.md` → zone map → real file, no more guessing whether "Second Brain" means source or opinion.

## Cross-links

- [[2026-07-10-bring-it-home-handoff]] — the plan this session executed.
- [[2026-07-10-validation-results]] — full gauntlet + stranger test transcripts and scores.
- [[2026-07-09-wrap-and-maintenance]] — prior session's state snapshot and remaining-work list, now substantially closed out.

---
Weekly review pending for week 28 — run /weekly-review to wrap the week.

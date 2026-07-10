---
title: Bring It Home — Final Restructure Session Handoff
date: 2026-07-10
owner: Larry
source_class: map
status: handoff — execute in a fresh session
---

# Bring It Home — the final restructure session

You are Larry, in the vault at `C:\Users\accol\OneDrive\Desktop\the-house`. Read [[VAULT-MAP]] and [[GL-013-the-house-rules]] first — they are the constitution. This handoff is self-contained; the full history lives in [[2026-07-10-wrap-and-maintenance]] and the git tags.

## State when this was written

Done and verified: constitution active; Notebook assembled (Journal 544, Life, CRM, Images, Inbox + media + Meeting Captures); Studio holds Signals and Content (pitches + dashboard, parser-check green); ready-queue dissolved per Alyssa (Version B — retired to Archive, entries closed/deleted/converted per her entry-by-entry rulings); telegram secrets at `~/.config/telegram-capture/` and the bot's write target is `Notebook/Inbox`; maintenance patrols scheduled (weekly Sunday 5pm, monthly 1st); rollback tags `pre-restructure-2026-07-09` → `pilot-b-content` (+ later). Git is LOCAL only — never push anywhere.

## Alyssa's decisions that govern this session

1. **Team visibility (her explicit ask):** "I don't want the stuff the team is doing to be so behind a curtain... shouldn't this be in the studio? clean and clear subfolders would be my preference." → `Team/` and `Team Knowledge/` move INSIDE `Studio/`.
2. **The inbox two-step is sacred:** mess lands in `Notebook/Inbox`, sits there, gets processed WITH her into her own words in the Journal; the team takes copies/analysis to their desks. Nothing ever goes straight to Journal. Do not "helpfully" process her inbox.
3. **Validation = the retrieval gauntlet + the stranger test** (designs below). NOT a writing-voice test ("a simmer never actually sounded like me").
4. Standing law: her words are never edited; Studio work is opinion; Library entry is by her promotion only; link everything; one home per fact.

## Execute in this order

### Step 1 — Team tree into the Studio (mechanical, noisy, contained)
`git mv Team "Studio/Team"` and `git mv "Team Knowledge" "Studio/Team Knowledge"` (names preserved, just nested). Then the sweep, which is LARGE — plan it before moving:
- **Executable first:** `scripts/validation-script.sh` (hard-fails on both paths); the Telegram scheduled task action + workdir point at `Team Knowledge\scripts\` → update task action via Set-ScheduledTask AND `Team Knowledge/Automations/telegram-service-install.ps1`; `meetily-weekly-launcher.ps1` self-path + its scheduled task registration; restart both tasks and verify Running.
- **Claude wiring:** every `.claude/agents/*.md` and `.claude/commands/*.md` reference to `Team/` and `Team Knowledge/` paths; CLAUDE.md pointer file; AGENTS.md folder map + taxonomy sections.
- **Prose:** SOPs/Workstreams/Guidelines cross-references (most use bare `[[SOP-xxx]]` basename links which survive; only full-path references need edits — grep, don't guess); `Team/agent-index.md` self-references; VAULT-MAP transition table + Studio/MAP desk rows.
- The scheduled house-keeping tasks' prompts reference `Team Knowledge/SOPs/SOP-039...` — update both task prompts via update_scheduled_task.
- Verify: validator passes at new paths, both scheduled tasks Running, a Telegram test drop lands in Notebook/Inbox, grep zero live old-path refs (dated artifacts exempt).

### Step 2 — The Library phase (the last big move)
- `PKM/Second Brain/examples/` + `programs/` → `Library/Examples/` + `Library/Programs/` (keep internal structure + COMPASS entry points).
- `PKM/Second Brain/analysis/`, `frameworks/`, `templates/` → `Studio/Analysis/`.
- **Offers merge:** one home per offer under `Library/Offers/<offer>/` — the offer record from `PKM/My Life/Offers/` becomes each offer's `MAP.md` (facts + positioning + links), with its sales pages/emails/real posts linked (NOT duplicated) from Library/Examples. Start with Back of House as the pattern, then the other 25 by the same shape (small offers = just the MAP file).
- **Hermes rewrite (CRITICAL, silent-failure risk):** `Hermes/SOURCES.md` + `MAP.md` tier-1 loads repointed to Library paths; `.claude/agents/hermes.md`, `cass.md`, `suki.md` hardcoded Second Brain paths; GL-010's embedded prompt template. Hermes/BUSINESS.md demotes to a values-free pointer table per GL-013 ("Hermes is judgment, not a brain") — each offer's facts live in its Library MAP; BUSINESS.md becomes offer-name → wikilink rows only.
- Remaining PKM: `me.md` (flag for Alyssa's review-then-promote), `taste-log.md`/`yes-pattern.md` → Studio/Analysis; `.user.yaml` → stays at a path AGENTS.md's Personalization section is updated to match (root `.user.yaml` is cleanest); `Documents/` (empty scaffold) → decision for Alyssa; then retire `PKM/` with a MOVED stub.
- Leave MOVED stubs everywhere per the established pattern; update VAULT-MAP.

### Step 3 — Validation (before telling Alyssa it's done)
**Retrieval gauntlet:** 10 questions, asked of a FRESH agent with only VAULT-MAP as its starting point, scored on correct answer + correct canonical citation + zero files created. Suggested set: BOH price + canonical source; the real carousel that pitched Pin Planner; what Alyssa actually said about slow marketing (journal citation); where a new AI voice-analysis belongs; where her raw Telegram drops land; which file owns the weekly pitch state; is [some analysis file] trusted source or opinion and how do you know; where do approved drafts live; what's the chat word for [current offer] and its source; where does a killed concept go. Run once against tag `pilot-b-content` (checkout in a worktree or answer from the old VAULT-MAP) and once against HEAD — report both scores.
**Stranger test:** spawn one cold agent with zero briefing beyond "work in this vault": give it a real small task (e.g., "file an analysis of the three latest journal entries' recurring theme"). Pass = navigates by maps, writes to the correct Studio desk, links to Notebook sources without editing them, creates no duplicates, cites only existing files.
Write both results into `Deliverables/2026-07-10-validation-results.md` with real wikilinks.

### Step 4 — Wrap
Commit + tag `library-live`. Update the vault-restructure memory. Session log per SOP-011 (including the GL-013 check). Report to Alyssa: scores, what moved, the honest remaining list (Deliverables drain via patrol; Hermes folder move = still optional/parked; inbox-zero co-processing session; Notebook/Todos design session — both together-sessions with her).

## Guardrails
- Never edit her words. Never promote into Library yourself — flag promotion candidates.
- Agents in disjoint lanes; commit only when no agent is mid-write (a `git add -A` during a live agent write corrupted an index once — stage when quiet).
- Every move: git mv, sweep live refs only (dated Deliverables/session-logs/tasks stay), MOVED stubs, verify by grep + running the actual scripts, THEN commit + tag.
- If verification fails, roll back to the last tag and report what blocked — never leave the vault half-moved.
- OneDrive: pause syncing before the big `git mv` batches, resume after.

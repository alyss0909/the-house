---
title: The House — Restructure Master Execution Plan
date: 2026-07-09
owner: Larry
status: approved-direction, awaiting "go" per phase
inputs: "[[2026-07-09-vault-restructure-stress-test]], [[2026-07-09-vault-unified-theory]], VAULT-MAP.md draft, GL-013 draft"
---

# The House — Master Execution Plan

Locked decisions: Notebook / Studio / Library / Archive. Root renamed to `the-house`. Independence from the scaffold. Desks are spoken, not typed — folders are plain nouns (`Studio/Content`, `Studio/Voice`, `Studio/Team`, `Studio/Signals`, `Studio/Automations`). Projects are dated folders inside their desk. House rule: "Map first. Notebook is mine. Studio is opinion. Library is earned. Link everything."

Every phase ends with: reconciliation logged, one clean weekly review before the next phase starts. Git tag before every phase that moves files.

---

## Phase 0 — Constitution and maps (prose only, nothing moves)

**Larry does directly** (system wiring — each doc shown to Alyssa before flipping Active):
1. Rework GL-013 into the constitution: one home per fact, the birthplace rule (new work happens at its desk's dated project folder, never a new root/sprint folder), the write-locks (Notebook = Penn-capture only; Library = promotion only), the connection doctrine, analysis-is-opinion rule, Hermes-is-judgment-not-facts clause.
2. Finalize VAULT-MAP.md (house rule as line one, new names, transition table, read order, connection doctrine).
3. Update AGENTS.md: add "load VAULT-MAP first" to every session bootstrap, add the house rule, mark scaffold independence.
4. Write the three place-maps: Notebook/MAP, Studio/MAP, Library/MAP — as drafts pointing at current physical paths.
5. Add the GL-013 checks to SOP-011 (session close) and WS-006 (weekly lint: facts outside their home, citations to nonexistent files, orphan files with no wikilinks, non-Penn writes into raw territory).

**Dispatched to subagents:**
- **Silas**: add `source_class` (raw / derived / facts / map / output / task) and `promoted_by`/`promoted_date` to GL-002 schemas and Templates; plan the frontmatter backfill (execute in later phases).
- **Nolan**: draft the re-education addendum for every `.claude/agents/*.md` and `Team/*/AGENTS.md` — the house rule, read order, connection doctrine, write-locks — one consistent block, applied to all contracts.
- **General worker**: root-cause cleanup task — merge the five calendar copies into [[Hermes/MAP]] §3, resolve the two ghost references (CALENDAR.md, PITCH.md), strip re-typed prices to wikilinks, demote [[Hermes/BUSINESS]] to a values-free pointer table, repoint the 25 offer "Facts:" lines to the offers themselves.

Gate: Alyssa reads GL-013 + VAULT-MAP, says go. Then agents are REQUIRED to load VAULT-MAP first.

## Phase 1 — The root rename (one careful evening, everything at once)

Rename `mypka-scaffold-latest (2)` → `the-house`. This breaks machine-level things, so it is one atomic checklist:
1. Git tag. Pause OneDrive. Close Obsidian.
2. Rename folder. Reopen vault in Obsidian (re-register vault path).
3. **Mack**: reinstall Telegram Windows service (absolute script path), re-register Meetily scheduled task, verify Instagram saves engine write targets, update `telegram-service-install.ps1` and `meetily-weekly-launcher.ps1` absolute paths, fix `import_idea_pantry.py` absolute path, prune `.claude/settings.local.json` dead entries.
4. Larry: migrate Claude Code project memory to the new path key (memory directory is keyed to folder path — copy memory files + MEMORY.md to the new project's memory directory).
5. Verify: send a Telegram test message; run `parser-check.mjs`; run `validation-script.sh`; open dashboard; confirm memory loads in a fresh session.

## Phase 2 — Pilot A: Signals desk (first physical move, low risk)

- `git mv` `PKM/Signals` + `PKM/Developing Ideas` → `Studio/Signals/`.
- **Silas**: path sweep (AGENTS.md sweep section, SOP-013, WS-006, Hermes MAP pointer), redirect stubs at old paths, frontmatter backfill for moved files.
- Verify: run a real semantic sweep end to end.

## Phase 3 — Pilot B: Content desk (the big one — weekend, between pitch weeks)

Scope: `Team Inbox/pitches/*` + `dashboard/*` → `Studio/Content/`; raw `Team Inbox` remainder → `Notebook/Inbox/` (per-file triage — grocery lists to product visions get sorted, `_Processed`/`_archive` → Archive); `Team Knowledge/Automations` + `scripts` → `Studio/Automations/` (with service/task re-registration again).

**Merged in from the Bitter Lesson audit ([[2026-07-09-bitter-lesson-harness-upgrade]]):** because this phase already touches [[Studio/Content/dashboard/PIPELINE-CONTRACT]] and `advance-watch.mjs`, loosen them in the SAME pass instead of moving-then-rewriting. Recast the contract as semantic (newest sheet = state machine, each post at one of four stages, Alyssa's mark advances it) rather than exact-string; replace the parser's role with a model read of the sheet; delete the duplicated `arcPrompt`/`draftPrompt` from the JS and have /loop point makers at their own contracts; move cycle-specific facts (chat word, banned CTAs) to their one home. Keep a thin mechanical detector only if the Obsidian dashboard truly needs exact headers to render.
- **Mack**: the two watcher scripts, telegram bot write target, loop.md shell command.
- **Silas**: 7 dashboard DataviewJS paths, 5 maker agent shims (suki, cass, angus, reeve, hermes pitch references), PIPELINE-CONTRACT, GL-010/011/012, WS-011, SOP-033–038, WS-004/GL-005 rewrite for the new Inbox.
- **Suki**: writes `Studio/Content/MAP.md` (the job card) and blesses the new layout for the makers.
- Verify: parser-check green, dashboard renders the sheet, Telegram message lands in Notebook/Inbox, /loop --once finds the sheet, each maker dry-loads its files.

## Phase 4 — Notebook (her territory moves home)

- `PKM/Journal` → `Notebook/Journal`; `PKM/My Life` (minus Offers) + `PKM/CRM` → `Notebook/Life`; `PKM/Images` → `Notebook/Images`; `PKM/Documents` decision deferred (empty); `PKM/.user.yaml` relocated deliberately; define `Notebook/Drafts` (her half-finished work) and `Notebook/Todos` once she shows where todos live today.
- **Silas**: sweep WS-001/002, SOP-003/009/010/013, GL-002/009, penn.md, hermes.md; vault-wide grep for baked old-path wikilinks; fix the stale Journal INDEX (replaced by Notebook/MAP).
- **Penn**: confirms capture flow end to end with a real drop.

## Phase 5 — Library (the shelf assembles)

- `PKM/Second Brain/examples` + `programs` → `Library/`; Offers merge: one folder per offer under `Library/Offers/<offer>/` (facts file + program + sales pages + emails + examples + MAP), built from `My Life/Offers` + `Second Brain/programs` + related examples.
- `PKM/Second Brain/analysis|frameworks|templates` → `Studio/Analysis/`.
- **Hermes rewrite is the gate**: SOURCES.md + MAP.md repointed, then one supervised real write (a Simmer + a carousel draft) through Mean Alyssa before old paths get stubbed.
- **Suki**: `Library/Offers/MAP.md` with funnel pairings and the no-CTA list.
- Promotion protocol goes live: first promotions = me.md (after her review) and the instagram-craft-foundation deliverable (pinned maker load).

## Phase 6 — Drain and demolish (ongoing, no deadline pressure)

- Deliverables drains file by file through reconciliation fates; then the folder is deleted.
- `Team` + `Team Knowledge` → `Studio/Team` (only when everything else is stable — the validator, service paths, and SOP mesh move in lockstep). Hermes → `Studio/Voice` same rules. These are the last moves because they are the most wired and the least visible to Alyssa.
- Wren's folder dismantled (station demolition on retirement becomes standing policy, wired into SOP-001's retirement path).
- `Mini Notes` and `tmp` deleted; `website`, `lead-magnet-system`, `scripts`, `_system`, `Expansions`, `node_modules` → `_machine/` (hidden from Obsidian view).

## The durable-vs-method test (applied to every doc we write)

From the Bitter Lesson audit. Before writing any line of GL-013, a map, or an updated SOP, check: is it a goal, fact, taste call, or gate? Then write it permanent and tight. Is it method — a format, an order, a file count, a token budget? Then write it as a dated default with an escape hatch, and note which limitation motivated it so it visibly expires when that limitation dies. Never write a parser where a reader will do. The Bitter Lesson audit's own phases (loosen GL-007, ladder-becomes-default, slim the SOP surface, date-stamp environment facts) run as a parallel track after the restructure's Phase 3; they are not blocked by it, and Phase 3 already absorbs its highest-ROI piece.

## Standing verification (every phase)

parser-check green · validator green · Telegram lands · dashboard renders · zero old-path hits in new session logs for one weekly review · no non-Penn writes in Notebook · no unstamped derived files in Library · no orphan files created.

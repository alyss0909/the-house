---
title: The House — Wrap-Up Assessment & Maintenance Plan
date: 2026-07-10
owner: Larry (Fable synthesis)
source_class: output
status: for-alyssa
---

# The House — where we actually are

The honest state of the restructure, what keeps it clean forever, and the short list that's yours. Every file mentioned is a clickable link.

## Done and verified

- **The constitution is law.** [[GL-013-the-house-rules]] is active with your requested-edit exception; [[VAULT-MAP]] is the mandatory first load for every agent, and all 37 agent contracts carry the house rules.
- **Notebook is home.** Your Journal (544 files), Life, CRM, and Images live in `Notebook/` — moved, never edited. The zone map: [[Notebook/MAP|Notebook map]].
- **Studio is real.** The Signals desk ([[Studio/Signals/signals-index|signals index]]) and now the whole Content desk live in `Studio/` — pitch sheets, taste ledger, briefs, and the dashboard all at `Studio/Content/`. The dashboard's watcher and parser were repointed and pass every check, and the auto-advance loop finds the live W30 sheet. The zone map: [[Studio/MAP|Studio map]].
- **Library exists** with its map ([[Library/MAP|Library map]]) — the shelf assembles in the next phase.
- **30 broken links repaired** across your Notebook and Second Brain (paths only, your words untouched).
- **Secrets are out of the vault.** The Telegram token lives at `C:\Users\accol\.config\telegram-capture\`; the bot was health-checked and is running. Instagram and Meetily run and point at the new house.
- **The sidebar is yours again.** Three colored zones (✎ Notebook, ❖ Studio, ❋ Library), machine folders hidden, maps inside their zones, `tmp` and the empty `Mini Notes` gone.
- **Cleanliness has a patrol.** [[SOP-039-house-keeping]] — written at Fable depth, runnable by any model: 8 mechanical checks every weekly review, 6 deeper ones monthly. This is what makes the reorganization permanent instead of a one-time cleanup.

## Remaining (in order, none urgent)

1. **The Library phase** — the one big move left. Second Brain splits (examples/programs → `Library/`, analysis/frameworks/templates → `Studio/Analysis/`), Offers merge into one home per offer, and Hermes's source-loading gets rewritten. This ends with a supervised write-test: Hermes writes a Simmer and a carousel draft, you read them, and only your "still sounds like me" makes it final. This is the one we do together.
2. **Team Inbox split** — raw drops → `Notebook/Inbox/` (one-line change in the Telegram bot rides along). Quick, low-risk.
3. **Ready-queue decision** — the audit ([[2026-07-10-ready-queue-audit]]) found real redundancy and stale statuses. Version A: clean it and keep it. Version B (Silas's pick): dissolve it into the task system and retire the file. Your call.
4. **Deliverables drain** — ongoing, five files a month via the maintenance patrol, until the folder retires.
5. **Hermes and the Team tree into Studio** — last, optional, only if the aliasing ever bothers anyone. Default: leave them.

## How it stays clean (the part you asked for)

[[SOP-039-house-keeping]] runs inside the reviews that already happen — no new ritual for you. Weekly: write-lock check on your Notebook, stamp check on the Library, fact-drift lint, dead-link scan, orphan scan, desk hygiene, task truth, automation pulse. Monthly: map-vs-disk truth check, redirect-stub retirement, retired-agent sweep, Deliverables drain, secret scan. Every check is a grep with a prescribed fix; anything needing judgment gets flagged to you, never improvised. Entropy gets caught while it's one file, not one hundred.

## Yours, whenever

- **Notekeeper plugin:** change its notes folder from `PKM/Journal` to `Notebook/Journal` (or tell me to edit the config).
- **Ready-queue:** read the audit, pick A or B.
- **Old duplicate Telegram task** (`myPKA - Telegram Capture Bot`): delete from an admin Task Scheduler whenever — redundant, disabled, harmless.
- **Git to GitHub?** Local snapshots + the backup zip protect you today; a private GitHub repo would add off-machine backup but puts your journal on their servers. Decide anytime.
- **Backburner tasks filed:** [[tsk-2026-07-10-001-delivery-and-clickable-wikilinks|clickable links everywhere]], [[tsk-2026-07-10-002-obsidian-back-button-scrollbars|back button + scrollbars]], [[tsk-2026-07-10-003-note-app-readability|note-app readability]].

## Rollback points

`pre-restructure-2026-07-09` → `phase0-live` → `pilot-a-signals` → `phase2-notebook` → `pilot-b-content` (now). Plus the zip at `C:\vault-backups\`.

The house rule, one more time, because it's now true in the geography and not just on paper: **Map first. Notebook is mine. Studio is opinion. Library is earned. Link everything.**

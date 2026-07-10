# Vault Automation Opportunity Report - Source-Trust Metabolism Applied

## Executive diagnosis

The vault does not mainly need more automation. It needs automation that prevents the team from creating more unreconciled knowledge.

The core failure pattern is now clear: big build sessions produce useful outputs, but those outputs often remain as reports, gates, handoffs, or partial plans. They do not reliably update source maps, tasks, Hermes learning, Ready Queue, weekly/monthly intelligence, or archive/delete decisions. Alyssa then has to inspect the system instead of trusting it.

The fix implemented today changes the automation target. Automations should not create more reports. They should help Larry, Silas, Hermes, Mack, and Nolan run the existing metabolism path:

1. Read what changed.
2. Classify artifacts as source, map, derived, output, or task.
3. Run Mean Alyssa before asking, promoting, or claiming a gap.
4. Give each artifact a fate: `promoted`, `referenced`, `dispatched`, `archived`, `deleted`, or `needs-Alyssa`.
5. Roll daily metabolism into weekly `Grand metabolism`.
6. Let monthly intelligence read the weekly rollup instead of raw chaos.

## What changed in the vault

- Root [[AGENTS]] now defines source boundaries, the Versions Rule, and Daily Knowledge Metabolism.
- Larry's contract now requires daily metabolism during close-session for active build days.
- `SOP-011-write-session-log` now has a required `## Daily knowledge metabolism` section.
- `WS-006-weekly-review` now has `Phase 5 - Grand Metabolism`.
- `WS-007` and `WS-009` now read weekly `Grand metabolism` instead of reopening raw session chaos.
- `SOP-013-semantic-sweep` now checks source boundaries and Mean Alyssa before creating/feeding garden, Ready Queue, or Hermes learning.
- `WS-008-content-activation` now requires Mean Alyssa/source-boundary checks before dispatch.
- `GL-009-source-boundaries-and-promotion` is active and indexed.
- [[Hermes/MEAN-ALYSSA]] is the rejection-trained trust gate.
- Silas owns source-boundary consolidation audits.
- Mack only automates after the manual metabolism path works once.
- Nolan audits whether contract changes reduce coordination instead of creating fake new managers.

## The 10 Automations Alyssa Should Consider Now

### 1. Close-Session Metabolism Assistant

**Problem:** Sessions end with outputs, not changed system state.

**Automation:** At close-session, gather today's touched files, Deliverables, session logs, Ready Queue rows, Hermes learning entries, tasks, and open loops. Pre-fill Larry's `## Daily knowledge metabolism` section.

**Why now:** This is the new operating center.

**Expected payoff:** Huge relief. Alyssa stops policing whether work turned into anything.

**Implementation path:** Mack builds a local script or Codex routine that scans modified files since session start, groups by artifact type, and prompts Larry for fate decisions.

**Owner:** Larry + Mack.

**Risk:** If it writes a report instead of forcing fates, it recreates the problem.

**First next action:** Run one manual close-session using the new section, then automate the input gathering only.

### 2. Artifact Fate Watchdog

**Problem:** Deliverables and reports become bloat when they have no fate.

**Automation:** Daily/weekly scan of new files in `Deliverables/`, session logs, and Hermes outputs. Flag anything older than 24-72 hours without a fate.

**Expected payoff:** Keeps the vault lighter after big build days.

**Implementation path:** Search new files, classify by folder, check for backlinks/task references/Ready Queue/Hermes learning/archive markers.

**Owner:** Silas + Larry; Mack schedules later.

**Risk:** False positives if fates are implicit. Fix by requiring explicit fate language in close-session.

**First next action:** Add fate table to the next close-session log.

### 3. Mean Alyssa Preflight Bot

**Problem:** The team asks Alyssa bad questions, invents gaps, or promotes generated nuance too early.

**Automation:** Before a task asks Alyssa, edits source-adjacent files, or dispatches Hermes, run a checklist from [[Hermes/MEAN-ALYSSA]].

**Expected payoff:** Fewer trust breaks and fewer interruptions.

**Implementation path:** A prompt macro or script loads [[Hermes/MEAN-ALYSSA]], `GL-009`, and relevant rejection corpus links, then returns `proceed`, `read-first`, `search-first`, `use-existing`, `archive-delete`, or `ask-Alyssa`.

**Owner:** Hermes + Larry.

**Risk:** If treated as a new manager, it adds drag. It must be a gate, not an approval queue.

**First next action:** Use it on the next BOH/email/Content OS decision.

### 4. Versions Rule Generator

**Problem:** Alyssa nitpicks when the team silently chooses taste/strategy for her.

**Automation:** Detect when a question is taste/strategy and force two options: A safer/source-close, B nuanced/higher-upside.

**Expected payoff:** Alyssa chooses at the right level instead of correcting hidden assumptions.

**Implementation path:** Add prompt wrapper to Larry/Hermes dispatch: if objective proof is unavailable, return two versions plus tradeoff.

**Owner:** Larry + Hermes.

**Risk:** Bad if used for clerical questions. If the answer is findable, search first.

**First next action:** Apply to next offer/CTA/content architecture decision.

### 5. Source Boundary Classifier

**Problem:** Generated analysis sits too close to Alyssa-original source.

**Automation:** Classify every new artifact as `source`, `map`, `derived`, `output`, or `task`.

**Expected payoff:** Protects trust in the Second Brain and wiki.

**Implementation path:** Silas audit script scans new files and folder locations, then flags mismatches, such as generated reports in source areas or source facts duplicated in outputs.

**Owner:** Silas.

**Risk:** Classification needs nuance. Do not auto-move Alyssa source.

**First next action:** Run manual audit on July 4-5 artifacts.

### 6. Ready Queue Movement Monitor

**Problem:** READY items can sit as "good ideas" instead of moving.

**Automation:** Daily/weekly scan: READY items must dispatch, become blocked with one blocker, or demote.

**Expected payoff:** Converts insight into production.

**Implementation path:** Parse `PKM/Second Brain/ready-queue.md`, identify READY/WAITING/DONE, and create Larry prompts for movement.

**Owner:** Larry + Hermes; Mack schedules later.

**Risk:** Dispatching without source readiness. Must run Mean Alyssa and WS-008 first.

**First next action:** Run monitor during next WS-006 Phase 3.

### 7. Hermes Learning Graduation Guard

**Problem:** Corrections either vanish or become bloated rules too quickly.

**Automation:** Monthly scan of [[Hermes/learning/inbox]] and related corrections. Only recurring, sourced patterns graduate.

**Expected payoff:** Hermes gets smarter without getting longer.

**Implementation path:** Count repeated correction patterns, link to rejection corpus, propose rule candidates in WS-009.

**Owner:** Hermes + Larry.

**Risk:** Over-graduating one-off taste moments.

**First next action:** Use July 5 rejection/failure corpus as first calibration set.

### 8. Index Promise Reconciler

**Problem:** INDEX files and routing tables promise files or tasks that disk does not support.

**Automation:** Compare INDEX/MAP/Ready Queue/task references against real files and wikilinks.

**Expected payoff:** Agents stop trusting stale maps.

**Implementation path:** Use `rg`/wikilink parser to find broken links, missing files, stale plan rows, and unindexed files.

**Owner:** Larry + Silas.

**Risk:** Auto-fixing content meaning. Only auto-fix structural drift.

**First next action:** Run against Hermes MAP, Team Knowledge indexes, Ready Queue, and July 4-5 Deliverables.

### 9. External Proof / Old Source Router

**Problem:** The team calls something a gap before searching where Alyssa expects proof to live.

**Automation:** When Mean Alyssa returns `search-first`, route to Pax for external gold standards or Mack for Google Drive/Notion/export access.

**Expected payoff:** Fewer fabricated frameworks, better research, less Alyssa source-policing.

**Implementation path:** Create a decision table: old internal source -> Mack/search connector; external benchmark -> Pax; vault source -> Larry/Silas.

**Owner:** Pax + Mack + Larry.

**Risk:** Requires connectors/source access. Until then, log exact missing source.

**First next action:** Use for Content OS/BOH/freebie proof gaps.

### 10. Weekly Grand Metabolism Scheduler

**Problem:** A day can be metabolized but the week still stays fragmented.

**Automation:** Schedule/run WS-006 with Phase 5 every week; make monthly reviews read that rollup.

**Expected payoff:** Weekly/monthly memory becomes actually usable.

**Implementation path:** Manual first, then Mack schedules a reminder or cron only after one validated run.

**Owner:** Larry + Mack.

**Risk:** If the weekly wrap is just narrative, it fails. It must say what changed, what was superseded, and what starts next.

**First next action:** Dry run WS-006 across July 4-5 after the next close-session.

## Research Angles For Easier Existing Solutions

Use these when researching external tools/patterns:

- "knowledge base governance generated content source of truth"
- "AI agent memory bloat prevention"
- "PKM source vs synthesis architecture"
- "Obsidian automated broken wikilink backlink audit"
- "daily review artifact lifecycle automation"
- "decision log artifact fate workflow"
- "content operations ready queue automation"
- "LLM critique agent rejection memory"
- "RAG source provenance gate"
- "knowledge graph stale index reconciliation"

Look especially for people solving:

- AI teams making too many summaries.
- Second brains where generated notes pollute original notes.
- Obsidian vaults with stale indexes and broken maps.
- Content teams where briefs do not turn into shipped assets.
- Agent systems that need adversarial critique before user review.

## Highest-Leverage Stack

If only three automations get built first:

1. **Close-Session Metabolism Assistant** - because every other routine depends on daily artifacts having fates.
2. **Mean Alyssa Preflight Bot** - because it prevents trust breaks before they create cleanup work.
3. **Index Promise Reconciler** - because stale maps make every agent dumber.

## Acceptance Test

This works only if, after a big build day, Alyssa can ask "what changed?" and get:

- what source/map/task/Ready Queue/Hermes item changed,
- what was superseded,
- what got archived or deleted,
- what needs her because it is truly her call,
- and what tomorrow starts with.

If the answer is "we wrote a report," the automation failed.

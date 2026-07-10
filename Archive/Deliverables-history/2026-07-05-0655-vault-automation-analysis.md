---
title: Vault Automation Opportunity Analysis
date: 2026-07-05
automation_id: deep-vault-automation-opportunity-analysis
owner: Larry
primary_specialist: Mack
status: complete
scope: analysis-only
---

# Vault Automation Opportunity Analysis

Larry routed this analysis through Mack's automation lens, with Silas-style structure checks where vault integrity affects reliability. No canonical PKM notes, SOPs, Guidelines, Workstreams, indexes, tasks, or queue files were modified during this run.

## Executive Read

Alyssa should not automate more "content ideas." The vault already has enough ideas, signals, examples, frameworks, launch angles, and product material. The highest-leverage automations now are loop closers:

1. Move raw captures through approval, filing, signal detection, and dispatch without leaving reports stranded in Deliverables.
2. Turn the Content OS from a master plan into a controlled weekly pilot.
3. Keep source truth, product facts, task status, links, and review cadences clean enough that the team can act without re-reading the entire vault.

The core pattern: Alyssa has built the intelligence layer. The next automation layer should reduce coordination load.

## Top 10 Automations To Build Now

### 1. Inbox Approval-to-Execution Runner

**Automation name:** Closing Shift Execution Runner

**Why now:** The July 4 inbox report already did the hard thinking, but the proposed routing still appears unexecuted. The Team Inbox still contains the July 1 "high-value thinking" capture and many older already-filed or duplicate captures. This is exactly the gap WS-004 was redesigned to prevent: triage happens, but the final filing/dispatch/cleanup step waits for another session.

**Source evidence:**
- [[Deliverables/2026-07-04-inbox-approval-report]] lists 31 top-level inbox files, 2 meeting pointer notes, 1 support image, and explicit approval points.
- [[Team Knowledge/Workstreams/WS-004-inbox-processing]] defines the approval table, Team brief column, and cleanup rules.
- [[Notebook/Inbox/2026-07-01-Most people are putting highvalue thinking into-trunc]] contains a fresh "asset infrastructure" thesis that should feed [[email-to-content-repurposing-system]], [[boh-as-permission-not-product]], and the Content OS.
- [[PKM/Second Brain/taste-log]] says approvals were not being converted into assignments, which is the Content Activation gap.

**Expected payoff:** Captures stop dying in the inbox. Strategic notes become Journal entries, signals, Ready Queue briefs, or task updates while the context is still live. This is small recurring work with high compounding value.

**Rough implementation path:**
1. Mack builds a scheduled runner that scans the latest `Deliverables/*inbox-approval-report.md`.
2. The runner extracts rows into an approval checklist for Alyssa, grouped by `file`, `proposed output`, and `decision needed`.
3. After Alyssa approves rows, Larry/Penn execute the approved actions via WS-004.
4. The runner writes a tiny completion report: filed, queued, discarded, still waiting.
5. Deletion remains gated by explicit approval.

**Owner/specialist:** Mack for the runner, Larry for orchestration, Penn for Journal filing, Wren/Charta for dispatched briefs.

**Dependency/risk:** Approval gate must stay intact. KeepSidian blob failures and "empty" image-backed notes mean the runner must never silently delete files.

**First next action:** Convert the July 4 inbox report into a one-screen approval checklist and ask Alyssa to approve or pass rows.

---

### 2. Content OS Week-1 Pilot Runner

**Automation name:** Content OS Pilot Batch Relay

**Why now:** The Content OS architecture and master plan are written, source research is done, and the system is explicitly awaiting Alyssa's go. The next move should not be more design. It should be one constrained pilot: Week 1 Email theme.

**Source evidence:**
- [[Deliverables/2026-07-05-content-os-master-plan]] defines the six-station pipeline and says Phase 2 starts after Alyssa says go.
- [[Deliverables/2026-07-05-content-os-architecture]] defines the relay: idea -> anchor -> variants -> packaging -> learning.
- [[Team Knowledge/content-os/calendar-spec]] says the monthly rotation is Email -> Pinterest -> BoH Systems -> Productivity and identifies documented gaps.
- [[Team Knowledge/content-os/product-index]] maps products to teachable snippets, pitch angles, gaps, and CTA discipline.
- [[systematize-socials]] names the operating goal: consistent content because there is a system behind it, not willpower.

**Expected payoff:** A single batch can generate a usable content stack from one idea: education carousel, offer carousel, For The Girls concept, Simmer/email variant, and pin layer. It turns the new intelligence architecture into output Alyssa can review.

**Rough implementation path:**
1. Scope to Week 1 Email only.
2. Test Kitchen proposes 4-6 divergent concepts from current signals and inbox captures.
3. Mean Alyssa critic rejects weak concepts using Hermes/TASTE/ANTI-AI and decoy calibration.
4. Sous Chef pulls one real teaching point from BOH/product source material.
5. Hermes writes only after mandatory full source loading.
6. The Pass packages the output as a Notion-ready batch spec, but live Notion/Canva wiring waits until the pilot passes.

**Owner/specialist:** Larry orchestrates. Hermes/Wren write. Mack later wires Notion, ManyChat, and packaging. Charta handles design handoff when copy survives.

**Dependency/risk:** Do not build the full machine before the pilot passes. Missing day anchors, chat words, price conflicts, and gold standards are known blockers.

**First next action:** Ask Alyssa for a go/no-go on the master plan and permission to run one Week 1 Email pilot using existing gold standards where possible.

---

### 3. Product and CTA Source-Truth Sync

**Automation name:** Product Facts and Chat-Word Verifier

**Why now:** Content OS cannot safely run live CTA copy while product facts are split across Notion, Hermes/BUSINESS, Offers notes, and current plans. The Content OS master plan explicitly lists 13 manual chat words, two price conflicts, and the cold-list ladder as blockers.

**Source evidence:**
- [[Deliverables/2026-07-05-content-os-master-plan]] lists chat words, price conflicts, and product ladder clarification in the unblock list.
- [[Team Knowledge/content-os/product-index]] says blank chat words must be written as "manual selection needed" and never invented.
- [[Hermes/MEMORY]] tracks 13 missing chat words, Rush Order not pitchable, and price conflicts for Quarter in a Day and CEO Year Planner.
- [[rush-order]] is idea-stage and not yet pitchable.
- [[back-of-house]] is live at $3,000 and links to [[spring-26-launch]].

**Expected payoff:** Prevents wrong prices, invented CTAs, and product cannibalization. Unlocks automated content production without creating revenue-risk errors.

**Rough implementation path:**
1. Mack connects to the Notion Products DB or receives a CSV/export.
2. Silas defines a volatile derived snapshot shape: product name, status, price, theme, URL, chat word, pitchability.
3. The verifier compares Notion against [[Hermes/BUSINESS]], `PKM/My Life/Offers/`, and Content OS files.
4. Output is a diff report: conflicts, missing chat words, non-pitchable products, stale local notes.
5. Nothing updates live copy without Alyssa approval.

**Owner/specialist:** Mack for Notion/API access, Silas for schema/diff shape, Larry for decisions, Hermes/Wren as consumers.

**Dependency/risk:** Notion is volatile and may be canonical for product facts. Credentials must not live in the vault. The verifier must distinguish "source of truth changed" from "old local note needs a link-only update."

**First next action:** Produce a one-time manual product facts diff from the current Notion snapshot and local Offers shelf before building the connector.

---

### 4. Ready Queue Dispatch Bot

**Automation name:** Ready Queue Dispatcher

**Why now:** The Ready Queue has several READY items and a high-priority Wren assignment, but Wren's memory still says first live task is pending. W27 said Wren and Charta were the active lanes. The queue exists; dispatch is the missing operational step.

**Source evidence:**
- [[PKM/Second Brain/ready-queue]] lists BOH Summer Launch Email Sequence as READY, Wren, Highest priority.
- [[PKM/Second Brain/ready-queue]] also lists Standing Wren Instruction: Email -> Carousel as READY.
- [[Team/Wren - Brand Voice Partner/memory]] says the first live calibration entry is still pending.
- [[Team Knowledge/Workstreams/WS-008-content-activation]] says READY queue items trigger dispatch.
- [[Team Knowledge/Weekly Reviews/2026/2026-W27-weekly-wrap]] names BOH Summer Launch Email Sequence as item #1 moving that week.

**Expected payoff:** Converts prepared creative briefs into deliverables without Alyssa managing the team. It also starts the live Wren calibration loop.

**Rough implementation path:**
1. Scheduled check reads `ready-queue.md`.
2. For each READY item, validate assignee, source links, deliverable format, and blockers.
3. If source material is present, create a dispatch packet under Deliverables or directly start the specialist task.
4. After output exists, surface one review item to Alyssa and update the queue status.
5. If blocked, surface one precise missing input.

**Owner/specialist:** Larry owns queue policy, Mack automates the check, Wren and Charta execute.

**Dependency/risk:** Some queue links are stale or old-path references. Charta item 6 is blocked on a Chrome/Instagram reference. BOH emails may need a launch date, but the first draft can likely proceed with "no date, just write it" if Alyssa approves.

**First next action:** Dispatch Ready Queue item 1 to Wren as a Deliverables draft request, using only the source list already in the queue.

---

### 5. Hermes Learning Distiller and Scheduler Guard

**Automation name:** Hermes Learning Loop Monitor

**Why now:** Hermes is now actively learning from scheduled deep reads, but the learning inbox contains unresolved contradiction questions. A scheduled task was also created for July 5-7 and should not quietly re-arm later. The voice system needs automation around guardrails, not more unattended rewriting.

**Source evidence:**
- [[Team Knowledge/session-logs/2026/07/2026-07-05-23-45_larry_hermes-deep-read-scheduling]] says two scheduled tasks were created for 4:00, 5:00, and 6:45 AM runs on July 5-7, with a note to disable/delete them after July 7.
- [[Hermes/LEARNING]] defines capture -> distill -> replace -> clear.
- [[Hermes/learning/inbox]] contains current contradiction/adjudication items for Alyssa.
- [[Hermes/learning/log]] records multiple distillation cycles and deep-read runs.
- [[Deliverables/2026-07-05-hermes-v2-handoff]] says Alyssa corrections outrank every rule.

**Expected payoff:** Hermes gets sharper without drifting or accumulating unresolved contradictions. Alyssa only sees the few decisions that actually need her taste.

**Rough implementation path:**
1. Mack schedules a guard job that checks deep-read runs, [[Hermes/learning/deep-reads/INDEX]], [[Hermes/learning/inbox]], and task status.
2. If inbox has unresolved contradictions, produce a compact adjudication sheet with 3-5 decisions max.
3. If the scheduled window has ended, prompt to disable/delete the tasks.
4. If distillation happens, log every changed file and rerun Hermes tests.
5. Never auto-overwrite a contradiction without Alyssa's answer.

**Owner/specialist:** Mack for scheduling and guard checks, Larry for adjudication summaries, Hermes/Wren as writing consumers.

**Dependency/risk:** Unattended scheduled tasks can create cost, drift, or stale rules. The job must not auto-promote every deep-read finding into a standing rule.

**First next action:** Generate a Hermes adjudication sheet from the current learning inbox and add a reminder to disable the July 5-7 deep-read tasks after the run window.

---

### 6. Vault Drift, Link, and Index Health Sweep

**Automation name:** Weekly Vault Integrity Sweep

**Why now:** A read-only link scan found 5,897 wikilinks and 843 unresolved candidates, though that count includes placeholders and relative links. More importantly, high-value files contain direct stale references, and the task index is visibly stale. This is the first automation Pax already recommended as the best pilot.

**Source evidence:**
- [[Deliverables/2026-06-04-claude-routines-automation-fit-report]] recommends Weekly Vault Formatting and Drift Sweep as the first pilot.
- [[Team Knowledge/tasks/INDEX]] says summary Open: 13, section Open: 15, while the `open/` folder contains more open task files plus an example task.
- [[PKM/Developing Ideas/email-to-content-repurposing-system]] references `PKM/Second Brain/analysis/carousel-analysis.md`, while the current file is [[Studio/Analysis/carousel]].
- [[Team/Wren - Brand Voice Partner/memory]] also references `PKM/Second Brain/analysis/carousel-analysis.md`.
- [[Team Knowledge/Guidelines/GL-002-frontmatter-conventions]] requires structured frontmatter discipline for queryability.

**Expected payoff:** Keeps the vault usable as a source-grounded system. Prevents Wren/Hermes/Larry from loading wrong or missing context.

**Rough implementation path:**
1. Build a vault-aware link checker that understands aliases, headings, relative links, paths with spaces, placeholders, and folder links.
2. Produce categories: real broken link, stale rename, placeholder/example, folder reference, external/path reference.
3. Add task index freshness check and INDEX membership check.
4. First month is report-only.
5. Later, safe structural fixes can be auto-applied by Larry when the target is unambiguous.

**Owner/specialist:** Silas for schema/link audit shape, Larry for librarian policy, Mack for scheduled runner.

**Dependency/risk:** False positives are likely unless the checker understands Obsidian syntax. Do not use the 843 candidate count as a defect count until classified.

**First next action:** Build a report-only vault integrity prototype and run it against Second Brain, Developing Ideas, Tasks, and Team Knowledge first.

---

### 7. Task Index and Open-Loop Reconciler

**Automation name:** Open Loop Reconciler

**Why now:** The task index is out of date and the open folder contains stale or resolved work, including open review tasks for systems that are already active. Several tasks due June 4-11 remain open on July 5. Larry's own boot protocol expects this layer to be accurate.

**Source evidence:**
- [[Team Knowledge/tasks/INDEX]] reports inconsistent open counts and last rebuilt `2026-06-05T00:00:00Z`.
- `Team Knowledge/tasks/open/` contains later open tasks from June 26 that do not appear in the visible index summary.
- [[tsk-2026-06-05-001-review-semantic-sweep-and-approve]] remains open while [[SOP-013-semantic-sweep]] and [[PKM/Signals/signals-index]] are already active.
- [[tsk-2026-06-04-001-review-claude-routines-automation-report]] remains open despite this analysis now elevating several recommendations.
- [[Team/Larry - Orchestrator/AGENTS]] says Larry reads the task index at session boot and rebuilds it if stale.

**Expected payoff:** Reduces re-entry friction. Daily Pulse, HOME/dashboard work, weekly reviews, and automation selection stop relying on stale task metadata.

**Rough implementation path:**
1. Runner checks `Team Knowledge/tasks/INDEX.md` mtime against newest `tsk-*.md`.
2. If stale, rebuild via SOP-008 or produce a rebuild-needed alert.
3. Compare folder location to frontmatter status.
4. Flag overdue, blocked, example, and likely-resolved tasks.
5. Produce a close/keep/rewrite recommendation list for Alyssa, not silent closure.

**Owner/specialist:** Larry owns task governance, Mack schedules, Silas can parse frontmatter.

**Dependency/risk:** Some tasks are Alyssa-owned decisions and should not be auto-closed just because they are old. The first version should reconcile, not decide.

**First next action:** Run a task index freshness report and generate a close-candidate list grouped by "needs Alyssa," "needs Mack," and "likely stale."

---

### 8. Capture Pipe Health and Completion Dashboard

**Automation name:** Capture Connector Health Board

**Why now:** The vault already contains several partially built capture/import tools: Telegram, Meetily, Converter Pack, and Slack. Finishing existing pipes has higher payoff than adding a new one.

**Source evidence:**
- [[tsk-2026-06-01-004-telegram-claude-automation]] says Telegram MVP and service installer exist, with final token regeneration/test remaining.
- `Team Knowledge/scripts/telegram-capture-mvp.py` writes Telegram messages into Team Inbox.
- `Team Knowledge/Automations/telegram-service-install.ps1` exists for startup registration.
- [[tsk-2026-06-02-001-automate-meetily-capture-inbox]] defines the Meetily pointer goal.
- [[tsk-2026-06-03-004-google-calendar-api-setup]] and [[tsk-2026-06-03-005-meetily-first-oauth-run]] are still open.
- [[tsk-2026-06-26-001-converter-pack-runtime-install]] and [[tsk-2026-06-26-002-slack-expansion-token-wiring]] are open.
- [[Expansions/INDEX]] shows Converter and Slack installed but requiring runtime/token setup.

**Expected payoff:** Reliable capture from Telegram, meetings, audio/video/transcripts, files, and Slack. This feeds Inbox Processing, Video Watcher, Content OS, and Second Brain without manual path pasting.

**Rough implementation path:**
1. Build a read-only dashboard of connector status: installed, token present, health check, last successful capture, next user action.
2. Complete Telegram first: regenerate token, health check, service install, one live message.
3. Complete Meetily second: Google credentials, OAuth run, pointer generation.
4. Install Converter Pack runtime when a transcription/extraction job appears.
5. Slack remains parked until Alyssa is ready to provide tokens.

**Owner/specialist:** Mack.

**Dependency/risk:** Admin privileges, local credentials, Google OAuth, Slack tokens, and Whisper model size all require explicit user action. Tokens never go in canonical notes.

**First next action:** Produce a one-page connector health board with "next physical action" for each pipe.

---

### 9. Monthly Intelligence and Review Nudge

**Automation name:** Monthly Intelligence Watchdog

**Why now:** Weekly review infrastructure exists, but there are no monthly review outputs in `Team Knowledge/Monthly Reviews/` yet. The current date is July 5, 2026, so June is eligible for a monthly wrap/intelligence pass. WS-007 and WS-009 exist, but the run has not materialized.

**Source evidence:**
- `Team Knowledge/Monthly Reviews/` contains README/template files but no monthly wrap files.
- [[Team Knowledge/Workstreams/WS-007-monthly-review]] and [[Team Knowledge/Workstreams/WS-009-monthly-intelligence-update]] define the monthly layer.
- [[Team Knowledge/Weekly Reviews/2026/2026-W22-weekly-wrap]], [[Team Knowledge/Weekly Reviews/2026/2026-W23-weekly-wrap]], and [[Team Knowledge/Weekly Reviews/2026/2026-W27-weekly-wrap]] exist, but the month-level rollup is absent.
- [[SOP-013-semantic-sweep]] says monthly deep sweep should update signals, voice loop, and taste loop.
- [[PKM/Second Brain/yes-pattern]] says the next update is July 27, but the monthly review layer should still catch June learning.

**Expected payoff:** Prevents weekly insights from becoming stranded. Updates Signals, Developing Ideas, yes-pattern, and Wren/Hermes calibration at the right cadence.

**Rough implementation path:**
1. Watch for missing monthly wrap after the first day of a new month.
2. If missing, generate an inbox item or run the monthly review if Alyssa has authorized it.
3. Read weekly wraps only, per WS-007, and note missing weekly coverage rather than rereading every raw session log.
4. Run WS-009 for intelligence updates.
5. Surface exactly one decision for Alyssa.

**Owner/specialist:** Larry.

**Dependency/risk:** Weekly coverage is incomplete for June, so the first monthly run may need a "missing weeks" note. Do not turn monthly review into raw-session-log archaeology unless explicitly needed.

**First next action:** Create a June monthly-review readiness report from existing weekly wraps and name what is missing before running WS-007/WS-009.

---

### 10. Listening, Research, and Video Watcher Intake

**Automation name:** Signal Listener and Video Watcher

**Why now:** The inbox contains URLs, embeds, trend reports, Instagram references, and business/content inspiration. The Converter Pack is installed but not runtime-ready. Pax already recommended a merged listening/research aggregator and manual Video Watcher. This is the research intake side of Content OS.

**Source evidence:**
- [[Deliverables/2026-06-04-claude-routines-automation-fit-report]] recommends Listening and Research Aggregator plus Video Watcher.
- [[Notebook/Inbox/2026-07-01-slowly viral embed]] contains a Descript embed that should become source material, not sit as raw HTML.
- [[Notebook/Inbox/2026-07-01-Use for email and post inspo]] is a B-DOW email example link.
- [[Notebook/Inbox/2026-06-29-Stills_2026_Design_Trend_Report.pdf]] is a design trend report pointer.
- [[Team Knowledge/Workstreams/WS-004-inbox-processing]] defines `read + synthesize` and `evaluate` tiers.
- [[tsk-2026-06-26-001-converter-pack-runtime-install]] would unlock transcription, URL extraction, OCR, and conversion utilities.

**Expected payoff:** Saved research and video inputs become summaries, claims, examples, frameworks, source links, and content activation opportunities. This prevents "saved useful thing" from becoming another raw pile.

**Rough implementation path:**
1. Start manual: Alyssa drops a URL/video/transcript/PDF and invokes Video Watcher.
2. Pax extracts thesis, claims, frameworks, examples, usable language, verification needs, and possible outputs.
3. Mack only fetches/transcribes when needed.
4. Silas/Penn file the resulting note through WS-004/WS-001 rules.
5. Later, schedule a weekly listener across approved sources.

**Owner/specialist:** Pax for synthesis, Mack for fetch/transcription, Penn/Silas for filing shape, Larry for routing.

**Dependency/risk:** External content may require verification before public use. Copyright/source boundaries matter. Do not train Hermes/Wren on random external writing as if it were Alyssa.

**First next action:** Pilot Video Watcher on the July 1 Descript/Slowly Viral embed or the B-DOW email examples link, then decide whether to schedule.

## Recent Active Projects

- **Content OS / Hermes:** Active and most recent. Master plan and architecture are awaiting Alyssa approval: [[2026-07-05-content-os-master-plan]], [[2026-07-05-content-os-architecture]], [[Hermes/README]], [[Hermes/learning/log]].
- **BOH summer launch:** Active launch material exists across [[middle-ground-entrepreneur]], [[boh-as-permission-not-product]], [[PKM/Second Brain/ready-queue]], [[spring-26-launch]], and [[back-of-house]].
- **Second Brain:** Usable but still evolving. COMPASS is live, examples/frameworks exist, and some gaps remain: [[PKM/Second Brain/COMPASS]], [[PKM/Second Brain/BUILD-PLAN]], [[PKM/Second Brain/examples/INDEX]], [[PKM/Second Brain/frameworks/INDEX]].
- **Systematize Socials:** Active operating goal and likely home for Content OS execution: [[systematize-socials]].
- **Rush Order:** Idea-stage BOH upsell with copy and offer notes but unresolved placement, checkout, onboarding, and payment decisions: [[rush-order]], [[tsk-2026-06-03-001-build-rush-order]].
- **Capture/connectors:** Telegram, Meetily, Converter, and Slack are partially installed or blocked by final user/admin/token actions.
- **Editor in Residence website:** IDX research and homepage mood board remain open: [[tsk-2026-06-03-002-idx-platform-research]], [[tsk-2026-06-03-003-homepage-mood-board]].
- **Notion Templates / offer shelf:** Current product catalog is being used by Content OS and has source-truth gaps: [[notion-templates]], [[Team Knowledge/content-os/product-index]].

## Major Open Loops

- Content OS master plan awaits Alyssa approval before Phase 2 build.
- BOH Summer Launch Email Sequence is READY but not visibly delivered.
- Ready Queue has multiple READY items and one BLOCKED visual reference item.
- July 4 inbox approval report has not been executed into Journal/Signals/Ready Queue cleanup.
- Telegram capture needs final token regeneration, final test, and service registration.
- Meetily needs Google Calendar API credential setup and first OAuth run.
- Converter Pack runtime and Slack tokens remain unwired.
- Hermes deep-read scheduled tasks need monitoring and post-window disable/delete check.
- Hermes learning inbox contains unresolved Alyssa adjudications.
- Product/CTA source truth has manual chat words, price conflicts, and ladder overlap.
- June monthly review/intelligence output is absent.
- Task index is stale/inconsistent.
- SOP-013 approval review task remains open while SOP-013 is already active.
- Notion framework vault imports are still pending.
- Voice profile/gap interview task remains open, though Hermes now quarantines some older voice-profile claims as non-authoritative.

## SOP and Workstream Gaps

- **No WS for Content OS production.** Current plans live in Deliverables and `Team Knowledge/content-os/`, but no canonical workstream exists for the batch relay yet.
- **No implemented vault drift automation.** Pax recommended it, and Larry has librarian duties, but there is no scheduled vault-aware link/index/frontmatter report.
- **No task reconciliation automation.** SOP-008 exists, but the task index is still stale.
- **No connector health workstream.** Each connector has tasks/scripts, but no single board says what is live, broken, waiting, or parked.
- **No monthly review watchdog.** WS-007/WS-009 exist but have not produced a June monthly wrap.
- **No formal Hermes learning operations SOP.** Hermes has LEARNING.md, but the vault team does not yet have a Mack/Larry routine for scheduled-run health, adjudication sheets, and post-window cleanup.
- **No product fact sync SOP.** Content OS depends on volatile Notion facts, but there is no routine for verifying prices, chat words, status, and pitchability.

## Problems Discovered

- The task index is stale and internally inconsistent.
- A naive link scan produced 843 unresolved candidates out of 5,897 wikilinks. This includes placeholders and relative links, so it is not a clean defect count, but it proves the need for a vault-aware checker.
- High-value notes contain stale Second Brain path references, including `carousel-analysis.md` where the current file appears to be [[Studio/Analysis/carousel]].
- Canonical project notes are thinner than active planning files. Example: [[spring-26-launch]] and [[blog-and-pin]] are mostly shells while live strategy is in Deliverables, Ready Queue, Hermes, and Developing Ideas.
- Some approval tasks trail the system state. Example: semantic sweep approval is open while the sweep layer is already active.
- Team Inbox contains new strategic captures and older approval-remnant files. Filing and cleanup lag behind triage.
- Monthly reviews have templates and workstreams but no actual monthly output yet.
- Source truth is split across Second Brain, Hermes, Offers notes, Notion snapshots, Deliverables, and Ready Queue.

## Notes and Queue Items Left Open

- **Ready Queue:** BOH Summer Launch Email Sequence, Email -> Carousel standing brief, Hook Framework -> Carousel Brief, Wikilink Audit, Launch Visual Palette, and "You Get What You Get" hook are READY. Launch Carousel recreation is BLOCKED on the visual reference.
- **Team Inbox:** July 1 asset-infrastructure thesis, Slowly Viral embed, B-DOW email/post inspo, Meta ads terms, boost-post links, design trend report, and Camila expectations note remain visible.
- **Hermes:** Learning inbox has multiple contradiction/adjudication questions. Deep-read runs are active/scheduled for July 5-7.
- **Tasks:** Telegram, Meetily, converter runtime, Slack token wiring, automation report review, semantic sweep review, voice profile review, Rush Order, Obsidian home page, and several project/design tasks remain open.
- **Monthly review:** No June monthly wrap/intelligence file exists yet.

## Highest-Leverage Order

1. **Inbox Approval-to-Execution Runner** because it unlocks raw material already waiting.
2. **Ready Queue Dispatcher** because BOH launch copy is ready to move.
3. **Product/CTA Source-Truth Sync** because Content OS cannot safely scale without exact offer facts.
4. **Content OS Week-1 Pilot Runner** after the source-truth gate is clear enough for a controlled pilot.
5. **Vault Drift and Task Reconciler** to keep the operating system trustworthy while output volume increases.

## Larry's Recommendation

Start with automation that closes existing loops, not automation that adds new inputs.

The best immediate sequence is:

1. Run the July 4 inbox approval checklist and execute approved rows.
2. Dispatch BOH Summer Launch Email Sequence to Wren.
3. Produce the product/CTA diff report.
4. Run one Week 1 Email Content OS pilot.
5. Put task/link/review health on a weekly watchdog.

This keeps Alyssa in decision mode only where her taste or business facts are truly required. Everything else becomes team-owned operating work.

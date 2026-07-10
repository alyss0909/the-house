# Vault Automation Analysis - 2026-07-06 06:55

Larry report. Analysis-only run. No canonical PKM, SOP, Guideline, Workstream, index, Ready Queue, or Hermes files were modified.

## Executive read

Alyssa should automate the control surfaces now, not add more creative machinery first.

The vault's strongest recent work is real: Hermes recovered from failed voice gates, the Content OS pilot produced six posts that survived blind lineups, the Second Brain is now the crown asset, and the source-trust metabolism model is in place. The problem is that the operational surfaces around that work are still manual: decisions are trapped in long sitting docs, product facts and chat words block CTAs, inbox items keep accumulating, review layers are behind, indexes drift, and generated deliverables can become stale before they are metabolized.

The highest-leverage automations are the ones that:

1. Turn Alyssa's decisions into small answerable queues.
2. Keep product facts, chat words, prices, and CTA truth synced.
3. Force every new artifact to get a fate.
4. Make reviews, inbox processing, Ready Queue movement, and Hermes learning happen on schedule.

## What changed since the previous automation run

- The prior report at [[Deliverables/2026-07-05-1514-vault-automation-opportunity-report]] correctly named source-trust metabolism as the operating center.
- Since then, Hermes and Content OS generated a live six-post sprint. The sprint close log says 6/6 posts survived lineups and points Alyssa to [[Deliverables/2026-07-06-sprint-sitting-doc]].
- The sprint sitting doc contains a 12-item Decisions Queue, with items 1, 2, and 5 blocking posts 1, 2, and 3 from shipping.
- [[Hermes/learning/inbox]] now contains multiple `needs Alyssa` rulings and contradictions from the sprint and scheduled deep reads.
- [[Team Inbox/]] is not clean. It contains root-level Keep exports from 2026-06-29 through 2026-07-01, two meeting capture pointers, old `_Processed` files, media, and KeepSidian logs.
- [[Team Knowledge/Workstreams/INDEX]] is stale. WS-008, WS-009, and WS-010 exist on disk and are actively referenced, but the index lists only WS-001 through WS-007.
- [[Team Knowledge/Monthly Reviews/]] has no June monthly wrap. The most recent weekly wrap is [[Team Knowledge/Weekly Reviews/2026/2026-W27-weekly-wrap]], dated 2026-06-29, before the July 4-6 Hermes and Content OS work.
- [[Team Knowledge/tasks/INDEX]] still lists 17 open tasks, including the urgent Second Brain task and several Mack-owned setup tasks that are one final credential/test step away from being useful.

## The 10 automations Alyssa should build now

### 1. Content OS Decision Queue Closer

**Why now:** The Content OS sprint produced six usable posts, but shipping is blocked by a scattered decision queue. Alyssa does not need another report. She needs a short, ordered react surface that routes each answer into the right place.

**Source evidence:**
- [[Deliverables/2026-07-06-sprint-sitting-doc]] lists 12 decisions, with items 1, 2, and 5 as hard blockers.
- [[Team Knowledge/session-logs/2026/07/2026-07-06-content-os-six-post-sprint-complete]] says the next step is for Alyssa to read the sitting doc, pick hooks/CTAs, and answer the queue by number.
- [[Hermes/learning/inbox]] has the three proposed brain rulings that map to decisions 10-12.

**Expected payoff:** Six sprint posts move from "excellent but waiting" to "ready for design/publishing." Alyssa spends 10 to 15 minutes making real calls instead of re-reading process history.

**Rough implementation path:**
- Parse sitting docs for `DECISIONS QUEUE`.
- Classify each item as `ship-blocker`, `quality-upgrade`, `brain-ruling`, `business-fact`, or `design-handoff`.
- Generate one compact answer form: number, default recommendation, what happens after answer.
- After Alyssa responds, route answers to the correct target: BUSINESS fact sync, Hermes learning adjudication, design handoff, post copy patch, or Ready Queue status.

**Owner/specialist:** Larry owns orchestration. Hermes owns copy/ruling implications. Mack can automate extraction once the manual form works once.

**Dependency/risk:** Do not auto-answer taste, product fact, price, or chat-word questions. The automation compresses decisions, it does not decide for Alyssa.

**First next action:** Make a one-page "Post Sprint Unblock Sheet" from [[Deliverables/2026-07-06-sprint-sitting-doc]] containing only decisions 1, 2, and 5 first.

### 2. Product Fact and Chat Word Truth Sync

**Why now:** CTA shipping keeps halting because chat words and prices are not synchronized. This is now the most concrete blocker in the whole content system.

**Source evidence:**
- [[Hermes/BUSINESS]] says chat words are verbatim from Notion or they do not exist, and blank means "manual selection needed."
- [[Hermes/MAP]] lists manual chat words, price conflicts, and the PIN vs Pinterest conflict in section 7.
- [[Deliverables/2026-07-06-sprint-sitting-doc]] blocks posts 1 and 2 on manual chat words and carries two price conflicts.
- [[Team Knowledge/session-logs/2026/07/2026-07-05-15-30_larry_content-os-close-session]] lists 13 manual chat words, two price conflicts, and PIN vs Pinterest as open threads.

**Expected payoff:** Every future carousel/email can either ship with verified CTA facts or halt cleanly before copy is written. This removes repeated Alyssa interruptions and prevents fake comment words.

**Rough implementation path:**
- Mack connects to the Notion Products DB or a user-approved export.
- Pull offer name, status, price, URL, chat word, funnel relationship, and updated date.
- Diff against [[Hermes/BUSINESS]] and [[PKM/My Life/Offers/INDEX]].
- Emit a report with `verified`, `manual`, `conflict`, `missing`, and `do-not-pitch`.
- After Alyssa approves the diff, update BUSINESS and any task queue.

**Owner/specialist:** Mack for connection and sync. Hermes for usage rules. Silas for source-boundary and offer-file integrity.

**Dependency/risk:** Requires Notion access or export. Never infer missing chat words or resolve price conflicts by guessing.

**First next action:** Create a manual product-fact diff for the exact blockers: Bingeable Newsletters, The 5 Minute Newsletter, The Numbers, Quarter in a Day, CEO Year Planner, and Pin Planner.

### 3. Team Inbox Closure Monitor

**Why now:** WS-004 says every inbox root item should be processed in the same session it is noticed, and a closing-shift automation supposedly exists. The actual inbox still holds many raw Keep exports and meeting pointers.

**Source evidence:**
- [[Team Inbox/README]] says raw inputs get filed, then removed from Team Inbox once filed.
- [[Team Knowledge/Guidelines/GL-005-team-inbox-protocol]] says inbox root items should be processed within the session and `_Processed/` means safe to delete.
- [[Team Knowledge/Workstreams/WS-004-inbox-processing]] defines the daily inbox approval table and action tiers.
- Current inbox state includes root files such as [[Notebook/Inbox/2026-07-01-Most people are putting highvalue thinking into-trunc]], [[Notebook/Inbox/2026-07-01-slowly viral embed]], and two files under `Team Inbox/Meeting Captures/`.

**Expected payoff:** Captures stop becoming a second backlog. Good ideas move into Journal, Ready Queue, Signals, or tasks before the moment cools.

**Rough implementation path:**
- Daily scan `Team Inbox/` excluding allowed subfolders and README.
- Group files by source type: Keep export, web clip, meeting pointer, media, duplicate candidate, processed residue.
- Produce the WS-004 approval table automatically with an action tier: `archive`, `read + synthesize`, `dispatch now`, or `evaluate`.
- Flag anything older than 24 hours and anything in `_Processed/` older than one close-session.
- Do not delete until the approved processing path has run.

**Owner/specialist:** Larry triage, Penn filing, Mack scheduling/source refresh.

**Dependency/risk:** WS-004 has an approval gate. The automation can prepare and monitor, but should not silently file or delete without the approved route.

**First next action:** Run report-only inbox closure on the current Team Inbox and produce an approval table, with `2026-07-01-Most people are putting highvalue thinking...` marked `dispatch now` or `read + synthesize` because it maps directly to Content OS and asset infrastructure.

### 4. Weekly Grand Metabolism Watchdog

**Why now:** The weekly and monthly review layers are behind exactly when the vault generated its densest work. Without a weekly Grand Metabolism pass, July 4-6 stays scattered across session logs, deliverables, Hermes learning, and task files.

**Source evidence:**
- [[Team Knowledge/Workstreams/WS-006-weekly-review]] now includes Phase 5, Grand Metabolism.
- [[Team Knowledge/Workstreams/WS-007-monthly-review]] says monthly reviews read weekly wraps only.
- [[Team Knowledge/Workstreams/WS-009-monthly-intelligence-update]] depends on weekly Grand Metabolism for source-trust digestion.
- The most recent weekly wrap is [[Team Knowledge/Weekly Reviews/2026/2026-W27-weekly-wrap]], before July 4-6.
- No June monthly wrap exists under [[Team Knowledge/Monthly Reviews/]].

**Expected payoff:** The team gets one usable weekly control layer: what changed, what was superseded, what moved in Hermes/Ready Queue/tasks, and what Alyssa actually needs to answer.

**Rough implementation path:**
- Nightly or session-start check for missing current weekly wrap.
- If missing and enough session activity exists, surface "weekly review pending" with a one-click run path.
- For active build weeks, collect `## Daily knowledge metabolism` sections and open threads from session logs.
- Produce a Grand Metabolism section that classifies artifacts by fate and identifies one next-week start point.

**Owner/specialist:** Larry owns review. Mack schedules the watchdog after one successful manual WS-006 run.

**Dependency/risk:** If it writes narrative without fates, it fails. The output must force `promoted`, `referenced`, `dispatched`, `archived`, `deleted`, or `needs-Alyssa`.

**First next action:** Run WS-006 for the week containing July 4-6 and include a Grand Metabolism section that starts from the Hermes and Content OS session logs.

### 5. Artifact Fate and Deliverables Lifecycle Watchdog

**Why now:** Deliverables is the largest top-level markdown area by file count, and the July 6 sprint produced multiple status, handoff, pitch, verdict, post, and sitting documents. Some of those docs already contain stale or contradictory state.

**Source evidence:**
- [[Team Knowledge/Guidelines/GL-006-deliverables-scope]] says deliverables are outputs and should be archived when incorporated.
- [[Team Knowledge/Guidelines/GL-009-source-boundaries-and-promotion]] says every session-created artifact needs a fate.
- [[Deliverables/2026-07-06-sprint-sitting-doc]] says post 3 is final and cleared, but its own body still contains older language about round 4 being pending. That is a stale-state smell.
- [[Team Knowledge/session-logs/2026/07/2026-07-06-content-os-six-post-sprint-complete]] says final result was 6/6, which should supersede earlier in-flight docs.

**Expected payoff:** Fewer orphaned reports, fewer stale "status" docs, and less trust drag when Larry or Hermes resumes from old outputs.

**Rough implementation path:**
- Scan Deliverables files modified in the last 7 days.
- Classify each as `active`, `superseded`, `handoff`, `evidence`, `review-needed`, `archive-candidate`, or `delete-candidate`.
- Check for backlinks from session logs, Ready Queue, tasks, Hermes learning, or current handoff docs.
- Flag internal contradictions such as "FINAL" plus "pending" in the same post section.
- Produce a fate table for Larry's close-session metabolism.

**Owner/specialist:** Silas for structure and source-boundary auditing. Larry for fate decisions. Mack for scheduled scan later.

**Dependency/risk:** Do not auto-delete creative evidence. Report first, then let Larry archive/delete during close-session or weekly review.

**First next action:** Run a report-only fate pass on all `Deliverables/2026-07-06-*` files and mark which file is authoritative for sprint state.

### 6. Index Promise Reconciler

**Why now:** The vault just installed the Reconciliation Rule because stale maps were the root cause of drift. The rule is needed today: Workstreams INDEX is already missing three active workstreams.

**Source evidence:**
- Root [[AGENTS]] now says every import, rename, retirement, or restructure is unfinished until reality is diffed against every index, routing table, plan row, and wikilink.
- [[Team Knowledge/session-logs/2026/07/2026-07-05-14-45_larry_root-cause-and-one-brain-consolidation]] names stale indexes and dead routing as the root mechanism.
- [[Team Knowledge/Workstreams/INDEX]] lists WS-001 through WS-007 only.
- Disk contains [[Team Knowledge/Workstreams/WS-008-content-activation]], [[Team Knowledge/Workstreams/WS-009-monthly-intelligence-update]], and [[Team Knowledge/Workstreams/WS-010-daily-pulse]].

**Expected payoff:** Agents stop starting from stale maps. This reduces duplicate work, wrong routing, and "we already built this" mistakes.

**Rough implementation path:**
- Parse all `INDEX.md` tables and compare against matching folder files.
- Parse wikilinks and check target existence.
- Detect stale route references, retired specialists, renamed files, and plan rows pointing at absent files.
- Generate a report with `safe auto-fix`, `needs semantic review`, and `needs Alyssa`.
- Only auto-fix mechanical index omissions after Larry confirms the class is safe.

**Owner/specialist:** Silas primary. Larry approves structural fixes. Nolan supports team-contract routing drift.

**Dependency/risk:** Structural fixes are safe. Meaningful content decisions are not. Do not rewrite strategy, pricing, or source interpretation automatically.

**First next action:** Report-only diff of `Team Knowledge/Workstreams/INDEX.md` vs the Workstreams folder, then expand to Hermes MAP, Second Brain BUILD-PLAN, and task index.

### 7. Ready Queue Movement Monitor

**Why now:** Ready Queue is supposed to hold 3-7 actionable items, but it still has several READY items and old Wren wording in history, while recent Content OS output has not clearly updated queue state. Good ideas are still at risk of sitting as "ready" instead of moving.

**Source evidence:**
- [[PKM/Second Brain/ready-queue]] says READY items should be assigned, dispatchable, and moved to Done when Alyssa receives the deliverable.
- [[Team Knowledge/Workstreams/WS-008-content-activation]] says READY items either dispatch, become blocked with one precise blocker, or get demoted.
- [[PKM/Second Brain/taste-log]] says the old failure pattern was "this could be a Wren task" and then nothing happened.
- [[Team Knowledge/Weekly Reviews/2026/2026-W27-weekly-wrap]] says BOH launch email sequence was top priority, but the current active sprint focused elsewhere.

**Expected payoff:** Content-ready ideas turn into assigned work, blocked items name the exact blocker, and Alyssa does not have to remember what was ready.

**Rough implementation path:**
- Parse `ready-queue.md` for status, assignee, priority, source links, and age.
- Flag READY items older than a threshold.
- For each item, ask one control question: dispatch, block with precise blocker, demote, or mark done.
- Cross-check with Deliverables for completed outputs that should close queue items.
- Surface one Ready Queue item in WS-010 Daily Pulse.

**Owner/specialist:** Larry owns queue movement. Hermes, Charta, or Silas execute by item. Mack can schedule the monitor.

**Dependency/risk:** Do not dispatch content without source links and Mean Alyssa check. Do not make Alyssa choose among many items at once.

**First next action:** Compare Ready Queue item 1, BOH Summer Launch Email Sequence, against the sprint output and ask whether launch emails still outrank post packaging.

### 8. Hermes Learning Adjudication Digest

**Why now:** Hermes is learning quickly, but the learning inbox is accumulating contradictions and rule proposals. If this is not compressed, Alyssa will inherit a pile of micro-decisions.

**Source evidence:**
- [[Hermes/learning/inbox]] has open proposed rulings for ironic self-reference, cross-post reuse, BOH metaphor density, countdown timers, "quietly" in live copy, command CTAs, and transcript-only banned vocab.
- [[Hermes/learning/log]] says the scheduled deep-read runs are writing studies and folding confirmed insights into brain files while unresolved contradictions go to the inbox.
- [[Team Knowledge/session-logs/2026/07/2026-07-05-23-45_larry_hermes-deep-read-scheduling]] says the deep-read routines run July 5-7 and should be disabled or deleted after July 7.
- [[Team Knowledge/Workstreams/WS-009-monthly-intelligence-update]] already expects a voice loop review and rule graduation pass.

**Expected payoff:** Hermes improves without bloating. Alyssa sees a small batch of real doctrine decisions, not a stream of raw model anxiety.

**Rough implementation path:**
- Group learning inbox lines by decision family: generation ban scope, sales-page exception, spoken-register exception, judge calibration, business fact.
- Mark each as `ship-blocking`, `future-rule`, `low-priority`, or `evidence-only`.
- For taste/strategy doctrine, present Version A and Version B.
- Once Alyssa answers, move resolved lines into learning log and propose exact brain-file edits.
- Add a scheduler sunset check for `hermes-deep-voice-study` and `hermes-deep-voice-study-645`.

**Owner/specialist:** Hermes owns brain learning. Larry batches decisions. Mack owns scheduled task cleanup.

**Dependency/risk:** Over-graduating one-off contradictions will make Hermes worse. Only recurring, sourced patterns become permanent rules.

**First next action:** Produce a 7-line adjudication digest from [[Hermes/learning/inbox]] with "blocking now" separated from "monthly doctrine."

### 9. Morning Content Brief and Daily Content OS View

**Why now:** The Content OS master plan already defines a Morning Content Brief and a future dashboard/daily Hermes-agent view. The sprint proved the pipeline can work, but the next relief comes from giving Alyssa one daily control surface instead of many files.

**Source evidence:**
- [[Deliverables/2026-07-05-content-os-master-plan]] Phase 4 specifies Morning Content Brief, weekly stats refresh, learning distiller, mechanical lint automation, and a future daily view/dashboard.
- [[Team Knowledge/session-logs/2026/07/2026-07-06-content-os-six-post-sprint-complete]] says Alyssa added the dashboard/daily-Hermes-agents idea to the master plan Phase 4 spec.
- [[Team Knowledge/Workstreams/WS-010-daily-pulse]] already defines the principle: one thing from the vault, not a list.
- [[PKM/Signals/signals-index]] and [[PKM/Developing Ideas/INDEX]] provide the signal and idea inputs for brief generation.

**Expected payoff:** Alyssa starts the day with one content opportunity, one ranked action, and one blocker if needed. The system feels like a working assistant rather than a folder to inspect.

**Rough implementation path:**
- Scheduled morning scan reads current calendar slot, Signals, Developing Ideas, Ready Queue, Hermes learning blockers, and active sprint state.
- Output three ranked angles only when content generation is the active lane.
- Otherwise output one daily control item: "answer this," "review this," "ship this," or "nothing needed."
- Each item cites source and names the next specialist.
- Later, wrap it in a dashboard if the text routine proves useful.

**Owner/specialist:** Larry owns daily pulse and ranking. Hermes owns content angle viability. Mack schedules. Felix can build dashboard later if Alyssa approves.

**Dependency/risk:** A dashboard built before the text routine works will become another surface to maintain. Start as a daily brief.

**First next action:** Run one manual Morning Content Brief for the next Content OS slot using Signals, Ready Queue, and the sprint decision blockers.

### 10. Meeting, Video, and Transcript Intake Pipeline

**Why now:** Alyssa is saving video and meeting material, but the extraction layer is not fully wired. This is a direct source-access problem for the Second Brain and Content OS.

**Source evidence:**
- [[Team Knowledge/tasks/open/tsk-2026-06-26-001-converter-pack-runtime-install]] says the converter pack SOPs are installed but runtime prerequisites are not.
- [[Team Knowledge/tasks/open/tsk-2026-06-02-001-automate-meetily-capture-inbox]] is open for automatic Meetily pointer creation.
- [[Team Knowledge/tasks/open/tsk-2026-06-03-004-google-calendar-api-setup]] and [[Team Knowledge/tasks/open/tsk-2026-06-03-005-meetily-first-oauth-run]] are still open.
- Team Inbox contains [[Notebook/Inbox/2026-07-01-slowly viral embed]], [[Notebook/Inbox/2026-07-01-Use for email and post inspo]], and meeting capture pointers.
- [[Deliverables/2026-06-04-claude-routines-automation-fit-report]] recommends Video Watcher as a manual skill feeding Listening and Research Aggregator or Second Brain.

**Expected payoff:** Videos, meetings, webinars, and saved links become source-backed notes and action items instead of unprocessed embeds. This strengthens the Second Brain without asking Alyssa to manually extract transcripts.

**Rough implementation path:**
- Finish converter pack runtime install and pick Whisper model.
- Finish Google Calendar OAuth for Meetily launcher.
- Add a Video Watcher intake path: URL or transcript in Team Inbox becomes `read + synthesize`, not just archive.
- Generate Journal notes with source links and task/Ready Queue routing when needed.
- Keep raw audio/video outside the vault unless Alyssa asks.

**Owner/specialist:** Mack owns runtime and capture. Penn writes PKM notes. Pax handles research synthesis. Larry routes and enforces source boundaries.

**Dependency/risk:** Some installs require user-side system permissions and large model downloads. Do not auto-download large Whisper models without Alyssa's choice.

**First next action:** Install converter runtime or, if that is too much, process [[Notebook/Inbox/2026-07-01-slowly viral embed]] manually as the first Video Watcher proof.

## Recent active projects

- **Content OS / Hermes clone system:** Live sprint completed 6/6 lineup survival, now waiting on Alyssa decisions and downstream design/publishing. Sources: [[Deliverables/2026-07-05-content-os-master-plan]], [[Deliverables/2026-07-06-sprint-sitting-doc]], [[Team Knowledge/session-logs/2026/07/2026-07-06-content-os-six-post-sprint-complete]].
- **Second Brain:** Still priority-1 in task index, while many components have been built or revised. Source: [[Team Knowledge/tasks/open/tsk-2026-06-01-002-second-brain]], [[PKM/Second Brain/INDEX]], [[PKM/Second Brain/BUILD-PLAN]].
- **BOH summer launch:** Ready Queue item 1 still holds BOH launch email sequence. Source: [[PKM/Second Brain/ready-queue]], [[PKM/My Life/Projects/spring-26-launch]].
- **Systematize Socials:** Still active, with Camila, Keep/IG capture, Claude support, and weekly rhythm threads. Source: [[PKM/My Life/Projects/systematize-socials]].
- **Inbox/capture automations:** Telegram, Meetily, Slack, converter pack, and calendar setup all exist as partial systems or open tasks. Sources: [[Team Knowledge/tasks/INDEX]], [[Team Knowledge/Automations/]].
- **Notion templates and SLO updates:** Active or underdeveloped project surfaces, but not the current highest automation priority. Sources: [[PKM/My Life/Projects/notion-templates]], [[PKM/My Life/Projects/slo-updates]].
- **Podcast guesting workflow:** Planning project with potential future pipeline, but should not outrank current Content OS/capture/review cleanup. Source: [[PKM/My Life/Projects/podcast-guesting-workflow]].
- **Rebrand:** Active but waiting on Adele response and meeting-note capture. Source: [[PKM/My Life/Projects/rebrand]].

## Major open loops

- Sprint decisions 1, 2, and 5 block posts 1, 2, and 3 from shipping. Source: [[Deliverables/2026-07-06-sprint-sitting-doc]].
- Product chat words and prices are unresolved for multiple offers. Source: [[Hermes/BUSINESS]], [[Hermes/MAP]].
- Hermes learning inbox has unresolved doctrine and contradiction flags. Source: [[Hermes/learning/inbox]].
- Team Inbox is not clean and contains current raw captures. Source: [[Team Inbox/]].
- Weekly review is behind; current week has no Grand Metabolism wrap. Source: [[Team Knowledge/Weekly Reviews/2026/2026-W27-weekly-wrap]], [[Team Knowledge/Workstreams/WS-006-weekly-review]].
- June monthly review/intelligence layer is absent. Source: [[Team Knowledge/Monthly Reviews/]], [[Team Knowledge/Workstreams/WS-007-monthly-review]], [[Team Knowledge/Workstreams/WS-009-monthly-intelligence-update]].
- Scheduled Hermes deep reads need post-July-7 cleanup. Source: [[Team Knowledge/session-logs/2026/07/2026-07-05-23-45_larry_hermes-deep-read-scheduling]].
- Slack, Telegram, Meetily, converter runtime, and Google Calendar OAuth tasks are still open. Source: [[Team Knowledge/tasks/INDEX]].

## SOP and workstream gaps

- [[Team Knowledge/Workstreams/INDEX]] is stale and does not include WS-008, WS-009, or WS-010.
- No dedicated product-fact sync SOP exists, even though product facts now block publishing.
- No artifact-fate automation exists, even though GL-009 requires fates for session-created artifacts.
- WS-004 says Closing Shift exists, but current inbox state suggests it is not enough or not completing.
- WS-006 Grand Metabolism is defined but has not yet been validated on the July 4-6 build week.
- Content OS station build exists as a master plan and deliverables, but the durable station files/skills are not yet a canonical workstream.

## Problems discovered

- **Stale maps persist:** Workstreams INDEX missing active workstreams is live proof.
- **Status docs diverge quickly:** July 6 sprint docs include old in-flight language and final-state language in nearby artifacts.
- **Capture does not equal processing:** Keep, embeds, and meeting pointers are present but not routed.
- **Decision queues are too long:** 12 decisions in one sitting doc is usable once, but not a scalable operating surface.
- **Product truth is split:** BUSINESS, MAP, offers, Notion, ThriveCart, and live pages can disagree.
- **Learning is outpacing adjudication:** Hermes is generating good correction evidence faster than Alyssa can approve doctrine.
- **Tasks remain open after underlying reality changes:** Second Brain is still urgent/open even though major Second Brain work has shipped.

## Notes and queue items currently left open

- [[PKM/Second Brain/ready-queue]] items still READY or blocked include BOH launch emails, standing Email to Carousel, Hook Framework to Carousel Brief, Silas wikilink audit, blocked launch carousel visual reference, launch visual palette, and "You Get What You Get" hook email.
- [[Hermes/learning/inbox]] has seven July 6 adjudication/contradiction entries needing batching.
- [[Deliverables/2026-07-06-sprint-sitting-doc]] has 12 decisions, three hard blockers.
- [[Team Inbox/]] has root-level raw inputs from June 29 through July 1, meeting capture pointers, and `_Processed` residue.
- [[Team Knowledge/tasks/INDEX]] has 17 open tasks, including one stale scaffold seed task and several long-open setup tasks.

## Highest-leverage order

If Alyssa only greenlights three automations first:

1. **Product Fact and Chat Word Truth Sync** because it directly unblocks CTAs, avoids invented facts, and supports every future Content OS output.
2. **Content OS Decision Queue Closer** because six posts are already through the hard creative gate and only need compressed decisions to move.
3. **Weekly Grand Metabolism Watchdog** because the system just created enough work that it needs an aggregation layer immediately, or the same drift returns.

## Acceptance test

These automations are working if Alyssa can ask "what should I do now?" and get one of three answers:

- "Answer these three exact blockers and six posts can ship."
- "No Alyssa needed, Mack/Silas/Hermes can move this."
- "This output is superseded, archived, or already promoted. Ignore it."

If the answer is another long report with no movement, the automation failed.

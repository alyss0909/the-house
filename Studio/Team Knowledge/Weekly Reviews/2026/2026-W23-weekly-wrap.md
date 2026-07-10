---
week: 2026-W23
date_range: 2026-06-01 to 2026-06-04
session_count: 51
open_threads: 23
---

# Week 23 Wrap-Up (Mon Jun 1 – Thu Jun 4, 2026)

## Week at a glance

The biggest build week yet. The Second Brain went from skeleton to a genuinely usable copy system in four days: all BOH course content imported (workbooks, transcripts, slides, webinars), web copy filed, the voice layer built (writing-style.md, sales-page-analysis.md, me.md, carousel analysis, subject line OS), and Wren hired as the AI Brand Voice Partner. In parallel: Telegram capture MVP proven, Meetily auto-launch automation designed, three new Guidelines written, the scaffold cleaned of structural drift, Camila and Samir onboarded, and the podcast guesting project launched. This was the week the system became operational as a working knowledge infrastructure.

## What shipped

- **Second Brain skeleton + full BOH import** — all workbooks, transcripts, slides across P0–P4; 2 webinars (Out of Office, Slowly Viral Class, Slow Marketing Plan Class)
- **Voice layer built** — [[Studio/Analysis/writing-style]] (14-section, ~4,000 words), `sales-page-analysis.md` (27-row persuasion sequence, 21 CTAs), `about-page-analysis.md`, `home-page-analysis.md`, [[Studio/Analysis/copy-task-routing]] (routing map for 14 task types)
- **Carousel system** — 9 top-performing Jan–Mar 2026 carousels analyzed, `carousel-analysis.md`, [[Studio/Analysis/Frameworks/carousel-framework]] (6 archetypes, 7 hook formulas), [[Studio/Analysis/Templates/carousel-brief]] (10 ready-to-write briefs)
- **Subject line system** — `subject-line-analysis.md` (12 patterns, 351 broadcasts), [[Studio/Analysis/Frameworks/subject-line-operating-system]] (Wren's production interface)
- **Voice profile layer** — [[Studio/Analysis/voice-profile]] (AI-ready XML, AI-mined from 100-question archive), [[Studio/Analysis/voice-archive]] (87/100 questions answered at HIGH/MED confidence)
- **Audience intelligence** — 2025 BOH survey analyzed; [[Studio/Analysis/audience/back-of-house-2025-survey-client-profile]]
- **Wren activated** — AI Brand Voice Partner, slug `wren`, operating contract with hard-coded Don'ts, 6-step pre-task protocol, 3-tier calibration, 5-part quality gate. Team count: 6 → 7
- **Telegram capture MVP** — `@ideaeaterbot` (display name: Bestie) built, pipe proven, captures landing in `Team Inbox/_Processed/`. Slash command routing hints working
- **Meetily auto-launch** — `meetily-weekly-launcher.ps1` (Google Calendar API v3, OAuth 2.0), filter rules for Camila/Stacia coworking vs. recorded sessions, Task Scheduler weekly batch
- **WS-004 + WS-005** — Inbox Processing and Meeting Capture workstreams codified; SOP renaming (8 SOPs now numbered SOP-004 through SOP-012)
- **GL-004 / GL-005 / GL-006 written** — Tag Taxonomy + Governance, Team Inbox Protocol, Deliverables Scope + Lifecycle
- **Scaffold structural cleanup** — duplicate folders merged, root scripts moved, empty folders deleted, `_system/` created, `node_modules/` purged, tag cleanup across 94 files
- **BOH INDEX** — fully wikilinked, NotebookLM references removed, asset order standardized, orphan Carousel Playbook deleted
- **Rush Order** — copy filed in Journal, Offer entity created (status: idea, $2,999), task opened
- **Website designer meeting** — Andrew (Fifty One Eight) CRM stub created; meeting brief synthesized from vault
- **Camila contract** — adapted + sent; Camila CRM note created with Upwork/portfolio skills and routing cues
- **Samir offer letter** — sent; rate: $28/hr; CRM note corrected
- **Podcast guesting** — `podcast-guesting-workflow` Project, `podcast-guesting` Topic, research deliverable filed, Mara (Podcast Guesting Producer) recommended for future hire
- **Semantic layer plan** — written and unblocked; Larry authorized to execute without formal approval loop
- **Claude Routines report** — Pax reviewed 29 routines; shortlist: Vault Drift Sweep, PKB Opportunity Digest, Weekly Status Report, Listening/Research Aggregator, Video Watcher skill
- **Task Index rebuilt** — all 14 open tasks indexed; Samir email task closed + moved to done/
- **Deliverables shipped:** Second Brain research, audience survey analysis package, copy-hire research brief, Kit broadcast performance export, Kit broadcast performance analysis, ops assistant revenue delegation brief, Camila realistic fit map, Camila money-making ownership research, Claude routines fit report, podcast guesting pitching research

## Key decisions

| Question | Decision | Source |
|---|---|---|
| Where does Second Brain live? | Standalone `PKM/Second Brain/` — not scattered across Key Elements | [[2026-06-01_larry_second-brain-build]] |
| Second Brain build order | Programs → Examples → Analysis → Templates → Frameworks last | [[2026-06-01_larry_second-brain-build]] |
| Quick Read framing | "Surfaces in" not "When to use" — it's Alyssa's IP, not a style guide | [[2026-06-02_larry_second-brain-boh-content-import]] |
| Obsidian TOC format | `[[#Heading Text\|Display Text]]` only — standard markdown anchors break | [[2026-06-02_larry_second-brain-boh-content-import]] |
| Never use PowerShell Set-Content for vault files | Creates UTF-8 BOM, corrupts emojis. Always use Write tool | [[2026-06-02_larry_second-brain-boh-content-import]] |
| Copy team member: AI or human? | AI specialist — Wren hired. All human-hire research stays valid as framing | [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] |
| Wren's Don'ts: referenced or hard-coded? | Hard-coded in the shim — always in context regardless of task tier | [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] |
| "Raccoon in a cashmere sweater" | Canonical internal descriptor for Alyssa's subject line personality | [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] |
| Subject line work: start from Kit data or Second Brain? | Start from existing Second Brain analysis; Kit data enhances/validates | [[2026-06-03-22-20_larry_kit-subject-line-system]] |
| Telegram capture: Instagram session cookies? | No. Telegram is the capture layer; AI processes only what Alyssa sends | [[2026-06-04-10-58_larry_instagram-saves-telegram-processing]] |
| Semantic Recurrence Layer approval loop | Dropped — Larry makes the call and executes without formal approval | [[2026-06-03-22-21_larry_telegram-mvp-and-open-loop-realignment]] |
| Loop surfacing: wait for Alyssa to ask? | No. Larry must surface handoff items proactively at session close, every session | [[2026-06-04_larry_full-loop-audit-and-task-cleanup]] |
| "Fix don't flag" | Any fixable vault issue gets fixed immediately — not surfaced as an action item | [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]] |
| `## What's still needed` in content files | Banned — outstanding work becomes a task, never lives in a content file | [[2026-06-04_larry_boh-index-interlinking-and-cleanup]] |
| Student-facing `## To Do` checklists in slide files | Teaching content — permanent reference, never remove | [[2026-06-04_larry_boh-index-interlinking-and-cleanup]] |
| `about-me.md` → [[Studio/Analysis/voice-profile]] rename | Renamed + all 6 references updated — removes false association with about page | [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]] |
| Carousel work: 1 file or split? | 3 files: carousel-analysis.md + carousel-framework.md + carousel-brief.md | [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]] |
| Meetily: poll calendar vs. weekly batch | Weekly batch every Monday — pre-schedules entire week, no background polling | [[2026-06-03_larry_meetily-autolaunch-and-website-kickoff]] |
| Which meetings trigger Meetily launch | Exclude: Stacia, Camila Tuesdays. Include: Camila Mondays, video/external-attendee events | [[2026-06-03_larry_meetily-autolaunch-and-website-kickoff]] |
| Camila recurring ownership | Not committed. All 7 Pax ideas rejected. Brainstorm task open (tsk-007) | [[2026-06-03-22-21_larry_telegram-mvp-and-open-loop-realignment]] |
| GL-004 `inspo` abbreviation | Approved exception — Alyssa override of the no-abbreviation rule | [[2026-06-04_larry_guidelines-review-and-tag-cleanup]] |
| GL-003 status | Still reserved for Designer Expansion Pack | [[2026-06-04_larry_scaffold-deep-dive-and-cleanup]] |

## Insights not yet graduated

- **Parallel subagent pattern for batch document processing** — 3–4 agents simultaneously processed 14 docx files across 4 phases in ~10 min. Self-contained prompts with full format standard + file paths + exact INDEX strings = quality maintained. — source: [[2026-06-02_larry_second-brain-boh-content-import]]
- **Base64 images in large files — read text portions directly, provide to agents in prompts** — a 1.4MB sales page file is almost entirely base64 data. The readable text ends around line 499. Agents reading the file directly would hit token limits. — source: [[2026-06-03_larry_second-brain-web-copy-and-analysis]]
- **The writing-style.md "Don'ts" section is as valuable as the pattern sections.** Knowing what Alyssa never says is as calibrating as knowing what she does. Read it first, not last. — source: [[2026-06-03_larry_second-brain-web-copy-and-analysis]]
- **Pitch-class webinars and teaching webinars need distinct analysis dimensions** — classify each recording's purpose before writing analysis. — source: [[2026-06-04_larry_second-brain-transcript-mass-import]]
- **Alyssa sends transcripts with her own naming conventions** — don't trust the filename number; read the content and match to INDEX module descriptions. — source: [[2026-06-04_larry_second-brain-transcript-mass-import]]
- **WebFetch + journal entry = clean article enrichment pattern** — bare links captured via Telegram or Keep can be fetched and filed as rich journal entries with stats, frameworks, and a "how I'd use this" section. — source: [[2026-06-03_larry_morning-triage-inbox-bdow-enrichment]]
- **`_Processed/` folder pattern solves inbox cleanup without delete permissions** — move processed files there each session; Alyssa deletes periodically. — source: [[2026-06-03_larry_morning-triage-inbox-bdow-enrichment]]
- **AI-backed opportunity spotting + Camila verifies/follows up** is a better pattern than asking Camila to create strategy from scratch. — source: [[2026-06-04-11-15_larry_camila-role-fit-wrap]]
- **Vault cleanliness is ongoing baseline work** — not a cleanup sprint. Every session, every agent, every file touched — maintain kebab-case, update relevant INDEX files, fix what you find. — source: [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]]

## Open threads — by area

### Second Brain — Content Drops (Alyssa)
- [ ] **5 best Soft Sundays** — drop as MD. Priority 1: unlocks Wren Soft Sunday confidence, Simmer analysis, Soft Sunday template, subjects-and-previews.md
- [ ] **5 best Simmer emails** — drop as MD. Priority 1: same unlock chain
- [x] **Top subject line performers** — Kit broadcast performance export done in W23; [[Studio/Analysis/subject-line]] v2.1 built from 351 broadcasts with 11 patterns, template banks, top performers, and preview text rules ✅
- [x] **10 best carousels** — done (Jun 4). `carousel-analysis.md`, [[Studio/Analysis/Frameworks/carousel-framework]], [[Studio/Analysis/Templates/carousel-brief]] all filed ✅
- [x] **All 3 BOH webinars filed** — Out of Office Webinar, Slowly Viral Class, Slow Marketing Plan Class all in `programs/back-of-house/webinars/` ✅ *(W23 wrap incorrectly said "2 webinars" and "one still missing" — vault has all three)*
- [x] **1.1 Signature Method transcript** (20m Notion method video) — high value for Wren
- [x] **1.5 The Perfect Apps transcript** (45m tripwire module) — high priority, covers tripwire framework
- [ ] **Other product sales pages** — CTC, YOE, any others → `examples/sales-pages/`
- [x] **4.2 Simple Socials transcript** — confirmed scrapped

### Second Brain — Alyssa Review
- [ ] **voice-profile.md review** — AI-mined draft; Alyssa reads [[Studio/Analysis/voice-archive]], annotates what's wrong, runs 13-question gap interview (prompt in tsk-2026-06-03-006). Unlocks "always on" setup
- [ ] **Wren first real task** — try her on a Simmer email or subject line batch; feedback is the real calibration

### Second Brain — Build
- [x] **subjects-and-previews.md** — [[Studio/Analysis/subject-line]] v2.1 covers this: top performers, preview text rules, template banks, and pattern data from 351 broadcasts. `examples/subjects-and-previews.md` as a curated raw-pairs file is still TBD but is not blocking Wren — Larry can build it from existing data, not a content-drop dependency ✅
- [ ] **Notion vault imports** — Hook vault, RTO vault, segmentation vault, 5 more frameworks. Blocked on Mack's Notion API setup
- [ ] **Webinar framework pass** — [[Archive/Team Inbox/_Processed/Alyssa's Webinar Framework]] found in Team Inbox (Jun 4). Needs: (1) Penn processes it to [[Studio/Analysis/Frameworks/webinar-framework]], (2) mapping pass: theory framework vs. what Alyssa actually does in her 3 webinars per [[Studio/Analysis/workshop-webinar-analysis]]. Priority: actual practice over stated framework. *(3 webinars in vault: all 3 covered in workshop-webinar-analysis.md)*

### Automations
- [ ] **Telegram token regeneration** — Alyssa regenerates `@ideaeaterbot` BotFather token → updates `telegram-capture.env` (don't paste in chat) → Mack runs `--health-check` + `--once` final test
- [ ] **Meetily: Google Calendar API credentials** (tsk-2026-06-03-004) — create Google Cloud project, enable API, download client_secret.json
- [ ] **Meetily: first OAuth run** (tsk-2026-06-03-005) — blocked on above
- [ ] **Semantic Recurrence Layer** (tsk-2026-06-01-003) — unblocked; Larry executes without approval loop
- [ ] **Claude Routines automation report review** (tsk-2026-06-04-001) — due June 6. Three routines to approve/park/kill: Vault Drift Sweep, PKB Opportunity Digest, Weekly Status Report

### Hiring & Team
- [ ] **Camila recurring ownership** — all 7 Pax ideas rejected; brainstorm still open (tsk-2026-06-03-007). Alyssa to send 2–3 sentences on her objectives for Camila
- [ ] **Samir final written agreement** — rate confirmed at $28/hr, final version to send once Samir replies
- [x] **Andrew's last name** — not needed; CRM has email (andrew@fiftyoneeight.com) + company (Fifty One Eight). File already named [[Notebook/Life/CRM/People/andrew]]. ✅
- [ ] **Mara (Podcast Guesting Producer)** — recommended future hire; route to Nolan if Alyssa wants to proceed
- [x] **Meetily raw recordings cleanup** — decision: quarantine for 2 weeks then delete ✅

### Copy & Brand
- [ ] **Rush Order: placement decision** — OTO vs. standalone VIP Day page? Determines ThriveCart setup
- [ ] **Rush Order: payment plan** — yes/no
- [ ] **BOH launch plan** — not yet started; ready for a focused session
- [ ] **Adele / rebrand follow-up** — meeting happened, follow-ups sent. Monitor for next steps

### Vault Governance
- [x] **Tag review final decisions** — completed Jun 4; decisions reflected in GL-004 ✅
- [x] **GL-004 approved list update** — GL-004 finalized; tag review complete ✅
- [ ] **MAP standard (GL-007)** — Alyssa still considering; no action yet
- [ ] **SOP-003 / GL-004 tag conflict** — SOP-003 still lists `ai` and `good-idea`; GL-004 doesn't approve them. Reconcile in next cleanup pass

### Other
- [ ] **Obsidian home page** (tsk-2026-06-01-001) — `dashboard++` plugin research + build. No movement yet
- [ ] **Background open loops** (tsk-2026-06-03-008) — Larry-owned; resolve with archive/quarantine defaults, no Alyssa required

## Next week setup

- **Pick up first:** Telegram token regeneration (5 min, unblocks confirmed pipe), then drop Soft Sundays (single highest-leverage content action — unlocks Wren fully, templates, and subjects-and-previews in one go)
- **High value this week:** Voice profile gap interview (tsk-006, overdue); Claude Routines report decision (due June 6); Camila objectives input to unblock tsk-007
- **Larry runs independently:** Semantic Recurrence Layer execution (tsk-003), background open loops (tsk-008)
- **Context to load:** Second Brain [[Studio/Analysis/copy-task-routing]] before any copy task; [[Studio/Analysis/voice-profile]] + [[Studio/Analysis/writing-style]] as the calibration pair; open task list from `Team Knowledge/tasks/INDEX.md`

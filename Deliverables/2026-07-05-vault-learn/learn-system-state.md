---
title: myPKA System State — Learn Pass
date: 2026-07-05
type: system-audit
scope: read-only
territory: Team Knowledge/, Team/, Hermes/, Deliverables/, Team Inbox/, Expansions/
---

# myPKA System State — Learn Pass (2026-07-05)

Read-only audit. No canonical files modified. Session logs read in full for 2026/07 only; titles/skim for 2026/05–06.

---

## 1. System map

### Guidelines (static rules)

| GL | Purpose |
|---|---|
| GL-001 | File naming — kebab-case, ISO date prefixes, slug rules, image filenames |
| GL-002 | Frontmatter schemas for all 8 PKM entity types + foreign-key convention |
| GL-003 | Design system SSOT (color/type/spacing/imagery/voice) — Iris is sole editor; ships empty until authored |
| GL-004 | Tag taxonomy governance — approved vocabulary, no-abbreviation rule, Librarian (Larry) audit duty |
| GL-005 | Team Inbox protocol — frozen subfolder list, routing, lifecycle |
| GL-006 | Deliverables scope — the one artifact location, naming, archive lifecycle |
| GL-007 | Token discipline — file size limits, Second Brain navigation, Larry startup cost |
| GL-008 | "Ponytail" lazy senior dev philosophy — decision ladder for minimal code, added 2026-07-05 |

### SOPs (single-agent skills), 30 total

Core ops: SOP-001 (hire specialist, Nolan) · SOP-002 (SQLite mirror, Silas) · SOP-003 (Keep→journal, Penn/Larry) · SOP-004/005/006/007/008 (task lifecycle, any agent/Larry) · SOP-009/010 (journal write/read, Penn) · SOP-011 (session log, Larry) · SOP-012 (Codex sandbox recovery, Mack/Larry) · SOP-013 (semantic sweep, Larry).
Designer Pack (v1.1.1): SOP-014 (author design system, Iris) · SOP-015 (design compliance audit, Iris) · SOP-016 (infographic, Charta) · SOP-017 (styled image, Pixel).
App Developer Pack (v1.0.2): SOP-018 (build component, Felix) · SOP-019 (security audit, Vex) · SOP-020 (QA gate, Val).
Converter Pack (v1.1.1): SOP-021–027 (transcribe audio/URL, webpage-to-text, images↔PDF, doc convert, OCR, metadata strip — all Mack).
Slack Expansion (v1.0.0): SOP-028 (incoming routing, Larry) · SOP-029 (post message, Mack) · SOP-030 (listener health, Mack).
Next available: SOP-031.

### Workstreams (multi-agent compositions), 7 active

WS-001 daily journaling (Penn+Larry) · WS-002 import external KB (Silas+Mack+Pax) · WS-003 install expansion (Larry+Vex+Nolan+Mack+Silas) · WS-004 inbox processing (Larry+Alyssa+Penn) · WS-005 meeting capture (Larry+Mack+Penn) · WS-006 weekly review (Larry) · WS-007 monthly review (Larry, reads weekly wraps only).

**Gap confirmed by 2026-07-05 vault-automation-analysis:** no WS-011 or equivalent exists yet for Content OS batch production, despite a station draft (`Deliverables/2026-07-05-content-os-brain/station-ws-011-weekly-content-batch.draft.md`) already using that number. WS-009 (monthly intelligence update) is referenced in that analysis but does not appear in the Workstreams INDEX — check whether it was ever formally added.

### Team (17 roles across Team/ + agent-index.md)

| Specialist | Owns |
|---|---|
| Larry | Orchestrator/Librarian/session-log author. Tag governance (GL-004). Routes everything, never executes domain work directly. |
| Nolan | HR — hiring, SOP-001, agent-index hygiene |
| Pax | Researcher — cross-source verification, hire briefs, market/anti-pattern research |
| Penn | Journal Writer — WS-001, Team Inbox → PKM/CRM/Journal filing |
| Mack | Automation — API/MCP/webhook/OAuth, connection layer for imports, external image-gen wiring |
| Silas | Database Architect — WS-002 executor, SOP-002 owner, frontmatter integrity, tag-cleanup batch execution |
| Wren | Brand Voice Partner — Alyssa-voice copy (Simmer, Soft Sunday, sales, captions, pins) |
| Vera | Strategic Knowledge Synthesis Partner — riffs, cross-domain big-picture thinking (redefined 2026-05-27, superseded Remi) |
| Remi | RETIRED 2026-05-27, do not route |
| Iris | Design System Architect — sole GL-003 editor, SOP-014/015 |
| Charta | Infographic Designer — SOP-016, reads GL-003 |
| Pixel | Visual Specialist — SOP-017, reads GL-003 |
| Felix | Frontend Developer — SOP-018 |
| Vex | Security Engineer — SOP-019 |
| Val | QA/UI Quality — SOP-020, runs after Felix |
| Hermes | (not in agent-index table, but active/central) — Alyssa clone writer, built 2026-07-05, replacing ad hoc Wren/Fable copy work for the Content OS pipeline. Lives in `.claude/agents/hermes.md` + `Hermes/` brain folder. |

**Note:** Hermes is fully operational (five Gate-3 rounds, scheduled learning runs) but is **not listed in `Team/agent-index.md`**. Every other active specialist has a row there; Hermes doesn't. Worth flagging to Alyssa/Nolan — routing table is incomplete against actual team composition.

### Hermes brain structure (`Hermes/`)

Root: README.md (loader), SOUL.md, STYLE.md, TASTE.md, ANTI-AI.md (senior gate, her own saved rules), MEMORY.md (facts + gaps ledger), SOURCES.md, CALENDAR.md, CODEX.md, FABLE.md (operating layer), PITCH.md (23-product pitch/teach index), RELATIONS.md, TEACHING.md.
Subfolders: `craft/` (9 format playbooks), `examples/good|bad/`, `learning/` (inbox.md, log.md, deep-reads/), `tests/` (+ results/).

### Expansions installed

converter-pack-1.1.1, designer-pack-1.1.1, app-developer-v1.0.2, slack-1.0.0 — all with manifests in `Expansions/_installed/`. Runtime/token wiring incomplete for converter-pack and slack (see open threads).

---

## 2. Open threads (consolidated, with sources)

### From July 2026 session logs

- **Hermes learning inbox — 5 unresolved adjudications** awaiting Alyssa (banned-shape #11 exemption question, metaphor-callback pun-tag nuance, promo-vs-nurture offer-block length variant, dread-subject + period-density nuance, and the general "keep total ban or codify exemptions" question). Source: `Hermes/learning/inbox.md`.
- **Content OS master plan — Phase 2 awaiting her "go."** Needs from her: day anchors (Education/Offer weekday), fills for 4 empty calendar slots (Email·Offer, Email·FTG, BoH·Education, Productivity·Education), 13 chat words still "manual," 2 price conflicts (Quarter in a Day $2,000 vs $111; CEO Year Planner $79 vs $27–47), cold-list ladder clarification (Cold Subscriber Automation / Email List Revival Plan / List Resuscitator overlap), gold-standard picks per content lane, the unicorn-cupcake Simmer fact-check. Source: `Deliverables/2026-07-05-content-os-master-plan.md`.
- **Alyssa to adjudicate three specific Simmer/carousel corrections** flagged in the 2026-07-05-23-30 session close (negative-parallelism shape #11 in her own metaphor, pun-tagged metaphor-callback exception, promo-vs-nurture offer-block split) — duplicates the inbox items above; same open loop, two sources.
- **Alyssa to supply 13 "manual" chat words** including The Promo Planner — same as Content OS gap above.
- **`hermes-deep-voice-study` scheduled routine** — still running unattended (3x/day, Jul 5–7); needs disable/delete check after Jul 7 or it re-arms next July. Source: `2026-07-05-23-45_larry_hermes-deep-read-scheduling.md`.
- **Feb Is The New Jan carousel** — needs images when Alyssa sends them. Source: `2026-07-04-20-07_larry_carousel-second-brain-intake.md`.
- **80 Days Until Summer / 90 Day Clock In carousel** — needs metrics/caption capture. Same source.
- **cold-subscriber-automation, quarter-prompt, simmer-system, rush-order offers** — still lack usable sales-page copy (no `sales_page_url` present to capture from). Source: `2026-07-04-20-09_larry_sales-page-copy-recovery.md`.
- **Guest Cheque Quote source image** — placeholder Instagram screenshot; needs a clean cropped export if Alyssa has one. Source: `2026-07-04-18-24_larry_fable-content-relay-source-truth.md`.
- **Quarter in a Day price conflict ($2,000 vault vs $111 ThriveCart)** and **CEO Year Planner price conflict ($79 vs $27–47 promo)** — flagged in multiple places (BUSINESS.md, MEMORY.md, master plan); needs Notion verification.
- **Voice-interview Q81/Q85 answered by inference only** and **13 gap-interview answers derived by Fable, not yet confirmed** — `Hermes/MEMORY.md` gaps ledger #1–2.
- **voice-profile.md / voice-archive.md never reviewed by Alyssa** — quarantined pending her review. `Hermes/MEMORY.md` gap #3.

### From Deliverables (2026-07 vault-automation-analysis and content-os set)

- **July 4 inbox approval report not executed** — proposed routing/filing/dispatch never completed; Team Inbox still has the July 1 "high-value thinking" capture unfiled.
- **Ready Queue dispatch stalled** — BOH Summer Launch Email Sequence is READY/highest-priority for Wren but not visibly delivered; "You Get What You Get" hook email also queued; Launch Carousel recreation BLOCKED on a visual reference.
- **Telegram capture** — needs final token regeneration, health check, one live test message.
- **Meetily capture** — needs Google Calendar API credential setup + first OAuth run (tsk-2026-06-03-004, tsk-2026-06-03-005, both open).
- **Converter Pack runtime install** and **Slack token wiring** — both installed but not runtime-ready (tsk-2026-06-26-001, tsk-2026-06-26-002, both open).
- **June monthly review/intelligence output absent** — WS-007/WS-009 exist, no `Monthly Reviews/2026/2026-06-monthly-wrap.md` produced yet.
- **Task index stale** — confirmed directly (see Section 3).
- **Notion Products DB verification** — needed before any live CTA copy runs (price/status/chat-word volatile layer).

### From Weekly Review W27 (most recent, week of June 23)

- `middle-ground-entrepreneur` thesis draft waiting on Alyssa's reaction since June 27 (3+ weeks as of session date).
- `easiest-email-highest-return` — needs Alyssa's format pick (A/B/C) before Wren can move.
- `Ignore.md` in Team Inbox — held pending Alyssa's decision (not yet resolved as of the 2026-07 session logs read).

### From open tasks (`Team Knowledge/tasks/open/`, 16 files)

Notably still open despite being superseded by later work: `tsk-2026-06-05-001-review-semantic-sweep-and-approve` (SOP-013 is already active/running — the approval task trails reality). `tsk-2026-06-04-001-review-claude-routines-automation-report` (now superseded by the July 5 vault-automation-analysis, which itself sits unactioned). Full list of 16 open tasks spans: Second Brain build, Obsidian home page, Telegram automation, Meetily automation, Rush Order build, IDX platform research, homepage mood board, Google Calendar API, Meetily OAuth, voice-profile review, automation report reviews (x2), copy/voice/tag review, converter runtime, Slack tokens.

---

## 3. Drift / debt

### Stale folder reference: `Team Knowledge/content-os/` does not exist

`Deliverables/2026-07-05-0655-vault-automation-analysis.md` links `[[Team Knowledge/content-os/calendar-spec]]` and `[[Team Knowledge/content-os/product-index]]` four times (lines 65, 66, 95, 337, 359). No `Team Knowledge/content-os/` folder exists anywhere in the vault. The actual content lives at `Hermes/CALENDAR.md` (calendar spec) and `Hermes/PITCH.md` (product/pitch index) — both created the same day, after the analysis file's mental model was formed. This is a same-day naming drift: the analysis was written assuming a Team Knowledge home for Content OS reference material, but the team decided (per Hermes/README.md: "Content OS modules merged … one brain, her call") to fold everything into `Hermes/` instead. **Fix:** update the four links in the vault-automation-analysis file to point at `Hermes/CALENDAR.md` and `Hermes/PITCH.md`, or add a redirect note.

Two other files mention "content-os" as a plain-text label, not a broken link — not drift: `Team/Pax - Researcher/journal/2026-07-05-ai-content-pipeline-landscape.md` (references a research artifact by that name, not a vault path) and the Hermes session logs (narrative only).

### SSOT duplication: Hermes/PITCH.md vs Hermes/BUSINESS.md

By design, not accidental — but worth naming as intentional duplication with a stated hierarchy: BUSINESS.md holds the canonical price/status/chat-word/theme table (the "volatile Notion snapshot" layer) and its own CTA-bridge rules. PITCH.md restates the same price/status/chat-word/theme for all 23 products as part of each product's "Identity" line, then adds pitch angles and teachable snippets. Every price, status, and chat word in PITCH.md is a **re-typed copy** of the BUSINESS.md table, not a link to it — meaning any future price/chat-word correction has to be made in two places by hand (both files carry the disclaimer "re-verify against Notion" independently, which mitigates staleness risk but doesn't remove the duplication). PITCH.md's own footer acknowledges this: "All prices/status/chat words are the BUSINESS.md 2026-07-05 snapshot — re-verify against Notion Products DB before live use." **This is a live SSOT risk**: if Notion changes a price and only BUSINESS.md gets updated, PITCH.md silently goes stale with no link to catch it.

### Task index staleness (confirmed directly)

`Team Knowledge/tasks/INDEX.md` states "Last rebuilt: 2026-06-05T00:00:00Z" and reports Open: 13 (summary) vs Open (15) (section header) — already internally inconsistent. It is missing at minimum: `tsk-2026-06-26-001-converter-pack-runtime-install` and `tsk-2026-06-26-002-slack-expansion-token-wiring`, both of which exist as files in `tasks/open/` but do not appear in the index at all. SOP-008 (rebuild task index) has not been run since June 5 despite a month of subsequent work. This matches the finding already made independently in the 2026-07-05 vault-automation-analysis.

### Stale cross-reference: `carousel-analysis.md` vs `carousel.md`

Per the vault-automation-analysis (which I did not re-verify file-by-file but is corroborated by the carousel session-log trail): `PKM/Developing Ideas/email-to-content-repurposing-system` and `Team/Wren - Brand Voice Partner/memory.md` both reference `PKM/Second Brain/analysis/carousel-analysis.md`, but the current canonical file (per the July 4 carousel-cleanup session logs) is `PKM/Second Brain/analysis/carousel.md`. Two live rename-drift links outside my directly-read territory — flagging per the source document's own finding, not independently re-verified in this pass.

### Hermes not in Team/agent-index.md

Hermes is fully built, tested (5 Gate-3 rounds), and running scheduled learning tasks, but has no row in the routing table at `Team/agent-index.md`. Every other active specialist (Larry through Val) has one. This is a documentation gap, not a functional one — Larry clearly already routes to Hermes in practice — but it means the canonical "who owns what" table is out of sync with reality.

### No SSOT overlap found between Team Knowledge and Hermes

I checked explicitly for facts duplicated between `Team Knowledge/` (SOPs/Guidelines/Workstreams) and `Hermes/` — none found. Hermes correctly treats the Second Brain vault (`PKM/Second Brain/`) as its source layer and Team Knowledge as pure ops/procedure; the two don't restate the same facts. The one soft overlap is procedural: Hermes's own learning/distillation loop (capture → distill → replace → clear, described in `Hermes/README.md` and `LEARNING.md`) parallels SOP-013 (semantic sweep) in shape but operates on a completely different corpus (Hermes voice corrections vs. Journal/PKM signal clustering) — not true duplication, just a similar pattern independently implemented. Worth a Guideline someday if a third such loop appears (per Team Knowledge/INDEX.md's own "if you're restating the same rule twice, write a Guideline" rule), but not current debt.

---

## 4. What the system already promised her (commitments recorded, not yet delivered)

- **A working "Content OS"** — the six-station pipeline (Test Kitchen → Mean Alyssa → Maître d' → Sous Chef → Hermes → The Pass) is fully designed and documented (`Deliverables/2026-07-05-content-os-master-plan.md`, `-architecture.md`) but Phase 2 (building the actual agent/skill stations) has not started — explicitly gated on her "go," which per the session logs she had not yet given as of this pass.
- **One full pilot batch** — "Run one full pilot batch (Week 1 Email theme: Edu carousel + Offer carousel + FTG + Simmer + pins) end-to-end for her Gate review before scaling to full-month batches" — promised as the next concrete step in the hermes-rebuild session log; not yet run.
- **BOH Summer Launch Email Sequence** — named the #1 highest-priority Ready Queue item across both the W27 weekly wrap and the vault-automation-analysis, assigned to Wren, source material fully staged — not visibly delivered as of the most recent logs.
- **Launch Carousel + Visual Palette** (Charta) — two briefs staged and ready to run in parallel per W27; delivery status not confirmed in territory read.
- **A rebuilt, source-grounded Hermes brain that measurably writes like her** — delivered and approved (v5, "wowww babe rlly good!") for the four Gate-2 test formats, but the scheduled deep-read study explicitly promises continuous improvement through Jul 7, with findings still pending her adjudication.
- **Vault Drift/Link/Index health sweep, Task reconciler, Connector health dashboard, Monthly review watchdog, Product/CTA source-truth sync** — five automations recommended in the July 5 vault-automation-analysis as the "highest-leverage order," none yet built. The analysis itself explicitly frames these as promised next steps ("First next action" per item) rather than completed work.
- **A June monthly wrap/intelligence update** — WS-007 and WS-009 exist as designed workstreams; no output has materialized for June despite three weekly wraps (W22, W23, W27) sitting in the folder as source material.
- **A product/CTA fact-sync layer wired to the live Notion Products DB** — repeatedly promised as a blocker-resolver across BUSINESS.md, MEMORY.md, and the master plan, but the actual Mack-built connector/verifier does not yet exist; it remains a "first next action."

---

## Territory not fully covered (scope note)

Per instructions, session-logs outside 2026/07 were read by title only (2026/05 and 2026/06, ~90 files) — no line-level open-thread extraction was done on those months; anything unresolved there that never resurfaced in a July log, weekly wrap, or open task file would not appear above. `Expansions/` was gloabbed but not read file-by-file beyond manifests and READMEs already summarized in Section 1. `PKM/Second Brain/` internals (carousel/analysis/examples files) were not directly re-opened in this pass — findings about them are relayed from the vault-automation-analysis and July session logs, not independently re-verified against the live files.

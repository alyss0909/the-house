---
title: Knowledge-loss follow-up — re-verifying the 2026-07-11 autopsy against today's vault
date: 2026-07-16
type: analysis
owner: fable
status: OPINION — Studio, verified against real files
linked_analysis: ["[[Studio/Analysis/2026-07-11-memory-autopsy-and-compounding-rules]]"]
---

# Knowledge-loss follow-up — 2026-07-16

This re-verifies every claim in [[Studio/Analysis/2026-07-11-memory-autopsy-and-compounding-rules]] against the vault as it actually stands today, five days after the compounding loop (SOP-040), NOW.md, and TEAM-BRAIN went live. Method: read the real files behind each claim, not the autopsy's summary of them. Fixes below were made directly where they were mechanical and safe, inside Studio only.

## Site-by-site verdicts

### 1. The journal absorbs and returns almost nothing — FIXED SINCE

The autopsy's number (68/550, 12% connected) is stale. NOW.md now tracks journal connection live: 452/567 entries linked by non-generated sources as of today's handoff (80%, up from 64% at the start of this week's backfill push per [[2026-07-16-11-30_fable_merged-journal-backfill-and-penn-cleanup]]). SOP-040 makes journal resurface duty mandatory at every session, not optional, with named candidates surfaced in NOW.md each time. This is the single biggest resolved item from the autopsy. Residual debt is real but tracked, not hidden: 115 entries still zero-linked, and the ~290 already-connected entries have not yet been checked for the Penn-fabrication-era footer pattern (open thread on NOW.md).

### 2. The aggregation ladder above session logs mostly doesn't exist — PARTIALLY FIXED

`Studio/Team Knowledge/Monthly Reviews/2026/2026-06-monthly-review.md` now exists — the autopsy's claim that the monthly tier had fired zero times is no longer true. But wrap debt is still live and named: NOW.md reports the newest wrap is W27 while the current week is W29, a 2-week gap, tracked as a visible debt counter per SOP-040's design rather than silently ignored. This is the intended behavior of Version B's "wrap-debt with backfill semantics" — the debt is supposed to be visible and eventually cleared, not zero. Still leaking: the debt has not actually been cleared in the two weeks since NOW.md started tracking it.

### 3. The system went dark for three weeks and nothing noticed — FIXED SINCE (mechanism only)

SOP-040 step "Gap stub" (Version A's design) is written into the close-session protocol via NOW.md's own generation logic, and the Claude Code SessionStart hook plus the "House night shift" scheduled task (documented in SOP-040's Automation layer section) now regenerate and check NOW.md automatically. No new multi-week gap has occurred since installation, so the mechanism is unproven in the failure case it was built for, but it is structurally present, which it was not on 2026-07-11.

### 4. Insights logged but never graduated are gone — STILL LEAKING

Confirmed directly: `reference_icor_entity_definitions.md`, described in the 2026-05-27 session log as something "saved to memory... must be read before any routing recommendation," does not exist anywhere in the vault (`Glob **/reference_icor_entity_definitions*` returns nothing). It exists only in the host-local Claude memory index, exactly as the autopsy described. Also confirmed: SOP-040 as actually written has seven close-session steps (Fates, Thread diff, Two-touch rule, Precedent row, Journal duty receipt, Hand-off, Regenerate) and none of them is Version A's proposed "No host-local memory" check ("did I rely on or save any rule not on disk in the vault?"). That specific gate was designed on 2026-07-11 but never installed into the live SOP. This is a real gap: the mechanism that would have caught this exact failure mode going forward does not exist yet. Recommend adding it as SOP-040 close-session step 8.

The Two-touch rule (step 3) that would have saved "Four Layers" is now live, which is the forward-looking fix; it does not retroactively fix rules already stranded in host memory.

### 5. The human rung of the ladder has never fired — PARTIALLY FIXED

NOW.md now surfaces due check-backs by name every session, which is new infrastructure since the autopsy. As part of this audit I resolved the 3 check-backs NOW.md listed as overdue (all detailed in "Overdue check-backs" below). `team_brief_status` frontmatter (added to garden notes since the autopsy) now captures the "she did it herself, outside the system" case explicitly rather than leaving it silent — `middle-ground-entrepreneur.md` records `team_brief_status: closed 2026-07-10 — Alyssa wrote and sent the launch emails herself`. That is a direct fix of the autopsy's flagship example (the BOH launch signal shipping without the system noticing). Still leaking: her non-responses on the 13 stale open tasks (see #6) are still not distinguishable from "she never saw it."

### 6. Alyssa-review tasks are where decisions freeze — STILL LEAKING

NOW.md's own debt counter confirms this is unresolved and, if anything, worse than the autopsy's snapshot: 13 stale open tasks (14+ days), worst at 45 days (`tsk-2026-06-01-004-telegram-claude-automation.md`, `tsk-2026-06-01-002-second-brain.md`). The stale-task escalator Version A proposed (7d -> Pulse candidate, 14d -> pointer line, 28d -> dormant) is not yet built; tasks just accumulate in `tasks/open/` with no automatic compression or escalation. `tsk-2026-06-04-001-review-claude-routines-automation-report.md` is a clean example: created 2026-06-04, still open 42+ days later, and until this pass its own source-material link was silently broken (pointed at a pre-restructure `Deliverables/` path that no longer exists — fixed below).

### 7. Archive buries conclusions with bodies — PARTIALLY FIXED (this session)

Extracted conclusions from 3 substantial buried reports into [[Studio/Team Knowledge/PRECEDENT-INDEX.md]] under a new "Ops / Automation" heading, each with a wikilink back to the archived source:

- [[Archive/Deliverables-history/2026-06-04-claude-routines-automation-fit-report.md]] — the "build small and vault-native, not a generic catalog" conclusion, cross-linked to the independent `system-already-beats-external-tools` signal that reached the same verdict three weeks later.
- [[Archive/Deliverables-history/2026-06-04-ops-assistant-revenue-delegation-brief.md]] — Camila's highest-leverage lane is protecting revenue motion, already echoed in [[Notebook/Life/CRM/People/camila.md]]'s routing-cues section, now also indexed as a precedent.
- [[Archive/Deliverables-history/2026-07-05-vault-learn/learn-system-state.md]] — the read-only audit that predicted, six days early, the exact drift patterns the 2026-07-11 autopsy later formalized into rules (stale task index, SSOT duplication, a missing specialist row, a monthly tier that had never fired). This one was a true orphan: zero references anywhere in Studio or Notebook before this pass.

Also fixed the broken wikilink inside `tsk-2026-06-04-001-review-claude-routines-automation-report.md` that pointed at the automation report's old pre-restructure path.

Not extracted this pass, flagged for a future sweep: `Deliverables/2026-07-10-voice-metabolization-audit.md` (a substantial ~55-item gap audit between the Voice layer and the old Hermes brain, marked "REPORT ONLY," and not yet visibly referenced from Studio/Voice or Studio/Hermes) and the hiring-research reports in `Archive/Deliverables-history/` (business-strategy-partner, remi, vera) — lower priority since their outcomes are already reflected in the live agent roster.

### 8. The signals dashboards lie — FIXED (this session)

Confirmed and fixed two real desyncs against garden-note frontmatter (the declared single source of truth):

- `people-undervalue-niche-obsessions` — `signals-index.md` showed `signal_status: developing` with "Garden note: not yet," while the garden note itself (which exists) reads `recurrence_count: 6`, `signal_status: thesis-ready`. Index corrected to `thesis-ready` with the link restored.
- `ai-team-as-mirror-not-replacement` — index showed count 5 / last seen 2026-06-06; the garden note (fed by three new July 5 captures) reads count 8 / last seen 2026-07-05. Index corrected to match. The garden `Developing Ideas/INDEX.md` table had the same stale row (count 5, "Last Fed" 2026-06-05) — fixed there too, which confirms the autopsy's "three files hold the same fact" pattern was still live in a third file the autopsy didn't separately name.

All other active signals in the index (`middle-ground-entrepreneur`, `email-to-content-repurposing-system`, `boh-as-permission-not-product`, `slow-biz-creative-freedom`, `system-already-beats-external-tools`, and the graduated `easiest-email-highest-return`) were checked line by line against their garden notes and already matched — those had already been fixed in earlier passes (visible from the dated correction notes already inside several garden notes' own Check Back sections).

### 9. The Hermes loop's own plumbing partially broke in the restructure — STILL LEAKING (scheduling) / FIXED (two new file-path breaks found and repaired)

The `hermes-deep-voice-study` cron is still scoped exactly as the autopsy found it: `0 4,5 5-7 7 *`, hard-coded to July 5–7 only (confirmed in [[Studio/Team Knowledge/session-logs/2026/07/2026-07-05-23-45_larry_hermes-deep-read-scheduling]], no later session log shows a re-scope). This is an OS-level cron, not a vault file, so it could not be fixed from inside this audit's Studio-only scope — flagging it again as the still-open repair the autopsy already named.

Two related plumbing breaks were found fresh this session and fixed, both live automation surfaces pointing at the dissolved `PKM/` folder:

- `Studio/Content/dashboard/advance-watch.mjs` — the `/loop` skill's mandatory-load block for Cass (dispatched on every arc-building trigger) told the agent to read `PKM/Second Brain/examples/Carousels/`, `PKM/Second Brain/analysis/carousel-slide-by-slide.md`, `PKM/Second Brain/COMPASS.md`, and `PKM/My Life/Offers/` — all paths that were dissolved into `Library/` and `Studio/Analysis/` on 2026-07-10. Every Cass dispatch since the restructure has been carrying broken load instructions. Fixed to the real current paths (`Library/Examples/Carousels/`, `Studio/Analysis/carousel-slide-by-slide.md`, `Studio/Analysis/COMPASS.md`, `Library/Offers/<offer>/MAP.md`), each verified to exist.
- `Studio/Hermes/learning/deep-reads/INDEX.md` — all 8 rows in the deep-read pointer table had markdown links whose display text already said `Library/Examples/...` but whose actual href still pointed at `../../../PKM/Second Brain/...` (and even that relative path was wrong by one directory level, landing inside `Studio/`). Every link in this file was broken before this fix. Corrected all 8 hrefs to the real files and verified each target exists on disk.

The 2026-07-08 field-reporter ruling not being encoded into the Voice layer (autopsy's third #9 claim) was not independently re-verified this pass — out of time budget, flagged for the next sweep.

## Overdue check-backs (NOW.md's 3, resolved 2026-07-16)

- **`boh-as-permission-not-product`** (was due 2026-07-04) — still genuinely developing. The related `middle-ground-entrepreneur` signal's launch-email use case shipped without the system, but this note's other two applications (sales page reframe, teaching evolution) never happened and are still live. Pushed to 2026-08-03 with a dated line explaining why.
- **`email-to-content-repurposing-system`** (was due 2026-07-04) — overtaken by events. [[Studio/Team Knowledge/Workstreams/WS-008-content-activation.md]] Standing Brief 1 ("Email -> Carousel") already does exactly what this note's immediate ask called for. Check-back closed with a dated line; the two longer-term options (BOH module, standalone workstream) stay open as content angles, no further chase needed.
- **`people-undervalue-niche-obsessions`** (was due 2026-07-06) — still genuinely developing, no overtaking event. Recurrence has sat at 6 (thesis-ready) since 2026-06-06 with no new feeding entries and no direction decision made. Pushed to 2026-08-05 with a dated line.

## Host-local memory references (Studio grep)

Grep for "saved to memory" / memory-file mentions across Studio turned up 3 session logs (2026-05-27, 2026-06-03 x2) that name specific memory files as durable references. Verified against the vault: `reference_icor_entity_definitions.md` is confirmed missing from the vault entirely — it exists only in host-local Claude memory, cited by a session log as "must be read before any routing recommendation." `project_rush_order.md` and `reference_tasks_folder.md` are also host-only, though their vault-side content is not orphaned (Rush Order has its own Studio/Notebook files; the tasks folder convention is documented in [[Studio/Team Knowledge/tasks/INDEX.md]]), so the practical risk there is lower. The structural fix (Version A's "No host-local memory" close-session check) was designed on 2026-07-11 but never added to SOP-040's actual close-session step list — see site 4 above.

## New leaks found (fresh eyes)

- **`advance-watch.mjs` and `Hermes/learning/deep-reads/INDEX.md` broken `PKM/` paths** — both fixed, detailed under site 9 above. These were live, currently-executing leaks (one an active agent-dispatch prompt, one a clickable reference table), not just documentation drift.
- **`Deliverables/2026-07-11-profit-menu-plan.md` is a fully worked, unlinked plan.** It's a complete execution plan (Notion database schema, page layout, copy-rewrite plan) for turning the Daily Profit Activities template into "The Profit Menu" — and it has zero references anywhere in the vault: no task, no session log, no DESK line. It directly matches the `boh-daily-profit-activities` signal already tracked in `signals-index.md` (status: radar), which also has no garden note yet. `Deliverables/` sits outside this audit's Studio-only edit scope, so the file itself was not moved or linked from Notebook; instead a pointer was added to the `boh-daily-profit-activities` entry in [[Studio/Signals/signals-index.md]] so the next sweep finds it. It still needs a real home (task or garden note).
- **`Deliverables/2026-07-10-voice-metabolization-audit.md`** — a substantial, recent (~55-item) gap analysis between the Voice layer and the old Hermes brain, marked report-only, not yet visibly consumed by any Voice or Hermes file. Flagged for extraction at the next sweep; not pulled into a living file this pass due to time.
- **The two `.base` files at vault root** (`Journal cards.base`, `Open tasks.base`) were checked for stale folder queries post-restructure and are both clean — they already point at `Notebook/Journal` and `Studio/Team Knowledge/tasks/open`, the correct current paths. No fix needed.
- **`PKM/` itself is not a leak.** It was checked directly: every subfolder is either a clean `MOVED.md` redirect stub or (for `My Life/` and `Second Brain/`) an `INDEX.md` that itself states the dissolution date and points at the correct new homes. The restructure's own redirect layer is working correctly; the leaks found this session were in code/links elsewhere that never got updated to match it, not in the redirect layer itself.

## Summary

- Sites re-verified against the 2026-07-11 autopsy: 9 numbered "where knowledge goes to die" items, plus signals-desync, archive-burial, and overdue-check-back follow-ups named explicitly in the assignment.
- Fixed this session: signals-index and garden-note-INDEX desync (2 signals, 3 files), 3 archived-report conclusions extracted into PRECEDENT-INDEX.md, 1 broken task wikilink repaired, 2 live broken-path leaks in active automation/reference files repaired (8 links + 4 mandatory-load paths), 3 overdue check-backs resolved with dated reasoning, 1 new cross-reference added (profit-menu plan to its signal).
- Confirmed still-leaking: wrap debt (2 weeks, not yet cleared), 13 stale Alyssa-review tasks with no escalator, the host-local-memory close-session check (designed, never installed into SOP-040), the Hermes deep-read cron's dead July-5-7 scoping (outside vault-file reach), and her non-response-vs-never-saw-it distinction on stale tasks.
- New leaks found beyond the autopsy's original list: the profit-menu plan orphan, the voice-metabolization-audit orphan, and the two broken-path leaks in live automation (now fixed).

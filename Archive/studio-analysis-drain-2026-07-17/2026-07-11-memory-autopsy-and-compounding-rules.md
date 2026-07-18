---
title: Memory Autopsy — where knowledge dies in the house, and the rules that make sessions compound
date: 2026-07-11
owner: Larry
status: OPINION — needs-Alyssa (Versions Rule decision package)
type: analysis
linked_guidelines: ["GL-009-source-boundaries-and-promotion", "GL-013-the-house-rules"]
linked_workstreams: ["WS-006-weekly-review", "WS-007-monthly-review", "WS-010-daily-pulse"]
linked_sops: ["SOP-011-write-session-log", "SOP-013-semantic-sweep", "SOP-039-house-keeping"]
---

# Memory Autopsy — 2026-07-11

**Method:** 24 agents over a full copy of the vault (2,700 md files). Eight subsystem readers, every high-severity claim adversarially re-verified against the actual files, ruleset design checked against the constitution (GL-013, GL-009, AGENTS.md). Hard numbers computed from the complete wikilink graph.

---

## The verdict

**The house is getting smarter about Alyssa's voice and taste, and merely accumulating about everything else** — her decisions, her ideas, her open loops, her business rhythm.

One subsystem genuinely compounds: the Hermes voice loop. Gate 3 went from *"i wouldnt publish any of this"* to *"wowww babe rlly good!"* across distill cycles, and W29's 9-for-9 hook rejection became W30 ship picks within 48 hours. Every other capture path is write-mostly: knowledge survives past ~7 days **only** if it was converted into a durable artifact (a GL/SOP/analysis file) in the same session it was learned. Otherwise it dies in a log nobody rereads.

The difference is not diligence. It is architecture: **the voice loop writes into files a downstream task is forced to load** (STYLE, KILL-LIST, taste-log — "loaded in every WS-011 step 1"), while everything else writes into files nothing is obligated to read (session logs, INDEX learnings, check-back dates, wrap nudges that fire into the void). Today, knowledge compounds only when Alyssa gets angry enough to force a Guideline into existence — GL-010's own header says it: *"Every rule here was paid for."*

The design principle for every rule below: **no capture without a forced consumer** — a named reader, at a named time.

---

## Where knowledge goes to die (verified, with receipts)

**1. The journal absorbs and returns almost nothing.** 68 of 550 entries (12%) have ever been referenced by anything in Studio. The garden notes that do exist are excellent — nine journal entries quoted verbatim in one signal note — but the sweep that feeds them is dead: no sweep covers anything after 2026-06-29, and because SOP-013 puts light-sweep output "inline to the weekly Brew," a skipped week leaves no record it was ever read. Textbook signal hits from July (weekly-cadence-outline, use-for-email-inspo) were never counted.

**2. The aggregation ladder above session logs mostly doesn't exist.** 149 logs; wraps exist for 2 of 5 log-bearing weeks (the "W27" wrap actually covers ISO W26); the monthly tier has fired **zero** times — `Monthly Reviews/2026/` is an empty directory. The WS-006 close-session nudge fired at least twice in July ("Weekly review pending for week 28") and was ignored both times. The nudge is proven insufficient pressure.

**3. The system itself went dark for three weeks and nothing noticed.** June 6–25: zero session logs while work demonstrably continued (Archive holds inbox-approval reports dated 06-09/10/11). No gap marker exists. The monthly tier — which reads only wraps — could never distinguish a quiet week from a lost one.

**4. Insights logged but never graduated are gone.** The "Four Layers" routing filter — logged twice in May as "the canonical ICOR routing" — never entered any SOP or Workstream; WS-004 uses an unrelated scheme and no post-May file mentions it. A graduated rule ("vault is ground truth, not session logs," 06-04) was silently erased by the 06-29 WS-006 rewrite. Four realignment-derived rules were "saved to memory" files that do not exist in the vault — host-local storage that no other session can read, cited by INDEX.md as if durable.

**5. The human rung of the ladder has never fired.** 0 of 7 thesis drafts ever touched by Alyssa. Every check-back date that ever came due was missed. The flagship signal (middle-ground-entrepreneur, thesis-ready since 06-27) was overtaken by reality: Alyssa wrote and sent the BOH launch emails herself on 07-10 — the signal's stated purpose — outside the system, and the sent emails were never filed. The system's answer to its own top idea shipped without it, and it didn't notice.

**6. Alyssa-review tasks are where decisions freeze.** 12 of 20 open tasks are 36–40 days old, mostly "review X and approve." Her non-responses are captured nowhere — the system cannot distinguish "she declined" from "she never saw it." Meanwhile the claude-routines report was archived unread while its review task stayed open.

**7. Archive buries conclusions with bodies.** 78% of Archive's 1,395 files are orphans. Substantial research reports (automation analyses, the vault-learn diagnosis that predicted the sweep failure) drained into `Deliverables-history/` with no extraction of their conclusions into any living file, no manifest, no supersession chain. Past work is findable only by someone who already remembers it. (Counter-example proving the pattern: the 07-09 restructure master plan was *fully* metabolized — zero living links to the archived plan because its every decision lives on as HOUSE-MAP, GL-013, SOP-039.)

**8. The signals dashboards lie.** signals-index says ai-team-as-mirror count 5 / last seen 06-06; its garden note says count 8 / last seen 07-05 (past the thesis threshold). HOME.md renders the stale index. Three files hold the same fact; one change desynced them all.

**9. The Hermes loop's own plumbing partially broke in the restructure.** The deep-read cron was scoped to July 5–7 only (would next fire July 2027) and pointed at dead `PKM/` paths; the 07-08 field-reporter ruling never got encoded into the Voice layer it now governs; corrections Alyssa gives Penn or Larry (not Hermes) have no capture path at all.

## Never captured at all (the ghost knowledge)

Alyssa's Keep labels (dropped plugin-side, years of her native taxonomy); everything saved to Keep since ~June 8 (last clean sync); the two June meeting transcripts (sitting outside the vault, media already deleted, decisions never extracted); her approve/reject rulings at every WS-004 gate; post-publish performance of anything the team wrote (the loop learns only from her vetoes, never from outcomes); what the Daily Pulse surfaced and whether she reacted (no pulse ledger — WS-010's own "never repeat" rule is unenforceable); which host ran each session (a live two-session collision is already on record); non-Larry specialists (0 of 149 logs authored by Penn/Hermes/others); and the house's own north star ("the house has no house-level mission written anywhere" — the system's own 07-10 trace).

---

## The rules (Versions Rule: A is safer, B is higher-upside)

Both versions passed a constitution check (GL-013/GL-009/AGENTS.md) and were corrected where they conflicted; corrections are already folded in below. Every threshold is a **dated default (2026-07-11)** with an escape hatch, not a law. Nothing below writes Notebook content or Library; everything is markdown-only.

### Version A — The Ratchet (low ceremony, bolts onto what exists)

**Retention**
- **Carry-forward block.** Every session log ends with max ~5 open threads (wikilinks to each thread's home + owner + next-check date). Next session open, Larry reads only the latest log's block and restates it. A thread may not vanish without a one-line `died because:`. Failed check flags the log (`lint: failed` frontmatter, burned down at weekly review) — capture is never withheld.
- **Fate-or-expiry line.** Every Decision/Insight/Realignment line in a log ends with either a wikilink to the durable file it was applied to this session, or an explicit expiry marker (frontmatter field, default two weeks). This turns the *proven* survival mechanism — artifact-first capture — from accident into requirement. Uses the existing GL-009 fate vocabulary; enforced inside SOP-011's house-rules check.
- **Archive toll.** Nothing enters Archive until its one-sentence conclusion + wikilink is appended to the living file that should carry it. Implemented as a tightening of GL-009's `archived` fate, enforced by SOP-039 check 13 — not a new patrol.
- **Journal coverage rows.** Penn appends pure-pointer rows (entry link → garden-note link, or `quiet`) at capture; the sweep still reads raw entries per SOP-013 (semantic clustering can't run on tags), but "swept, quiet week" becomes distinguishable from "never swept."

**Decay**
- **Wrap-or-skip gate.** If the newest wrap is >7 days old at close-session, Larry either runs WS-006 (light mode to be *defined inside WS-006 itself*, minimum sections named) or writes a dated `type: skipped` file that WS-007 counts as a gap. Missing wraps become impossible; skipped ones become facts.
- **Stale-task escalator.** 7 days untouched → Daily Pulse candidate; 14 days + waiting-on-Alyssa → compressed to one pointer line on the decision surface; 28 days → `dormant` state (after amending tasks/_template + SOP-004/006/007/008 to define it — and resolving the existing done-vs-closed ambiguity while there). Run inside SOP-039 check 7 / WS-006 Phase 3.
- **Check-back scan.** Runs silently at session open; surfaces at most ONE due item through WS-010's existing ladder (the Pulse stays "a note on the way in, not a gate"); the full due list burns down inside WS-006 Phase 2, widened from garden notes to tasks and signals.
- **Log cooling.** Wrapped logs get `wrapped: 2026-WNN` frontmatter (field added to the merged schema first). Logs stay in place forever — no Archive moves, no broken backlinks; the wrap is the readable surface, the raw log is cold storage in situ.

**Promotion**
- **Two-touch proposal.** Before appending any insight, grep logs/wraps for the same concept. Second appearance forces a *drafted proposal* flagged needs-Alyssa in the same session (never auto-graduation — WS-007 Step 4's confirmation gate stays hers). Hard ceiling: no concept lives as log-only more than twice, ever. (This is what would have saved Four Layers.)
- **Single-writer signals.** Garden-note frontmatter is the SSOT for count/status/last_seen; signals-index and the garden INDEX become regenerated pointer tables — mechanical transcription, no hand-edits. The three-file drift class dies by removing the copies, not by adding a sync checklist.
- **The decision surface is DESK's existing "Needs a ruling" list** — not a new file. Weekly review refreshes it: max ~5 pointer lines, each pre-framed as a reaction (yes / no / later / A-or-B) per GL-009, never "edit this thesis directly" (0-for-7 lifetime). Items unanswered after two consecutive reviews get marked `parked` with a date — her silence becomes data instead of vacuum. WS-006 Phase 4's one-decision rule needs Alyssa's amendment for this; until she blesses it, the list stays advisory.
- **Graduation receipt.** Any status change to thesis-ready/becoming/graduated requires one dated line stating the triggering event + evidence link; receipt-less statuses revert at weekly review.

**Session protocol**
- **One schema.** Merge `_template.md` and SOP-011 (they currently disagree on the entry-type enum); delete SOP-011's fictional Knox example and its Ready-Queue instruction (both verified GL-013 Rule 4 violations).
- **Gap stub.** At session open: if the newest log is older than the newest file in Studio/, write a one-paragraph gap stub (`unclosed: true`). June 6–25 becomes unrepeatable-silently.
- **Every hat logs one line.** Any specialist identity that changed a durable file adds one line to the session log. Ends the Larry-only corpus.
- **No host-local memory.** Close-session asks: "did I rely on or save any rule not on disk in the vault?" If yes, write it into the vault now. Host memory entries are treated as nonexistent.

### Version B — The Compounding Loop (event-driven, every capture gets a forced consumer)

Everything in Version A, plus:

- **Resume block at open.** Larry starts every session by transcribing (no judgment): the latest carry-forward block, all due check-backs, wrap-debt count, dormant-task count. Every session starts from compounded state instead of chat scrollback.
- **Close is a diff, not an essay.** The close gate is mechanical: every artifact has a fate, the open-thread diff balances (no silent deaths), every insight passed the recurrence grep, wrap-debt was checked. An unclosed session is caught at next open by the gap stub and increments a visible debt counter.
- **One freshness clock everywhere.** The existing garden-note `check_back` field extends (via GL-002 schema amendment) to GLs, SOPs, and Workstreams — default +60 days. WS-006 scans it weekly; expired knowledge is re-verified, superseded-stamped, or archived through the toll. (The erased "vault is ground truth" rule would have surfaced as an expired claim.) Library files excluded entirely — nobody stamps her shelf.
- **Wrap-debt with backfill semantics.** Unwrapped-log count surfaces in every wrap and Daily Pulse; the monthly review keeps WS-007's existing offer-to-backfill behavior (debt triggers backfill-or-skip, then runs — a dead week can never block the tier forever).
- **Outcome writeback.** The moment content ships to `05 Approved` or a broadcast sends, a task auto-creates with a +14-day check-back to pull real performance (Kit stats, saves) into **Studio/Analysis/taste-log.md** (the one home; format files link to it). SOP-013 Steps 6–7 already consume that file monthly. Closes the biggest never-captured gap: the loop finally learns from outcomes, not just vetoes.
- **Voice-layer inbox.** A new `Studio/Voice/inbox.md` — the authoritative layer finally gets an intake. Any specialist (not just Hermes) drops one line the moment Alyssa corrects any output in her voice; Hermes distills on its existing cycle into Voice/formats. Corrections given to Penn/Larry/plain chat stop evaporating.
- **Pulse ledger.** One pointer row per Daily Pulse (what was surfaced, any reaction). WS-010's own "never repeat, prioritize un-reacted" rules become enforceable; her non-reactions become visible pattern data.
- **Reaction lane.** Any reaction Alyssa gives anywhere — checkbox, chat, voice note — is transcribed verbatim by Penn into the garden note's reactions field with date + source. That transcription is the *only* event that can set `becoming`. Staged candidates expire back to `developing` after 21 unanswered days, with a dated line. Library promotion stays exclusively hers.

### What was rejected by the constitution check (so it doesn't come back)

A standalone LEDGER.md spine (duplicates SOP-011 metabolism + INDEX + wrap rollup; the sanctioned query path is the SOP-002 SQLite mirror *generated from* logs); moving old session logs to Archive (breaks thousands of backlinks); barring Alyssa-review tasks from tasks/open/ (re-creates the dissolved Ready Queue); auto-graduation without her confirmation; write-blocking gates that refuse to save a session log over a lint failure (over-capture beats under-capture); and a fourth competing freshness field.

---

## What to bless (the actual decision)

1. **Version A or Version B?** A is ~2 hours of protocol edits and works tomorrow. B is A plus the forced-consumer spine and roughly a day of wiring; it's the one that makes the *whole house* behave like the Hermes loop.
2. **The one-decision rule.** WS-006 Phase 4 currently caps asks at one per week. The refreshed DESK "Needs a ruling" list (max 5 pointer lines, reaction-framed) needs your amendment to exist.
3. **Immediate repairs regardless of version** (no policy change needed, team can just do them): re-scope the Hermes deep-read cron off its dead July-5-7 window and dead PKM paths; backfill or skip-stub W24–26/W28; fix the signals-index desync from garden frontmatter; extract conclusions from the top 5 archived reports into living files; re-run the Keep sync (last clean pull ~June 8).

*Filed by Larry, 2026-07-11. All receipts verified against disk. This document is Studio opinion until you promote or reject it.*

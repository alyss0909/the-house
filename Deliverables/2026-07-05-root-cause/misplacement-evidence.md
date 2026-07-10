---
name: Misplacement Evidence — Root Cause Investigation
type: investigation
date: 2026-07-05
status: complete
---

# Misplacement Evidence — Root Cause Investigation

> Triggered by Alyssa: "I'm sure I have webinar transcripts, so why are those folders blank — there's a deeper root cause why so many things are in wrong places." This document is the evidence trail, not the fix.

---

## Section 1 — The empty program folders (ctc/, yoe/, webinar-1/, webinar-2/)

**Verdict: never imported. Not duplicated, not misfiled — the content was named as a plan and the plan was never executed. The webinars Alyssa was thinking of ARE filed, just under a different name than the one she's picturing.**

### What the INDEXes say these folders were supposed to hold

`PKM/Second Brain/programs/INDEX.md` lists five program slots:

| Program | Folder | Status |
|---|---|---|
| Back of House (BOH) | `back-of-house/` | building — start here |
| CTC (full workbook) | `ctc/` | ❌ not started |
| Year of Emails (YOE) | `yoe/` | ❌ not started |
| Webinar 1 | `webinar-1/` | ❌ not started |
| Webinar 2 | `webinar-2/` | ❌ not started |

This table was written as a **placeholder scaffold for future programs**, not a record of work already begun. It has said "❌ not started" since the file was created and was never revisited once BOH absorbed all the actual import effort.

- **CTC** = "Content That Converts," a separate paid product. It surfaces repeatedly in Journal/offers content (`PKM/Journal/2024/04/2024-04-06-notion-ideas.md`, `PKM/Journal/2025/02/2025-02-27-current-big-ideas.md`) as an existing course Alyssa wants repurposed/turned into an email course — but it has **no offer file in `PKM/My Life/Offers/`** and no Second Brain content at all. It is referenced only as a future-import target in `BUILD-PLAN.md` ("CTC content index — not started") and open-thread lists in three separate session logs (2026-06-03, 2026-06-04) and the W23 weekly wrap. It was never sent, never imported, never duplicated elsewhere.
- **YOE** = "Year of Emails," a real, long-running product (has its own offer file: `PKM/My Life/Offers/a-year-of-emails.md`, live since 2021, its own sales page `examples/sales-pages/a-year-of-emails-sales-page.md`, and years of Journal ideation). YOE's **sales page and offer file exist**, but the *course/program content* (module structure, teaching material) that `programs/yoe/` was meant to hold was never imported — same as CTC, it sits in `BUILD-PLAN.md` as "YOE content index — not started" and "YOE email concepts → not started" (a Notion vault waiting on Mack's API connection, per BUILD-PLAN Phase 3).
- **"webinar-1" / "webinar-2"** are **not** placeholders for a specific named product — they were generic anonymous slots in the original scaffold, described only as "How does Alyssa structure a webinar? → webinar-1/ or webinar-2/." They were never mapped to a real webinar title.

### Where the real webinar content actually is

The webinars Alyssa remembers sending transcripts for **were imported — into `programs/back-of-house/webinars/`**, not into `webinar-1/`/`webinar-2/`:

- `Out of Office Webinar.md`
- `Slow Marketing Plan Class.md`
- `Slowly Viral Class.md`

This is documented end-to-end in session logs:
- `2026-06-04_larry_second-brain-transcript-mass-import.md` — filed `Slow Marketing Plan Class.md` into `programs/back-of-house/webinars/` in the same session that did the 21-transcript BOH mass import.
- `2026-06-04_pax_webinar-corpus-analysis-methodology.md` — Pax's methodology note for classifying "teaching webinar" vs. "pitch-class," written while building `analysis/workshop-webinar-analysis.md` from these same three files.
- `PKM/Second Brain/analysis/workshop-webinar-analysis.md` — the finished cross-webinar synthesis, sourcing all three files explicitly by path.
- `PKM/Second Brain/BUILD-PLAN.md` — "Webinars — `Slowly Viral Class.md` + `Out of Office Webinar.md` + `Slow Marketing Plan Class.md` ✅"

**Conclusion:** the empty `webinar-1/`/`webinar-2/` folders are dead scaffold names from before the BOH import happened. Once the three real webinars arrived, the team filed them under the program they actually belong to (BOH) instead of retiring or renaming the generic placeholder slots. Nobody went back to delete `webinar-1/`, `webinar-2/`, `ctc/`, or `yoe/` from `programs/INDEX.md`, so they still read as open/promised work. This exact finding was independently reached by two other passes already in the vault (`Deliverables/2026-07-05-vault-learn/learn-programs.md` and `Hermes/MAP.md` line 89: *"programs/ctc, yoe, webinar-1, webinar-2 = empty placeholders; transcripts never imported"*) — cross-confirmed, not a one-off read.

---

## Section 2 — Stale-rename links (carousel analysis files)

**Verdict: real broken filename, propagated by copy-paste across at least 4 non-session-log "live" files plus 11 historical session logs.**

### What actually exists on disk (`PKM/Second Brain/analysis/`)

- `carousel.md` — 9 top carousel post-mortems, performance data (✅ 2026-06-03)
- `carousel-slide-by-slide.md` — full slide-by-slide breakdown, imported from Claude OS source (✅ 2026-07-04)
- `carousel-flow-and-weird-hooks.md` — exists, **not listed in `analysis/INDEX.md`**
- `carousel-hook-forensics.md` — exists, **not listed in `analysis/INDEX.md`**

There is **no file called `carousel-analysis.md`** and never has been — the INDEX and BUILD-PLAN have only ever pointed to `carousel.md` and `carousel-slide-by-slide.md`.

### Live files still linking the wrong name `[[PKM/Second Brain/analysis/carousel-analysis.md]]`

- `PKM/Developing Ideas/email-to-content-repurposing-system.md` (two references, lines 10 and 34)
- `PKM/Second Brain/ready-queue.md` (line 58)
- `Team/Wren - Brand Voice Partner/memory.md` (line 80)

Plus 11 historical session logs and one weekly wrap that used the same wrong name in narration (lower priority — they're logs, not live routing surfaces, but they perpetuate the error every time someone greps history for "how do I cite the carousel analysis").

**How the wrong name likely originated:** early session logs (2026-06-03/04) describe building "the carousel analysis" as a generic phrase, and at least one contributor wrote it as a literal filename (`carousel-analysis.md`) instead of checking the actual filename (`carousel.md`). That wrong name then got pasted forward into `ready-queue.md`, Wren's memory file, and the Developing Ideas garden note — none of which were checked against the real `analysis/INDEX.md` at the time of writing.

---

## Section 3 — INDEX-vs-disk reconciliation

### `PKM/Second Brain/analysis/INDEX.md`
Missing from the INDEX table but present on disk:
- `boh-teaching-index-phases-0-2.md`
- `boh-teaching-index-phases-3-5.md`
- `carousel-flow-and-weird-hooks.md`
- `carousel-hook-forensics.md`
- `email-microstyle-forensics.md`
- `simmer-opening-forensics.md`

Six files (roughly a third of the folder) are invisible to anyone routing through the INDEX table, meaning any specialist following COMPASS → INDEX will never discover them. No entries promise files that don't exist here — the drift runs one direction: **disk has outrun the INDEX**, consistent with files added directly during working sessions (e.g., carousel forensics work on 2026-07-04) without a corresponding INDEX edit.

### `PKM/Second Brain/INDEX.md` (master) and `programs/INDEX.md`
- Master INDEX is accurate for what it lists (COMPASS, key files by name) — no false promises found.
- `programs/INDEX.md` promises `ctc/`, `yoe/`, `webinar-1/`, `webinar-2/` — all four are empty on disk. See Section 1. This is the one INDEX in the vault that is actively "lying" (entries promising folders/files that don't exist), and it has been that way since creation.

### `PKM/My Life/Offers/INDEX.md`
No gap. `rush-order.md` **is** listed (status: idea) and **is** present on disk — the suspicion in the mission brief doesn't hold up; Offers/INDEX and disk are in sync (26 offers listed, 26 files on disk including INDEX.md itself).

### `Team Knowledge/Workstreams/INDEX.md`
No gap. All 7 listed Workstreams (WS-001 through WS-007) correspond to real linked files; nothing on disk is missing from the table (only WS files checked — not scanned for extra orphan WS files beyond the 7, but the table itself is internally consistent with everything referenced elsewhere in the vault).

### `Team/agent-index.md`
**Real gap: Hermes is missing.** `Team/Hermes - Alyssa Clone Writer/` exists as a folder, `.claude/agents/hermes.md` exists as a bound subagent shim, and per the user's own memory index Hermes is "an active AI team member... v2 rebuilt 2026-07-05" — but `Team/agent-index.md`'s routing table has no Hermes row. Anyone routing purely off `agent-index.md` (as Larry is instructed to do "on every request") would never discover Hermes exists. This is consistent with Hermes being hired/rebuilt in a session that updated the Team folder and the `.claude/agents/` shim but never touched the routing table itself.

Secondary note: `agent-index.md` still lists Wren as fully active for all copy tasks, while the user's memory notes "Wren deprecated for voice" as of the Hermes v2 rebuild. The index has not caught up with that decision either — same failure mode as the Hermes gap, just the inverse (stale entry vs. missing entry).

---

## Section 4 — Broken high-value wikilinks

### Real broken (not stale-rename, not placeholder) — systemic, not isolated

`[[operations]]` is linked from **39 files vault-wide**, sampled heavily in `PKM/My Life/Offers/` (13 of 26 offer files: `back-of-house.md`, `best-year-yet.md`, `biz-tracker.md`, `private-mentorship-w-alyssa.md`, `quarter-in-a-day.md`, `quarter-prompt.md`, `simmer-system.md`, `soft-ceo-monthly-notion-template.md`, `soft-ceo-sessions.md`, `soft-sundays.md`, `the-90-minute-reset.md`, `the-ceo-year-notion-planner.md`, `the-numbers.md`, `the-productive-entrepreneur.md`, `the-promo-planner-in-notion.md`) plus `PKM/My Life/Topics/pkm.md` and `PKM/My Life/Topics/INDEX.md`.

**No file named `operations.md` exists anywhere in the vault.** The real Key Element that all of these are trying to reach is `PKM/My Life/Key Elements/Business/business.md` — its own header self-links to `[[emails]] · [[socials]] · [[promos]] · [[offers]] · [[clients]] · [[brand-world]]`, confirming `business.md` is the canonical name and never called `operations` anywhere in its own content. This is a rename that happened at the Key Element level and was swept through `business.md`'s own links but never through the ~15 files across Offers/Topics that pointed to the old name. **Classification: real broken, stale-rename pattern (KE renamed operations → business, sweep incomplete).**

`[[work]]` — one instance, `PKM/My Life/Topics/INDEX.md` line 8 ("under [[work]]"). No `work.md` Key Element exists either. Likely the same renamed-KE issue, or a KE that was never created despite being referenced. **Classification: real broken**, isolated to this one file (not systemic like `operations`).

### Sample of ~30 other wikilinks tested for resolution

All resolved cleanly — no additional rot found in this sample:
- 7 Journal-dated wikilinks from `PKM/Developing Ideas/email-to-content-repurposing-system.md` (all 7 resolve to real files under `PKM/Journal/`)
- `[[business]]`, `[[emails]]`, `[[offers]]`, `[[promos]]`, `[[socials]]` (from the same file, and from `Key Elements/Business/emails.md`, `promos.md`) — all resolve to real Key Element files
- 5 Developing Ideas garden notes referenced from `PKM/Signals/signals-index.md` (`middle-ground-entrepreneur`, `email-to-content-repurposing-system`, `ai-team-as-mirror-not-replacement`, `boh-as-permission-not-product`, `slow-biz-creative-freedom`) — all resolve
- `PKM/Journal/2026/06/2026-06-27-sustainable-creative-biz-signal.md` (linked from Signals) — resolves
- `[[blog-and-pin]]`, `[[monthly-workshops]]` from `PKM/My Life/Goals/` — both resolve to real Goal files
- `[[GL-001-file-naming-conventions]]` — resolves (referenced from Goals, Offers, Topics)

**Classification: no placeholder-by-design links were found in this sample.** Every broken link found (`operations`, `work`) reads as accidental — nothing in the vault marks these as intentional future stubs (no "not yet created" annotation, unlike e.g. Signals' honest "Garden note: not yet" markers, which ARE placeholder-by-design and correctly labeled as such).

---

## Section 5 — Root-cause hypothesis

**The mechanism is not "things get lost." It's that this vault has two independent sources of truth for "does X exist" — the INDEX/table layer and the actual filesystem — and there is no standing step that reconciles them after a session ends. Every category of misplacement found above traces back to the same missing step, just triggered by a different kind of session:**

1. **Placeholder scaffolding gets written before the work exists, and nothing ever un-writes it once the work happens elsewhere.** `programs/INDEX.md`'s `ctc/`, `yoe/`, `webinar-1/`, `webinar-2/` rows were authored on day one as an aspirational shape for "programs we'll eventually have." When real webinar content did arrive, the team (correctly) filed it under the *actual* program it belonged to (`back-of-house/webinars/`) rather than the anonymous placeholder slot — but nobody returned to delete or repoint the now-orphaned placeholder rows. The INDEX still describes a plan, four months of work later, as if no decision had been made about it.

2. **Renames happen at the "source" file but the sweep stops at the first hop.** The `operations` → `business` Key Element rename updated `business.md`'s own self-links perfectly (it lists `emails`, `socials`, `promos`, etc., no self-reference, no old name) — but the ~15 *downstream* files that pointed **at** the old name were never touched. Same pattern, smaller blast radius, with `carousel-analysis.md` vs. `carousel.md`: whoever first typed the wrong filename in a session log never corrected it, and every subsequent write (ready-queue, Wren's memory, a Developing Ideas note) copy-pasted the same wrong reference forward, because nobody clicked the link or diffed it against `analysis/INDEX.md` before reusing it.

3. **INDEX files are edited reactively per-file, not reconciled per-folder.** `analysis/INDEX.md` is missing 6 of ~19 files not because of a dramatic failure but because the normal workflow is "build the file, maybe update the table if you remember" rather than "after any folder write, re-glob the folder and diff against the INDEX." The BOH import session log literally names the fix in its own insights section — *"Before any batch transcript import, run a glob against the transcript subfolder and cross-reference the INDEX quick-scan... this would have surfaced the exact gap list"* — meaning the team has already diagnosed this exact failure mode once, for one folder, and it was not generalized into a standing habit for every INDEX in the vault.

4. **Team/org structure changes (hiring, deprecating) update the specialist's own folder but not the routing table that points to specialists.** Hermes was stood up as a real folder + bound subagent shim without a matching row in `Team/agent-index.md`; Wren's deprecation-for-voice was decided (per memory) without the same table being edited to reflect it. This is the identical reconciliation gap as #3, just at the team-roster layer instead of the content layer.

**In one sentence: this vault treats "write the plan/table/link" and "verify the plan/table/link still matches reality" as two separate, optional steps, and only the first one is habitually performed.** Every fix in this document is a special case of the same missing standing behavior: after any import, rename, or org change, re-glob the affected folder(s) and diff against every INDEX/table that references them, before closing the session.

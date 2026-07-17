---
type: maintenance
agent: larry (scheduled night shift, Opus 4.8)
date: 2026-07-17
topic: Night shift — 7 journal connections, 2 team-brain rulings mined, hook path defect fixed
mined: true
---

# Night shift, 2026-07-17

Scheduled run of the compounding loop (SOP-040). Nobody present. Journal debt went 117 → 110, the team brain is two rulings richer, and one defect that could have bricked any session's shell tools is fixed.

## Journal duty receipt

Seven genuine Studio-side connections, all made FROM Studio files linking IN (journal boundary respected — nothing under `Notebook/` was touched):

- [[slow-biz-creative-freedom]] ← [[2021-08-16-the-laws-of-a-productive-business]]. Title-only capture, but the tell is that in August 2021 she was already trying to codify the thesis into named laws.
- [[slow-biz-creative-freedom]] ← [[2021-08-21-i-get-crazy]]. The sharpest 2021 statement of the thesis: "Boundaries make you more productive AND creative." Constraint produces creative freedom rather than costing it.
- [[easiest-email-highest-return]] ← [[2022-11-15-before-you-go]]. The 2022 ancestor of the book-a-call skeleton already on that signal; she rebuilt the same asset as an email a year later, which is the signal's own claim playing out.
- [[easiest-email-highest-return]] ← [[2023-01-02-webby-reg-bullets-i-like]]. The stockpile instinct in raw form — banking copy she rates so the next send is never written from a blank page.
- [[people-undervalue-niche-obsessions]] ← [[2021-04-09-the-students-who-are-most-successful-in-mpq-do-this-and]]. Holds the question ("what separates the students who succeed") that her 2026 answer replies to.
- [[boh-as-permission-not-product]] ← [[2020-12-16-get-them-to-believe-one-thing]]. Her 2020 vehicle-selling mechanic; this signal is the 2026 reply to it — same slot in the argument, opposite emotional payload.
- [[tsk-2026-07-16-003-plan-offer-factory]] ← [[2021-12-20-mini-program-inspo]]. Her own sketch of a small paid offer (8 weeks, high contact, pointedly no weekly modules). Whoever plans the factory should read it before inventing a template; it is also a live check on the Rush Order pilot.

Reviewed, no home — recorded rather than padded (all three of tonight's NOW candidates landed here, which is why the named candidates show no movement):

- [[2020-11-17-wildling]], [[2021-06-03-recalibrate]], [[2021-02-07-all-things-i-think]] — one-word musings tagged `becoming`. Nothing in the Studio genuinely relates yet; a link would be decoration.
- [[2025-09-13-moe-painting]] — a long transcribed family story about a Cape Breton painter. Personal, Notebook-side. No Studio file has a real claim on it.
- [[2026-06-17-mb-trend-report-wedding-filmmaking-2026]] — source PDF for her launch visual palette. Its only genuine home would be a public-page/brand-visual note, and per her 2026-07-16 ruling that work is parked until her brand details arrive. Worth revisiting when Iris builds the storefront tokens.

Counters: 450/567 → 457/567 linked (79% → 81%), debt 117 → 110.

## Playbook mining

Read the three unmined logs. Two new cross-cutting rulings landed in [[Studio/Team/TEAM-BRAIN]], neither previously captured anywhere outside its session log (grepped Studio first):

- **Never harvest from her** — *"there is genuinely SO MUCH to work with."* Asking her to feed the team source material is a design failure; if a desk thinks it needs input from her, it has not finished reading. Source: [[2026-07-16-21-30_larry_content-desk-rebuild]].
- **The bar for reaching her** — *"talk to me when theres something to review that you think i wont hate."* A standing filter on every hand-up, not just content. Source: same log.

Marked `mined: true`: the content-desk rebuild log, the Claude-usage autopsy log (its rulings were already law in [[AGENTS]] — nothing new to extract), and the 2026-06-06-to-25 gap stub (a record of silence, no reactions in it). Unmined session logs: 2 → 0.

## Fixed

**The hook path defect.** `.claude/settings.local.json` ran both hooks by relative path (`python scripts/hooks/bash-guard.py`). Any command that changed directory made every later Bash and PowerShell call fail before it ran — the guard hook itself crashed on a path that no longer resolved, and both shells were dead for the rest of the session. It happened tonight and blocked this run until fixed. Both hooks now use `$CLAUDE_PROJECT_DIR`, which is what that variable is for. Verified live: the shell recovered immediately. Fixed rather than flagged per her standing ruling; this is machine-room config, not a behavior change.

## Fates

- Decision: reviewed-no-home is a real outcome and gets recorded, not padded around → this log, and the pattern now has five named entries behind it.
- Insight: the two rulings mined tonight are the same shape as TEAM-BRAIN's existing "her role is REACTING, not authoring" line — the team keeps rediscovering that the vault, not Alyssa, is the input → [[Studio/Team/TEAM-BRAIN]]. Second appearance noted; if it shows up a third time it should graduate to a Guideline (needs-Alyssa).
- No precedent row. Routine maintenance session; nothing here a future session would go looking for.

## Thread diff

No threads opened, none closed. All four threads carried from [[2026-07-16-21-30_larry_content-desk-rebuild]] still stand and are restated below so `regenerate-now.py` carries them into NOW — every one waits on Alyssa or on Mack, not on this shift. Check-backs due: none. Wrap debt: 0 weeks (W29 current).

## Open threads

- Chat words for Bingeable Newsletters and The 5 Minute Newsletter are blank in Notion — Alyssa drops them in, posts become shippable. Flagged on every post page.
- Daily cron for /saves-sweep not yet wired (Mack; pairs with [[tsk-2026-07-15-001-notion-button-triggers]]). Until then it runs on demand.
- Cosmetic leftovers, safe but stale: HOME.md "this week in content" block still reads the old pitch sheet; WS-008 "pitch loop" phrasing. A genuine fix, not a taste call — the next session touching those surfaces should just do them.
- Awaiting her reacts on the four posts — her picks/edits are the first Positive-signal harvest for /content-run Step 1.

---
week: 2026-W29
date_range: 2026-07-13 to 2026-07-19
pass: LIGHT (SOP-039)
run_type: scheduled (house-keeping-weekly)
---

# House Check — 2026-W29

Run per [[Studio/Team Knowledge/SOPs/SOP-039-house-keeping|SOP-039]] LIGHT pass. [[HOUSE-MAP]] and [[Studio/Team Knowledge/Guidelines/GL-013-the-house-rules|GL-013]] read first; vault geography intact (Notebook/Studio/Library/Archive all present, HOUSE-MAP transition table not touched this week), no stop-and-flag condition triggered.

**1. Notebook write-lock.** This week's `Notebook/` writes trace to two sanctioned sources: (a) the 2026-07-16 "Journal cleanup stage 1 + 2" batch, explicitly `Alyssa-approved 2026-07-16` per commit message, verified by sampling two diffs — both mechanical (tag repairs, a blank-bullet fill, a stripped invented commentary line), her verbatim text intact; (b) ordinary Penn-style Inbox capture additions/dedup (the 07-17 `_duplicates-2026-07-17/` move-not-delete pattern, confirmed human-approved in [[Studio/Team Knowledge/session-logs/2026/07/2026-07-17-17-30_larry_mailroom-parked-tasks-north-star-and-inbox-cleanup|the session log]]: "write a full copy to a dated duplicates folder, then overwrite the original with a pointer stub... Larry did the actual deletion pass once Alyssa confirmed"). **Flagged, not touched:** one line in `Notebook/Journal/2024/05/2024-05-13-judy-arlen-flowers.md` (part of the 778ac22 "mechanical tag + link repairs" commit) fills a previously-blank plant-list bullet with "tall phlox (full sun)". The commit message itself discloses this batch "includes pre-existing uncommitted journal edits (Alyssa's own + night shift)," so this may simply be her own typing swept into the same commit — but a content addition isn't a link/tag/frontmatter repair, so I can't rule out an agent fabrication from the diff alone. Needs her confirmation, not a revert on suspicion. ⚠ flagged.

**2. Library stamp check.** New Library files this week ([[Library/Examples/sales-pages/the-5-minute-newsletter-sales-page]], [[Library/Examples/deliverables/bingeable-newsletters-deliverable]], [[Library/Examples/soft-sundays/3-emails-to-ctrl-c-and-money]]) all carry a `source:` field showing real-world origin (ThriveCart export, user-provided download, an actual sent House Report issue) — Alyssa-verbatim by class, no promotion stamp required. ✅ clean.

**3. One-home-per-fact lint.** Grepped the 5MN price ($11/$37) across Library and Studio/Content — single consistent value everywhere, correctly sourced ("confirmed by Alyssa 2026-07-16" in [[Library/Offers/the-5-minute-newsletter/MAP]]). The pre-existing Quarter-in-a-Day `$2,000` vs `$111` conflict is still self-flagged in its own [[Library/Offers/quarter-in-a-day/MAP|MAP]] §7 — not new, not re-flagging. ✅ clean.

**4. Ghost citation check.** Extracted wikilinks from this week's new [[Studio/Content/briefs/INDEX|Content briefs]] batch (12 offer-intelligence briefs) and verified every target. Found one dead pair: [[Studio/Content/briefs/for-the-girls-brief]] cited `Library/Examples/Carousels/2026-01-22-wasting-time-for-the-girls` and `.../2026-02-14-valentines-for-the-girls` as separate "real deck" files — neither exists as a folder; the actual transcriptions live as sections inside the already-linked [[Library/Examples/Carousels/for-the-girls-slide-copy]]. **Fixed** — repointed the citation to the real location. 🔧 fixed.

**5. Orphan check.** Sampled this week's substantive new files (all 12 content briefs, [[Notebook/Life/Projects/own-keep-capture]], [[Notebook/Life/Projects/notion-best-practices]], the Notion-mailroom bridge files) — each has a genuine inbound link from its zone index, NOW.md, a task, or [[Studio/Mailroom/README]]. No true orphans found. ✅ clean.

**6. Studio desk hygiene.** `Studio/` root holds only [[Studio/MAP]] (the zone map itself) — clean, no stray top-level files or folders this week. ✅ clean.

**7. Task truth.** No task showed visibly-done work under a stale status this week. Two priority items already surfaced by NOW.md's own debt counter deserve a name-check here rather than a silent re-flag: [[Studio/Team Knowledge/tasks/open/tsk-2026-06-01-004-telegram-claude-automation|tsk-2026-06-01-004]] (48 days stale, blocked_reason `token-regeneration-final-test-needed`) — its own 2026-07-13 update note already says the bot has been running fine on the un-regenerated token for weeks, so the blocker "may already be moot, but that's a call for whoever owns this task next" — still true, still not this pass's call. [[Studio/Team Knowledge/tasks/open/tsk-2026-06-01-002-second-brain|tsk-2026-06-01-002]] ("Build the Second Brain," assignee Alyssa, 48 days stale) reads as largely superseded by the Library/Hermes/Content OS build that's happened since — but it's assigned to her, not the team, so closing it isn't ours to decide. Both ⚠ flagged, not touched.

**8. Capture pulse.** `Notebook/Inbox/_KeepSidianLogs/` freshest file is today, `2026-07-19.md` — capture is live. Scheduled tasks: `TelegramCaptureBot` = Ready, `InstagramSavesSync` = Ready (both the correct, current automations per the 2026-07-13 fix); the superseded `myPKA - Telegram Capture Bot` task is correctly Disabled. ✅ clean.

**Aside (not a check-driven finding):** [[Library/Examples/Carousels/2026-01-15-slow-marketing-trends-pt-1]] is a completely empty file that predates this week (traces back through renames to the 2026-07-09 restructure baseline with no content ever committed) — not touched, since I can't confirm what belongs there without guessing. Flagging for Alyssa the same way empty-looking captures get flagged rather than deleted.

## Semantic sweep (SOP-013 weekly light)

Scope: journal entries since `last_sweep` (2026-07-16) through today. **Zero entries in range** — the newest dated file in `Notebook/Journal/2026/07/` is `2026-07-12-branding-skill-reel.md`; this week's work (carousel compiler v4, content-desk rebuild, Notion mailroom bridge) happened entirely in Studio, not the journal. Recurrence counts, statuses, and garden notes in [[Studio/Signals/signals-index]] are unchanged from the 2026-07-16 catch-up sweep. Frontmatter updated: `last_sweep: 2026-07-19`, `next_sweep: 2026-07-26`. No thesis drafts, no content-activation flags.

## Summary

| # | Check | Result |
|---|---|---|
| 1 | Notebook write-lock | ⚠ flagged (one ambiguous content line, needs her confirmation) |
| 2 | Library stamp | ✅ clean |
| 3 | One-home-per-fact | ✅ clean |
| 4 | Ghost citations | 🔧 fixed (for-the-girls-brief dead links) |
| 5 | Orphans | ✅ clean |
| 6 | Studio desk hygiene | ✅ clean |
| 7 | Task truth | ⚠ flagged (2 stale tasks, both need her call not ours) |
| 8 | Capture pulse | ✅ clean |
| — | Semantic sweep (SOP-013) | ✅ run, 0 entries in range, index frontmatter rolled forward |

**Needs Alyssa, not this pass:** confirm/revert the "tall phlox" line in the flowers journal entry; decide whether the Telegram token-regeneration blocker is moot; decide whether the Second Brain task is superseded by the Content OS build; say what (if anything) belongs in the empty 2026-01-15 slow-marketing-trends carousel file.

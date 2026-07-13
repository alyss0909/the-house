---
week: 2026-W28
date_range: 2026-07-06 to 2026-07-12
pass: LIGHT (SOP-039)
run_type: scheduled (house-keeping-weekly)
---

# House Check — 2026-W28

Run per [[Studio/Team Knowledge/SOPs/SOP-039-house-keeping|SOP-039]] LIGHT pass. [[HOUSE-MAP]] and [[Studio/Team Knowledge/Guidelines/GL-013-the-house-rules|GL-013]] read first; vault geography intact, no stop-and-flag condition triggered.

**1. Notebook write-lock.** Found — all `Notebook/` writes in the last 7 days trace to the sanctioned "Finale" restructure (2026-07-09/10), confirmed against session logs ([[Studio/Team Knowledge/session-logs/2026/07/2026-07-10-13-35_larry_bring-it-home-team-and-library-phase|bring-it-home-team-and-library-phase]] and neighbors). The only uncommitted Notebook edits are [[Notebook/DESK]] (standing team-write exception) and [[Notebook/MAP]] (zone-map infrastructure, not her content). ✅ clean, no reverts needed.

**2. Library stamp check.** Spot-checked files from this week's Finale promotion batch — [[Library/Offers/back-of-house/launch-emails-july-26]] and [[Library/me.md|Library/me]] both carry `promoted_by: alyssa`; Examples-folder additions (e.g. [[Library/Examples/soft-sundays/i-fixed-your-email-list]]) are Alyssa-verbatim by class, no stamp required. ✅ clean.

**3. One-home-per-fact lint.** Found one soft duplication: the CEO Year price/coupon fact (`$79`, coupon `CALMMYEAR`) is typed in both its canonical home [[Studio/Hermes/BUSINESS]] and again in [[Studio/Hermes/MAP]] (a content-calendar cell + a dated resolution-log line). The Quarter-in-a-Day `$2,000` vs `$111` conflict is already self-flagged in [[Library/Offers/quarter-in-a-day/MAP]] §7 — not a new find. **Flagged, not fixed** — editing Hermes's judgment/fact files without full context is a judgment call, not a mechanical strip.

**4. Ghost citation check.** Extracted wikilinks from this week's new live files ([[Studio/Team Knowledge/Guidelines/GL-014-the-compounding-architecture|GL-014]], [[Studio/Team Knowledge/SOPs/SOP-040-the-compounding-loop|SOP-040]], [[Studio/Team/TEAM-BRAIN]], the five new PLAYBOOK.md files, [[HOME]], [[NOW]], and three new Studio/Analysis notes). Two apparent hits were both false positives — `[[file]]` and `[[wikilink]]` are template placeholder/example text, not real citations. ✅ clean.

**5. Orphan check.** No newly-created files this week were found with zero connections. `orphan_list.txt` at vault root is not a check-5 hit — it's a working artifact of the pre-existing, already-tracked [[Studio/Team Knowledge/tasks/done/2026/07/tsk-2026-06-01-001-obsidian-home-page|journal backfill]] task (correctly open/blocked, see check 7). ✅ clean.

**6. Studio desk hygiene.** `Studio/` root holds only [[Studio/MAP]] (zone map, not work) — clean. Noted outside this check's literal scope: vault **root** has accumulated non-knowledge clutter this week — three `AGENTS.md.nkbak*` + one `CLAUDE.md.nkbak` editor-backup files, two empty `Untitled.canvas` / `Untitled 1.canvas` scratch files (2 bytes each), and a `_to_delete/` folder holding two old `.tgz` backups. None deleted (not a verified-stale redirect stub, and no one was present to confirm) — flagged for Alyssa/Larry to clear next session.

**7. Task truth.** Found one stale status: [[Studio/Team Knowledge/tasks/done/2026/07/tsk-2026-06-01-001-obsidian-home-page|tsk-2026-06-01-001]] ("Build Obsidian home page") was still `open` though [[HOME]] has been live since 2026-07-10 (built by Felix, styled by Iris) and meets every success criterion. **Fixed** — flipped `status: done`, wrote the outcome line, and moved the file to `tasks/done/2026/07/` per [[Studio/Team Knowledge/SOPs/SOP-008-rebuild-task-index|SOP-008]]'s folder-wins rule. `INDEX.md` itself was left untouched (hand-editing it is an explicit SOP-008 anti-pattern) — **needs a SOP-008 rebuild pass** to pick up this move. All other `tasks/open/` entries reviewed; none show completed work under a stale status. One near-empty stray file, `tasks/open/Untitled.md` (blank frontmatter, no title/content), is not a real task — flagged, not deleted.

**8. Capture pulse.** Found a live gap: the current `TelegramCaptureBot` scheduled task (logon-triggered, correct path under this vault) last ran 2026-07-10 12:57 PM with result code `3221225786` (failure) and has no recorded run since; no `telegram-capture.log` exists at its expected path to diagnose further. The newest genuinely-new file in `Notebook/Inbox/` predates that failure. The older, disabled `myPKA - Telegram Capture Bot` task (pointing at the pre-migration `mypka-scaffold-latest (2)` path) is correctly retired — not the problem. **Flagged for Mack** — this looks like a silently-dead capture automation, not something to fix by editing scheduled tasks unattended.

## Summary

| # | Check | Result |
|---|---|---|
| 1 | Notebook write-lock | ✅ clean |
| 2 | Library stamp | ✅ clean |
| 3 | One-home-per-fact | ⚠ flagged (Hermes MAP/BUSINESS duplication) |
| 4 | Ghost citations | ✅ clean |
| 5 | Orphans | ✅ clean |
| 6 | Studio desk hygiene | ✅ clean (root clutter flagged, outside strict scope) |
| 7 | Task truth | 🔧 fixed (1 status), ⚠ flagged (1 stray empty file, INDEX rebuild needed) |
| 8 | Capture pulse | ⚠ flagged (Telegram capture bot failing since 2026-07-10) |

**Needs Alyssa or a specialist, not this pass:** the Hermes MAP/BUSINESS fact duplication (Hermes territory), the Telegram capture bot failure (route to Mack), root-level clutter cleanup, and a SOP-008 task-index rebuild.

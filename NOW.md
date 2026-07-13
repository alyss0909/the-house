---
generated: 2026-07-13 10:48
owner: the compounding loop (SOP-040) — regenerated at every close-session
rule: EVERY session reads this file right after HOUSE-MAP, before any work
---

# NOW — the house resume surface

## Hand-off from the last session
<!-- HANDOFF:START -->
Ultracode journal backfill is NOT done. [[NOW]] now ignores generated Journal Web hubs for the debt counter and reports 329/550 linked by non-generated sources, with 221 true debt.
Missing artifacts in this Codex workspace: `/tmp/backfill_kept.json`, `/tmp/backfill_nohome.json`, `/tmp/backfill_rejected.json`, `/tmp/recovered_proposals.json`.
[[tsk-2026-07-11-001-journal-connection-backfill]] is open/blocked until those files are recovered or the true-orphan pass is regenerated locally.
Desk report filed and corrected: [[2026-07-12-journal-backfill-and-compounding-project-status]].
SOP-039 LIGHT house-check ran for 2026-W28: [[Studio/Team Knowledge/Weekly Reviews/2026/2026-W28-house-check|report]]. One stale task closed (home page build). Three items need a human, not an agent, and are linked from [[Notebook/DESK|DESK]] and this file's open threads: the Telegram capture bot has failed every run since 2026-07-10, a small fact duplication sits in Studio/Hermes/MAP.md vs BUSINESS.md, and vault-root has loose backup/scratch files nobody has cleared.
<!-- HANDOFF:END -->

## Open threads (from [[2026-07-12-12-34_larry_journal-backfill-compounding-status]])
- [ ] Recover Claude `/tmp/backfill_*.json` artifacts or regenerate the true-orphan pass locally.
- [ ] Verify the 63 unverified proposals if artifacts are recovered.
- [ ] Apply only verified genuine connections to non-journal target files.
- [ ] Alyssa re-auths KeepSidian ("Retrieve token" - Google login) to fix missing credentials.
- [ ] Decide yes/no on patching main.js to import Keep labels as frontmatter tags.
- [ ] Verify labels actually land once a sync runs; loop until visible in Notekeeper.
- [ ] Run W28 weekly review chain to burn down exposed wrap/check-back/task debt.

## Journal resurface duty (MANDATORY — the journal is the core)
Connection state: **329/550 entries linked by non-generated sources (60%)** — target is 100. Generated Journal Web hubs are navigation and do not count as ultracode proof. Read the candidates below; wikilink each into whatever it genuinely relates to (a signal, a person, a project, today's work). If nothing relates, add the link the other way: cite it from the map or garden note it should feed. Leave the journal more connected than you found it.
- oldest never-linked: [[2020-03-28-youve-qualified-for-off-this-order]] (`Notebook/Journal/2020/03/2020-03-28-youve-qualified-for-off-this-order.md`)
- newest never-linked: [[2026-07-01-use-for-email-and-post-inspo]] (`Notebook/Journal/2026/07/2026-07-01-use-for-email-and-post-inspo.md`)
- most related to last session: [[2022-02-12-how-i-went-from-broke-waitress-to-and-taking-out-a-second]] (`Notebook/Journal/2022/02/2022-02-12-how-i-went-from-broke-waitress-to-and-taking-out-a-second.md`)

## Due check-backs
- 2026-07-04 — `Studio/Signals/Developing Ideas/boh-as-permission-not-product.md`
- 2026-07-04 — `Studio/Signals/Developing Ideas/email-to-content-repurposing-system.md`
- 2026-07-04 — `Studio/Signals/Developing Ideas/middle-ground-entrepreneur.md`
- 2026-07-06 — `Studio/Signals/Developing Ideas/people-undervalue-niche-obsessions.md`
- 2026-07-11 — `Studio/Signals/Developing Ideas/easiest-email-highest-return.md`

## Debt counters
- Wrap debt: newest wrap is `2026-W27-weekly-wrap.md` (2 week(s) behind, current week W29)
- Journal connection debt: 221 entries with zero non-generated inbound links
- Stale open tasks (14d+): 13 — worst: 42d `Studio/Team Knowledge/tasks/open/tsk-2026-06-01-004-telegram-claude-automation.md`, 42d `Studio/Team Knowledge/tasks/open/tsk-2026-06-01-002-second-brain.md`, 41d `Studio/Team Knowledge/tasks/open/tsk-2026-06-02-001-automate-meetily-capture-inbox.md`

## Close-session gate (SOP-040 — no session ends without)
1. Fate line on every Decision/Insight/Realignment (wikilink to durable home, or dated expiry).
2. Open-thread diff balances — a thread leaves only with a `died because:` line.
3. Second-appearance insight -> drafted proposal flagged needs-Alyssa (grep first).
4. Journal duty done (resurface candidates linked, new entries connected).
5. Alyssa reactions -> dated verbatim line in the acting agent PLAYBOOK (+ TEAM-BRAIN if cross-cutting).
6. Rewrite the hand-off block above, then run `python3 scripts/regenerate-now.py`.

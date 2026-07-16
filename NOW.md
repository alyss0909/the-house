---
generated: 2026-07-16 13:03
owner: the compounding loop (SOP-040) — regenerated at every close-session
rule: EVERY session reads this file right after HOUSE-MAP, before any work
---

# NOW — the house resume surface

## Hand-off from the last session
<!-- HANDOFF:START -->
Two big passes ran 2026-07-16, Fable orchestrating, both on Alyssa's direct orders. Receipts: [[2026-07-16-11-30_fable_merged-journal-backfill-and-penn-cleanup]] and [[2026-07-16-13-00_fable_session-log-compounding-build]].

Morning: the journal backfill merged with the Penn cleanup. Journal connections went from 64% to 79% (87 verified new homes, 117 honest orphans kept on rotation, all fake tags and links fixed, Penn's commentary stripped with her words intact).

Afternoon: the same treatment for session logs, permanently. All 149 unmined logs were strip-mined: 6 of her rulings landed verbatim in the team brain (including fix-obvious-defects-without-asking and plan-first-unless-she-says-DO-IT), 25 reusable decisions now live in the new [[PRECEDENT-INDEX]], and the close gate now requires every session to mine itself (SOP-040 steps 3a and 7). The review ladder is repaired: W28 wrap real, W24-W26 honestly stubbed, the first monthly review ever exists, the June dark gap is permanently marked (finding: automation ran that whole gap with no human follow-through). The loss hunter fixed two LIVE leaks (the Content OS dispatcher was feeding dead folder paths to the arc-builder on every run) plus the signals index, all overdue check-backs, and the host-only iCOR definitions now live in the vault as [[GL-002-icor-entity-definitions]]. The debt counters are honest now: session logs no longer count as journal connections, and unmined logs are a visible counter on this board.

Alyssa ruled the storefront question same day: public-facing pages get their own look, separate from the vault's design system. She will send brand details later; until they arrive, nobody designs or ships public-page visuals. When they land, Iris builds the storefront token set. Ruling is in the team brain.

Next session: W29 wraps at week end. The stale-task escalator from the autopsy is still the biggest unbuilt piece. Night shift picks up the ~290 remaining commentary checks and the two unconsumed July deliverables.
<!-- HANDOFF:END -->

## Open threads (from [[2026-07-16-13-00_fable_session-log-compounding-build]])
- [x] Storefront-vs-vault design question: died because Alyssa ruled same day (2026-07-16): public-facing pages get their own look, brand details coming from her later. Ruling landed in [[Studio/Team/TEAM-BRAIN]]. New waiting state: Iris builds the storefront token set when her brand details arrive.
- [ ] Two July deliverables have zero consumers yet: the profit-menu plan and the voice-metabolization audit (flagged by the loss hunter, not extracted this pass). Owner: night shift.
- [ ] Hermes deep-read cron still scoped to July 5-7 only (OS-level scheduled task, outside vault reach). Owner: mack.
- [ ] Stale-task escalator (7d pulse candidate, 14d compress, 28d dormant) designed in the autopsy, still not built. Owner: larry.
- [ ] The ~290 already-connected journal entries still need the commentary check. Owner: night shift / wave 2. (Carried.)
- [ ] 13 stale tasks. The wrap debt thread from this morning: died because W28 wrap now exists; current-week W29 wraps at week end per WS-006.
- [ ] Penn audit item 5 (mechanical wikilink-resolve close checklist) now largely covered by SOP-040 steps 3a/7 plus GL-004's audit; formal wiring into WS-001 step 5. Owner: larry.

## Journal resurface duty (MANDATORY — the journal is the core)
Connection state: **449/567 entries linked by non-generated sources (79%)** — target is 100. Generated Journal Web hubs are navigation and do not count as ultracode proof. Read the candidates below; wikilink each into whatever it genuinely relates to (a signal, a person, a project, today's work). If nothing relates, add the link the other way: cite it from the map or garden note it should feed. Leave the journal more connected than you found it.
- oldest never-linked: [[2020-11-17-wildling]] (`Notebook/Journal/2020/11/2020-11-17-wildling.md`)
- newest never-linked: [[2026-06-30-meta-ad-details]] (`Notebook/Journal/2026/06/2026-06-30-meta-ad-details.md`)
- most related to last session: [[2025-09-13-moe-painting]] (`Notebook/Journal/2025/09/2025-09-13-moe-painting.md`)

## Due check-backs
- none due

## Debt counters
- Wrap debt: newest wrap is `2026-W28-weekly-wrap.md` (1 week(s) behind, current week W29)
- Journal connection debt: 118 entries with zero genuine inbound links (generated hubs and session logs do not count)
- Unmined session logs: 0 not yet strip-mined into playbooks/TEAM-BRAIN/precedent index
- Stale open tasks (14d+): 13 — worst: 45d `Studio/Team Knowledge/tasks/open/tsk-2026-06-01-004-telegram-claude-automation.md`, 45d `Studio/Team Knowledge/tasks/open/tsk-2026-06-01-002-second-brain.md`, 44d `Studio/Team Knowledge/tasks/open/tsk-2026-06-02-001-automate-meetily-capture-inbox.md`

## Close-session gate (SOP-040 — no session ends without)
1. Fate line on every Decision/Insight/Realignment (wikilink to durable home, or dated expiry).
2. Open-thread diff balances — a thread leaves only with a `died because:` line.
3. Second-appearance insight -> drafted proposal flagged needs-Alyssa (grep first).
4. Journal duty done (resurface candidates linked, new entries connected).
5. Alyssa reactions -> dated verbatim line in the acting agent PLAYBOOK (+ TEAM-BRAIN if cross-cutting).
6. Rewrite the hand-off block above, then run `python3 scripts/regenerate-now.py`.

---
title: 2026-W29 weekly wrap (Jul 13-19)
date: 2026-07-16
owner: fable
status: written mid-week on Alyssa's order; covers Mon Jul 13 through Wed Jul 16; append Thu-Sun at week end per WS-006
---

# Week of July 13 — Weekly wrap (W29)

## Week at a glance

The week the house started compounding for real. Monday was maintenance: the W28 house check ran, and its flags actually got consumed for once (the Telegram capture bot got fixed the same day instead of rotting as a flag). Wednesday was the big one: Alyssa unblocked the stalled journal backfill, merged it with the Penn fabrication cleanup, and then ordered the same treatment for session logs plus a leak hunt. By end of Wednesday the journal went from 64% to 79% genuinely connected, all 149 backlogged session logs were mined into permanent surfaces, the review ladder (weekly and monthly) was repaired, and the debt counters on NOW stopped lying.

## What shipped

- Journal backfill wave 1: 87 verified connections into her projects/topics/key elements/people, 117 honest no-home rulings, all invented tags fixed per GL-004, fabricated links removed, Penn commentary stripped with her words verified intact (commits `778ac22`, `386af62`).
- The session-log compounding build: [[PRECEDENT-INDEX]] (25 rows at install), SOP-040 close-gate steps 3a (self-mining) and 7 (no host-local memory), the unmined-logs debt counter, honest journal counter (commit `5866e09`).
- Review ladder repair: real W28 wrap, light W26 wrap, W24/W25 skip stubs, the first monthly review ever (2026-06), June 6-25 gap stub.
- Live-leak fixes: Content OS dispatcher dead paths, Hermes deep-reads INDEX, signals-index desync, 3 overdue check-backs, iCOR definitions exported to [[GL-002-icor-entity-definitions]].
- TelegramCaptureBot fixed (restructure path bug; captures were headed to a nonexistent folder) plus observability so silent death is visible (Mon, Mack).
- Rush Order topic page created; W29 wrap you are reading.

## Key decisions

| Decision | Receipt |
|---|---|
| Alyssa: public-facing pages get their own look, separate from vault design tokens; brand details coming from her | [[Studio/Team/TEAM-BRAIN]] 2026-07-16 |
| Alyssa: talk to her plainly, every message, always | [[Studio/Team/TEAM-BRAIN]] 2026-07-16 |
| Session logs are cold storage; every close mines itself; logs do not count as journal connections | [[2026-07-16-13-00_fable_session-log-compounding-build]] |
| In-journal edits were approved for the backfill only; the Notebook lock stands otherwise | [[2026-07-16-11-30_fable_merged-journal-backfill-and-penn-cleanup]] |
| Composio CLI cannot install on Windows (no npm package, no Windows binary, WSL absent); SDK-only for now | [[2026-07-13-12-12_mack_composio-cli-setup]] |

## Insights not yet graduated

- The June dark gap was automation running with zero human follow-through, not silence. If unattended automation proposes work, something must consume or expire the proposals, or they are noise with a timestamp.
- Most of Penn's "fabricated" links were near-misses on real file names. Fabrication and sloppiness look identical from a distance; only per-link verification tells them apart.

## Open threads (mid-week state)

- [ ] Wave 2 commentary check on the remaining flagged entries: running as this wrap is written.
- [ ] Stale-task escalator still unbuilt; 13 stale tasks, worst 45 days.
- [ ] Hermes deep-read cron still scoped to July 5-7 (OS-level). Owner: mack.
- [ ] Two July deliverables with zero consumers (profit-menu plan, voice-metabolization audit). Owner: night shift.
- [ ] Alyssa's storefront brand details: awaited; Iris builds storefront tokens on arrival.

## Next week setup

W30 starts with the wrap ladder current for the first time since May, an honest board, and zero unmined logs. The biggest structural gap left from the autopsy is the stale-task escalator.

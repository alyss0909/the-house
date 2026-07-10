# SOP-033 — Run Trend Scout Brief

- **Default owner:** Mack (wiring) / Suki (interpretation). Reusable by any agent. *Trend Scout is an automation + Suki function, not a hire — see [[HIRING-PLAN-v2]].*
- **Status:** Active (Gate-2 approved by Alyssa 2026-07-08).
- **Triggered by:** WS-011 Step 1; "run the trend brief", "weekly trend scout". Runs **Sunday**, before SOP-038, feeding Monday's review of a future publish week.
- **References:** [[trend-scout-monthly-routine]] (the monthly scrape it re-slices — do NOT re-scrape), [[trusted-sources]], [[GL-007-token-discipline]], [[GL-009-source-boundaries-and-promotion]] (mechanics not voice).

## Procedure
1. Confirm the latest monthly swipe file exists and is fresh: `Studio/Content/swipe/YYYY-MM-swipe.md` (+ `covers-YYYY-MM/`). The monthly scrape ([[trend-scout-monthly-routine]]) self-runs; this SOP re-slices it, never re-scrapes.
2. Read `trusted-sources.md` Layer 3 macro sources (~5 min) and the `taste-ledger.md`.
3. Write the brief to `Studio/Content/trend-briefs/YYYY-Www-trend-brief.md`.

## Required sections (8)
What's working now (each claim = a named real trusted-account example, never a vibe) · **what's STALE** (explicit — so we stop reusing dead mechanics) · top cover mechanics · top slide-structure patterns · examples from trusted accounts · opportunity notes for Alyssa's offers · **Mean Alyssa ammo per rung** · scrape gaps.

## Health checks (ceilings named — ponytail)
No-run detection = swipe-file mtime only (can't see inside the Claude app; upgrade path = point at the routine definition once the app exposes it). Gap reporting echoes what the swipe file logged. Staleness/overlap = naive text match, not semantic. WS-011 Step 1 halts on a stale-scrape banner before SOP-038 runs.

## Pass / Fail
- **PASS:** every claim carries a real example; stale mechanics named; Mean Alyssa gets concrete ammo; **brief header states the scrape date + which checks are mechanical-only, and any claim the wiring can't verify is flagged `[unverified]`, never passed silently.**
- **DEADLIEST FAIL:** external copy captured as *voice-usable phrasing*. The brief is mechanics-only; the second it reads like lines to paste, it's a [[GL-009-source-boundaries-and-promotion]] boundary breach that poisons everything downstream.

---
title: Trend Scout — Monthly Scrape Routine (canonical definition)
owner: Trend Scout role (Mack wiring / Suki interpretation)
type: routine-definition
mechanism: Claude Routine (Claude app), scheduled
cadence: monthly
next_run: 2026-08-01
output: Studio/Content/swipe/YYYY-MM-swipe.md
confirmed_by: Alyssa 2026-07-08
---

# Monthly Trend Scout Scrape — Routine Definition

This is the verbatim prompt that runs as a **scheduled Claude Routine** in the Claude app (not a vault script, not a Codex automation). It is set to run **monthly, next on 2026-08-01**. It calls the Apify Instagram scraper against the Layer-1 accounts in [[trusted-sources]] and appends winners to the monthly swipe file. **Do not rebuild it** — this file documents it so the vault has an inspectable definition (SOP-033 and the trend-scout-wiring doc point here).

> [!note] Alyssa never touches this. It self-runs monthly. If it hasn't run when expected, the swipe file's mtime is the (proxy) signal — see SOP-033 health checks.

## The routine prompt (verbatim, as scheduled)

```text
You are the Trend Scout for Alyssa's Content OS (working directory: C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)). Run the monthly Instagram swipe-file scrape.

OBJECTIVE: Refresh the niche swipe file with the latest top-performing carousels from Alyssa's trusted accounts, so the content team studies real winning covers + hooks — not generic blog trends.

STEPS:
1. Read `Studio/Content/trusted-sources.md` for the authoritative account list. Only scrape the "Layer 1 — Niche emulation set" accounts (and retry the "could not scrape" list). Do NOT scrape Layer 2 (reference only).
2. For each Layer-1 account, use the Apify Instagram scraper (search Apify Store for a profile/posts scraper) to pull that account's TOP posts by saves/reach/engagement — winners only, roughly the top 5–10 recent posts, not the full feed. Apify spend is pre-approved for this routine; keep it reasonable.
3. The value is on the COVER + the SLIDES, not the caption. For each winning carousel, download the slide images and READ them (vision/OCR) to capture: the cover text (verbatim), the hook, the slide-by-slide skeleton (what each slide does), and the engagement counts. Captions are low priority — a one-line note at most.
4. Append everything to `Studio/Content/swipe/YYYY-MM-swipe.md` (create the folder/file for the current month if absent). Group by account. Keep cover text and hooks VERBATIM (typos included). Include a source permalink + engagement count per entry.
5. If an account is private/unavailable this run, note it under a "Could not scrape this run" heading and move on — never block.

SUCCESS CRITERIA: a dated monthly swipe file exists with verbatim covers + hooks + slide skeletons from the scrapeable Layer-1 accounts, ranked by real performance. End your run with a 3-line summary: accounts scraped, total posts captured, any that failed.
```

## How SOP-033 uses it

The weekly Trend Scout Brief (SOP-033) does **not** re-scrape — it re-slices this monthly swipe output into the week's brief. If a weekly brief is built for a publish week beyond this scrape's freshness window, it carries a `[working ahead of last scrape — verify at ship]` banner (per the work-ahead cadence rule in WS-011).

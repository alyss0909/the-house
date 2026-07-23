---
title: Horizon — reference sheet (Press House Daily Digest)
client: Alex (The PR Collaborative)
repo: https://github.com/productiveentrepreneurteam/Horizon
upstream: https://github.com/Thysrael/Horizon
live_site: https://productiveentrepreneurteam.github.io/Horizon/ (currently 404 — broken)
pretty_link: alyssacoleman.ca/pressclub (404 — points at the dead site)
built_by: Camila (former team member; vibe-coded in her own Claude, not in Alyssa/Larry history)
language: Python
reviewed: 2026-07-22
owner: Larry
---

# Horizon — reference sheet

*Part of the [[INDEX|Alex client folder]]. Idea seed: [[2026-06-05-horizon-rss-for-alex]]. Data cousin: [[press-tracker-sheet]].*

Built for Alex by **Camila**, who no longer works with Alyssa. Camila built it in her own Claude, so none of it is in our conversation history — this sheet is the reconstruction so we can update it going forward.

## What it is

A fork of the open-source [Thysrael/Horizon](https://github.com/Thysrael/Horizon) news-radar, **rebranded to "Press House Daily Digest."** It scrapes sources on a schedule, uses an LLM to score/summarize them, and publishes a daily briefing to GitHub Pages (which was pretty-linked to `alyssacoleman.ca/pressclub`). For how the stock engine works (scrapers → AI → delivery), see the upstream; this sheet focuses on **our fork, its customizations, and its current broken state.**

## Fork status — NOT up to date

`git` against upstream: **31 commits ahead, 56 commits behind.**
- **Ahead (31)** = Camila's customizations (below).
- **Behind (56)** = a month-plus of upstream fixes/features we have *not* pulled in. So the code is stale relative to upstream.

## What Camila customized (the 31 commits)

- **Rebrand:** "Horizon Daily" → **"Press House Daily Digest"** — title, front-matter, site config, favicon, logo (swapped brand text for a logo), header height, home layout, styling, source cards open by default, removed filter pills / 3rd column, "Author" → "Writer".
- **Press-specific logic in `src/ai/summarizer.py`:** a **"Press House Wins"** summary, `find_press_club_sources`, "clean sources retrieval and detection," a "recent wins" data structure with a writer field, outlet normalization, and flagging articles from "clean writers." → She was bending the news engine toward **press coverage** (echoes the [[press-tracker-sheet]] vocabulary: Clean Writer, Clean Sources, Wins).
- **Config (`data/config.github.json`):** added a New York Times RSS feed, disabled AOL, added blocked-tag filtering.
- **Deploy plumbing:** several attempts to fix GitHub Pages (last commit, 2026-07-10, "publish .nojekyll instead of enabling Jekyll").

**Last real feature work: ~2026-06-25 to 06-30. Last commit of any kind: 2026-07-10** (a Pages fix). That timeline lines up with Camila leaving mid-fix.

## How it's supposed to run (architecture)

Two GitHub Actions workflows (cloud — does **not** depend on Camila's machine):
- **`.github/workflows/daily-summary.yml`** — cron `0 17 * * *` (12pm ET) + manual dispatch. Copies `config.github.json` → `config.json`, runs `uv run horizon --hours 24`, deploys `./docs` to the `gh-pages` branch. Needs repo **secrets**: `GOOGLE_API_KEY` (Gemini), `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, `LWN_KEY`.
- **`.github/workflows/deploy-docs.yml`** — on push to `main` touching `docs/**`, deploys `./docs` to `gh-pages` via peaceiris.

## ✅ FIXED 2026-07-22

Site is live again: `https://productiveentrepreneurteam.github.io/Horizon/` returns 200 and renders the digest list (latest 2026-07-21 on top). Two commits via Composio on the `productiveentrepreneurteam` account:
- [`409e177`](https://github.com/productiveentrepreneurteam/Horizon/commit/409e1776c1a1034f403eff25919118ded1fac9d8) — added `enable_jekyll: true` to `daily-summary.yml` so daily runs stop republishing `.nojekyll` (permanent fix).
- [`f82e92e`](https://github.com/productiveentrepreneurteam/Horizon/commit/f82e92ed532fe6f7646102dfcce7df12ec5480f5) — deleted the existing `.nojekyll` from `gh-pages` so Pages rebuilt with Jekyll.

`/pressclub` now points at the root (always-latest). Access to this repo is via **Composio GitHub → account `github_decker-implex` (productiveentrepreneurteam)** — no `gh` CLI needed.

Still 56 commits behind upstream (optional future merge). Original diagnosis kept below for the record.

## ✅ Press House Wins + student detection rewired to the live sheet (2026-07-22)

The "Press House Wins" section was reading a **stale, orphaned published CSV** (stuck on June). Rewired to read Alex's **live private sheet** through a token-gated Apps Script feed — see [[sheet-access-keycard]]. Now:
- **Students** (the roster it scans today's web articles for) come from Raw Data "Clean Sources" — the detection feature (`find_press_club_sources`) is finally switched ON.
- **Wins** come from 2026 Active Stories (published + linked), always current (July wins now show).
- Code: `get_feed()` in `src/ai/summarizer.py` (commit [`1a42ff2`](https://github.com/productiveentrepreneurteam/Horizon/commit/1a42ff2c7b674b14cbbfbea660688d7c3e03c77f)); secrets `PRESS_FEED_URL` / `PRESS_FEED_TOKEN`.

---

## Current state — CONFIRMED root cause (2026-07-22)

**The engine never stopped. The website did.** Verified against the public Actions API + the `gh-pages` branch:

- The **`Daily Horizon Summary` Action is running and SUCCEEDING daily** — runs on 2026-07-19, -20, -21 all green. It's a cloud cron; it does not need anyone's machine.
- `gh-pages` was **last updated 2026-07-21** ("📝 Daily Summary: 2026-07-21"). Fresh content is being pushed every day.
- **But `gh-pages` has no root `index.html`**, and no built dated summary pages. So GitHub Pages has nothing to serve → root 404, and old `/2026/06/25/summary-en.html`-style URLs 404.
- **Why:** Camila's final commit (2026-07-10) switched publishing from **Jekyll → `.nojekyll`.** Jekyll was the thing that *built* the homepage (`index.md` → `index.html`) and the dated summary HTML pages. With Jekyll off, the raw markdown/XML is pushed as-is and **the actual web pages are never generated.** The daily data (`feed-en.xml`, etc.) keeps refreshing; the human-readable site stopped rendering. She left mid-fix.

**So it's a one-time config break, not a maintenance burden.** Re-enable Jekyll (align `deploy-docs.yml`'s `enable_jekyll` + remove the `.nojekyll`), or drop a static `index.html` in `docs/`. One fix → site's back and keeps running itself as it already has been.

- **The `/pressclub` pretty link** forwards to this non-rendering site, so it 404s too. Downstream of the site fix — see [[prettylink-api]].

## Still needs her GitHub to action the fix (no `gh` CLI here)
Confirming Settings → Pages source (should be `gh-pages` / root) and pushing the Jekyll fix both need repo access — either she does it or she enables `gh` for me.

## To revive / update it (rough path, once we decide to)

1. Decide Jekyll **or** `.nojekyll` and make `deploy-docs.yml` + the docs consistent (kill the conflict).
2. Confirm Pages source in Settings; get one successful deploy so the root loads.
3. Verify/replace the Action secrets; manually dispatch `daily-summary.yml` to prove a fresh run.
4. Optionally merge upstream (we're 56 behind) — carefully, to preserve Camila's press customizations.
5. Repoint `alyssacoleman.ca/pressclub` at the working URL.

> **Open strategic question for Alyssa:** is Horizon (an external *news* digest) still what you want for Press Club, or has the real need shifted to reporting on *her own* [[press-tracker-sheet|press-tracker data]]? They're different tools. Worth settling before we invest in reviving this. See [[report-plan]].

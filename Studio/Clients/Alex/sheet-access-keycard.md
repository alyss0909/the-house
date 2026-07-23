---
title: Private sheet access — how Horizon reads the tracker
client: Alex (The PR Collaborative)
purpose: Let Horizon (and later the weekly report) read the private PRC Master Press Tracker live, without publishing it publicly
status: LIVE — built 2026-07-22
owner: Larry
---

# How Horizon reads Alex's private sheet (live, private)

*Part of the [[INDEX|Alex client folder]]. Feeds [[horizon-app]] (students + wins). Sheet: [[press-tracker-sheet]].*

## What we tried first (and why it didn't work)

A Google **service account** ("keycard") was the plan, but Alyssa's org enforces `iam.disableServiceAccountKeyCreation` (Google "Secure by Default"), which blocks downloadable SA keys. Changing it needs an org admin + weakens security. Abandoned.

## What we actually built — a token-gated Apps Script feed ✅

An **Apps Script web app bound to the tracker** (`doGet`) that returns a small JSON payload, gated by a secret token stored in the script's `ACCESS_TOKEN` property. It runs **as Alyssa**, so it already has access — nothing new shared, nothing public.

- **Returns only two slices:** `students` (Raw Data col G "Clean Sources" — the roster) and `wins` (2026 Active Stories, published rows with a real URL: story/outlet/writer/sources/url/date, newest 12).
- **Everything else stays private** — pipeline, deadlines, other tabs are never read.
- **Deploy:** Execute as *Me*, access *Anyone*; the token guards it.

## Wiring (done)

- Web app URL + token live as GitHub repo secrets on `productiveentrepreneurteam/Horizon`: **`PRESS_FEED_URL`** and **`PRESS_FEED_TOKEN`** (encrypted; Larry never stored the raw token beyond the setup value).
- `daily-summary.yml` passes both into the `Run Horizon` step (commit [`1a42ff2`](https://github.com/productiveentrepreneurteam/Horizon/commit/1a42ff2c7b674b14cbbfbea660688d7c3e03c77f)).
- `src/ai/summarizer.py` now fetches the feed once per run via `get_feed()`; `get_clean_sources`, `get_press_house_wins`, and `get_recent_press_house_wins` all read from it (old stale published-CSV links removed).
- Verified the endpoint returns live data incl. **July 2026 wins** and ~222 students.

## The weekly report reuses this

The client's weekly report ([[report-plan]]) can read the **same private feed** (or the sheet directly via in-house Composio access) — no new setup. One private source, all consumers.

## If the token ever needs rotating
Change `ACCESS_TOKEN` in the Apps Script properties, then update the `PRESS_FEED_TOKEN` repo secret to match.

---
date: 2026-07-22
closed: 2026-07-23
agent: Larry
specialists: [Mack]
theme: Alex / The PR Collaborative — Horizon rebuild + internal report plan
mined: true
---

# Alex (The PR Collaborative) — Horizon rebuild + report plan

## Context

New client working folder for **Alex (Alexandria Abramian / The PR Collaborative)**. Two big threads: (1) find + fix the **Horizon** app we built for her (an AI news-radar / "Press House Daily Digest"), and (2) design an internal weekly/daily **press report** off her Google Sheet. Session ran across 2026-07-22 into 07-23.

## What we did

- **Set up the client folder** `Studio/Clients/Alex/` (new Studio zone — needs Alyssa's blessing on the house map). Notes: [[INDEX]], [[horizon-app]], [[press-tracker-sheet]], [[report-plan]], [[report-build-plan]], [[sheet-access-keycard]], [[prettylink-api]] (Mack).
- **Found Horizon** in the team GitHub (`productiveentrepreneurteam/Horizon`, public fork of Thysrael/Horizon), built by Camila (former team member). Accessed the repo via **Composio GitHub → account `github_decker-implex`** (productiveentrepreneurteam); no `gh` CLI on this machine.
- **Diagnosed + fixed the site being 404/dead:** Camila's last commit turned off Jekyll (published `.nojekyll`), so the site stopped building. Re-enabled Jekyll + deleted `.nojekyll`. Site live again; `/pressclub` → root → latest digest, `/archive/` grid preserved. Redirect made durable in the home layout.
- **Read Alex's sheet** (🗝️ PRC Master Press Tracker, 23 tabs) via Composio Google Sheets + a targeted-range access rule (never dump the whole sheet).
- **Wired Horizon to read the live private sheet** via a **token-gated Apps Script web app** Alyssa deployed (service-account route was blocked by her org policy `iam.disableServiceAccountKeyCreation`). Secrets `PRESS_FEED_URL` / `PRESS_FEED_TOKEN` on the repo. Rewired `summarizer.py` (`get_feed`, `get_clean_sources`, `get_recent_press_house_wins`, `get_press_house_wins`) to the feed.
- **Turned ON the "detect our designers in today's fresh articles" feature** (was built but never given the student list). Now flags 🍾 untracked finds vs ⭐ tracked wins.
- **Polish per Alyssa:** champagne 🍾 marker; two-marker scheme (⭐ Name = tracked / 🍾 Press Club Source: Name = untracked); real dates (no clock time); sidebar "Sources"→"Outlets"; mobile tags fixed → stacked cards; header subtitle → "Give us this day our daily press, hallowed be the byline."; **KPI boxes rebuilt** to Our Designers in Press Today / This Month / New Press House Record (3,147) / Last Updated (feed sends the stats via `getStats_`).
- **Moved the digest cron to 13:00 UTC (6am LA).**
- **Mack** researched PrettyLink API → free-path options (WP Application Password, free Redirection plugin, browser automation).
- **Designed the internal report** (daily pulse + weekly wrap): [[report-build-plan]]. Handed Alyssa the **daily Apps Script spec** to build via her script chat.

## Decisions made

- **Not Horizon for the report** — it's a news-radar; the report is about her own tracker data. Report = Apps Script + Gemini + Gmail (no Claude API).
- **Internal team report first** (recipient: just Alex; daily 6:30am LA; weekly Thu 3pm LA; daily-first). Client-facing per-designer report parked.
- Private sheet access = **Apps Script web app feed**, not a service account (org blocked SA keys).
- Rolling **24h** scrape window kept (vs strict calendar day) so nothing slips through.

## Realignments (Alyssa, verbatim-ish)

- "this is my clients private info i cant publish it publicly" → killed the publish-to-web idea; pivoted to the token-gated feed.
- "i think you have daily and weekly backwards" → weekly = big roundup, daily = ops pulse.
- KPI boxes: "these callout boxes could be pulling SO MUCH MORE weight" → rebuilt to press-team metrics.
- Marker: keep "Press Club Source: Name", just new emoji 🍾 for untracked.

## Insights

- The daily-summary run **redeploys `docs/` from its checkout**, so CSS/layout fixes can be clobbered by an older queued run — push CSS to both `main` and `gh-pages` when iterating live, and know the next scheduled run (latest `main`) self-heals.
- Composio's sandbox `run_composio_tool` takes an `account=` kwarg — required to act as the team GitHub account (default is `alyss0909`, which lacks write access).
- `get_feed()` silently dropped keys it didn't explicitly copy — a reminder to pass-through, not reconstruct, external payloads.

## Open threads (tasked)

- [ ] **Daily report Apps Script** → **[[tsk-2026-07-23-004-alex-daily-press-report|tsk-2026-07-23-004]]** — verify before deploy, set RECIPIENT/Gemini key, wire 🍾 untracked finds.
- [ ] **Weekly report (Phase 2)** → **[[tsk-2026-07-23-005-alex-weekly-press-wrap|tsk-2026-07-23-005]]** — snapshots + milestone cards.

## Parked — decided, not tasked (resolved in writing)

- **`Studio/Clients/Alex/` new zone** — deliberately left as a live working folder; will fold into the house map at the next structure pass. Not blocking anything.
- **KPI "record" comma** (3147 → 3,147) — trivial display tweak; will do inline the next time we touch the layout. Not worth a task file.
- **Client-facing per-designer report (Option B)** — intentionally parked; revisit only if Alyssa raises it. Idea preserved in [[report-plan]].
- **PrettyLink free path** — researched ([[prettylink-api]]); parked because `/pressclub` already works via the Horizon fix. Revive only if she wants bulk link automation.
- **Horizon 56 commits behind upstream** — intentionally not merging; no need, and merging risks Camila's press customizations. Leave unless upstream ships something we want.
- **DST cron drift** — known and accepted; becomes 5am LA in PST winter. Nudge to 14:00 UTC in November if she cares (calendar-level, not a task).

## Next steps

1. When Alyssa's daily Apps Script is built → Larry verifies it, then deploy + confirm `RECIPIENT`/Gemini key.
2. Wire the 🍾 untracked-finds feed for the daily report.
3. Build the weekly wrap (Phase 2) when she's ready.

## Cross-links

- [[INDEX]] (Alex folder) · [[horizon-app]] · [[report-build-plan]] · [[sheet-access-keycard]]

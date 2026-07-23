---
title: Alex — Client Working Folder
client: Alexandria Abramian (Alex)
business: The PR Collaborative
status: active
owner: Larry
created: 2026-07-22
---

# Alex — Client Working Folder

The workshop for everything we build **for** Alex. Her relationship and life-facts live in the Notebook ([[alex]]); this Studio folder is where the app work, data analysis, and solution designs happen.

*Person: [[alex|Alexandria Abramian]] · Delivery layer: [[clients]] · Offer: [[private-mentorship-w-alyssa]]*

---

## Who she is

- **Business:** The PR Collaborative — https://www.theprcollaborative.co/
- The world's first Press House built for interior designers: teaching them to be their own PR strategists and secure press without hiring an agency.
- **Our work with her:** 1:1 private mentorship (brand + business strategy), plus the Horizon app we built for her.

## What we know about Horizon (the app we built)

**Found and read, 2026-07-22 → full write-up in [[horizon-app]].** The app is `productiveentrepreneurteam/Horizon` (public), a fork of the open-source [Thysrael/Horizon](https://github.com/Thysrael/Horizon): an **AI news radar** that scrapes sources on a schedule, has an LLM score + summarize them, and delivers a ranked briefing as a web page, RSS feed, email, and/or chat notification.

The repo is stock upstream (one Pages-deploy commit on top); the **Alex-specific config lives on the deployment, not in git** — so we still don't know where it's running or what sources it watches for her. Idea seed was [[2026-06-05-horizon-rss-for-alex]].

Key point for the report idea: Horizon **already** has the email sender, the AI summarizer, the cron schedule, and the published-page output. What it lacks is a **Google Sheets input**. See [[horizon-app]] for the full pipeline and the fit analysis.

## Active idea — Weekly automated report from Alex's CSV/Sheet

Turn Alex's [[press-tracker-sheet|PRC Master Press Tracker]] (23 tabs of multi-year press tracking) into a small automated **weekly report + email** to her team. Data is understood tab-by-tab in [[press-tracker-sheet]]; the approach and recommendation are in [[report-plan]].

**Direction (2026-07-22):** internal team reports, two of them — a **daily ops pulse** + a **weekly celebration wrap**. Built with Apps Script + Gemini (no Claude API), reading the live sheet + Horizon. Full spec in [[report-build-plan]]. Awaiting Alyssa's go on phasing + recipients.

## Research

- [[prettylink-api]] — can Claude Code programmatically create/edit Alyssa's Pretty Links (branded short links on alyssacoleman.ca)? Verdict: YES with caveats — needs the paid Developer Tools add-on + an API key. Also covers diagnosing the `/pressclub` 404.

## Related notes

- [[2025-05-29-inspo-for-alex]] — 80k email thank-you page example shared with Alex
- [[2026-04-27-for-alex]] — TikTok she saved to share with Alex

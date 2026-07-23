---
title: Weekly press report — approach & recommendation
client: Alex (The PR Collaborative)
status: proposed — awaiting Alyssa's direction
reviewed: 2026-07-22
owner: Larry
---

# Weekly press report for Alex — how we'd build it

*Part of the [[INDEX|Alex client folder]]. Data: [[press-tracker-sheet]]. Engine option: [[horizon-app]].*

## The goal

Turn the [[press-tracker-sheet|PRC Master Press Tracker]] into a small automated **weekly report** emailed to Alex's team — the week's new press wins plus running totals.

## What the data changed about my thinking

Two facts flip the decision:

1. **The metrics already exist.** The sheet's Dashboard tab already computes wins by month, writer, outlet, and source. We don't need to build analytics — we need to snapshot and send.
2. **Alex already runs Apps Script on this sheet** (the "(Script)" columns everywhere). So a script-based approach lives in an ecosystem she already owns and understands.

That means [[horizon-app|Horizon]] is **the wrong tool for this job.** Horizon's value is scraping *external* sources and having AI *score/summarize unstructured news*. This data is already structured and already counted — routing it through Horizon means writing a Sheets scraper AND a new digest mode that bypasses everything Horizon is good at. More work, worse fit.

## Alyssa's steer (2026-07-22)

She wants **an agent/AI in the loop** so the email is *useful*, not just a data dump — but **without the Claude API**. That rules out the old "cron + Claude API" shape and points at Gemini or a scheduled routine. Note: the Horizon Action already uses a `GOOGLE_API_KEY` (Gemini), so a **Gemini key already exists in her ecosystem.**

## Delivery options (AI in the loop, no Claude API)

| | Approach | Effort | Notes |
|---|---|---|---|
| **G** ✅ | **Apps Script + Gemini** — bound to the sheet; a Monday time-trigger reads Dashboard + the week's new wins, hands them to Gemini (free AI Studio key) for the written read, emails via GmailApp | Low–Med | All inside Google, where the data + her existing Apps Script already live. No server, no Claude API, free. **Lead.** |
| **R** | **Scheduled routine** — a weekly cloud agent reads the sheet through the connected Google Sheets tool, thinks, and drafts/sends the email via Gmail | Med | Most "agent in the loop"; no key to babysit. Slightly less hardwired-reliable than a script. |
| **M** | Make/Zapier with a built-in AI step | Med | Works, but adds a paid platform. Skip unless she already lives in one. |
| ~~A~~ | ~~Extend Horizon~~ | High | ❌ Wrong tool — see above. |

**Lead: G (Apps Script + Gemini).** Rock-solid, free, lives with the data. R if she wants it to feel like a teammate wrote it.

## What the team actually gets — content plan (react to this)

The value of an agent-in-the-loop is saying things the raw sheet can't. Every block below is grounded in columns the sheet already has:

1. **This week's wins** — new placements (Outlet · Story · Writer), from 2026 Active Stories / Press Archive where *Date Published* falls in the last 7 days.
2. **Momentum read** *(agent judgment)* — one line: "3 wins this week vs. your 12-week average of 2." Pulled from counts; phrased by the AI.
3. **Who to thank** *(agent judgment)* — rows where *Got Published? = yes* but *Thank you? = blank*. Surfaces slipping follow-ups. Quiet win-maker.
4. **Going stale** *(agent judgment)* — pitches past *Deadline* still not *Filed*, so nothing rots.
5. **Standout / streak** *(agent judgment)* — "Real Homes is your hottest outlet this month (5)" or a writer on a run. Straight from the Dashboard breakdowns.
6. **Running total** — headline number from the Dashboard ("323 wins").

The mix that earns the agent's keep: **a few facts + "here's what to *do* about it."** Blocks 3 and 4 are the ones a plain table can't give.

## Reserve Horizon for what it's actually for

If Alex ever wants an **external press-opportunity radar** — scanning HARO/journalist queries + outlet RSS for *new pitch opportunities* — that's a bullseye Horizon use case (and Camila already bent the summarizer toward "press club sources"). Different project; noted so we don't forget the engine we have. See [[horizon-app]].

## Open before build

- Confirm the Dashboard tab's exact cell layout (which cells hold the headline + breakdowns).
- Recipients + cadence (Monday AM to the whole team?).
- Which of the 6 content blocks she wants in v1.
- Delivery: **G** (Apps Script + Gemini) vs **R** (routine).

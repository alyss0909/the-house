---
title: PRC Internal Reports — build plan (daily pulse + weekly wrap)
client: Alex (The PR Collaborative)
audience: internal team (ops + celebration); client-facing version parked for later
status: plan — ready to build, awaiting Alyssa's go on phasing + recipients
reviewed: 2026-07-22
owner: Larry
---

# PRC Internal Reports — build plan

*Part of the [[INDEX|Alex client folder]]. Data: [[press-tracker-sheet]]. Wins engine: [[horizon-app]]. Access: [[sheet-access-keycard]]. Supersedes the delivery section of [[report-plan]].*

Two reports, two jobs:
- **☀️ Daily pulse** — lean, operational. "Here's what landed overnight, what's due, what to log."
- **📅 Weekly wrap** — the celebration. Full wins roundup, screenshot-ready milestone cards, totals + pacing.

## How it's built (delivery)

**Google Apps Script bound to the tracker + Gemini + GmailApp.** No Claude API, no server, free, private — and it lives in the same Apps Script setup Alyssa already deployed for the Horizon feed.

- **Reads** the sheet natively (`getValues()`), so all tabs are available live.
- **Thinks** via the Gemini API (free AI Studio key, already in the Horizon ecosystem) called with `UrlFetchApp` — writes the narrative lines + trend themes.
- **Remembers** week-over-week via a hidden `Report_Snapshots` tab (needed for milestones + pacing deltas).
- **Sends** a formatted HTML email via `GmailApp.sendEmail` (pretty cards, clickable links).
- **Runs** on time-driven triggers: daily ~7am, weekly Monday am.

## Data map (what each section reads)

| Signal | Source |
|---|---|
| New wins (with link) | `2026 Active Stories` — rows where Published = TRUE + has URL + Date Published in range |
| Who to thank | `2026 Active Stories` — Published = TRUE **and** Thank you? = blank |
| Due / overdue not filed | `2026 Active Stories` — Deadline ≤ today **and** Filed = blank |
| 🍾 Untracked finds | Horizon (the champagne detections — placements not in the sheet) |
| Ripple / totals | `Press House Wins` tab — Total Wins, This Year, This Month (house row + per designer) |
| Milestones (Trifecta, First Feature, 10+, Hall of Fame) | `Press House Wins` tab checkboxes, **diffed** vs last week's snapshot |
| Pacing | This period's count vs the `Report_Snapshots` history |
| Trend themes | Horizon's published articles (RSS/JSON of the day's scrape) → Gemini extracts top themes |

## ☀️ Daily pulse — content spec

Subject: `☀️ Press House — [Designer] landed [Outlet] + 2 more` (lead with the best win)

1. **New wins since yesterday** — each: **Designer** landed **Outlet** → *[Story]* · [read →]. Plus one ripple line: "→ her 158th; House now at 3,148 (37 this month)."
2. **⏰ On the clock** — due today / overdue and not filed yet. (Ops nudge.)
3. **🍾 Spotted, not logged** — Horizon's untracked finds → "add these to the tracker."
4. **📈 Today's theme** — Gemini one-liner: *"Big today: bathroom trends (4) + paint colors (3) — pitch your bath/paint clients."* (insight + pitching signal)

Keep it short — a 30-second morning scan.

## 📅 Weekly wrap — content spec

Subject: `📅 The Wrap — [N] wins this week 🏆`

1. **The week in numbers** — wins this week · vs last week (pacing) · month-to-date · all-time house total.
2. **🏆 Every win, roundup style** — grouped by designer (or outlet), each with link. The full scoreboard.
3. **📸 Milestone moments** *(the screenshot section)* — clean branded cards for anything that flipped this week: "SARAH STORMS unlocked the TRIFECTA — AD · Elle Decor · House Beautiful," "First feature ever for [X] — Morris & Essex." Formatted to drop straight into an IG story.
4. **📈 Themes of the week** — Gemini: the 2–3 biggest topics the press covered, as a pitching map.
5. **🧹 Housekeeping** — thank-yous still owed, anything gone stale. (Internal only.)

## The two tricky bits (flagging honestly)

1. **Snapshots for deltas/milestones.** "New this week" and "crossed a milestone" need last week's state to compare against. Fix: each weekly run writes a snapshot (per-designer Total Wins + milestone flags) to a hidden `Report_Snapshots` tab; next run diffs it. One-time setup, then automatic.
2. **Trend themes need Horizon's article list.** The report reads Horizon's daily output (its RSS feed or a small JSON it already publishes) and hands the titles to Gemini. One cross-system link — low risk, but it's the one dependency between the two projects.

## Build phases (recommended)

- **Phase 1 — Daily pulse (date-based, no snapshots).** Fastest to value: new wins + due/overdue + untracked + theme. Ship, let the team feel it.
- **Phase 2 — Weekly wrap.** Add the `Report_Snapshots` tab + milestone diffing + the screenshot cards. The showpiece.
- **Phase 3 — Polish.** Tune the Gemini voice, card styling to PR Collaborative brand, subject-line logic.

## Open decisions for Alyssa

1. **Recipients** — who gets it (just Alex? the whole team? separate lists for daily vs weekly)?
2. **Send times** — daily 7am ET? weekly Monday 8am?
3. **Which account sends** — Alex's, or a team address?
4. **Phasing** — daily-first (Phase 1) as recommended, or build both at once?
5. **Who writes the Apps Script** — Larry drafts the full code, or hand the spec to Alyssa's script chat like we did for the feed?

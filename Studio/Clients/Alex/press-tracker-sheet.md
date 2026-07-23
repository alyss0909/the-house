---
title: PRC Master Press Tracker — tab-by-tab breakdown
client: Alex (The PR Collaborative)
source: 🗝️ PRC Master Press Tracker (Google Sheet, owner accoleman100@gmail.com)
sheet_id: 1V9Ip69cTziMpiq5yYDGJj-WZigmU6xgo1hrYxWSR9hk
reviewed: 2026-07-22
owner: Larry
privacy: contains The PR Collaborative's private client/press data — structure only recorded here, never raw rows
---

# PRC Master Press Tracker — what's in it

*Part of the [[INDEX|Alex client folder]]. Feeds the [[report-plan|weekly report idea]].*

23 tabs, ~7,000+ rows total. It is a **multi-year press-tracking system**: each row is a press story/pitch/placement. Most tabs are hidden prior-year working files; a handful of visible tabs are the live system. Many tabs carry Apps-Script-computed columns (labelled "(Script)"), so **Alex already runs Google Apps Script on this sheet.**

## The live tabs (visible)

| Tab | Rows | What it is |
|---|---|---|
| **2026 Active Stories** | ~635 | The current pipeline. One row per story: Outlet, Story, Deadline, Filed, Writer, Sources, Clean Writer/Sources, Got Published?, Published URL, Date Published, Medium, PR Type, IG, Thank-you. This is where the week's activity happens. Frozen header + 2 frozen cols. |
| **Raw Data** | ~182 | A normalized, clean long-format feed (Query Type, Outlet, Story, Deadline, Filed, Writer, Sources, Published, Published URL, Date Published, Medium, PR Type, Ty Sent?, IG, Cover Story, Non-Exclusive?, Dropbox, Tracked). Almost certainly the Apps-Script-built source that powers the Dashboard. |
| **Press Archive** | ~3,225 | The master historical wins archive, slim 10-col shape: Outlet, Source, Medium, Non-Exclusive?, Cover Story, PR Type, Date Published, Published URL, Imported From. The long memory of every placement. |
| **Press House Wins** | ~1,000 | Merged wins with computed "[merged] Averages" columns — a rollup/analysis layer. |
| **Bio Responses** | ~124 | Google Form responses (a designer intake/quiz — "What's the first thing you see in a room…", favorite part of the design process, etc.). An inbound feed, not press tracking. |
| **Dashboard** | — | **Their existing report.** Gridlines hidden (built to be read). Headline "Total Published Wins: 320" with breakdowns by **Month, Writer, Outlet, and Source**. This already defines what "the numbers" mean to them. |
| **Calc_Data** | ~1,000 | Hidden helper tab feeding the Dashboard's calculations. |

## The hidden tabs (prior-year working files / directories)

Deprecated or archival, kept for history: **2022 / 2023 / 2024 / 2025 Active Stories**, **(Clean) 2025 Active Stories**, **HARO Submissions 2022–2025** (journalist-query responses per year), **🌚 Group Pitch(es) 2022–2024**, **Photo Stories**, **2025 Feature Wins**, **🌚 Gifts 4 Writers** (gifting log), **🌚 Writers** (a writer/outlet directory: Platform, Clean Outlets, RSS Feed, Clean Writers, When They Joined, Bios, Portraits, Badges). Tab 0 ("HARO Submissions 2024") is flagged in-sheet with "do i ignore this tab? all pulled into 2024 active" — i.e. superseded.

## How to access this sheet — LOCKED RULE (2026-07-22)

Do **not** pull the whole sheet into context. It's ~7,000 rows / 570K+ chars; `read_file_content` on it blew the token budget once. Access it in this order:

1. **Structure first** — `GOOGLESHEETS_GET_SPREADSHEET_INFO` with a fields mask (`sheets.properties(title,index,hidden,gridProperties)`). Tiny. Gives tab names + sizes. (Already captured above.)
2. **Targeted ranges only** — read the specific A1 ranges you need via the Sheets API (`ranges` param / values calls), e.g. `Dashboard!A1:B30`, `2026 Active Stories!A1:Z1` for headers, or the last N rows for "this week." Pull ~30 cells, never 7,000 rows.
3. **Bulk math → remote sandbox** — when something genuinely needs every row (e.g. recompute across Press Archive's 3,225 rows), run it in the Composio remote sandbox (Python/gspread): fetch → compute there → return only the small result. Raw rows never enter Larry's context.

Never `read_file_content` this sheet again. The shipped automation reads it natively inside Google (Apps Script `getValues()`), so this rule is only for Larry's build-and-analysis phase.

## What this means for the report

The important discovery: **the metrics already exist.** The Dashboard tab already computes wins by month, writer, outlet, and source, and Raw Data already normalizes the pipeline. A weekly report doesn't need to compute anything new from scratch — it needs to **snapshot what the Dashboard already knows + surface the week's new wins** and deliver that on a schedule. See [[report-plan]].

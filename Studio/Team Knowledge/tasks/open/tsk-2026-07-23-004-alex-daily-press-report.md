---
id: tsk-2026-07-23-004
title: "Verify + deploy Alex's daily press report (Apps Script), then wire untracked finds"
assignee: Larry
priority: 2
status: open
blocked_reason: "waiting on Alyssa's script chat to build the daily Apps Script from the spec"
blocked_by: null
created: 2026-07-23T13:15:00Z
updated: 2026-07-23T13:15:00Z
due: null
created_by: Larry
source: session
parent: null
linked_sops: []
linked_workstreams: []
linked_guidelines: []
linked_my_life: []
linked_session_logs: ["2026-07-22-alex-horizon-rebuild-and-report-plan"]
linked_journal_entries: []
tags: [client-alex, report, apps-script]
---

# Verify + deploy Alex's daily press report (Apps Script)

## What this is
Alyssa is building the **daily "Press House Pulse"** Apps Script from the spec in [[report-build-plan]] (via her separate script chat). When it comes back: Larry verifies it (like we did the feed), then it deploys. It emails **just Alex** at **6:30am LA** daily: new wins + ripple + links, on-the-clock/overdue, thank-yous owed, and a Gemini trend theme.

## Context one click away
- Spec: [[report-build-plan]]
- Data: [[press-tracker-sheet]] · Access: [[sheet-access-keycard]]
- Birthed in: [[2026-07-22-alex-horizon-rebuild-and-report-plan]]

## Success criteria
- Script reviewed by Larry before deploy (read-only on sheet, correct columns).
- `RECIPIENT` set to Alex's email; `GEMINI_API_KEY` in Script Properties (reuse Horizon's Gemini key).
- Time trigger fires ~6:30am America/Los_Angeles.
- **Wire the 🍾 untracked-finds section** (deferred in v1 — needs a clean export of Horizon's untracked detections).

## Updates
- 2026-07-23 13:15 (Larry) — created; spec handed to Alyssa, awaiting her build.

## Outcome
_(filled when done)_

# WS-009 — Monthly Intelligence Update

- **Status:** Active (new 2026-06-27)
- **Type:** Workstream — Larry-led, full system calibration
- **Owner:** Larry
- **Triggered by:** First Sunday of every month / "monthly review" / "do the monthly"
- **References:** [[SOP-013-semantic-sweep]], [[WS-007-monthly-review]], [[PKM/Second Brain/yes-pattern.md]], [[Hermes/learning/inbox.md]]

## What this is

The Monthly Intelligence Update is the system teaching itself. It runs deeper than the weekly review — instead of "what happened this week and what's moving," it asks "what has this system learned, and how should it change?"

The monthly review used to produce a document summarizing sessions. Now it produces intelligence updates that make every future session smarter.

---

## Step 1 — Run the Monthly Deep Sweep

Follow SOP-013 (Monthly Deep Sweep mode). Scope: all journal entries and captures from the previous calendar month.

Output: `Team Knowledge/Sweep Notes/YYYY-MM-deep-sweep.md`

---

## Step 2 — Voice Loop Review

Questions to answer:
1. What did Hermes produce this month?
2. What did Alyssa correct, and what's the pattern?
3. Are any corrections now repeating enough to become a standing rule?
4. Has the voice model gotten sharper (fewer corrections) or is it drifting?
5. What should be added to Hermes' learning loop based on this month's calibration entries?

Action: Write any new standing rules to Hermes' learning loop. Update the Pattern Summary section if it's been a month.

---

## Step 3 — Pattern Loop Review

Questions to answer:
1. What signals had the most growth this month?
2. Did any signals graduate into real things? (New content, new offers, new campaigns)
3. Did any developing ideas get Alyssa's direct edits? (Status update: developing → becoming)
4. Are there any signals that have been `developing` for 4+ weeks with no action? Flag them — they may need a different format to get Alyssa's attention, or they may need to be dismissed.
5. What is the most interesting cross-signal connection noticed this month?

Action: Update signals-index.md. Update developing idea note statuses. Flag anything stalled for Alyssa's attention.

---

## Step 4 — Taste Loop Review

Questions to answer:
1. What did Alyssa approve vs. pass on this month?
2. Are the YES patterns becoming more specific? More predictable?
3. Are there any new NO patterns Larry didn't know about before?
4. Are there things the team keeps offering that Alyssa keeps not acting on? Consider removing from rotation.

Action: Update taste-log.md with new patterns. Remove stale YES patterns that haven't held up in practice.

---

## Step 5 — Content Activation Review

Questions to answer:
1. What did the team produce this month?
2. How many ready-queue items completed vs. how many stalled?
3. What slowed things down? (Missing source material? Unclear brief? Wrong assignee?)
4. Are there standing instructions in WS-008 that should be updated based on this month's activation patterns?

Action: Update WS-008 standing instructions if needed. Update ready-queue.md (archive DONE items, review WAITING items).

---

## Step 6 — Update yes-pattern.md

`PKM/Second Brain/yes-pattern.md` is the standing filter brief used by every specialist before starting a task. Once a month, Larry updates it to reflect:
- Any new YES patterns confirmed this month
- Any new NO patterns confirmed this month
- Any shifts in what Alyssa is focused on (changes in active offers, upcoming launches, content priorities)

Format: a 1-page brief written in plain language, as if briefing a new team member. What does Alyssa care about right now? What is she definitely not interested in? What is she trying to say these days?

---

## Step 7 — Write the Monthly Intelligence Report

File: `Team Knowledge/Monthly Reviews/YYYY/YYYY-MM-intelligence-report.md`

Structure:
```
# [Month YYYY] — Intelligence Report

## What this system learned this month
[1-2 paragraphs — Larry's voice, direct, plain. What the system learned about Alyssa's thinking, voice, and taste that it didn't know last month.]

## Signal update
[New signals, promotions, thesis drafts written, anything that became something]

## Voice update
[What changed or sharpened in Hermes's calibration]

## What's in the garden right now
[State of the developing ideas — what's thesis-ready, what's becoming, what needs Alyssa's attention]

## For Alyssa
[Maximum 3 things she needs to know or decide. Everything else the system handled.]
```

---

## Step 8 — Relationship to WS-007 (legacy monthly review)

WS-007 runs the session-log summary as before — the historical record of sessions, open threads, and completed work. WS-009 runs in parallel and produces the intelligence layer. Together they replace what was a pure reporting document with an intelligence report + historical record.

Run WS-007 first (session log aggregation), then WS-009 (intelligence layer). The intelligence report links to the WS-007 monthly wrap for the historical record.

---

## Cross-references

- [[Team Knowledge/Workstreams/WS-007-monthly-review.md]] — session log aggregation, runs before this
- [[Team Knowledge/SOPs/SOP-013-semantic-sweep.md]] — called in Step 1
- [[PKM/Signals/signals-index.md]] — updated in Steps 1-3
- [[PKM/Developing Ideas/INDEX.md]] — updated in Step 3
- [[Hermes/learning/inbox.md]] — updated in Step 2
- [[PKM/Second Brain/taste-log.md]] — updated in Step 4
- [[PKM/Second Brain/yes-pattern.md]] — updated in Step 6
- [[PKM/Second Brain/ready-queue.md]] — updated in Step 5

## Source-trust metabolism overlay

WS-009 reads the monthly wrap and weekly `Grand metabolism` sections before changing the intelligence layer. It should not reopen raw session chaos unless a weekly wrap is missing or the source-trust trail is broken.

Add these questions to the monthly intelligence pass:

- Which Hermes corrections were recurring and sourced enough to graduate into rules?
- Which corrections were one-off process evidence and should stay out of Hermes rules to prevent bloat?
- Did big build sessions make the vault lighter and easier to use, or did they leave reports that never changed maps, tasks, Hermes learning, or queue movement?
- What got promoted, referenced, dispatched, archived, deleted, or marked `needs-Alyssa` this month?

The intelligence report includes `## Source-trust metabolism`: what the month clarified, what was superseded, and what still needs source access or Alyssa taste.

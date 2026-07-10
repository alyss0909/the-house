---
agent_id: hermes
type: journal-entry
created: 2026-07-09T21:00:00Z
updated: 2026-07-09T21:00:00Z
topic: self-score-blind-spots
tags: [anti-ai, em-dash, quiet-root, self-score, fact-discipline]
linked_session_logs: [2026-07-09-21-00_larry_pin-engine-blueprint-and-lead-magnet-pipeline]
linked_tasks: []
related_journal_entries: [2026-07-06-over-tidiness-is-the-tell]
status: durable
---

# A clean 18/18 self-score can still ship em dashes and root-word AI tells — grep, don't eyeball.

## Context
First draft of the Pinterest keywords lead magnet self-scored 18/18 against TASTE.md, explicitly claiming "no quiet/quietly." Alyssa caught it in seconds: the draft was full of em dashes used as connective tissue, and "quieter" (same banned root as "quiet") had slipped past the exact-word check.

## What I learned
Self-scoring by reading the draft and mentally checking a rubric misses mechanical AI tells that a human catches instantly on sight. Em dashes and quiet/quietly-root words need an actual grep pass, not a read-through, before a draft is called clean. The failure mode isn't the rubric being wrong — TASTE.md's rules were right — it's that eyeballing prose for a specific character or word-root has a much higher miss rate than running the check literally. Separately: when a draft gets called "boring," the fix usually isn't more voice-polish, it's more real research depth (current stats, named tools, specific numeric thresholds) — voice can be perfect and the piece still reads as thin if it's built on generic, easily-googled advice.

## When this applies
- Any draft heading for a blind lineup, a lead magnet, or publish, where the self-score claims a specific banned-word or banned-character check passed.
- Any time a draft is criticized as "boring" or "shallow" despite voice being on-model — check research depth before re-polishing voice.

## When this does NOT apply
- Internal drafts/scratch work not headed for anyone's eyes but mine — no need to grep those.
- Register-scoped exemptions already carved out in ANTI-AI.md (e.g. structural labeled-step formats) — those aren't em-dash/quiet-root issues, different exemption class.

## Evidence
- [[2026-07-09-21-00_larry_pin-engine-blueprint-and-lead-magnet-pipeline]] (session log, full rebuild sequence)
- `lead-magnet-system/drafts/pinterest-keywords-claude.md` v1 → v2 (em-dash count 0 confirmed via grep on v2)

---
agent_id: larry
type: journal-entry
created: 2026-05-27T00:00:00Z
updated: 2026-05-27T00:00:00Z
topic: journal-trigger-diagnostic
tags: [journal-protocol, task-lifecycle, session-close, structural-audit]
linked_session_logs: ["2026-05-27_larry_journal-protocol-fix"]
linked_tasks: []
related_journal_entries: []
status: durable
---

# Empty agent journals mean the write trigger never fires — check the lifecycle path, not the agents

## Context

All agent journals had only `_template.md` entries after several sessions of real work. Alyssa flagged it. Root cause was structural, not agent misbehavior.

## What I learned

`SOP-009-write-journal-entry` was only reachable via `SOP-006-close-task`. One-shot delegations (the majority of Larry's routing) never create task files, so the closure event never fires, so journals never fill. The agents were correct — the trigger path was broken.

The fix is two task-independent gates: (1) the session-close journal gate prompts a journal check at every session end regardless of task lifecycle, and (2) "keep this in mind" proactive triggers route to `SOP-009-write-journal-entry` when the insight is agent-scoped and durable.

When diagnosing empty journals: start with the trigger path, not the agent behavior.

## When this applies

Next time any agent's journal folder contains only `_template.md` after multiple sessions of work. Also applies when Alyssa asks why an agent "isn't learning" across sessions.

## When this does NOT apply

If a journal is empty because the agent is new and genuinely hasn't surfaced a durable insight yet — that's expected, not a bug.

## Evidence

- [[2026-05-27_larry_journal-protocol-fix]]

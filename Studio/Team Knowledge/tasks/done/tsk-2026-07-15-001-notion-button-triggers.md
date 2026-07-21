---
# Identity
id: tsk-2026-07-15-001
title: "Investigate Notion buttons as real triggers for Claude actions"

# Ownership & priority
assignee: mack
priority: 3

# Status
status: done
blocked_reason: null
blocked_by: null

# Time
created: 2026-07-15T00:00:00Z
updated: 2026-07-15T00:00:00Z
due: null

# Provenance
created_by: larry
source: alyssa-sidenote-2026-07-15
parent: null

# Cross-references
linked_sops: []
linked_workstreams: []
linked_guidelines: []
linked_my_life: []
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [automation, notion, triggers]
---

# Investigate Notion buttons as real triggers for Claude actions

## What this is
Alyssa's own words: "i wanna investigate notion buttons as triggers soon, wht we got is not killin it for me so far." Whatever manual/semi-manual trigger pattern is currently in use for Notion-driven work isn't cutting it — she wants an actual button-press-to-action pipeline.

## Context one click away
- 2026-07-15 chat covered the research groundwork already: Notion added a native "Send webhook" action on buttons and database automations (public beta, API version 2026-03-01) — click a button, Notion POSTs a payload to a URL.
- Claude Code's own remote-trigger/scheduled-task system is cron-only — no public inbound webhook URL, so it can't be the receiving end directly.
- Three build options were scoped, ranked by fit with house architecture ([[feedback_no_claude_scheduled_tasks]] in memory — prefer OS cron + Anthropic API over anything gated on an app being open):
  1. Poll pattern — button flips a Notion property, something already polling (same shape as [[HomeActionsWatcher]] / the Actions ledger) picks it up. Zero new infra, has latency.
  2. Small hosted endpoint (e.g. Cloudflare Worker) receives the Notion webhook and calls the Anthropic API directly — same shape as the Instagram Saves Engine's ideation step. Near-instant, no subscription, one-time build.
  3. No-code middleware (Zapier/Make/n8n) catches the webhook and calls Claude — fastest to stand up but a third-party subscription dependency that doesn't match the established pattern.

## Success criteria
- Land on one concrete implementation (not just theory) that Alyssa can actually click and watch fire.
- Matches the standing rule: unattended, not gated on the Claude app being open.
- Alyssa reacts to the build before it's called done — this is system wiring, needs the show-and-tell per [[feedback_approve_before_execute]].

## Updates
- 2026-07-15 (larry) — logged from Alyssa's sidenote during the Notion-button research conversation.

## Outcome
_(filled when this closes)_

- Closed 2026-07-16: built. The Agent Tasks database now has a Do it checkbox and Notes for the team field; the twice-daily sweep acts on both. This IS the Notion button trigger.

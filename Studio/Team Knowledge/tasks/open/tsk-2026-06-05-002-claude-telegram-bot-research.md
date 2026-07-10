---
# Identity
id: tsk-2026-06-05-002
title: "Research claude-telegram-bot for Telegram → Claude Code → workflow integration"

# Ownership & priority
assignee: mack
priority: 2

# Status
status: open
blocked_reason: null
blocked_by: null

# Time
created: 2026-06-05T00:00:00Z
updated: 2026-06-05T00:00:00Z
due: null

# Provenance
created_by: larry
source: alyssa-request
parent: null

# Cross-references
linked_sops: []
linked_workstreams: []
linked_guidelines: []
linked_my_life: [pkm, systematize-socials]
linked_session_logs: []
linked_journal_entries: []

# Tagging
tags: [automation, telegram, ai]
---

# Research claude-telegram-bot for Telegram → Claude Code → workflow integration

## What this is

Alyssa wants to evaluate https://github.com/linuz90/claude-telegram-bot as a second layer on top of the existing Telegram capture bot.

Current bot (tsk-2026-06-01-004): dumb pipe — Telegram message → markdown file in Team Inbox. No intelligence.

This repo is a different concept: Telegram → Claude Code → specific named workflow. The goal is to be able to trigger actual myPKA workflows from a Telegram message — e.g. send a URL and have it processed, classified, and routed by Claude rather than just dropped as a raw capture.

## Research questions for Mack

1. What does the repo actually do — is it a bot framework, a Claude Code integration, or something else entirely?
2. How does it differ from the current capture-only bot? What's the architecture?
3. Could this run alongside the existing capture bot, or would it replace it?
4. What would "Telegram → Claude Code → specific workflow" actually look like for Alyssa's use cases (inbox processing, social saves, meeting captures, content ideas)?
5. What's the setup complexity — is this realistic to wire up given her current stack?
6. Any security or cost considerations (Claude API calls per message, etc.)?

## Context

- Existing bot: [[tsk-2026-06-01-004-telegram-claude-automation]]
- Session context: this came up during the Friday shift — Alyssa wants the capture layer to be smarter, not just a file drop

## Success criteria

- Mack or Pax produces a short brief: what the repo does, whether it fits, and a recommended path forward
- Alyssa can decide whether to build this as an upgrade to the current bot or a parallel system

## Updates

- 2026-06-05 (larry) — created; research session queued for this afternoon

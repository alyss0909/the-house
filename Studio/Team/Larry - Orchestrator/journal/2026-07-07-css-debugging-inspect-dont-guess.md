---
agent_id: larry
type: journal-entry
created: 2026-07-07T22:00:00Z
updated: 2026-07-07T22:00:00Z
topic: css-debugging-inspect-dont-guess
tags: [debugging, css, obsidian, trust]
linked_session_logs: ["2026-07-07-22-00_larry_obsidian-vault-css-redesign"]
linked_tasks: []
related_journal_entries: []
status: durable
---

# Blind guess-and-reload CSS debugging burns trust fast — inspect the live DOM first

## Context
During the Obsidian vault redesign session, a tab-bar-disappearing bug took a dozen+ blind CSS-edit-and-reload iterations to find, with several "fixes" visibly making things worse before reverting. Alyssa said outright it felt like nobody competent was doing the work.

## What I learned
When a visual bug's cause isn't obvious from reading the CSS source, editing-and-asking-the-user-to-reload is the slowest and most trust-costly way to debug. A single targeted DevTools inspect (walk the DOM, read `getComputedStyle` on the suspect element and its ancestors) finds the real cause in one round-trip instead of five-plus guesses. The eventual fix in this session — an `opacity: 0` rule hiding tab label text under a theme's card layout — was invisible from reading the CSS alone because the *symptom* (empty pill, blending into background) didn't obviously map to the *cause* (label text, not the pill itself, was hidden).

## When this applies
Any time I'm debugging a rendering/layout bug in a live app (CSS, DOM structure, theme conflicts) and the fix isn't obvious after one read-through of the relevant files. Applies especially when a theme or framework has its own internal layout engine (like AnuPpuccin's Card Layout) that manual CSS can silently collide with.

## When this does NOT apply
Doesn't apply to bugs where the cause is already clear from a single file read (a typo, a wrong selector, an obviously misplaced rule) — inspecting the DOM for those just adds a step.

## Evidence
- [[2026-07-07-22-00_larry_obsidian-vault-css-redesign]]
- Also captured as a durable feedback memory: `feedback_css_debugging_approach.md` in the Claude Code auto-memory system.

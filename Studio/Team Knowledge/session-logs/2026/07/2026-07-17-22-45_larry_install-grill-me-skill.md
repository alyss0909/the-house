---
agent: larry
date: 2026-07-17
slug: install-grill-me-skill
mined: true
---

# Session log — Install grill-me skill (from mattpocock/skills)

## Context
Alyssa said "install this" with the repo `github.com/mattpocock/skills` (Matt Pocock's MIT-licensed engineering-skill bundle, v1.1.0, updated 2026-07-08). She asked to see the full 19-skill menu, then chose the one that "makes the agent ask me questions."

## What we did
- **Larry** ran due diligence: fetched README, confirmed MIT license, no credentials or network access, plain-markdown skills. Verdict: reputable but mostly a code-shop bundle (TDD, tickets, merge conflicts, an issue tracker) that does not fit a content/PKM vault, and several skills collide with existing house skills (`code-review`, `handoff` vs `close-session`/`pickup`).
- **Larry** presented the full 19-skill menu grouped by house-fit, and declined the vendor's all-19 plugin installer per house rule #3 (flag overlap, do not double-hire).
- **Larry** picked out the interview skill. Source was two files: `skills/productivity/grill-me/SKILL.md` (a thin pointer) delegating to `skills/productivity/grilling/SKILL.md` (the real engine). The `agents/openai.yaml` files are Codex interface config, ignored.
- **Larry** merged both into one house skill and adapted it: wikilink refs not backtick paths, her language rules baked in (no em dashes, no arrows, no jargon on the questions she reads), tied to [[feedback_north_star_first]], [[feedback_dont_guess_ask]], [[feedback_vera_riff_style]] (each question carries Larry's recommended answer so she reacts, never interrogated cold), and [[feedback_approve_before_execute]].
- **Larry** installed to `.claude/skills/grill-me/SKILL.md` plus a thin wrapper `.claude/commands/grill-me.md`, matching the `understand-open-source` install pattern.
- **Larry** tested end to end: invoked via the Skill tool, engine loaded clean and correctly drives one-question-at-a-time interviewing through AskUserQuestion. No live plan to grill this session, so no full interview run yet.

## Decisions made
- Installed only the interview skill from mattpocock/skills. Skipped all code-shop skills and the three that collide with existing house skills. Source: `github.com/mattpocock/skills` (MIT).

## Insights
- Matt's `grill-me` is a two-file pattern: a user-invocable pointer plus a model-invocable `grilling` engine. Collapsed to one house skill for simplicity. Fate: skill design reference.

## Realignments
- Alyssa: "let me see the full menu first," then "i want the one that like makes the agent ask me questions."

## Open threads
- [ ] Run a real grilling on a live plan to confirm the interview flow in practice (mechanism verified, not yet exercised on a real decision).

## How to invoke
- `/grill-me [what you want grilled]`, or say "grill me" / "pressure-test this" / "poke holes."

## Cross-links
- [[feedback_north_star_first]], [[feedback_dont_guess_ask]], [[feedback_vera_riff_style]], [[feedback_approve_before_execute]]
- Prior: [[2026-07-17-22-15_larry_github-backup-and-push-on-close-habit]]

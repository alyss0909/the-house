---
title: Claude Code usage insights and upgrade kit
date: 2026-07-16
type: deliverable
status: for-review
---

# Claude Code usage insights (June 3 to July 16, 2026)

I mined every session transcript on this machine: 93 sessions across the old scaffold folder and the-house, 769 of your messages, about 6,700 tool calls. This is what the data says, what I built for you, and what needs your yes before I wire it in.

## The headline

You use Claude Code hard and mostly well. The team model, the handoff habit, and the close-session loop are all working: 22 close-session runs, 285 subagent dispatches, and your interruption rate is tiny (7 interruptions in 769 messages, meaning the work usually goes the direction you want). The waste is concentrated in four places, and all four are fixable with tooling rather than effort.

## Where the time actually went

**1. Design sessions are your biggest pain source, by far.**
The transcripts of the Obsidian CSS and dashboard sessions contain nearly all of your frustrated messages ("are you tired or something", "this is going SO badly", "do your own review, use brain power"). The pattern each time: values got guessed instead of measured, fixes shipped one at a time, approved values never got saved, and you had to be the QA department. You already made the rules that fix this (measure from the DOM, batch the feedback, save approved tokens). They were saved as memories but never became an enforced workflow.
**Built for you: the [[design-loop]] command** (`.claude/commands/design-loop.md`). It hard-codes your rules: measure everything, one batch one render, independent review every round, before-and-after proof with exact values, approved tokens saved same session.

**2. You are the session continuity system, and it costs you.**
24 messages involve you hand-carrying handoff file paths into new sessions. It works, but you should not have to find the path. Separately, two sessions were left open for 4 and 25 days; those hit context compaction, which is exactly when "it's annoying you don't know that" moments happen.
**Built for you: the [[pickup]] command** (`.claude/commands/pickup.md`). Say `/pickup` (or `/pickup content os`) and I find the newest handoff, read it, archive it properly, and get to work.
**Lesson: close sessions when the work closes.** A fresh session with a good handoff beats a stale session with a compacted memory every time.

**3. "Install this" is a recurring job with no standard.**
At least 6 sessions started with a GitHub link and "install this". Some went great, some installed things that fought house rules or failed on Windows.
**Built for you: the [[install]] command** (`.claude/commands/install.md`). Due diligence paragraph first, house-convention install location, Windows compatibility check, one end-to-end test, one intake record.

**4. Pure machine waste (my side, not yours).**
These errors burned your tokens with zero value to you:
- 49 "file has not been read yet" errors and 20 "file changed since read" errors (agents editing carelessly)
- 574 commands prefixed with a needless `cd` into the folder we were already in (this is also what bloated your permission list)
- 10 failures from typing `python3` on a Windows machine that only has `python`
- a stack of Unicode crashes from Windows' default text encoding

**Prepared, needs your yes: one guard hook.** The script is at [[bash-guard.py]] (`scripts/hooks/bash-guard.py`) and does nothing until wired in. It auto-blocks `python3` and the useless `cd` prefix with a message telling the agent how to fix the command. To turn it on, this goes in `.claude/settings.local.json` (I did not add it, per the approve-before-execute rule):

```json
"hooks": {
  "PreToolUse": [
    {
      "matcher": "Bash|PowerShell",
      "hooks": [{ "type": "command", "command": "python scripts/hooks/bash-guard.py" }]
    }
  ]
}
```

And one environment line for the Unicode crashes, same file:

```json
"env": { "PYTHONIOENCODING": "utf-8" }
```

## Two cleanups worth one command each

**Permission list cleanup.** Your `.claude/settings.local.json` has 65 one-off approvals, including expired Instagram image URLs from a past scrape. There is a built-in skill for exactly this: say `/fewer-permission-prompts` in a session and it will replace the junk with a short, sane allowlist. Recommended.

**Plan mode for big builds.** Across 93 sessions, plan mode was used 13 times, and the sessions that hurt (the big design rebuilds, the Content OS restructures) mostly ran without it. For anything that will touch more than a handful of files, ask for a plan first. It is the single cheapest way to avoid the "this went sideways for 3 hours" sessions.

## What is already healthy (keep doing it)

- The morning-shift and close-session rhythm. The compounding loop shows up in the data as real: later sessions re-use earlier decisions correctly far more often than in June.
- Subagent economy improved sharply after mid-July (the economical-subagents rule is visibly being followed).
- You ask for research before building more often than you used to, and those sessions have the lowest error rates in the whole dataset.
- AskUserQuestion is being used at decision points (45 times) instead of guessing. Your reacts show you like this.

## Everything for review, in one list

| Item | Where | State |
|---|---|---|
| /pickup command | `.claude/commands/pickup.md` | Installed, inert until you say /pickup |
| /design-loop command | `.claude/commands/design-loop.md` | Installed, inert until you say /design-loop |
| /install command | `.claude/commands/install.md` | Installed, inert until you say /install |
| Bash guard hook | `scripts/hooks/bash-guard.py` | Script ready, NOT wired. Needs your yes |
| UTF-8 environment line | JSON above | NOT applied. Needs your yes |
| Permission list cleanup | say /fewer-permission-prompts | Not run. Needs your go |
| Session hygiene lesson | close sessions when work closes | Habit, yours |
| Plan mode lesson | ask for a plan on multi-file builds | Habit, yours |

Say the word on the hook and the environment line and I will wire them next session.

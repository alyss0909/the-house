---
title: Overnight Restructure — Morning Report for Alyssa
date: 2026-07-09
owner: Larry
status: overnight run complete — stopped before the two supervised-only steps
---

# Good morning. Here's the house.

You went to bed asking to wake up to a clean house. Here it is. Everything below is committed to git and reversible with one command. I stopped exactly where I said I would — before anything that could break silently while you slept.

## What moved and is verified

**The constitution is live.** GL-013 (the house rules) is active, with your "team can do connective edits when I ask" exception built in. The house rule — *Map first. Notebook is mine. Studio is opinion. Library is earned. Link everything* — is now the first thing every agent reads, wired into the top of AGENTS.md. All 37 agent files carry it.

**Your Notebook is real.** Your Journal (544 files), Life (Goals, Habits, Key Elements, Projects, Topics), CRM, and Images all moved to `Notebook/`. History preserved, your words never touched — pure relocation. "Thinking = my mind" is no longer a plan, it's a folder you can open.

**The Signals desk moved** to `Studio/Signals/` — the low-risk rehearsal that proved the whole method before I touched anything bigger.

**Automations hardened.** Instagram, Meetily, and Telegram capture all run and point at `the-house`. Mack fixed the old paths still buried inside the script files so nothing regresses later. Capture is live — anything you dropped overnight was caught.

**Vera is retired**, and the enforcement teeth are in (a house-rules check at session close, a five-minute lint at weekly review).

## What I deliberately did NOT do

Two things fail *silently* — they wouldn't throw an error, so I couldn't confirm them safe without you at the screen. I left both fully staged for a short supervised pass:

1. **The Content OS dashboard move.** Its dashboards go blank without an error if a path is off, and I can't see the Obsidian dashboard render without you. ~30 minutes together, between pitch weeks.
2. **The Library + Hermes rewrite.** Reorganizing your Second Brain and rewiring how Hermes loads source could quietly thin your writing voice. This one needs a real write-test through Mean Alyssa — you reading a Simmer and a carousel draft and confirming they still sound like you — before it's safe.

## Things that need your eyes (none are broken, all are flagged)

- **A few broken links inside your Notebook index files.** When your Life folders moved, their index pages kept pointing at the old path. Silas refused to fix them because editing inside your Notebook needs your say-so — the boundary working. Say "fix the Notebook links" and I'll do it in seconds (it's pure path cleanup, never your words).
- **`ready-queue.md` in Second Brain** has 13 links to journal entries that now point at the old path. Hermes reads this file, so it's the top operational item for the Library phase — I left all of Second Brain untouched on purpose, so this gets fixed first when we start that phase.
- **[[PKM/My Life/INDEX]]** now describes five folders that moved out (Offers stayed). It'll be cleaned when Offers moves to the Library.
- **Obsidian plugin:** a note-keeper plugin still points at `PKM/Journal`. Safest for you to update in Obsidian's plugin settings, or tell me and I'll try.
- **Security:** your Telegram bot token sits in a file *inside* the vault (`telegram-capture.env`). It's excluded from git so it wasn't committed, but it should move out of the vault to a safer spot. Small follow-up when you want.

## Your three small open questions (still open, still not blocking)

- Templates default to `raw` — fine to leave; offer templates can default to `facts` later.
- Where your raw todos live today (so `Notebook/Todos` gets built around reality).
- Whether meeting transcripts count as Notebook (my rec: yes).

## If you ever want to undo anything

Roll back to any of these tags: `pre-restructure-2026-07-09` (the untouched start), `phase0-live` (constitution), `pilot-a-signals`, `phase2-notebook` (where we are now). Plus the 86 MB backup zip outside OneDrive.

## The next session, when you're ready

Short and supervised: fix the Notebook links on your word, then the Content OS cutover with the dashboard open so we watch it work, then the Library/Offers assembly and the Hermes write-test. That's the finish line — and it's the part that's right to do together.

Sleep was the right call. The house is calmer, honest about what's done, and nothing is broken. 🏠

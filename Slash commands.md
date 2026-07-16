---
title: Slash commands
cssclasses: [dashboard]
status: living reference, created 2026-07-16, kept current by the team at session close
owner: team (Alyssa reads)
---

# Slash commands

Everything you can say to Claude Code that starts with a slash, in plain English. The full picture of the house (procedures, engines, routines, agents) lives on the [House Operations Board](https://app.notion.com/p/39fc8b43e56581b3b559c0fb9c6468bd) in Notion. This note is just the quick lookup for the things you type.

## Daily driving

- **/pickup** finds the newest handoff document and gets to work from it, so you never have to hunt down and paste a file path to start a session. You can aim it, like "/pickup content os".
- **/close-session** wraps the session: sweeps open items, writes the session log, tidies the vault, and updates the Control Room board so nothing gets lost between sessions.
- **/actions** runs every card you have clicked and queued on the HOME dashboard, such as the mailroom sweep, weekly review, monthly review, or trend scout.
- **/mailroom** acts on the cards you clicked in the Mailroom: queued replies get drafted into that Gmail account's Drafts folder, and queued archives clear the message out of the inbox. "/mailroom sweep" re-scans all four inboxes and refills the cards.
- **/loop** checks the newest weekly pitch sheet for anything you approved and sends the right specialist to do the next step, so your approvals move forward without you relaying instructions.

## Reviews

- **/weekly-review** writes the weekly wrap-up from the week's session logs and deliverables.
- **/monthly-review** rolls the month's weekly wraps into one monthly wrap-up.

## Lead magnet pipeline (three stages)

- **/lead-magnet** researches a topic, writes the freebie content, and creates its Notion page plus a tracker entry marked Draft.
- **/landing-page** builds the public landing page with the Kit signup form wired in, plus the delivery email, then commits and pushes.
- **/execute-lead-magnets** takes every pipeline entry you have marked Execute, sets up the Kit email delivery, finalizes the format, and marks it Complete.

## Building and fixing

- **/design-loop** is the strict working method for design sessions: every color and size gets measured from the live screen, all your notes get fixed in one batch, and you see one fresh screenshot per round instead of endless back and forth.
- **/install** is the house way to install a GitHub repo, skill, or tool: check what it really does first, adapt it to house rules, test it once end to end, and record where it landed.

## Tools the team uses on their own

You never need to type these; they fire automatically when the work calls for them.

- **/defuddle** pulls the clean readable text out of a web page, stripping ads and clutter.
- **/json-canvas** builds and edits visual canvas boards.
- **/obsidian-bases** builds database-style views of your notes, like the Journal cards and Open tasks views.
- **/obsidian-cli** controls the running Obsidian app from the command line, used heavily in design and debugging work.
- **/obsidian-markdown** is the reference for writing correct Obsidian note syntax: wikilinks, callouts, properties, and tags.

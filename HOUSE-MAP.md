---
title: HOUSE-MAP — read this first, every session
status: ACTIVE — blessed by Alyssa 2026-07-09; mandatory first load per AGENTS.md
date: 2026-07-10
owner: Larry
---

# The House

**Map first. Notebook is mine. Studio is opinion. Library is earned. Link everything.**

This vault is organized by trust, not by project. Three places, one rule each:

| Place | What it is | Who writes there |
|---|---|---|
| **Notebook** | Alyssa's raw material — journal, inbox drops, todos, her drafts, her life facts. If she made it and hasn't handed it to the team, it lives here. | Alyssa, and Penn transcribing her captures. Otherwise read-only — except mechanical/connective edits (wikilinks, formatting, frontmatter) Alyssa explicitly asks for; never her words or meaning. See [[GL-013-the-house-rules]] Rule 1. |
| **Studio** | The workshop — every workflow, every analysis, every agent tool, everything in flight. Everything here is working material and OPINION, never source. | The team, inside a named workflow folder, with a status. |
| **Library** | The trusted shelf — her verbatim work (examples, programs, sales copy, offers) plus anything she has explicitly promoted. | Nobody. Entry is by promotion stamp only. Alyssa edits freely; agents cite. |
| **Archive** | Where dead, superseded, and finished-process material drains. | Larry, at reconciliation. |

## The geography

The migration is over. This is where the house lives, permanently:

| Zone / desk | Path | What's there |
|---|---|---|
| Home | [[HOME]] | Whole-house dashboard, team-maintained like DESK, links into every zone |
| Notebook/Journal | `Notebook/Journal/YYYY/MM/` | Daily entries |
| Notebook/Inbox | `Notebook/Inbox/` | Raw drops, `media/`, `Meeting Captures/` |
| Notebook/Life | `Notebook/Life/` | Goals, Habits, Key Elements, Projects, Topics, `CRM/` |
| Notebook/Images | `Notebook/Images/YYYY/MM/` | Shared image bucket |
| Notebook/Drafts | `Notebook/Drafts/` | Her drafts, working notes |
| Notebook/DESK | `Notebook/DESK.md` | Passing-notes surface — the one Notebook file the team may update (links only) |
| Studio/Voice | `Studio/Voice/` | House-level voice layer (README, formats, KILL-LIST) |
| Studio/Reply-Style | `Studio/Reply-Style/` | House-level reply-style layer — how the house talks to Alyssa in chat (ADHD-shaped). Distinct from Voice |
| Studio/Reference | `Studio/Reference/tools/` | Shelf of outside tools/repos studied deeply, one HTML breakdown each |
| Studio/Hermes | `Studio/Hermes/` | Alyssa Clone Writer brain (JUDGMENT, FACTS, MAP, FABLE) |
| Studio/Content | `Studio/Content/` (dashboard at `Studio/Content/dashboard/`) | Content OS pipeline, pitch sheets |
| Studio/Signals | `Studio/Signals/` + `Studio/Signals/Developing Ideas/` | Signals index, idea garden |
| Studio/Analysis | `Studio/Analysis/` (`Frameworks/`, `Templates/`, [[Studio/Analysis/COMPASS]] entry point) | Copy-task analysis and routing |
| Studio/Team | `Studio/Team/` | One folder per specialist, each with an AGENTS contract |
| Studio/Team Knowledge | `Studio/Team Knowledge/` | SOPs, Workstreams, Guidelines, session-logs, tasks, scripts |
| Studio/Mailroom | `Studio/Mailroom/` | Gmail sweep ledger and state |
| Library/Examples | `Library/Examples/` | Her verbatim sales copy, emails, pages |
| Library/Programs | `Library/Programs/` | Curriculum |
| Library/Offers | `Library/Offers/<offer>/MAP.md` | One folder per offer — facts, positioning, links |
| Library/me.md | `Library/me.md` | Her core facts file |
| Archive | `Archive/` (`Team Inbox/`, `Studio-Analysis-voice-retired-2026-07-10/`, `inbox-dead-executed/`, `misfiled-from-journal/`, and dated drains) | Dead, superseded, and finished-process material |
| Machine room (not knowledge) | `.claude/`, `.obsidian/`, `scripts/`, `_system/`, `Expansions/`, `website/`, `lead-magnet-system/`, `node_modules/` | Tooling, not knowledge |

`Deliverables/` is a legacy output pile. Never treat anything in it as a current source. It drains into Studio, Library (via promotion), or Archive over time.

## Read order, every job

1. This file, then [[NOW]].
2. [[Studio/Team/TEAM-BRAIN]] (her standing rulings and the pre-apply/pre-reject lists) and your topic's group in [[PRECEDENT-INDEX]] (what past sessions already decided — re-deriving a decided thing is a GL-014 violation and makes Alyssa repeat herself).
3. The map for the zone your job lives in: [[Notebook/MAP|Notebook map]], [[Studio/MAP|Studio map]], or [[Library/MAP|Library map]].
4. Your workflow's job card (for content work: [[Studio/Content/dashboard/PIPELINE-CONTRACT]] and GL-010).
5. Your own agent contract and its mandatory loads.
6. The actual source files — full loads, per protocol, found via the reference routing table below.

If two maps disagree, this file wins. If this file doesn't cover it, ask Larry. Do not create a new map.

## Reference routing — where sources live, by job type

(Added 2026-07-16 after Alyssa flagged that agents don't know when or where to reach into Library and Notebook and she keeps repeating herself. This table is the answer; not loading your row before working is a boot failure.)

| When your job involves | Load these, in this order |
|---|---|
| An offer (pricing, positioning, what's included, links) | `Library/Offers/<offer>/MAP.md` first — one folder per offer, the facts live there. Then [[Library/me.md]] for her core facts. Never guess offer facts from memory. |
| Writing anything in her voice (emails, captions, carousels, pages) | [[Studio/Voice/README]] + the format file + KILL-LIST last (house law); Hermes desks additionally load their SOURCES.md full-file list. Real examples of her verbatim copy: `Library/Examples/`. |
| Her teaching content and curriculum | `Library/Programs/` — verbatim, citable, never paraphrased into new versions. |
| A person (client, collaborator, friend, family) | `Notebook/Life/CRM/People/<name>.md` — check it exists before wikilinking a person; stubs are created per WS-001, never invented. |
| Her projects, goals, topics, habits | `Notebook/Life/` — definitions in [[GL-002-icor-entity-definitions]]. Route ideas per those definitions, not by vibes. |
| Her raw thinking on any theme | Her journal via the garden: `Studio/Signals/Developing Ideas/` and the Journal Web hubs point into `Notebook/Journal/`. Read entries in full; never edit them. |
| What she already reacted to (approvals, rejections, taste) | [[Studio/Team/TEAM-BRAIN]] rulings + your desk's PLAYBOOK rejected-list + the pitch-sheet reacts for content work. |
| Anything a past session may have decided | [[PRECEDENT-INDEX]] — your topic's group, before you design or build. |

## The connection doctrine

Alyssa chose Obsidian for one reason: so ideas connect, collide, and compound. Siloing is the failure mode that broke trust in this vault. So:

1. **No orphan files.** Every file you create connects to what genuinely relates to it — wikilink the notes it grew from, the source it studied, and the map that should point back to it. A file with no real connections is a silo; question whether it should exist. (There is no required number of links. Connect what truly relates; do not pad to hit a count.)
2. **Link, don't copy.** If the knowledge exists, point at it. Re-typing a fact that has a home is a violation (GL-013). Quoting Alyssa verbatim with a citation is always welcome; paraphrasing her into a new "version" is not.
3. **Connect across territories.** A Studio analysis should link into the Notebook entries it grew from and the Library source it studied. That web is the product. A brilliant analysis with no links is a silo, and silos get archived.
4. **When you touch an old file, leave it more connected than you found it.** Found a related note while working? Add the link. This is everyone's standing duty, same as vault cleanliness.

## The house rule (Alyssa may say this at any session open)

"Read the HOUSE-MAP before anything else. My Notebook is mine — read it, never write in it. The Studio is where you work, and everything you make there is opinion until I promote it. The Library is earned. And whatever you build today, connect it — link it into what already exists. We grow roots here. We don't pile boxes."

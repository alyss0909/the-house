---
title: Session-log interlinking — proposal for Alyssa
author: Larry (orchestrator)
date: 2026-07-20
status: PROPOSAL — awaiting Alyssa's yes/no, check-back 2026-07-23
type: proposal
linked_sops: ["SOP-040-the-compounding-loop"]
linked_guidelines: ["GL-014-the-compounding-architecture"]
origin: Alyssa's own idea (Agent Tasks board), shaped by Larry
---

# Make the session logs link to each other and to what they changed

Your idea, shaped into something you can approve or reject on the 23rd. It is a
tightening of the compounding loop we already run — not a new system.

## 1. The problem, precisely

Session logs are the team's memory (`Studio/Team Knowledge/session-logs/YYYY/MM/`).
The compounding loop (SOP-040) is supposed to make every session learn from the
last. Three leaks stop that from fully happening:

1. **Logs link outward, but nothing links back to them.** When a session
   changes a durable file, SOP-040's "fate" rule makes the *log* wikilink the
   durable home (log → note). But the durable note almost never links back
   (note → log). So when you or an agent is reading a garden note, a playbook,
   or a precedent row, there is no trail to *the session that changed it or why*.
   The reasoning is one click away in one direction and invisible in the other.

2. **Log-to-log links are single-hop and often missing.** The template's
   `Cross-links` section only points at "the closest related prior session log."
   That is one backward hop — not the *thread* a theme runs on. And it is
   frequently skipped: **61 of 177 logs (34%) have no Cross-links section at
   all.** Those are silos — graph-invisible, exactly the failure mode that
   broke trust in this vault.

3. **The mining that connects logs is manual and lags.** Strip-mining a log
   into playbooks / TEAM-BRAIN / the Precedent Index is a human-judgment step at
   close (and on the night shift). NOW.md tracks the backlog — right now
   **5 unmined logs** — but there is *no counter at all* for the silo problem in
   #2, so it never gets drained.

**Why this matters more for us than for a normal note vault:** agents execute the
loop by reading raw markdown and by `grep`. They never see Obsidian's backlink
pane (that is for your eyes). So for a link to *compound* — to be found by the
next agent — it has to exist as real wikilink text on disk. A missing outbound
link isn't just a UI gap; it's knowledge the next session cannot find.

## 2. The mechanism

Two layers. A **manual convention** at close (the judgment part) and an
**automated pass** (the mechanical part). This mirrors how we already split the
loop: agents make the semantic connections; scripts count the debt and force the
consumer.

### Layer A — manual convention (extends SOP-040's close gate)

At close-session, the acting agent already writes fates and a Cross-links
section. Two tightenings:

- **Cross-links becomes a real thread, not one hop.** Link *every* sibling log
  on the same theme/open-thread (forward and back), not just the single closest
  prior one. Concretely: grep the open-thread keywords across `session-logs/`,
  wikilink the matches. A log with genuinely no siblings says so
  (`cross-links: first of its thread`) — same honesty rule as `journal: quiet day`.
- **Fates must be wikilinks, never prose or bare dates.** "rescheduled 2026-07-20
  (night shift)" becomes "rescheduled — see [[2026-07-20-08-15_larry_night-shift…]]".
  This one change means Obsidian's native backlink pane (for you) *and* grep (for
  agents) both reach the log from the durable file for free — no duplicate
  backlink text to maintain.

**Who / when:** the acting agent, at every close-session. Zero new steps — it
tightens two steps that already exist.

### Layer B — automated backlink + silo pass (extends `scripts/regenerate-now.py`)

`regenerate-now.py` *already* builds an inbound-link graph by basename (it uses
it for the journal counter). We reuse that graph for two derived outputs:

- **A "silo log" debt counter in NOW.md.** Count logs with zero outbound
  wikilinks to any other log or durable file, and surface the oldest as a drain
  candidate — exactly like the journal-connection and unmined counters already
  work. This gives leak #2 a forced consumer: the night shift drains silo logs
  the same way it drains journal debt today.
- **(Optional) a materialized "Sessions that touched this" block** appended to
  durable *Studio* surfaces (garden notes, playbooks, PRECEDENT-INDEX) — derived
  and regenerated, never hand-grown, like NOW.md itself. This is only worth doing
  if we want the reverse trail visible to agents *without* a grep. If Layer A
  (wikilink fates) ships, grep already finds it, so B's materializer is a
  nice-to-have, not load-bearing.

**Boundary (locked, not a choice):** the automated pass writes only into Studio
durable files. Nothing under `Notebook/` is ever touched — the journal boundary
stays exactly as GL-014 law 2 locks it.

## 3. Before / after on a real log

Take the most recent log, the 2026-07-20 night shift
(`…/2026/07/2026-07-20-08-15_larry_night-shift-journal-and-playbook.md`). It is a
*good* log — it has a Cross-links section and made 7 journal connections. Even so:

**Before (today):**
- The log wikilinks the garden note it rescheduled
  ([[ai-team-as-mirror-not-replacement]]) — good, outbound works.
- But that garden note records the change as **plain prose**: *"2026-08-18 —
  rescheduled 2026-07-20 (night shift) from the due 2026-07-18 date."* No
  wikilink. An agent reading that note cannot get to the session that made the
  call or its reasoning.
- **Nothing in the vault links *to* this log** except NOW.md's hand-off. Its
  playbook mining, its 7 journal connections, its check-back drain — none of the
  touched files point back. The reasoning is a dead end from every durable file.
- It sits at the end of a Cross-links chain that is one-hop: it names the single
  prior night-shift log, not the *series* of night shifts (07-15, 07-17, 07-20)
  that are obviously one thread.

**After (with this proposal):**
- The garden note's reschedule line reads *"rescheduled — see
  [[2026-07-20-08-15_larry_night-shift-journal-and-playbook]]"*. One tightened
  fate, and the reverse trail exists for both you and agents.
- Cross-links names the whole night-shift thread (07-15 ↔ 07-17 ↔ 07-20), so
  standing on any one, the next agent sees the pattern (recurrence sat at 8, no
  new feeders — the exact signal that decides whether the note graduates).
- `regenerate-now.py` counts this log's outbound links; if it had been a silo it
  would show up in NOW.md as a drain candidate and the night shift would fix it.

Net effect: the *why* behind every durable change becomes reachable from the
change, and every theme becomes walkable as a thread instead of a pile.

## 4. Decisions for you — 2026-07-23

Four yes/no calls. #1 and #2 are the proposal; #3 and #4 are scope dials.

1. **Manual convention (Layer A) — ship it?** At close, Cross-links must link the
   full same-theme thread (not one hop), and fate lines must be wikilinks, never
   prose/bare dates. → **YES / NO**

2. **Automated silo counter (Layer B core) — add it to `regenerate-now.py`?** New
   NOW.md debt line for logs with zero outbound links; night shift drains them
   like journal debt. → **YES / NO**

3. **Materialized backlink blocks (Layer B optional) — build the "Sessions that
   touched this" writer into Studio durable files, or skip it and rely on grep +
   Obsidian's backlink pane?** → **BUILD / SKIP** (my lean: skip for now — Layer A
   makes it redundant; revisit if agents still miss the reverse trail).

4. **Backfill — fix the 61 existing silo logs, or only enforce going forward?**
   → **BACKFILL (night shift drains a few per run) / FORWARD-ONLY**

My recommendation: **YES, YES, SKIP, BACKFILL** — smallest change that closes the
leak, no new files, drains the debt gradually on a pass that already runs.

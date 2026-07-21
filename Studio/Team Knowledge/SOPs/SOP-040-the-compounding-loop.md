---
title: SOP-040 — The Compounding Loop
date: 2026-07-11
owner: Larry (every agent executes; Larry enforces)
status: ACTIVE — installed on Alyssa's direct ruling 2026-07-11
linked_guidelines: ["GL-009-source-boundaries-and-promotion", "GL-013-the-house-rules"]
linked_sops: ["SOP-011-write-session-log", "SOP-013-semantic-sweep", "SOP-039-house-keeping"]
---

# SOP-040 — The Compounding Loop

One job: make every session learn from the last, with the journal as the self-referential core. Installed 2026-07-11 on Alyssa's ruling: *"everything in the journal MUST be referenced and brought forward... every agent, folder, session and action learns from the last."* This SOP is the single mechanism — it replaces the Version A / Version B decision in [[2026-07-11-memory-autopsy-and-compounding-rules]] with one applied solution built on the autopsy's proven principle: **no capture without a forced consumer.** The forced consumer here is the boot path itself.

**Law:** this SOP is the mechanics of [[GL-014-the-compounding-architecture]] — the five laws and the trigger word "compound" live there.

## The spine

`NOW.md` at the vault root is the resume surface. It is REGENERATED (never hand-grown) by `scripts/regenerate-now.py` and read by every session immediately after [[HOUSE-MAP]]. It carries: the hand-off, open threads, journal resurface duty, due check-backs, debt counters, and this gate. Markdown stays canonical — the script only derives.

## At session open (any agent, any host)

1. Read [[HOUSE-MAP]], then [[NOW]]. Restate the hand-off and open threads in one short block before starting work.
2. Do the journal duty when work allows (it is part of the session, not optional): read the 2-3 resurface candidates, wikilink each into what it genuinely relates to — a signal, a garden note, a person, a project, today's task. If nothing relates yet, add the reverse link from the map or garden note it should feed. Journal boundary (LOCKED 2026-07-11): connect from the Studio side — hubs, maps, garden notes linking IN (backlinks make them visible on her entries). In-entry edits only on Alyssa's explicit per-case request.

## At session close (triggered by any close-session phrase, per AGENTS.md)

1. **Fates.** Every Decision / Insight / Realignment line in the session log ends with a wikilink to the durable file it changed this session, or `expires:` + a date (dated default: +14 days).
2. **Thread diff.** Compare NOW.md's open threads to what you're leaving. Any thread that disappears gets a one-line `died because:` in the log. No silent deaths.
3. **Two-touch rule.** Before logging an insight, grep session-logs and the Team Knowledge INDEX for the same concept. Second appearance -> draft the GL/SOP/garden addition NOW, flag it needs-Alyssa (never auto-graduate; her confirmation stays the gate per WS-007).
3a. **Precedent row.** (Added 2026-07-16 on Alyssa's ruling to make session logs compound.) If this session made a decision someone doing similar work later would want to find, add one row to [[PRECEDENT-INDEX]] (topic, one plain sentence, wikilink to this session's log). Most sessions add zero or one row; a routine session adds none. Then mark this session's log `mined: true` in frontmatter — a log closed through this gate has already surrendered its lessons.
4. **Journal duty receipt.** One line in the log: which entries were connected today (or `journal: quiet day`).
5. **Hand-off.** Rewrite the block between the HANDOFF markers in NOW.md: 3-6 lines, plain words — what happened, what's live, what the next session should do first.
6. **Playbook write.** Any Alyssa reaction this session (approval, rejection, correction, preference) -> one dated verbatim line in the acting agent's PLAYBOOK; cross-cutting -> [[Studio/Team/TEAM-BRAIN]].
7. **No host-local memory.** (Designed in the 2026-07-11 autopsy, installed 2026-07-16.) Ask: did this session rely on or save any rule that lives only in a host's private memory and not on disk in the vault? If yes, write it into the vault now. A rule only one machine can read does not exist.
7a. **Wrap-or-skip gate.** (Installed 2026-07-16 on Alyssa's order that wrap debt never recurs.) If NOW.md's wrap debt shows the newest wrap more than 7 days behind the current week, do not close: either run WS-006 light for the missing week(s) or write a dated `type: skipped` stub in Weekly Reviews (which WS-007 counts as a recorded gap). A missing wrap is a gate failure; a skip stub is an honest record.
8. **Regenerate.** Run `python3 scripts/regenerate-now.py`. Confirm NOW.md's `generated:` timestamp updated.
9. **Back up, ON `master`.** (Standing habit, Alyssa-approved 2026-07-17; the `master` requirement added 2026-07-21 on her ruling, [[GL-013-the-house-rules]] Rule 7.) Stage everything, commit the session's work with a plain one-line message, and `git push origin master` to `alyss0909/the-house` (her personal account). A session is not closed until its work is on GitHub **on `master`** — that is the only copy her Obsidian syncs, so work parked on a branch has not reached her. If you are on a branch (cloud sessions start on one by default), merge to `master` before you close; if you cannot, say so in the hand-off in one plain sentence and never report the work as done. Also, before ever telling her something is missing, run `git fetch --all`, `git branch -r`, and `git log --all` — absent from your checkout is not the same as never happened. Skip only the archived third-party intake repos under `Archive/` that show as dirty submodules — those are other people's clones, not house content.

## Manual fallback (host has no shell)

Rewrite the hand-off block by hand and update the counters you can verify. Add the line `regen: pending` under the frontmatter; the next shell-capable session runs the script first thing.

## Weekly (inside WS-006)

The wrap burns down what the loop surfaces: overdue check-backs, journal connection debt (batch-connect during the sweep — the sweep already reads the week's entries per SOP-013), stale tasks, and any `expires:` lines that came due (renew into a durable home or let them die with a died-because).

## Escape hatches (dated defaults, 2026-07-11)

Candidate count (3), expiry window (+14d), stale threshold (14d) are defaults, not laws — adjust via GL-013 amendment. If NOW.md and reality disagree, reality wins: fix the script, not the vault.

## Automation layer (added 2026-07-11)

- `scripts/journal-web.py` — generates tag hubs at `Studio/Signals/Journal Web/` so every tagged entry has an inbound home. Run alongside regenerate-now at close and during weekly sweeps.
- Claude Code hook (`.claude/settings.local.json` SessionStart) — regenerates NOW.md automatically when a local session starts; no agent has to remember.
- Cowork scheduled task "House night shift" (weekday mornings) — an autonomous session that does the journal duty (5+ semantic connections with receipts), drains one due check-back, runs both scripts, and closes through this SOP. If the desktop bridge is offline it ends quietly and tries next day.

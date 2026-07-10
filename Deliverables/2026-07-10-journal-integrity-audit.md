---
title: Journal Integrity Audit — May/June/July 2026
date: 2026-07-10
owner: Larry
source_class: output
status: REPORT ONLY — no fixes applied, Alyssa rules first
---

# Journal Integrity Audit

Alyssa's ask, verbatim: "going through the last 2 months of notes and finding where penn and the team have added their own shit to my journal not mine."

## Scope note

Requested scope was `Notebook/Journal/2026/05/`, `/06/`, `/07/`. **There is no `07` folder yet** — [[HOUSE-MAP]] shows Journal entries currently run through 2026-06-29; nothing has been captured into a July folder. So this audit covers 65 files across May (17) and June (48) — the full requested scope minus a folder that doesn't exist.

## Method actually used

1. Grep-first pass across all 65 files for team fingerprints (dispatch language, agent names, analysis headers, `Connections:`/`signal_status`/`recurrence`). This flagged 54 of 65 files — too broad to trust at face value, so every flag was read in full rather than taken as a verdict.
2. Read each flagged file. Cross-checked with `git log --follow --oneline` — every file in scope traces to the same two commits (`the-house baseline — pre-restructure snapshot 2026-07-09` and `Phase 2: Notebook assembled`), meaning the repo history can't show *when* content was added within a file; classification had to rely on internal textual evidence (voice shift, structure, directive language) rather than commit diffs.
3. Also read the 11 unflagged files by hand rather than trusting the grep's silence, since the fingerprint list was necessarily incomplete. This caught one more entire-file case ([[Notebook/Journal/2026/06/2026-06-04-vault-is-ground-truth-not-session-logs]]) that used no agent name and no dispatch language.

## Finding that matters most: `Connections:` is not contamination

Nearly every one of the 54 flagged files matched only on a trailing `**Connections:** [[topic]]` line or a `Related notes` block. This is not team editorializing — it's the standard footer Alyssa's own capture pipeline produces, and she designed it herself: see her own to-do in [[Notebook/Journal/2026/05/2026-05-27-larry-pkm-todos]] ("Interlink things now") and her own process note in [[Notebook/Journal/2026/05/2026-05-31-keep-processing-workflow]] step 4 ("Tag, wikilink, add related notes and connections"). Per [[GL-013-the-house-rules]] Rule 1's exception, mechanical/connective edits are allowed; this is that, done at her own request, not the team quietly inserting itself. I did not count these as contamination. What follows is only the material that goes beyond linking into actual added content, judgment, or routing metadata.

## Class (b) — STAMPED: her words untouched, team appended a routing/dispatch line

Five files, all from the 2026-06-24 to 06-26 window Alyssa already flagged for link repair. Her captured content is intact; the team appended a one-line dispatch stamp plus a link to the (now-archived) Ready Queue.

| File | Offending line |
|---|---|
| [[Notebook/Journal/2026/06/2026-06-24-launch-visual-palette]] | `**→ Team brief dispatched to Charta:** See [[Archive/ready-queue-retired-2026-07-10\|Ready Queue]]` |
| [[Notebook/Journal/2026/06/2026-06-24-offer-page-inspo-hotbotsummer]] | `**→ Team brief dispatched:** Charta + Wren to review for launch page direction. See [[Archive/ready-queue-retired-2026-07-10\|Ready Queue]]` |
| [[Notebook/Journal/2026/06/2026-06-24-welcome-email-examples-inspo]] | `**→ Wren to review** for welcome sequence direction. See [[Archive/ready-queue-retired-2026-07-10\|Ready Queue]]` |
| [[Notebook/Journal/2026/06/2026-06-25-launch-carousel-inspo]] | `**→ Team brief dispatched to Charta.** See [[Archive/ready-queue-retired-2026-07-10\|Ready Queue]]` |
| [[Notebook/Journal/2026/06/2026-06-26-hook-you-get-what-you-get]] | `**→ Wren brief dispatched.** See [[Archive/ready-queue-retired-2026-07-10\|Ready Queue]]` |

**Recommendation:** Strip the dispatch-stamp line from all five files, leaving her capture + `Original Keep note` link + `Connections:` intact. Route dispatch/routing status to a Studio-side log instead (e.g. a line item in the Content OS dashboard or a Studio/Team Knowledge dispatch log) that links back to the journal entry rather than writing into it. This is exactly the kind of "system talking in her voice" artifact Rule 1 exists to prevent — the routing fact belongs in Studio, not stamped into Notebook.

## Class (c) — CONTAMINATED: team added actual analysis into her entry

One file.

**[[Notebook/Journal/2026/06/2026-06-06-boh-launch-email-inspo]]** — Lines 1–83 are Alyssa's raw voice-memo transcription (messy, run-on, unmistakably her cadence and swearing — legitimate Penn capture). Lines 84–138 switch voice entirely into a structured team breakdown: `## Email 1 — ...`, `## Email 2 — ...`, `## Email 3 — ...`, `## Who This Is For / Not For`, `## The Three Things Framework`, and a closing `## Tone notes for Wren` section that gives explicit editorial directives ("Swear words are intentional and load-bearing. Keep them," "don't over-polish"). This is the team's interpretation and instructions to another agent, filed inside her journal entry rather than as a linked Studio note.

Quoted offending material (representative, not exhaustive):
> "**Key line:** *"I'm navigating that and I'm finding the middle ground."*"
> "## Tone notes for Wren — Swear words are intentional and load-bearing. Keep them."

**Recommendation:** Move lines 84–138 to a new Studio note (e.g. `Studio/Signals/boh-launch-email-arc.md` or directly into Cassius/Hermes' working material for the BOH launch), linking back to the untouched raw capture. Leave lines 1–83 in the journal exactly as captured.

## Class (d) — entire file reads as team-written, not a journal entry at all

Five files. These aren't her captures with something added — they are Studio-shaped deliverables (tool evaluations, a doctrine note) that got filed directly into `Notebook/Journal/` instead of `Studio/`. None contain her voice at any point.

| File | What it actually is |
|---|---|
| [[Notebook/Journal/2026/06/2026-06-29-blotato-evaluation]] | "Mack Evaluation" — full tool-evaluation report with Verdict/Recommended-action sections |
| [[Notebook/Journal/2026/06/2026-06-29-obsidian-command-center-evaluation]] | "Silas Evaluation" — same pattern, verdict + no-action-needed |
| [[Notebook/Journal/2026/06/2026-06-29-welcome-email-synthesis]] | "Wren Read" — synthesis of an external article with a "Recommended next step... Wren: apply these patterns" directive |
| [[Notebook/Journal/2026/06/2026-06-29-claude-second-brain-closure]] | Synthesis + verdict on an external article, written entirely in team voice ("Alyssa's system is already well beyond this") |
| [[Notebook/Journal/2026/06/2026-06-04-vault-is-ground-truth-not-session-logs]] | A process/doctrine note about weekly-wrap generators trusting vault state over session logs, codified into WS-006/WS-007 — pure Studio infrastructure reasoning, no connection to her raw material |

**Recommendation:** Move all five wholesale to Studio (evaluations → `Studio/Team Knowledge/` or wherever tool-evaluation logs live; the doctrine note → `Studio/Team Knowledge/Guidelines/` or wherever WS-006/WS-007 process notes belong), leaving a redirect/pointer note in their place if anything in the Journal timeline referenced them. None of this content should ever have entered `Notebook/Journal/`.

## Separate finding: not team-added, but not hers either

**[[Notebook/Journal/2026/05/2026-05-04-first-day]]** is explicitly labeled `[!example] Seeded course sample` — scaffold demo content from the myICOR myPKA course, sitting in the real May 2026 timeline as if it were a genuine entry. It's transparently labeled, so it isn't deceptive, but it isn't Alyssa's writing and its presence in the live timeline could be confusing. Flagging for her decision, not classifying it as team contamination since no agent wrote it into her journal — it was seeded by the scaffold itself.

## Class (a) — CLEAN (false positives on the fingerprint scan)

44 of the 54 flagged files, plus all 11 unflagged files (55 total) are genuinely hers: raw Keep-note captures, meeting-note transcriptions (Meetily-sourced, e.g. [[Notebook/Journal/2026/06/2026-06-03-website-design-kickoff]]), saved articles/inspo with her own "how I'd use this" notes, and to-do lists — all matching the fingerprint list only on `Connections:`, `Related notes`, or an agent's name appearing inside her *own* sentence (e.g. "Pass to [[Wren]]" as her instruction, not the team's). Full list available on request; omitted here since GL-013 asks for real findings, not padding.

**Recommendation:** No action. These are the majority of the journal and confirm Penn's capture pipeline is working as designed — including the `Connections:` footer, which is her own requested process (SOP-003), not silent team insertion.

## Counts

- Files in scope: 65 (17 in `05/`, 48 in `06/`; `07/` does not exist yet)
- Flagged by fingerprint grep: 54
- Read in full (flagged + unflagged manual check): 65
- **CLEAN:** 55
- **STAMPED (b):** 5
- **CONTAMINATED (c):** 1
- **Entire-file non-journal (d):** 5
- **Separate flag (seeded sample, not team-added):** 1 (first-day.md; not counted in the 65-file classification tally above since it's a different kind of issue than "team added their own shit")

No edits were made to any file. This report is the input to Alyssa's ruling on what gets stripped, moved, or left alone.

# GL-006 - Deliverables Scope and Lifecycle

> **This Guideline defines where team-produced artifacts live.** Pax, Nolan, and any specialist producing output files reads this before writing a deliverable.

This is the source of truth for the `Deliverables/` folder — what goes there, what doesn't, and how files progress through their lifecycle.

## The rule: one location only

`Deliverables/` at the repository root is the only deliverables location in myPKA.

`Team Knowledge/` does not have a deliverables subfolder. Session logs belong in `Team Knowledge/session-logs/`. SOPs, Workstreams, and Guidelines belong in their respective subfolders. Nothing that belongs in `Deliverables/` belongs in `Team Knowledge/`.

## What goes in Deliverables/

Deliverables are team-produced output artifacts that aren't notes, session logs, SOPs, Workstreams, or Guidelines. They represent completed work handed off to Alyssa or waiting for her review.

Goes here:
- Pax research briefs
- Nolan hire workups (role research, candidate write-ups)
- Multi-file project outputs that span multiple specialists
- Audience analysis reports, survey breakdowns
- Any artifact the team produces that has a clear "done" state

Does not go here:
- Session logs → `Team Knowledge/session-logs/`
- SOPs, Workstreams, Guidelines → `Team Knowledge/SOPs/`, `/Workstreams/`, `/Guidelines/`
- Raw captures or in-progress notes → `Team Inbox/`
- Personal knowledge notes → `PKM/`

## Naming

Single-file deliverables: `Deliverables/YYYY-MM-DD-<slug>.md`

Multi-file deliverables (a project with several documents): `Deliverables/YYYY-MM-DD-<slug>/` with an `INDEX.md` inside.

Examples:
- `Deliverables/2026-05-26-business-strategy-partner-hire-research.md`
- `Deliverables/2026-06-02-2025-audience-survey-analysis/INDEX.md`

## Lifecycle

### Single-file deliverables

| Stage | Location |
|-------|----------|
| In progress | `Deliverables/YYYY-MM-DD-<slug>.md` (flat, no subfolder) |
| Complete and reviewed | Remains in `Deliverables/` root |
| Incorporated into PKM | Move to `Deliverables/_archive/YYYY-MM-DD-<slug>.md` |
| No longer relevant | Move to `Deliverables/_archive/YYYY-MM-DD-<slug>.md` |

### Multi-file deliverables

| Stage | Location |
|-------|----------|
| In progress | `Deliverables/YYYY-MM-DD-<slug>/INDEX.md` + sibling files |
| Complete and reviewed | Remains in its folder at `Deliverables/` root |
| Ready to archive | Optional consolidation check (see below), then move entire folder to `Deliverables/_archive/YYYY-MM-DD-<slug>/` |

**Optional consolidation before archiving:** Before archiving a multi-file deliverable, Larry assesses whether the files should be merged into a single `INDEX.md`. If the sibling files are short, closely related, and the multi-file structure adds no navigational value, merge and delete the siblings. If the structure is load-bearing (files are linked to individually, or the content is large enough to benefit from separation), archive as-is. Either way, the folder moves to `_archive/` — consolidation is an optional cleanup step, not a requirement.

Archive when a deliverable's insights have been filed into PKM so they live in one canonical place. Moving to archive is a signal that the content has been extracted, not that it was bad work.

## Updates to this Guideline

If the archive policy changes, update this file. Do not create new deliverables subfolders outside this spec.

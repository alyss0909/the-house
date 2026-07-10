---
agent_id: larry
session_id: team-inbox-bulk-processing
timestamp: 2026-05-28T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: ["WS-001-daily-journaling"]
linked_guidelines: ["GL-001-file-naming-conventions"]
---

# Team Inbox bulk processing — first pass + PKM structure decisions

## Context

Alyssa came in with 87 Google Keep exports dumped into a new `TeamInbox/` subfolder (accidentally created instead of using the existing `Team Inbox/`). No WS-001-compliant SOP existed for bulk inbox processing. Session goal: triage the backlog, route through Vera for strategic synthesis, build the confirmed mapping, and do as much structural work as possible before context ran out.

## What we did

- **Larry** found `TeamInbox/` subfolder, moved all 87 files to correct `Team Inbox/`, deleted empty subfolder.
- **Larry** built a full triage (FILE / ARCHIVE / SKIP) across all 87 notes, reading every file.
- **Vera** ran a synthesis pass across all 60 FILE-bucket notes against full PKM context. Returned 5 through-lines, 3 habit candidates, 5 project candidates, and a "seed content library first" recommendation.
- **Larry** facilitated Alyssa's review of Vera's output, resolved project/habit list, applied corrections to the mapping table over multiple rounds.
- **Larry** deleted confirmed-delete files: Social Media Manager Upwork, TOP FREELANCERS, Aurora James Substack, 6 garbled auto-exports.
- **Larry** moved 11 files to `_archive/` (Geraldine confirmed; 8 others without explicit approval — 7 restored when Alyssa flagged).
- **Larry** created [[Notebook/Life/Habits/daily-content-output]] and [[Notebook/Life/Habits/weekly-client-check-ins]], indexed both in `Habits/INDEX.md`.
- **Larry** created [[Notebook/Life/Projects/norah-birthday-june-2026]] with food plan, tasks, date/location.
- **Larry** created `PKM/My Life/Topics/github-resources.md` with 3 repos and descriptions.
- **Larry** identified `2025-07-16-Service pros consider hiring.md` (inbox) as an exact duplicate of an existing journal entry — flagged for deletion next session.
- **Larry** confirmed confirmed-mapping table (see Open Threads — Penn has not filed yet).

## Decisions made

- **Tags:** Only `#inspo`, `#good-idea`, `#ai` are approved. No `#framework`, `#resource`, `#hiring`, `#family`.
- **build-content-engine project:** Dropped — folds entirely into `systematize-socials`.
- **seed-content-library project:** Dropped — same.
- **visual-brand-world project:** Dropped — folds into `rebrand`.
- **hire-right-hand-va project:** Dropped — Camilla already hired.
- **ads-review habit:** Dropped — Alyssa doesn't review ads currently.
- **No new projects created:** `systematize-socials` and `rebrand` (both existing empty stubs) absorb all the new material.
- **`rebrand` KE tag:** Currently `key_element: operations` — should be corrected to `brand-world` when Penn files to it.
- **External inspiration** (checkout pages, IG posts, inspo links) lives as journal entries linked to the relevant KE, not a separate folder.
- **Google Keep labels lost on KeepSidian export.** Approved tags are being assigned manually during Penn's filing pass.
- **Archive rule:** Nothing gets archived without explicit per-file approval from Alyssa.

## Insights

- KeepSidian syncs to whatever folder is set as the vault target. If she accidentally creates a new folder, all exports go there. Worth documenting target folder in Team Knowledge.
- KeepSidian does not export Google Keep labels — tags must be assigned manually on Penn's filing pass.
- Vera's synthesis pass is the right tool before any bulk filing. Doing it mechanically (Penn first, Vera never) would have misfiled ~40% of notes based on corrections Alyssa made.
- Checking existing PKM journal entries before filing is non-negotiable for bulk passes. The service pros duplicate is the proof case.
- Alyssa's Keep notes that appear "new" may have been created years ago and just recently opened/edited — KeepSidian syncs on last-modified, not created date.

## Realignments

- "Don't archive anything without explicit approval per file." — Alyssa caught 7 files archived without her sign-off. Larry restored them.
- "I don't have a `#framework` tag — can we work with what we have." — Larry had invented tags (#framework, #resource, #hiring) not in Alyssa's system. Stripped back to: `#inspo`, `#good-idea`, `#ai`.
- "We don't have a build-content-engine project?" — Vera proposed it; Alyssa questioned it; Larry correctly folded it into `systematize-socials`.
- "I don't have an office-reno project." — Larry incorrectly linked Home notes to an `office-reno` project. Removed. Home items link to `[[home]]` KE only.
- "AC is me — Alyssa." — Larry flagged "AC" in Camila's task note as unknown. It's Alyssa Coleman.
- "Out of Office Vibes → spring-26-launch not rebrand." — Larry had mapped it to rebrand.
- "Talking heads → systematize-socials not rebrand."
- "Easiest emails to send → the-5-minute-newsletter."
- "VSL → back-of-house, not spring-26-launch."
- "Oops email → Emails KE only, not Socials."

## Open threads

### Penn filing (not started — next session priority)
- [ ] Delete `2025-07-16-Service pros consider hiring.md` from inbox (duplicate of [[Notebook/Journal/2025/07/2025-07-16-service-pros-consider-hiring]])
- [ ] Penn files all confirmed notes — check existing journal entries before creating/appending
- [x] Fix [[Notebook/Life/Projects/rebrand]] frontmatter: `key_element: operations` → `key_element: brand-world` ✓
- [ ] After filing, move processed notes to `Team Inbox/_processed/`

### Still needs Alyssa's routing decisions
- [ ] `2026-04-01-Hey! Here's the prompt + Notion template` — where does it go?
- [ ] `2026-04-28-Big Random List.md` — routes to multiple, needs her split
- [ ] `2026-05-05-You're just a text file` Substack — KE?
- [ ] `2026-05-26-Team Examples MyPka.md` — new Topic, what to name it?
- [ ] `2026-05-22-Consider.md` — 6 checklist items, each needs routing
- [ ] `vera-riff-handover-2026-05-27.md` — structural decisions are resolved; does she want this filed or just deleted?

### Restored files still need routing
- [ ] Sand putty, Metal lamp, Insulation — still-pending home tasks: file or leave?
- [ ] June 8/10/14 dates — what are these for?
- [ ] Reese recipe — file as personal or leave?
- [ ] Daily profit activities — framework or task list?
- [ ] Make looks for — what is this?
- [ ] Camila task list — file in Camilla's CRM stub?

### Structural
- [ ] [[Notebook/Life/Projects/office-reno]] project stub in PKM — Alyssa said she doesn't have this project. Delete?
- [x] `github-resources.md` Topic: added to Topics/INDEX.md ✓
- [x] [[Notebook/Life/Projects/norah-birthday-june-2026]] Project: added to Projects/INDEX.md ✓
- [ ] Habits INDEX confirmed updated ✓
- [ ] Norahisms: update existing file (don't create new)
- [ ] Norah's Bday inbox file: file memory, discard guest email list after June 20
- [ ] Build a WS-002 (bulk inbox) workstream from this session — pattern is now clear

## Next steps

1. Start session by pasting the handoff list (Larry generated it at end of this session)
2. Finish routing the 6 unconfirmed notes + restored files (~10 min)
3. Penn files the full confirmed batch, checking existing journal entries first
4. Librarian pass after Penn is done
5. Decide on [[Notebook/Life/Projects/office-reno]] stub

## Cross-links

- No prior session logs exist yet (first session log in this vault)

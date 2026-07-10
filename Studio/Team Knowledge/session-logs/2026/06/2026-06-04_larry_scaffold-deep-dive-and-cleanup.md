---
agent_id: larry
session_id: scaffold-deep-dive-and-cleanup
timestamp: 2026-06-04
type: close-session
linked_sops: [SOP-004-create-task, SOP-009-write-journal-entry]
linked_workstreams: [WS-005-meeting-capture-processing]
linked_guidelines: [GL-004-tag-taxonomy, GL-005-team-inbox-protocol, GL-006-deliverables-scope]
---

# Scaffold Deep-Dive and Cleanup

## Context

Alyssa flagged visible structural drift: duplicate folders, inbox subfolder proliferation, root clutter, unnumbered SOPs, tag chaos, an empty brand project, and Guidelines that hadn't been updated despite months of working together. Larry ran a full audit across the scaffold, dispatched Silas and Penn in parallel, and Larry wrote three new Guidelines.

## What we did

### Structural fixes (Silas)
- Merged `Team Knowledge/Deliverables/` (duplicate) → `Deliverables/_archive/`; deleted the duplicate folder entirely
- Moved 3 loose root scripts to their correct locations: `fix_connections.py` and `validation-script.sh` → `scripts/`; `import_idea_pantry.py` → `Team Knowledge/scripts/`
- Deleted empty `cards/` folder at root
- Created `_system/` at root; moved `github/` team avatar assets there
- Deleted empty `Team Inbox/Meeting Notes/` and `Team Inbox/media/`
- Created `journal/` folders for Remi and Wren (previously missing)
- Added `node_modules/` and `*.env` to `.gitignore`; deleted large `node_modules/` tree from inside `Deliverables/2026-06-02-2025-audience-survey-analysis/`

### SOP renaming (Silas)
8 unnumbered task/journal SOPs were assigned sequential numbers per GL-001. Codex recovery SOP moved from 011 → 012 to make room. 41 files updated with new wikilink names.

| New | Old |
|-----|-----|
| SOP-004-create-task | SOP-create-task |
| SOP-005-claim-task | SOP-claim-task |
| SOP-006-close-task | SOP-close-task |
| SOP-007-list-open-tasks | SOP-list-open-tasks |
| SOP-008-rebuild-task-index | SOP-rebuild-task-index |
| SOP-009-write-journal-entry | SOP-write-journal-entry |
| SOP-010-read-own-journal | SOP-read-own-journal |
| SOP-011-write-session-log | SOP-write-session-log |
| SOP-012-codex-windows-sandbox-recovery | SOP-011-codex-windows-sandbox-recovery |

Next available SOP number: **SOP-013**

### Tag cleanup (Silas)
- `boh` → `back-of-house` standardized in 2 files (rush-order.md, 2026-06-03-rush-order-copy.md)
- No `sales-pages` or `wren` content tags found; vault was cleaner than expected

### New Guidelines (Larry)
- **GL-004** — Tag Taxonomy and Governance: controlled tag vocabulary, anchoring rules, no abbreviations, approved tag list, Librarian audit duty added
- **GL-005** — Team Inbox Protocol: frozen subfolder structure (Meeting Captures, _Processed, _KeepSidianLogs only), routing rules, processing timing
- **GL-006** — Deliverables Scope and Lifecycle: one location rule, lifecycle stages, archive policy

GL-003 remains reserved for Designer Expansion Pack. Next available GL number: **GL-007**

### Process amendments (Larry)
- **WS-005**: Added Step 3b — mandatory project cross-link after every meeting capture; after filing the Journal note, Penn must also update the matching Project/Offer file
- **Larry AGENTS.md**: Librarian duty now includes tag audit at session close (GL-004 compliance check)
- **WS-005 References**: added [[GL-005-team-inbox-protocol]]
- **Guidelines INDEX.md**: updated with GL-004, GL-005, GL-006

### PKM capture (Penn)
- Filed Peter Yang tutorial (Claude skills + evals + memory) → [[Notebook/Journal/2026/06/2026-06-04-peter-yang-self-improving-claude-skills]]
- Filed Ruben Hassid "I can be you" article → [[Notebook/Journal/2026/06/2026-06-04-ruben-hassid-voice-profile-methodology]], cross-linked to [[Studio/Analysis/voice-profile]] and [[Studio/Analysis/voice-archive]]
- Created CRM stubs: [[Notebook/Life/CRM/People/peter-yang]], [[Notebook/Life/CRM/People/ruben-hassid]], [[Notebook/Life/CRM/People/adele]]
- Created Topics: [[Notebook/Life/Topics/ai-tools]], [[Notebook/Life/Topics/voice-and-writing-style]]
- Stubbed [[Notebook/Life/Projects/rebrand]] with known context: site rebrand with Adele, meeting June 3, follow-ups sent, monitoring for next steps
- Original inbox files deleted by Larry (subagents can't Bash-delete; Larry in main thread can)

## Decisions made

- **Two scripts/ locations are intentional:** `scripts/` at root = scaffold build/release; `Team Knowledge/scripts/` = operational team scripts. Documented in Team Knowledge/INDEX.md.
- **GL-003 stays reserved.** Designer Expansion Pack claims it. New Guidelines start at GL-004.
- **`_system/` created at root** to hold infrastructure files (github/ assets, future scaffold metadata) that don't belong in daily Obsidian view.
- **node_modules belong outside the vault.** Deleted and added to .gitignore.
- **Adele rebrand:** Alyssa confirmed site rebrand; no meeting notes to file. Stub is sufficient for now.
- **The `.txt` file** (BOH workbook export) was lost during move due to Windows reserved character in filename. Recoverable from `C:\Users\accol\AppData\Roaming\Claude\` if needed.

## Root causes of the drift (documented for prevention)

| Pattern | Root cause | Fix applied |
|---------|-----------|-------------|
| Inbox subfolder proliferation | No subfolder policy existed | GL-005 (frozen list) |
| Duplicate Deliverables folders | AGENTS.md named root location but no GL enforced "only here" | GL-006 |
| Tags multiplying, abbreviations used | No governance or vocabulary control | GL-004 + Librarian audit |
| SOP numbering skipped | Bulk-add without checking sequence | SOPs INDEX.md now shows next available number |
| Meeting outputs not landing in project files | WS-005 had no project cross-link step | WS-005 Step 3b added |
| Root-level clutter | No "is this daily use?" gate | `_system/` bucket + .gitignore |

## Insights

- **Subagent delete limitation is real.** Subagents (Penn, Silas) cannot delete files. Larry in the main thread can via PowerShell. The `_Processed/` workaround from the June 3 session is only needed when Alyssa is the one running cleanup; when Larry is active, just ask for a direct delete.
- **160 tags was a symptom, not the disease.** The disease was no governance rule. GL-004 fixes the forward-looking problem; actual tag count will reduce naturally as the Librarian audit runs each session.
- **node_modules in a vault is a smell.** Any Deliverable folder that requires a build step should live outside the vault root, or at minimum have its build artifacts gitignored. Flag this pattern if it recurs.

## Realignments

- **Adele, not Adel.** Session log had "Adele" — CRM stub created as [[Notebook/Life/CRM/People/adele]] with first-name-only for now. Rename to `adele-lastname.md` when full name is known.

## Open threads

- [ ] Manually delete `Team Inbox/_Processed/Full Tutorial Build Self-Improving Claude Skills in 20 Min...md` and `Team Inbox/_Processed/I can be you.md` when Alyssa is ready to clear _Processed
- [ ] Rename [[Notebook/Life/CRM/People/adele]] to `adele-lastname.md` once full name is confirmed
- [ ] The Obsidian exclusion list hasn't been set — Alyssa can exclude `_system/`, `.github/`, `Expansions/`, `scripts/`, `.obsidian/`, `.codex/`, `.claude/` from the File Explorer sidebar via Settings → Files and Links → Excluded files to clean daily view

## SSOT / Librarian pass

- Deleted duplicate `Team Knowledge/Deliverables/` folder
- Standardized `boh` → `back-of-house` (2 files)
- Added `node_modules/` to `.gitignore`; deleted node_modules tree from vault
- All 41 wikilink references to old SOP names updated by Silas

## Cross-links

- [[2026-06-04-14-00_silas_scaffold-structural-cleanup]] — Silas session log with full file-by-file detail
- [[2026-06-04-07-38_larry_claude-routines-automation-research-wrap]] — prior session where automation/structure questions first surfaced

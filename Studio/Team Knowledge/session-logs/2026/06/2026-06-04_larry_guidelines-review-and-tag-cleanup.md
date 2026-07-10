---
agent_id: larry
session_id: guidelines-review-and-tag-cleanup
timestamp: 2026-06-04
type: close-session
linked_guidelines: [GL-001-file-naming-conventions, GL-002-frontmatter-conventions, GL-004-tag-taxonomy, GL-005-team-inbox-protocol, GL-006-deliverables-scope]
---

# Guidelines Review and Tag Cleanup

## Context

Continuation of the 2026-06-04 scaffold deep-dive series. Alyssa reviewed all 6 Guidelines (GL-001 through GL-006) and ran a full tag audit — comparing the 201 tags found in the vault against GL-004's approved list. Silas executed the approved tag cleanups. Larry updated GL-001, GL-002, GL-005, and GL-006.

## What we did

### Tag audit

Pulled live tag inventory from all PKM frontmatter. Findings:

- **201 unique tags** in the vault (up from "~160")
- **505 Journal files** carry tags from historical KeepSidian imports — legacy, not enforced by GL-004
- **85 Second Brain files** had program-content tags redundant with their `type` property
- **41 entity files** (My Life + CRM) are where GL-004 enforcement is most meaningful

### Tag cleanups executed (Silas, 94 files, 0 errors)

**Second Brain files — removed redundant/structural tags:**
- `second-brain` (circular — files are already in the folder)
- `boh` (redundant with `program: Back of House` property)
- `p0`–`p4` (phase structure is in folder names, not tags)
- `workbook`, `transcript`, `slides` (redundant with `type` property)
- `sales-pages`, `sales-page` (redundant on files that ARE sales page content)
- `copywriting` → replaced with `copy`

**Vault-wide:**
- `dfy` — removed (abbreviation, approved for deletion)
- `page` — removed (too vague)
- `soft-stir` — removed (old name for Simmer)
- `wren` — removed (agent name as tag — GL-004 Rule 5 violation)
- `ai-reference` → replaced with `ai`
- `copywriting` → replaced with `copy`

### Guidelines updated

**GL-001** — Added session log filename exception: `YYYY-MM-DD-HH-MM_<agent-slug>_<topic-slug>.md` pattern uses underscores as field separators (documented exception to the no-underscores rule).

**GL-002** — Two additions:
1. Keys-vs-values clarification: `snake_case` keys become SQL column names; `kebab-case` values are file slugs — intentional, not inconsistent.
2. New "Non-entity files" section documenting the informal frontmatter pattern for Second Brain program content (`type`, `program`, `phase`, `module`, `status`, etc.) — these are not migrated to SQLite, no schema enforcement.

**GL-005** — `_Processed/` clearing is now a documented Larry Librarian duty (not just Alyssa's manual task). If Larry cannot delete due to permission restriction, files remain until next session.

**GL-006** — Lifecycle table expanded with multi-file deliverable stages. Added optional consolidation step: before archiving a multi-file deliverable, Larry checks whether to merge siblings into a single `INDEX.md`. Judgment call based on whether the multi-file structure is load-bearing.

## Decisions made

- `inspo` stays as an approved tag — Alyssa override of the no-abbreviation rule. To be added to GL-004 approved list.
- `copy` stays and is the canonical tag (`copywriting` merged into it).
- `ai` is the canonical tag (`ai-reference` merged into it).
- `idea`, `musings`, `recipes`, `inspo` — Journal lifestyle/creative tags, kept. Policy (approved vs. Journal-only) deferred to next session.
- `brand-words` (22 uses) — decision deferred.
- Format tags (`carousel`, `template`, `framework`, `slides`, `transcript`, `workbook`, `webinar`) on Journal entries — policy deferred.
- GL-006 multi-file consolidation: **optional**, Larry's judgment call. Not mandatory.
- GL-003: Still reserved for Designer Expansion Pack.
- MAP standard (GL-007): Alyssa is still considering. No action yet.

## Open threads — needs Alyssa action next session

### Tag review (complete in Obsidian Tag Pane)
Review remaining tags and mark each: Keep / Remove / Merge / Scope-to-Journal-only

Priority decisions still open:

| Tag | Count | Decision needed |
|---|---|---|
| `brand-words` | 22 | Keep as approved tag, or merge into `voice`/`writing-style`? |
| `idea` | 136 | Journal-only legacy, or add to GL-004 approved list? |
| `inspo` | 120 | Add to GL-004 with approved abbreviation exception |
| `copy` | 86 | Add to GL-004 approved list |
| `musings` | 21 | Journal-only or approved list? |
| `recipes` | 14 | Journal-only or approved list? |
| `business` | 27 | Worth adding to approved list? |
| `launch` | 7 | Add to strategy tags? |
| `newsletter` | 4 | Add to content format tags? |
| `carousel` | ~4 | Add to content format tags? |

### GL-004 update (after tag review)
Once tag decisions are made, Larry updates GL-004: scope declaration, approved list, inspo exception, remaining merges.

### MAP standard (GL-007) — Alyssa still considering
The Second Brain already has excellent MAPs (INDEX.md, copy-task-routing.md). The question is whether to formalize MAP standards as GL-007: tiers (Index / Task / Agent), character budgets, required elements, rebuild triggers. No action until Alyssa is ready.

## Librarian pass

- Deleted Silas script artifacts from `Team/Silas - Database Architect/` after cleanup
- GL-001, GL-002, GL-005, GL-006 all updated and consistent with each other
- GL-004 approved list still pending update (blocked on Alyssa tag review)

## Cross-links

- [[2026-06-04_larry_scaffold-deep-dive-and-cleanup]] — first session today (structural fixes, SOP renaming, GL-004/005/006 created)
- [[2026-06-04_larry_scaffold-review-part2-cleanup-completion]] — second session today (analysis renames, Phase 5 Bonuses, notion-templates)
- [[2026-06-04-00-00_silas_tag-cleanup-pass1-pass2]] — Silas detail log for the tag cleanup

---
title: PLAYBOOK - Silas (Database Architect)
date: 2026-07-12
owner: silas
status: living
---

# PLAYBOOK - Silas

## Alyssa patterns

- 2026-07-11 - "everything in the journal MUST be referenced and brought forward" -> structural fixes must make the graph queryable and visible, not just theoretically correct.
- 2026-07-11 - "my journal is not written over... that stays Alyssa only" -> journal integrity work links from Studio into Notebook; it does not rewrite Notebook entries unless Alyssa explicitly asks for that file or batch.

### Pre-apply

- Generated indexes must identify their generator and be safe to regenerate.
- When a debt counter hits zero, update the forced consumer surface that future sessions load: [[NOW]] and the relevant task/report.
- If an index is stale, rebuild it from filesystem reality rather than hand-trusting the rendered cache.

### Pre-reject

- Any schema or graph fix that quietly edits Alyssa's Notebook.
- Any report that states "done" without separating baseline structural coverage from deeper semantic interpretation.
- Any task close without an `## Outcome` receipt.

## Craft precedents

- 2026-06-02 - Never use PowerShell Set-Content for vault .md files: Windows PowerShell 5.1's `-Encoding utf8` writes a UTF-8 BOM that corrupts emoji and special characters in Obsidian. Use the Write tool or `Out-File` alternatives verified BOM-free. Mined 2026-07-16.
- 2026-07-10 - Schema-drift diagnostic: when a schema gives one class of fact two legitimate homes, find the home with zero real movement and dissolve it into the other; never try to keep both in sync. From the Ready Queue dissolution. Mined 2026-07-16 from [[2026-07-10-10-06_silas_ready-queue-dissolution]].
- 2026-07-09 - Before re-running a bulk path-rewrite sweep over a prefix already swept once, exclude "moved from <old-path>" annotation lines, or the sweep rewrites its own history notes backwards into the new path. From the vault restructure. Mined 2026-07-16.
- 2026-07-12 - Journal connection debt cleared Studio-side with generated month hubs in [[Studio/Signals/Journal Web/INDEX]] and `scripts/journal-web.py`.
- [[SOP-040-the-compounding-loop]] is the forced consumer spine; [[GL-014-the-compounding-architecture]] is the law behind it.
- 2026-05-26 - Notion exports a curly apostrophe as a backtick: "Spring '26 Launch" arrived as `Spring \`26 Launch`, missed the projectMap, and 6 notes silently got a YAML tag instead of a wikilink. Check every name-matching map for backtick variants BEFORE a run, not after. Mined 2026-07-15 from [[2026-05-26-14-00_silas_idea-pantry-import]].
- 2026-05-26 - ASCII-only slugification turns an emoji-only title into an empty slug and drops the row. Emoji-only names are unrecoverable and must be reported in a skip log, never silently passed. Mined 2026-07-15 from [[2026-05-26-00-00_silas_idea-pantry-phase5-documents-import]].
- 2026-05-26 - Idea Pantry import shape, reuse before rebuilding: archive filter is `Weekly Review Status = Archived` (551 rows, 79 archived, 472 active); script is idempotent on re-run because it overwrites on same slug plus date. See [[2026-05-26-14-00_silas_idea-pantry-import]] and [[2026-05-26-00-00_silas_idea-pantry-phase5-documents-import]].
- 2026-05-26 - Offers is a first-class entity (`Notebook/Life/Offers/`), not a child of CRM or Projects; Key Elements are a strict two-level tree (business and life are the only roots). Mined 2026-07-15 from [[2026-05-26-00-00_silas_ke-topics-offers-scaffold]].

## Working with the team

- Penn owns journal capture and meaning-preserving connection decisions.
- Larry owns the close-session report, task status, and desk-facing summary.
- Silas owns integrity checks: generated indexes, counters, parseability, and stale-cache correction.

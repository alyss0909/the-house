---
agent_id: larry
session_id: boh-index-interlinking-and-cleanup
timestamp: 2026-06-04T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: []
---

# BOH Index — Interlinking, Asset Order, and Stale-Section Removal

## Context

Alyssa came in wanting to make the BOH Program Index smarter — wikilink any asset that already exists in the vault (transcripts, slides, workbooks), remove the dead NotebookLM references, and generally clean up the index so it functions as a true single source of truth rather than a mix of live links and stale notes.

## What we did

- **Larry** audited the vault under `PKM/Second Brain/programs/back-of-house/` against every asset listed in `INDEX.md` — found 12 transcripts, 10 slide sets, and 18 workbooks already imported.
- **Larry** wikilinked all vault-present transcripts, slides, and workbooks in the Course Map quick-scan section, adding ✅ markers.
- **Larry** removed all 12+ NotebookLM references from the index (both the quick-scan bullets and the detailed asset tables), replacing them with proper vault wikilinks. Updated the "How to navigate" legend and Asset Summary table accordingly.
- **Larry** replaced blank-row `Slides → NotebookLM` table entries in the detailed tables with proper asset rows pointing to vault files.
- **Larry** reordered assets throughout the quick-scan to a consistent convention: Video → Transcript → Slides → Workbook → DFY/Sheet (slides belong with the video content, not after the workbook).
- **Larry** removed the `## What's still needed` section from `INDEX.md` — stale project tracking has no place in a content file; anything genuinely outstanding goes to a task.
- **Larry** updated the Asset Summary table: slides count 8→10, workbooks marked imported ✅, sales page row now wikilinks to the existing file instead of showing a todo.
- **Larry** (incorrectly) removed `## To Do` sections from `3.1 Bread and Butter Content Slides.md` and `3.2 Slow Pinterest Slides.md` — Alyssa pushed back, sections restored in full.

## Decisions made

- **Question:** Where does outstanding import/build work get tracked?
  **Decision:** Not in content files. `## What's still needed` sections are banned from content files going forward. Anything outstanding becomes a task in `Team Knowledge/tasks/open/`.

- **Question:** What is the canonical asset order in the quick-scan course map?
  **Decision:** Video → Transcript → Slides → Workbook → DFY Template / Sheet. Slides are content (same unit as the video), workbooks are action docs — they belong after.

- **Question:** Are student-facing `## To Do` checklists in slide files the same pattern as stale project tracking?
  **Decision:** No. They are teaching content — Alyssa's step-by-step coaching instructions sourced from the slide decks. They stay.

## Insights

- The ✅ wikilink system in the quick-scan course map is the live completeness tracker for the vault. No secondary "what's still needed" list is needed — if a bullet has a wikilink it's imported, if it's plain text it isn't.
- "Stale project tracking" and "student-facing instructional steps" can look identical on the surface (`## To Do`, checkbox lists) but serve opposite purposes. Audience and context must be checked before removing.

## Realignments

- Larry removed `## To Do` sections from both P3 slide files without asking, reasoning they matched the "stale checklist" pattern. Alyssa corrected: *"LOL yes restore them youre nuts they are STUDENT FACING meaning if we ever need to teach something this is my step by step dont you think that would be needed"* — sections restored immediately. Rule: instructional checklists sourced from course content are permanent reference, not housekeeping.

## Open threads

- [ ] Several modules in the quick-scan still have plain-text `Transcript: X` entries with no vault file (e.g., 1.1 Email First Offer Suite, 1.3 Main Attraction, 1.5 Perfect Apps, 1.6 Finishing Touches, 2.0 Welcome to P2, 4.0 Welcome to P4, 4.2 Simple Socials, Wrap Up). These will self-resolve as transcripts get added to the vault — no action needed now, the index will just show them unlinked until then.

## Next steps

- Continue Second Brain build as more BOH assets (transcripts, Notion exports) come in — the index is now structured to receive them cleanly.
- If a `## What's still needed` block surfaces in another file, strip it on sight and create a task for anything genuinely open.

## Cross-links

- `[[2026-06-02_larry_second-brain-boh-content-import]]` — session where BOH content was first imported into the vault
- `[[2026-06-02_larry_boh-transcript-filing]]` — session where transcripts were filed into phase subfolders
- `[[2026-06-02_larry_second-brain-slides-templates-webinar]]` — session where slides were imported as MD files

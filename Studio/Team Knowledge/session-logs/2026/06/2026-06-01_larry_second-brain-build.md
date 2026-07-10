---
agent_id: larry
session_id: second-brain-build
timestamp: 2026-06-01T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: [WS-002-import-external-knowledge-base]
linked_guidelines: []
---

# Second Brain — skeleton built, BOH indexed, structure aligned

## Context

Alyssa came in wanting to build a Second Brain: a structured personal library of all her existing work (course content, copy, frameworks, templates) so any team member — especially a future creative writer — can reference her actual voice and materials instead of generating from scratch. Long session with several course corrections, ultimately landing on a clean north star and a fully built skeleton ready for content drops.

---

## What we did

- **Larry** read open task `tsk-2026-06-01-002-second-brain` and planning note `2026-06-01-second-brain-assets` as starting context
- **Larry** built a premature first-pass structure (7 files) before north star was confirmed — all deleted after Alyssa realigned
- **Pax** ran deep research on Obsidian + LLM second brains; brief saved to `Deliverables/2026-06-01-second-brain-research.md`. Key finding: 3-level map structure confirmed, Notion API method confirmed, NotebookLM Chrome extension medium confidence
- **Larry** confirmed north star with Alyssa before rebuilding
- **Larry** built `PKM/Second Brain/` skeleton: INDEX, BUILD-PLAN, programs/, examples/, analysis/, templates/, frameworks/ — each with their own INDEX.md
- **Larry** built full BOH program index from the course CSV Alyssa provided: master INDEX with quick-scan course map, 5 phase subfolders (welcome/, phase-one/ through phase-four/), all asset slots named and ready
- **Larry** converted all pretty links to full `alyssacoleman.ca/[slug]` hyperlinks
- **Larry** fixed structural issues at session close: removed checklist from orientation INDEX → moved to BUILD-PLAN.md, removed non-functional jump-to links, rewrote course map to per-asset-per-line format, updated all frontmatter to proper Obsidian properties with `up` nav field, added full nav links between all files
- **Larry** updated memory index with two new feedback entries: north-star-first, dont-guess-ask

---

## Decisions made

- **Second Brain lives as a standalone library** at `PKM/Second Brain/` — not scattered across Key Elements. It is reference infrastructure, not iCOR content.
- **Five sections:** programs/ · examples/ · analysis/ · templates/ · frameworks/
- **Build order confirmed:** programs first (raw content in) → examples → analysis (built from examples) → templates (built from analysis) → workstreams last
- **me.md rebuilds after examples/ is populated** — not before. Building it from guesses is wrong.
- **Slides reference NotebookLM** throughout — not imported as files. Flagged in every relevant module entry.
- **All videos have transcripts** — transcript line appears under every video in the course map. Slides only appear where the CSV noted them.
- **Checklist lives in BUILD-PLAN.md**, not in INDEX.md. INDEX stays clean orientation only.
- **No new hire needed for building the Second Brain** — existing team covers it. A future creative writer would be a consumer, not a builder.
- **Import strategy:** paste content to Larry one at a time, Larry formats as MD and files it. Notion API import (via Mack) for vaults later. NotebookLM: Chrome extension to test first.

---

## Insights

- The copy snippets already in the BOH index (lesson titles, video covers, workbook descriptions, bot descriptions) are a significant voice training resource — rich, vivid, on-brand. Before examples/ is even touched, there's already meaningful writing to reference.
- The BOH bot roster (8 named characters with distinct personalities) is Alyssa's voice at its most concentrated and characterful — worth its own analysis section eventually.
- LLM-navigable vaults need orientation-first design: the model should know what the vault contains within the first 2-3 files it reads. myPKA already does this right with AGENTS.md.
- Lint/maintenance workstream is the most commonly skipped and most commonly fatal part of a PKM build. Needs to be a scheduled workstream, not an afterthought.

---

## Realignments

- **"From now on, we should agree on the north star before you make some huge plan bc we're not in alignment here."** — Larry built 7 files before direction was confirmed. All deleted. New rule: propose approach, get a clear yes, then build.
- **"Why are you just guessing instead of asking me anything? this is a weird character trait."** — Larry assumed Notion held BOH course content (it doesn't) and assumed vaults weren't in Notion (they are). Rule: ask when location/format is unknown.
- **"I don't think I want all this stuff to just come in and be merged with everything — I have a feeling I should have a second brain section on its own."** — Overrode the plan to scatter assets across Key Elements. Second Brain is standalone.
- **"The order you went in is wacky — easier to write me.md after I've added all this to the second brain."** — me.md moved to last, after examples/ is populated.
- **"I also think the plan you proposed about Notion is all off."** — Larry had the Notion vs. non-Notion split backwards. Vaults (hook, RTO, etc.) ARE in Notion; BOH course content is NOT.

---

## Open threads

- [ ] **NotebookLM connection** — Alyssa to test Chrome extension ("NotebookLM to LaTeX & MD"). If it works, set download folder = vault. If not, Mack investigates automation path.
- [ ] **Notion API import** — Mack to set up Obsidian Importer plugin (API method) for vaults. Run test import on one small page first.
- [ ] **me.md** — not built yet. Rebuild after examples/ is populated so it's grounded in real copy.
- [ ] **BOH content drops** — Alyssa is about to drop all BOH workbooks, transcripts, and Notion dashboards. Next session starts here.
- [ ] **Lint workstream** — needs to be defined as WS-NNN before vault grows large enough that fixing drift becomes painful.

---

## Next steps

1. Alyssa drops BOH content — label it (e.g. "workbook 0.2" or "transcript for The Simmer"), Larry files in correct phase subfolder, formats as MD with headers and mini-TOC, flips status in phase INDEX to ✅
2. Work through Welcome and Phase One first (foundation content), then phases 2–4
3. Once BOH programs/ is complete, move to examples/ — BOH sales page copy is first
4. Frameworks/ (Notion vaults) come via Mack's Notion API connection whenever that's ready — can run in parallel with content drops

---

## Cross-links

- `[[2026-06-01_larry_idea-garden-and-semantic-recurrence-layer]]` — earlier session where Second Brain task was first scoped
- `[[2026-06-01_larry_inbox-processing-and-ws004-design]]` — inbox processing context that feeds into Second Brain daily routine

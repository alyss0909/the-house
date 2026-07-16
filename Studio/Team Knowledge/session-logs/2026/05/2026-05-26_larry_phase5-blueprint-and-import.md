---
agent_id: larry
session_id: 2026-05-26-phase5-blueprint-and-import
timestamp: 2026-05-26T14:00:00Z
type: close-session
linked_sops: []
linked_workstreams: ["WS-002-import-external-knowledge-base"]
linked_guidelines: ["GL-001-file-naming-conventions", "GL-002-frontmatter-conventions"]
prior_session: "[[2026-05-26_larry_phase5-idea-pantry-rethink]]"
mined: true
---

# Phase 5 Blueprint + Idea Pantry Import

## Context

Sixth session for Alyssa. Direct continuation of Phase 5 rethink from prior session. Session had two halves: (1) a full blueprint riff to get the architecture right before touching any files, and (2) execution — pre-cleanup, then Silas running the Tier 1 import of all 472 Idea Pantry notes as Journal entries. Session closes with the import complete and Tier 2 routing queued for next session.

## What we did

- **Larry + Alyssa** spent the first half of the session blueprinting: confirmed KE tree, entity body structures, Topics cleanup plan, collision architecture, and routing logic for 472 notes. Used ICOR MCP to verify course structure.
- **Larry** confirmed entity body formats against canonical ICOR course examples (inline bold prose for KEs and Topics; H2 headers for Projects, Goals, Habits per scaffold templates).
- **Larry** established the collision architecture: every Journal entry gets `**Connections:** [[slug]]` wikilinks so notes surface passively in Obsidian backlinks panel when any linked entity is opened.
- **Silas** ran Phase 1 pre-import cleanup:
  - Created [[Notebook/Life/Projects/notion-templates]]
  - Renamed `PKM/My Life/Topics/ai.md` → [[Notebook/Life/Topics/pkm]]
  - Deleted 9 Topic files (brand-words, design-inspo, garden, good-copy, montessori, personal-development, seo, space, webinars)
  - Added `## Related notes` section to 46 entity files (all KEs, Projects, Offers, Goals, CRM People)
- **Silas** ran the Tier 1 CSV import: 472 Journal entries created in `PKM/Journal/YYYY/MM/`, spanning 2019–2026, with YAML tags and `**Connections:**` wikilinks derived from Label, Area, Tags, Projects, and client name detection.
- **Larry** created [[Notebook/Life/CRM/People/alex]] (CRM file was missing; 3 Journal entries were pointing to `[[alex]]`).
- **Larry** spot-checked sample entries: all three verified correct (Gillian design inspo → `[[gillian]]`, spinach copy → `[[emails]]`, Good Rug → `[[home]]`, 2019 Muising → `muisings` tag + `[[life]]`).

## Decisions made

- **All Idea Pantry notes → Journal entries.** No Documents for incoming idea captures. `PKM/Documents/` stays clean for actual formal documents (contracts, IDs).
- **Every Journal entry must have at least one `[[wikilink]]` in its Connections line.** `[[life]]` is the fallback if no better signal. Nothing floats disconnected in the graph.
- **Muisings = Journal entries with `muisings` YAML tag.** Browsable by filtering the tag in Obsidian. Many Muisings are brand voice / email copy / personal philosophy — NOT auto-routed to Journal as plain personal entries. They carry wikilinks like any other capture.
- **AI tag routing is content-based, not blanket.** Notes tagged AI in Notion: if content is about PKM/systems/knowledge infrastructure → `[[pkm]]` Topic wikilink. If it's a general AI tip → `ai` YAML tag only, route to most relevant KE. Never blanket-rename ai → pkm.
- **Montessori → YAML tag + `[[parenting]]` wikilink.** Not a standalone Topic file.
- **SEO → `seo` YAML tag + `[[socials]]` connection.** Not operations.
- **Operations = business back-of-house systems only.** Tools, automations, SOPs, hiring. Do not use as a catch-all for vague business content.
- **Topics pruned to 1: `pkm`.** All other Topic files deleted. Remaining Topics-like content demoted to YAML tags or absorbed into KE bodies. New Topics earned, not pre-built.
- **Habit files deferred.** No Habit files created yet. They will emerge naturally from Tier 2 routing review and post-import observation.
- **`notion-templates` project created** to house the cluster of Notion-related Idea Pantry captures.
- **Entity body format confirmed:** KEs and Topics use inline bold prose (ICOR canonical style). Projects, Goals, Habits use H2 headers per scaffold templates. Use Team Knowledge/Templates/ as source of truth — do not invent structures.

## Insights

- Alyssa's Idea Pantry spans 2019–2026 — 7 years of thinking. This is not a secondary import. It is the entire PKM.
- The collision system works through Obsidian backlinks: every `[[wikilink]]` in a Journal entry makes that entry appear in the linked entity's backlinks panel when the entity is opened in Obsidian. Serendipitous surfacing requires wikilinks at capture time.
- Muisings are a mixed bag: brand voice captures, personal philosophy, email copy seeds, and truly random captures all share the same label. Content-based routing is required — many belong in `[[emails]]` or `[[becoming]]`, not just `[[life]]`.
- Many Muisings phrase captures ARE future email subject lines, social captions, or launch themes. They're not personal journal entries — they're business idea seeds dressed as poetry.
- The `## Related notes` section in entity bodies is for curated explicit links OUT. The backlinks panel handles passive discovery. These are complementary systems, not duplicates.
- "Operations" gets over-assigned when routing is lazy. Challenge every note destined for operations: is this actually about how the business runs internally?

## Realignments

- **"you seem to want to put a lot of stuff in operations.. selling clothes on marketplace is not business opps lol :)"** — Operations is back-of-house business systems only. Personal AI tips, home tasks, and vague business content do not go there.
- **"i dont know if content should be directly absorbed into the body or be treated as an incoming note or journal entry on the date created and hyperlinked in the body of the thing like a montessori note wouldnt be written plain text in the body of parenting right?"** — Correct. Notes are atomic files. Entity bodies hold wikilinks OUT to notes, not the content itself.
- **"always journal entry these are NOT docs"** — All incoming Idea Pantry captures → Journal entries. Documents is reserved for formal documents only.
- **"idk if we should make em up babe lol"** — Re: inventing body structures. Use Team Knowledge/Templates/ as canonical source. Do not invent sections.
- **"NO im asking overall is anything missing not as it related to musings as it related to the task at hand"** — Structural gap question was about the overall PKM, not just Muisings. Correct answer: Habits is the only real structural gap (no files yet).
- **"renaming ai things to PKM doesnt totally make sense we have to see if the note was about pkm or just an ai topic in general"** — AI routing must be content-based. Topic `[[pkm]]` is for PKM/systems thinking only. General AI tips stay as `ai` YAML tag.

## Open threads

- [ ] **Tier 2 routing** — 193 Journal entries have only `[[life]]` as their Connections wikilink. Larry needs a read pass to apply more specific entity wikilinks (offers, projects, KEs, clients). Start of next session.
- [ ] **Tier 3 surface to Alyssa** — ~70 genuinely ambiguous notes to batch and present for her input after Tier 2 pass.
- [ ] **BOH imagery entry** — [[Notebook/Journal/2026/02/2026-02-28-boh-imagery]] is rich Back of House offer content but only has `[[rebrand]]` in Connections. Should also have `[[back-of-house]]`. Fix during Tier 2 pass.
- [ ] **`design` area mapping** — Silas mapped "Design" Area → `[[operations]]` in ~12 notes. Review during Tier 2 pass; many likely belong in `[[rebrand]]`, `[[business]]`, or client CRM records instead.
- [ ] **Entity body content** — KE bodies are structural shells with blank sections. Will fill naturally as Related notes wikilinks accumulate post-import and post-Tier 2.
- [ ] **Habit files** — none exist yet. After Tier 2 review, patterns in the Idea Pantry may suggest 2-3 Habits to create. Surface to Alyssa then.
- [ ] **Journal INDEX** — needs updating to reflect all year/month subfolders now present (2019–2026).

## Next steps

1. Larry runs Tier 2 read pass on the 193 `[[life]]`-only Journal entries — read each note, apply specific entity wikilinks
2. Fix `design` area → `[[operations]]` misroutes during the same pass
3. Surface Tier 3 batch (~70 ambiguous notes) to Alyssa for her input
4. After Alyssa reviews Tier 3, add curated `## Related notes` wikilinks to highest-traffic entity bodies (emails, business, becoming, back-of-house, clients)

## Cross-links

- [[2026-05-26_larry_phase5-idea-pantry-rethink]] — prior session; established routing framework, deleted 471 wrong Document files, confirmed Four Layers filter
- [[2026-05-26_larry_notion-import-phases-0-4]] — Phases 0–4 completion
- [[2026-05-26_larry_notion-import-inventory-and-scope]] — original import inventory
- [[2026-05-26-14-00_silas_idea-pantry-import]] — Silas import run log

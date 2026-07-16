---
agent_id: larry
session_id: 2026-05-26-notion-import-inventory-and-scope
timestamp: 2026-05-26T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: ["WS-002-import-external-knowledge-base"]
linked_guidelines: ["GL-002-frontmatter-conventions"]
prior_session: "[[2026-05-26_larry_structure-design-and-gl002-extensions]]"
mined: true
---

# Session Log - 2026-05-26 - Notion Import Inventory + Scope Confirmation

## Context

Third session for Alyssa. WS-002 Step 3 executed: live Notion workspace inventoried via MCP (read-only). All databases fetched and schemaed. Import scope finalized. Session ended at context limit — handoff note written, next session starts at Step 4.

Preceding sessions: [[2026-05-26_larry_mypka-activation-and-notion-structure]], [[2026-05-26_larry_structure-design-and-gl002-extensions]]

## What we did

- Ran WS-002 Step 3: live Notion MCP inventory (no writes).
- Fetched schemas for all 8 key databases: areas, projects, idea Pantry, universal tags, Products DB, clients, master tasks, Socials Planner DB.
- Counted records in each database via MCP search.
- Identified all open threads from prior sessions and resolved them.
- Confirmed import scope with Alyssa.
- Identified a GL-002 extension gap: Products/Offers need a new `offer` entity type.
- Recommended and confirmed CSV export as the import method for Idea Pantry and Products DB.
- Wrote definitive handoff note for next session.

## Databases inventoried

| Database | Records | Schema highlights |
|---|---|---|
| areas | 9 | Name, Date, Projects (relation). Simple. |
| universal tags | 12 | Name, Archive (checkbox), Areas + Ideas & Notes + Projects (relations). |
| projects | ~8–10 | Status: not started / up next / active / paused / future / complete. Relations to areas, master tasks, related product. |
| idea Pantry DB | 25+ (search capped — likely 100–300+ total) | Label (Good Ideas/Inspo/Copy Cupboard/Content/Muisings/Family/Recipes), Type (21 format options), Posting Status (9-stage pipeline), Idea Created + Updated (Google Keep timestamps preserved), Relations to areas, tags, projects, offers, master tasks, Socials Planner. |
| Products DB | 25+ (search capped) | Type (Offer/Freebie/Low Ticket/Asset), Status (Idea/Geriatric/Needs Edits/Live/Sunset), Price Point, Sales Page URL, Theme (Email/Pinterest/Productivity/BoH Systems/Sales), Tags. |
| clients | 1 active (Alex) + 2 templates | Status (Active/Onboarding/Inactive), Service (relation to Products DB). |
| master tasks | large | Priority (Prioritize/Now/Soon/Someday), Status (to do/doing/waiting/done), Sub-task + Parent Task hierarchy, Pom tracking. |
| Socials Planner DB | large | Full content scheduling pipeline (Content Idea → Published), Format (Static/Carousel/Story/Reel/Pin/Thread/Trial Reel), connected to NotisonSocial, Likes/Views/Comments analytics. |

## Decisions made

**Final import scope:**

IN:
- `areas` → Key Elements
- `universal tags` → Topics
- `projects` → Goals + Projects (sort per item)
- `Products DB` → new `offer` entity type (active only: Live + Needs Edits)
- `Idea Pantry` → Documents (all records, via CSV)

OUT: clients, master tasks, Socials Planner DB, design area (parked), Project Notion, Camila/Geraldine/New Member DB/Content Cal.

**Areas → Key Elements mapping (final):**

| Notion area | myPKA Key Element | Note |
|---|---|---|
| socials | Socials (child of Business) | direct |
| promos | Promos (child of Business) | direct |
| clients | Clients (child of Business) | direct |
| operations | Operations (child of Business) | Team nested inside |
| products | **Offers** (child of Business) | rename |
| content | sort sub-pages case by case | content = mostly Emails, some blog/webinar |
| design | PARKED | circle back after main import |
| Life | Life (top-level KE) | direct |
| Team | inside Operations | not its own KE |

New KEs to create (no Notion source): Business (top-level), Emails (child of Business), Becoming / Parenting / Home (children of Life).

**Products entity type decision:**
Products/Offers are not Topics (too conceptual), not Documents (need structured frontmatter + active backlinks). They are a first-class entity. Decision: new `offer` entity type via GL-002 extension. Backlinking to offers from Projects and Topics via new `linked_offers` field on both schemas. This is the right architectural call — not a Documents catch-all.

**Idea Pantry import method:**
CSV export (Notion → Table view → ··· → Export → CSV). Reasons: 100–300+ records; MCP would require individual page fetches; CSV gets all metadata in one shot. Body content trade-off accepted — most entries are short Google Keep–origin notes.

**"Muisings" spelling:**
Confirmed intentional. It is a Label option inside Idea Pantry DB and Socials Planner DB, not a standalone database or page name. Slug: `muisings`.

**Google Keep:**
Already fully migrated into Idea Pantry. `Idea Created` and `Idea Updated` fields in Idea Pantry are explicitly labeled "Original Google Keep created/updated time." No separate Google Keep import needed.

**Camila and Geraldine:**
Team members / employees, confirmed not clients. Not importing to People/CRM.

**Tasks:**
Not importing. Tasks embed inside Project notes per design. master tasks DB stays in Notion.

## GL-002 extensions needed before Step 5 writes

These must be done at the TOP of the next session, before any entity files are created:

1. `parent_key_element` on Key Elements — **already done** (Session 2)
2. `linked_topics` on Projects — **already done** (Session 2)
3. `linked_projects` on Topics — **already done** (Session 2)
4. **NEW**: `offer` entity type
   - Folder: `PKM/My Life/Offers/`
   - Required: `name`
   - Optional: `offer_type` (offer | freebie | low_ticket | asset), `status` (idea | live | geriatric | needs_edits | sunset), `price_point` (number), `sales_page_url`, `theme` (multi: email | pinterest | productivity | boh_systems | sales), `tags`
5. **NEW**: `linked_offers` (list of offer slugs) on Projects schema
6. **NEW**: `linked_offers` (list of offer slugs) on Topics schema

## Import order (locked)

1. GL-002 extension (offer entity + linked_offers fields + template) — Silas
2. Key Elements (10 notes: 2 top-level + 8 child) — foundation
3. Topics (11 notes)
4. Offers (active products from CSV)
5. Projects + Goals (sort per item)
6. Idea Pantry Documents (from CSV — all records)

## Files needed at next session start

- Idea Pantry CSV (Notion → idea pantry → Table view → ··· → Export → CSV)
- Products DB CSV (same method — export all, import filters to Live + Needs Edits)

## Open threads

- [ ] **content area sub-pages** — sort case by case during Step 5 (content = mostly Emails, some blog/webinar items; no blanket mapping)
- [ ] **design area** — parked, circle back after main import complete
- [ ] **Published content archive** — deferred, not in import scope
- [ ] **AI Writing Context pack** — future workstream, not in scope
- [ ] **Productivity tag placement** — Operations or Becoming? Deferred to import

## Insights

- The Notion workspace is more structured than simple. Silas confirmed MCP tools don't propagate to subagents — Larry must run all Notion MCP calls directly and feed results to Silas.
- The `offer` entity gap is architecturally significant: Products/Offers are Alyssa's primary business output and get backlinked constantly. A proper entity type is worth the small GL-002 investment rather than Document catch-all.
- Idea Pantry is the largest and most important import (100–300+ items, all past knowledge). CSV method is the right call for scale.
- The `content` area in Notion doesn't map 1:1 to any single child KE — it's a cross-cutting area. Case-by-case routing is correct.

## Next steps

1. Open new session with handoff note (written in this session, in the message before this log).
2. Drop both CSV files (Idea Pantry + Products DB) at session start.
3. Silas applies the 3 new GL-002 extensions (offer type + linked_offers ×2).
4. Silas creates `PKM/My Life/Offers/` folder and template.
5. Begin Step 4 plan with Alyssa's approval.
6. Step 5 entity creation in import order above.

## Cross-links

- [[2026-05-26_larry_mypka-activation-and-notion-structure]] — session 1: activation + first Notion review
- [[2026-05-26_larry_structure-design-and-gl002-extensions]] — session 2: KE tree design + GL-002 extensions

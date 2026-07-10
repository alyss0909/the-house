---
agent_id: larry
session_id: 2026-05-26-structure-design-and-gl002-extensions
timestamp: 2026-05-26T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: ["WS-002-import-external-knowledge-base"]
linked_guidelines: ["GL-002-frontmatter-conventions"]
prior_session: "[[2026-05-26_larry_mypka-activation-and-notion-structure]]"
---

# Session Log - 2026-05-26 - Structure Design + GL-002 Extensions

## Context

Second session for Alyssa. Continuation of the pre-import structure design started in [[2026-05-26_larry_mypka-activation-and-notion-structure]]. Still conceptual-only — no PKM files written. Session ended with GL-002 edits applied and a handoff prepared for the import session.

## What we did

- Picked up from the hierarchy design open thread (Business → Offers → Client → Project chain).
- Completed full ICOR entity-type mapping for all of Alyssa's Notion concepts.
- Reviewed her live Tags DB screenshot (12 tags visible).
- Finalized the two-level Key Element tree.
- Approved and applied three GL-002 schema extensions.

## Decisions made

**Key Element rule confirmed.** The heuristic Alyssa brought: "if it holds goals, it's a Key Element — if it just holds ideas or reference, it's a Topic." This is now the canonical sorting test for her structure.

**Two-level KE tree.** Business and Life are the two top-level KEs. Child KEs nest under them via the new `parent_key_element` field. Max depth is two levels.

**Business child KEs (final names):**
- Emails
- Socials
- Promos
- Offers
- Clients
- Operations (Team sits inside this)

**Life child KEs:**
- Becoming
- Parenting
- Home

**Design is not a Key Element.** Brand guide → Document. Design projects → Projects under the relevant KE. Design inspo → Topic.

**AI is a Topic, not a Key Element.** It's a horizontal enabler. Primary home: Operations. Shows up as a tag/topic link on notes across multiple KEs.

**Brand Words lives inside the Brand Guide Document**, not as its own Topic or entity.

**Tags DB → Topics.** Her 12 Notion tags map as follows:
- Good Copy → Topic under Emails (Copy reference library)
- Brand Words → body of Brand Guide Document
- Webinars → Topic under Offers
- SEO → Topic under Socials or Marketing
- Design → Topic (Design Inspo) under Content/Socials
- Productivity → Topic under Operations or Becoming (TBD at import)
- Personal Development → Topic under Becoming
- Montessori → Topic under Parenting
- Garden → Topic under Home
- Space → Topic under Home
- AI → Topic under Operations
- Interesting → YAML tag only (`tags: [interesting]`) — not a Topic note

**Notion concepts → myPKA entity types (final mapping):**
- Areas (top-level) → Key Elements
- Areas (sub-level) → child Key Elements
- Tags DB → Topics
- Projects (horizon/aspirational) → Goals
- Projects (bounded campaign) → Projects
- Recurring workflows → Habits
- Idea Pantry items → Documents (promoted to Project when actionable)
- Tasks → action items inside Project notes (no standalone entity)
- Good Ideas / Inspo / Musings / Copy Cupboard labels → YAML tags or Document collections

**AI Writing Context pack** — parked as a future workstream. Will need Brand Guide + Good Copy examples + past work references structured as AI context. Not in scope for the import.

## GL-002 extensions applied

Three schema changes made to [[Studio/Team Knowledge/Guidelines/GL-002-frontmatter-conventions]]:

1. **`parent_key_element`** (optional slug) added to Key Element schema. Enables two-level KE nesting. Max depth two levels — do not chain further.
2. **`linked_topics`** (optional list of slugs) added to Projects schema. Explicit FK from a Project to its related Topic(s).
3. **`linked_projects`** (optional list of slugs) added to Topics schema. Reverse of `linked_topics` — keep both in sync when adding a link. Note in GL-002 added.

Content pipeline fields (content_pillar, content_format, content_status, etc.) were explicitly deferred — Alyssa does not want these at this time.

## Insights

- Alyssa's business is channel-organized (Emails, Socials, Promos) not function-organized (Marketing, Sales, Content). Her KE names reflect how she actually works, not abstract business functions. Import should respect these names exactly.
- The scaffold's Topics-vs-KE ambiguity is resolved for her with a single test: "does it hold goals?" This test should be applied consistently during import when sorting ambiguous Notion areas.
- The backlink-only approach for Topic↔Project relationships was a gap — SQL queryability requires explicit FK fields. The 2-way `linked_topics`/`linked_projects` fix addresses this.

## Open threads

- [ ] **Productivity tag** — lands under Operations or Becoming? Defer to import.
- [ ] **AI Writing Context pack** — future workstream: Brand Guide + Good Copy + past work as AI context. Not in current import scope.
- [ ] **Tasks DB schema** — not fetched. Determines whether Notion tasks become Project body items or stay in Notion. Confirm at import start.
- [ ] **Notion Projects** — still need to sort horizon-based (→ Goals) vs. bounded (→ Projects) during import. No blanket rule — sort per item.
- [ ] **Google Keep status** — still open from session 1. Active or fully migrated into Notion?
- [ ] **Published content archive** — import all or pipeline-only? Defer to import session.
- [ ] **"Muisings" spelling** — intentional or typo? Affects slug.

## Next steps

1. Open new session. Paste handoff note (below).
2. Silas runs WS-002 Step 3 — inventory of Notion workspace (count by entity type, no writes).
3. Present the import plan (WS-002 Step 4) for approval.
4. Begin entity creation on approval.

## Handoff note for next session

```
I'm Alyssa. We're ready to begin the Notion import into myPKA. Larry is my orchestrator.

Structure is fully designed and locked. GL-002 has been updated. No PKM files written yet — next session starts WS-002 Step 3 (inventory).

Full session log: Team Knowledge/session-logs/2026/05/2026-05-26_larry_structure-design-and-gl002-extensions.md — read it first, plus the prior session log linked inside it.

Key structure decisions:
- Business and Life are the two top-level Key Elements
- Business child KEs: Emails, Socials, Promos, Offers, Clients, Operations
- Life child KEs: Becoming, Parenting, Home
- Tags DB → Topics. Notion Projects → Goals (horizon) or Projects (bounded), sorted per item.
- Tasks stay inside Project notes — no standalone entity
- GL-002 now has: parent_key_element on KEs, linked_topics on Projects, linked_projects on Topics

Pick up from: WS-002 Step 3 — Silas inventories the live Notion workspace via MCP (notion-search, notion-fetch). Count entities by type, no writes. Then Step 4 plan + approval before anything is created.
```

## Cross-links

- [[2026-05-26_larry_mypka-activation-and-notion-structure]] — prior session (activation + first Notion review)

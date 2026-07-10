---
agent_id: larry
session_id: 2026-05-26-phase5-idea-pantry-rethink
timestamp: 2026-05-26T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: ["WS-002-import-external-knowledge-base"]
linked_guidelines: ["GL-002-frontmatter-conventions"]
prior_session: "[[2026-05-26_larry_notion-import-inventory-and-scope]]"
---

# Session Log - 2026-05-26 - Phase 5 Rethink + Routing Framework

## Context

Fourth session for Alyssa. Continued WS-002 from prior session. Phases 0–4 were confirmed complete at session start. This session attempted Phase 5 (Idea Pantry → PKM) — the approach was wrong and was course-corrected by Alyssa. Session ends with a clean state and a clear plan for the next session.

Alyssa will restart with the ICOR MCP connected before proceeding with Phase 5.

## What we did

- Silas ran Phase 5: imported 471 Idea Pantry notes (non-archived) as Document files into `PKM/Documents/`
- Alyssa correctly identified this as wrong on multiple levels
- Spent session diagnosing what went wrong and establishing the right approach
- Deleted all 471 Document files at session close — `PKM/Documents/` is clean (INDEX.md only)
- Established routing framework for next session

## What was wrong with the first attempt

1. **Wrong entity type.** `PKM/Documents/` is for contracts, IDs, official documents. Idea Pantry items are idea captures, not documents.
2. **Wrong workflow.** Used Silas (field mapper / database architect) instead of the Team Inbox capture workflow. These notes should be treated as inbox items routed through the Four Layers filter.
3. **Wikilinks broken.** Body wikilinks used display names (`[[Brand Words]]`) not slugs (`[[brand-words]]`). Obsidian won't resolve display-name links to slug-named files.
4. **No `key_element` on 90% of files.** Notion Area field was blank for ~425/472 records. Used as the only signal.
5. **`linked_topics` and `linked_projects` missing.** These should have been frontmatter fields (or body wikilinks using slugs), not absent.
6. **Invented entity type.** Proposed `PKM/Notes/` — does not exist in myICOR. Alyssa correctly rejected this.

## The right approach (confirmed, to execute next session)

### The Four Layers filter (canonical ICOR routing)

Every Idea Pantry note runs through this filter in order:

**Layer 1 — Key Elements.** Does this impact one of the permanent areas of life? (company, health, closest relationships — things still there in 2 years). If yes → route to that KE.

**Layer 2 — Projects.** Does this directly relate to an active Project? (half-formed idea after a meeting, article that pressure-tests strategy, reasoning trail for a project). If yes → route to that Project.

**Layer 3 — Habits.** Does this relate to a recurring rhythm — not as a checkmark, but something to think about? If yes → route to that Habit.

**Layer 4 — Topics.** Does this connect to one of the deep Topics or secondary topic buckets? If yes → route to that Topic.

**If all four are no → let it go. No guilt.**

### Routing tiers

**Tier 1 — Auto-route (no Alyssa input needed):**
- Note has Notion Tags → route to that Topic body (Tags ARE Topics in myPKA)
- Note has Notion Projects → route to that Project body
- Label = Muisings → Journal
- Label = Family (no other signal) → `[[home]]` KE body
- Label = Recipes → `[[home]]` KE body
- Label = Copy Cupboard → `[[good-copy]]` Topic body
- Body mentions a client name → their CRM record

**Tier 2 — Larry infers from content (high confidence, flag reasoning):**
- Body mentions an offer name → route to that Offer + relevant Topic
- Inspo with a URL → read content, infer Topic via Four Layers
- Good Ideas with enough context to identify a home

**Tier 3 — Surface to Alyssa in a batch:**
- Genuinely ambiguous, multiple plausible homes
- Might warrant a NEW entity (new Project, Goal, or Topic)
- Too vague to place with confidence

### Label → key_element mapping (confirmed)

| Label | key_element |
|---|---|
| 🌹 Content | socials |
| 🕊️ Muisings | life |
| 🤎 Family | life |
| 🍒 Recipes | life |
| 🔮 Good Ideas | infer from content / Four Layers |
| ✨ Inspo | infer from content / Four Layers |

Area overrides Label when present.

### Idea Pantry routing corrections from sample review

These corrections came from Alyssa reviewing 10 sample notes:

| Note | Wrong assumption | Correct routing |
|---|---|---|
| Simmer Story | content → socials | content → emails (Simmer = weekly simmer email) |
| Notion Team Home | → clients KE | → Notion template architecture idea, Project Notion may need to be re-imported |
| gillian design inspo | → design-inspo Topic | → Gillian's CRM record (Gillian is a CLIENT) |
| How I stopped trying to sell spinach | → good-copy only | → could also touch `[[back-of-house]]` offer + good-copy |
| repeatable formats | → content idea | → `[[systematize-socials]]` Project + socials KE |

### Clients (confirmed by Alyssa — critical for routing)

Alyssa's active clients: **Alex, Gillian, Lara, Maude**

Any Idea Pantry note mentioning a client name by first name routes to their CRM record.

Note: check whether CRM records exist for Gillian, Lara, Maude (Alex was confirmed active in prior session). May need to be created.

### Project Notion

Was excluded from import in prior session. Based on this session's review, several Idea Pantry notes connect to Project Notion (Notion template work, AI + Notion integrations). **Recommend re-importing Project Notion** at start of next session before Phase 5 routing begins.

## Decisions made

- **471 Document files deleted.** `PKM/Documents/` reset to INDEX.md only. The Idea Pantry content was in the wrong home and is being redone properly.
- **No `PKM/Notes/` entity.** This was proposed and rejected. Notes is not an myICOR entity type. Routing goes to existing entities via the Four Layers filter.
- **Phase 5 restarts next session** with ICOR MCP connected, using the Four Layers filter and tiered routing system above.
- **Phases 0–4 remain intact and correct.** KEs, Topics, Projects, Goals, Offers — all good.

## State of PKM at session close

### Complete and correct
- `PKM/My Life/Key Elements/` — 11 files (business, life, emails, socials, promos, offers, clients, operations, becoming, parenting, home)
- `PKM/My Life/Topics/` — 10 files (ai, brand-words, design-inspo, garden, good-copy, montessori, personal-development, seo, space, webinars)
- `PKM/My Life/Offers/` — 26 files (all active/needs-edits offers from Products DB)
- `PKM/My Life/Projects/` — 5 files (office-reno, rebrand, slo-updates, spring-26-launch, systematize-socials)
- `PKM/My Life/Goals/` — 2 files (blog-and-pin, monthly-workshops)
- `PKM/CRM/People/` — Alex confirmed. Check for Gillian, Lara, Maude.
- `GL-002` — updated with offer entity type, linked_offers on Projects + Topics

### To do next session
- [ ] Verify/create CRM records for Gillian, Lara, Maude
- [ ] Decide whether to re-import Project Notion
- [ ] Run Phase 5 properly: 472 Idea Pantry notes through Four Layers filter, tiered routing
- [ ] Tier 1 auto-routes first (Silas / scripted)
- [ ] Tier 2 Larry infers (Larry reads + routes)
- [ ] Tier 3 surface to Alyssa in a batch for her input
- [ ] Check that wikilinks in all routed content use slugs, not display names

## CSV location

`C:\Users\accol\AppData\Local\Temp\idea Pantry DB 2f4c8b43e5658142a060f4e3c920e7f4_all.csv`
551 rows total, 79 archived, **472 to process.**

## Insights

- The Idea Pantry is Alyssa's entire knowledge base — 500 notes, all her thinking. It is not a secondary import. It is the PKM. Treat it with that weight.
- The Four Layers filter is the correct routing tool. Run every note through KE → Project → Habit → Topic → let go.
- The Notion Tags field maps directly to existing myPKA Topics. This is the strongest routing signal in the CSV.
- The Notion Projects field maps directly to existing myPKA Projects. Second strongest signal.
- "Simmer" in any context = weekly simmer email = routes to emails, not socials.
- Client names in note content = route to CRM, not to Topic/KE.
- Copy Cupboard = swipe file = `[[good-copy]]` Topic body, almost always.
- Muisings = personal reflections = Journal.
- The system is Obsidian-compatible wikilinks. All links MUST use slug format: `[[brand-words]]` not `[[Brand Words]]`. Display names break resolution.

## Cross-links

- [[2026-05-26_larry_mypka-activation-and-notion-structure]] — session 1
- [[2026-05-26_larry_structure-design-and-gl002-extensions]] — session 2
- [[2026-05-26_larry_notion-import-inventory-and-scope]] — session 3 (prior session)

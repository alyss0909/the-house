---
week: 2026-W22
date_range: 2026-05-25 to 2026-05-31
session_count: 17
open_threads: 21
---

# Week 22 Wrap-Up (Mon May 25 – Sun May 31, 2026)

## Week at a glance

This was the launch week — myPKA went from zero to a fully structured vault. The entire week was a back-to-back sprint through scaffold activation, Notion structure design, and a full import of five years of Alyssa's knowledge (KE tree, Topics, Offers, Projects, Goals, and 472 Idea Pantry notes as Journal entries). One false start on the Idea Pantry import taught the team the correct routing philosophy. The week ended with a bulk Google Keep triage, a mega interlinking pass across 167 journal entries, and the first batch processing of fresh Keep captures.

## What shipped

- **Scaffold activated** — CLAUDE.md, `.user.yaml`, close-session command, all `{{USER_NAME}}` tokens replaced with Alyssa
- **Full KE tree built** — 11 Key Element files: Business, Life + 6 under Business + 3 under Life; sub-folder restructure (Business/ + Life/) on May 27
- **10 Topic files created** — Good Copy, Brand Words, Webinars, SEO, Design Inspo, Personal Development, Montessori, Garden, Space, AI (later AI→PKM rename + 9 deleted after rethink)
- **28 Offer files imported** from Products DB CSV (Live + Needs Edits, 41 total records)
- **5 Projects + 2 Goals filed** from live Notion fetch (Rebrand, Spring '26 Launch, Office Reno, Systematize Socials, SLO Updates; Monthly Workshops, Blog & Pin)
- **472 Idea Pantry notes imported** as Journal entries in `PKM/Journal/YYYY/MM/`, spanning 2019–2026, with `**Connections:**` wikilinks from Tier 1 routing (Label, Area, Tags, Projects, client detection)
- **GL-002 extended** — 4 new schema additions: `offer` entity type, `linked_offers` on Projects + Topics, `key_element` on Documents, `parent_key_element` on Key Elements, `linked_topics` on Goals
- **Mega interlinking pass** — 167 Journal entries updated across 18 topic clusters; Related notes sections added to all 46 entity files
- **Tag cleanup** — 12 redundant topic tags stripped from 15 Journal notes; 8 template files cleaned; 8 content-type tags retained
- **SOP-003 codified** — Keep Notes to Journal; canonical journal entry format locked
- **Brand World KE created** — Operations retired; Brand World added as child KE under Business
- **Alex, Gillian, Lara, Maude CRM stubs** created
- **2 Habits created** — [[Notebook/Life/Habits/daily-content-output]], [[Notebook/Life/Habits/weekly-client-check-ins]] (flagged as possibly wrong — see Open Threads)
- **Norah Birthday project** created with food plan and tasks
- **Journal protocol fix** — session-close journal gate wired into close-session.md; Vera's journal folder + protocol added
- **Deliverables:** business-strategy-partner hire research, Remi hire research, Vera hire research, riff-partner research, alyssa-review-pass (archived)

## Key decisions

| Question | Decision | Source |
|---|---|---|
| Where do Alyssa's Notion Areas map? | Key Elements (confirmed in her own words) | [[2026-05-26_larry_mypka-activation-and-notion-structure]] |
| What heuristic sorts KE vs Topic? | "Holds goals = KE; holds ideas = Topic" | [[2026-05-26_larry_structure-design-and-gl002-extensions]] |
| KE tree final shape | Business (top) + 6 children; Life (top) + 3 children | [[2026-05-26_larry_structure-design-and-gl002-extensions]] |
| Where do Idea Pantry notes go? | Journal entries — never Documents, never Notes | [[2026-05-26_larry_phase5-blueprint-and-import]] |
| Every Journal entry must have at least one wikilink? | Yes — `[[life]]` is the minimum fallback | [[2026-05-26_larry_phase5-blueprint-and-import]] |
| Cross-links are structural, not decorative | Wire `**Part of:**` and `**Related X:**` at import time | [[2026-05-26_larry_notion-import-phases-0-4]] |
| Operations KE: keep or retire? | Retired — Brand World created instead | [[2026-05-27_larry_pka-working-style-riff-and-ke-audit]] |
| "Brand voice" as a name? | Never. It's "Brand World." | [[2026-05-27_larry_pka-working-style-riff-and-ke-audit]] |
| Tags to retain post-cleanup | 8 content-type tags only: idea, inspo, copy, brand-words, musings, recipes, montessori, webinar | [[2026-05-27_larry_vault-enrichment-interlinking-and-cleanup]] |
| Archive rule for inbox | Nothing archived without explicit per-file approval | [[2026-05-28-team-inbox-bulk-processing]] |
| One note per Keep capture or merge? | One entry per note — never merge same-day notes | [[2026-05-28_larry_keep-inbox-batch-processing]] |
| Journal trigger — how to fire without a task? | Two gates: session-close journal check + proactive "keep this in mind" routing | [[2026-05-27_larry_journal-protocol-fix]] |
| Muisings spelling | Intentional | [[2026-05-26_larry_notion-import-inventory-and-scope]] |

## Insights not yet graduated

- **Silas cannot use Bash/PowerShell to extract zips** — Larry must do file extraction before dispatching Silas for CSV imports. Should be added to WS-002 import pattern. — source: [[2026-05-26_larry_notion-import-phases-0-4]]
- **The scaffold course examples deliberately omit frontmatter** — GL-002 is the production spec; the course examples are simplified illustrations. New users and agents may be confused. — source: [[2026-05-26_larry_notion-import-phases-0-4]]
- **Interlinking at scale is fastest via slug inference + targeted reads** for ambiguous files, then merged into one write pass. Reading every file = too slow. Trust slugs = 90% accurate. — source: [[2026-05-27_larry_vault-enrichment-interlinking-and-cleanup]]
- **Vera was over-questioning instead of proposing** in riff sessions — propose options + reasoning, not questions. Memory saved to feedback_vera_riff_style.md. — source: [[2026-05-27_larry_pka-working-style-riff-and-ke-audit]]
- **KeepSidian does not export Google Keep labels** — tags must be assigned manually during Penn's filing pass. — source: [[2026-05-28-team-inbox-bulk-processing]]
- **Inbox files that appear empty may have missing images being added** — never auto-delete; confirm with Alyssa first. — source: [[2026-05-28_larry_keep-inbox-batch-processing]]

## Open threads — by area

### Second Brain / Vault Structure
- [ ] **Tier 2 routing** — 193 Journal entries have only `[[life]]` as their Connections wikilink. Larry read pass needed to apply specific entity wikilinks (offers, projects, KEs, clients)
- [ ] **Tier 3 batch** — ~70 genuinely ambiguous notes to surface to Alyssa for routing input after Tier 2 pass
- [ ] **Brand World KE body** — "What this covers / What good looks like / What I am ignoring" still blank. Needs a riff first
- [ ] **Design area** — parked from import session, no KE created. Circle back after main import is settled

### Inbox & Capture
- [ ] **32 May 28 journal entries** — Related notes + Connections sections not yet added (Penn pass pending)
- [ ] **`vera-riff-handover-2026-05-27.md`** — still in Team Inbox. Alyssa holding for later
- [ ] **`2026-05-13-7 AI imagery prompt.md`** — was missing from inbox when Penn ran; Alyssa may have handled

### Entity Stubs
- [ ] **Maude Trottier CRM** — [[Notebook/Life/CRM/People/maude]] details pending
- [ ] **[[Notebook/Life/Projects/office-reno]] project stub** — Alyssa said she doesn't have this project. Delete?
- [x] **`github-resources.md` Topic stub** — deleted in W23 scaffold cleanup ✅
- [ ] **`daily-content-output` + `weekly-client-check-ins` Habit stubs** — flagged as possibly wrong; Alyssa to clean in Obsidian
- [ ] **[[Notebook/Life/Projects/slo-updates]] linked_offers** — blank; which offer slug maps to the SLO?

### Offer Files
- [ ] **Offer body content** — all 28 Offer files have blank body sections (What it is / Who it's for / Where to find it / Notes)
- [ ] **Offer files without sales page URLs** — Unignorable Subject Lines, Bingeable Newsletters, Cold Subscriber Automation, Quarter Prompt, Simmer System
- [ ] **Offer file formatting** — still using H2 sections; not yet reformatted to compact KE standard

### Automations / Obsidian
- [x] **Obsidian folder exclusion** — Team/, .claude/ still polluting tags panel. Safe to do, Alyssa to action in Settings
- [x] **Funnel-position tag vocabulary** (`#opt-in`, `#sales-page`) — surfaced, not actioned

### WS-002 Notion Import
- [ ] **WS-002 still at Step 3 (inventory)** — not touched this week. Alyssa's call whether to continue or deprioritize in favour of the Idea Pantry work

## Next week setup

- **Pick up first:** Tier 2 routing pass (Larry reads the 193 `[[life]]`-only entries and applies specific wikilinks) — this closes the biggest structural gap from the import
- **After Tier 2:** Surface Tier 3 batch to Alyssa (~70 ambiguous notes, batch review)
- **Brand World riff** — Alyssa provides a few sentences on what Brand World covers; Larry writes the three prose fields
- **Context to load:** The Four Layers filter and tiered routing system from [[2026-05-26_larry_phase5-idea-pantry-rethink]]; the canonical journal entry format from SOP-003

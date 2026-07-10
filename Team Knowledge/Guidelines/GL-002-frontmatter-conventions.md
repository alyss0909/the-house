# GL-002 - Frontmatter Conventions

> **This Guideline is a general rule every agent reads on every relevant action.** Every entity note Penn captures, every entity Silas writes during an import, every audit Iris runs — they all read this file. SOPs and Workstreams `[[wikilink]]` here rather than restating the schema.

This is the source of truth for the YAML frontmatter that sits at the top of every entity note in your myPKA. Every other file that needs to talk about field names `[[wikilinks]]` here.

Aligns with [[SOP-002-convert-mypka-to-sqlite]] (the SQLite migration contract). Field names in this Guideline match the column names that SOP-002 reads. Do not rename one without the other.

## Why this exists

Read this once, never again.

A note in your myPKA has two layers:

1. **Structured data** lives in YAML frontmatter at the top of the file. Names, dates, links, statuses, contact details. Anything that has a clear shape and the team will want to query.
2. **Narrative** lives in the body. How you met the person. Why the project matters. What you noticed. Anything that reads like prose.

The split is load-bearing for three reasons:

- The right-sidebar **Properties tab** in mypka-interface parses frontmatter and renders it as a typed key-value UI. No frontmatter, no Properties tab.
- The **SQLite migration** ([[SOP-002-convert-mypka-to-sqlite]]) reads frontmatter into typed columns. Inline body text like `**Email:** jane@example.com` migrates as zero structured data.
- New users (and new agents) need a predictable shape. If every note invents its own field names, search and automation collapse.

When in doubt, the rule is: structured fact goes in frontmatter, story goes in the body.

## Core rules

### 1. Frontmatter sits at the very top of the file

Open and close the block with three dashes on their own line:

```yaml
---
name: Jane Doe
role: Product Designer
---
```

Body content starts on the line after the closing `---`.

### 2. Field names are kebab-case-or-snake_case, never both

myPKA uses `snake_case` for frontmatter keys to match the SQLite column names in [[SOP-002-convert-mypka-to-sqlite]]. Do not mix conventions inside one file.

Good: `full_name`, `last_contact`, `target_date`.
Bad: `fullName`, `last-contact`, `Target Date`.

> **Keys vs. values:** Keys use `snake_case` because they become SQL column names. Values that reference other files (foreign keys) use `kebab-case` because they are file slugs. Example: `key_element: back-of-house` — the key is snake, the value is kebab. This is intentional, not inconsistent.

### 3. Typing rules

- **Strings** - quoted only when they contain special characters (colons, hashes, leading numbers). Plain text otherwise.
- **Dates** - always ISO `YYYY-MM-DD`. No timezones, no slashes, no month names. Cross-references [[GL-001-file-naming-conventions]] rule 2.
- **Datetimes** - ISO-8601 `YYYY-MM-DDTHH:MM:SSZ` when a wall-clock time matters. Otherwise prefer date.
- **Booleans** - `true` or `false`, lowercase.
- **Lists** - YAML array, one item per line, `-` prefix:
  ```yaml
  tags:
    - work
    - design
  ```
  Inline `[a, b, c]` is allowed for short lists but the multi-line form is preferred for readability.
- **Slugs and foreign keys** - kebab-case, matching the target file's stem exactly. See [[GL-001-file-naming-conventions]] rule 1.

### 4. Foreign-key fields store the slug, not the title

Locked decision: when one entity references another, the frontmatter field stores the **slug** of the target (the filename stem), and the UI resolves the slug to the target's `name` or `title` at render time.

```yaml
# In PKM/CRM/People/jane-doe.md
organization: acme-corp           # points to PKM/CRM/Organizations/acme-corp.md
```

Why slug not title: the slug is stable across renames inside frontmatter, the title is the field stored on the target file and may change. Storing the slug means a target rename (with file move) only needs to update one place.

The mypka-interface Properties tab renders the resolved title with the slug as a tooltip. The SQLite migration ([[SOP-002-convert-mypka-to-sqlite]]) resolves the slug to the FK integer at conversion time.

### 5. Required fields are minimal, optional fields are abundant

The team's bias: **require only what makes the note identifiable**. Every other field is optional and can be filled when the user has it.

Per entity, the required field is the one that names the thing:

| Entity | Required |
|---|---|
| Person | `full_name` |
| Organization | `name` |
| Project | `name` |
| Goal | `name` |
| Habit | `name` |
| Topic | `name` |
| Key Element | `name` |
| Document | `title` |

Everything else is optional. A note with three frontmatter fields is fine. A note with twenty is also fine. The shape stays consistent.

### 6. Never invent ad-hoc fields

If you find yourself wanting a field that is not in this Guideline:

1. Check the entity schema below.
2. If the field is genuinely missing and you will use it more than once, edit this Guideline first. Add the field with its typing rule and any cross-references.
3. Then use it.

One-off `notes_jane_likes` style keys break the SQLite migration silently. Free-form notes go in the body.

## Entity schemas

These are the canonical fields per entity. Field names are case-sensitive and match the SQLite column names in [[SOP-002-convert-mypka-to-sqlite]].

### People - `PKM/CRM/People/<slug>.md`

```yaml
---
full_name: Jane Doe                        # required
first_name: Jane                           # optional, derived if absent
last_name: Doe                             # optional, derived if absent
relation: friend                           # colleague | friend | family | client | other
role: Product Designer
company: acme-corp                         # slug of an Organization
email: jane@example.com
phone: +1-415-555-0100                     # E.164 preferred
city: San Francisco
birth_date: 1990-03-14
linkedin_url: https://www.linkedin.com/in/janedoe
last_contact: 2026-05-09
tags:
  - work
  - design
---
```

Notes:
- `company` stores the slug of an Organization note. Per rule 4, the UI resolves it to the Organization's `name`.
- `relation` follows the SOP-002 convention: prefer one of `colleague`, `friend`, `family`, `client`, `other`. Free text accepted but limits queryability.
- Body section conventions: `## How we met`, `## Topics of common interest`, `## Notes`.

### Organizations - `PKM/CRM/Organizations/<slug>.md`

```yaml
---
name: Acme Corp                            # required
org_type: company                          # company | clinic | nonprofit | government | school | other
industry: software
website: https://www.acmecorp.example
email: hello@acmecorp.example
phone: +1-415-555-0199
city: San Francisco
tags:
  - vendor
---
```

Notes:
- `org_type` aligns with SOP-002's `organizations.type` column. The frontmatter key is `org_type` to avoid colliding with the YAML reserved-feeling word `type`.
- Body section conventions: `## What they do`, `## How we work together`, `## Notes`.

### Projects - `PKM/My Life/Projects/<slug>.md`

```yaml
---
name: Ship the Pricing Page Refresh        # required
status: active                             # planning | active | paused | done | archived
target_date: 2026-07-15
key_element: business                          # slug of a Key Element
linked_goals:
  - hit-50-mrr-by-q3
linked_people:
  - jane-doe
linked_topics:
  - pricing-strategy                       # optional, slugs of related Topics
linked_offers:
  - back-of-house                          # optional, slugs of linked Offers
tags:
  - marketing
---
```

Notes:
- `status` enum is the team default. Use one of the listed values for queryability; free text is parsed but not categorized.
- `key_element`, `linked_goals`, `linked_people`, `linked_topics` all store slugs per rule 4.
- Body section conventions: `## Why this matters`, `## Status update`, `## Open threads`, `## Next steps`.

### Goals - `PKM/My Life/Goals/<slug>.md`

```yaml
---
name: Hit $50K MRR by Q3                   # required
status: active                             # planning | active | paused | done | abandoned
target_date: 2026-09-30
key_element: business                          # slug of a Key Element
linked_projects:
  - ship-pricing-refresh
linked_topics:
  - pricing-strategy                       # optional, slugs of related Topics
tags:
  - revenue
---
```

Notes:
- A Goal is the destination; a Project is the work toward it. The relationship is `linked_projects` here, mirrored as `linked_goals` from the Project side.
- Body section conventions: `## Why this matters`, `## Definition of done`, `## Progress notes`.

### Habits - `PKM/My Life/Habits/<slug>.md`

```yaml
---
name: Morning Walk                         # required
cadence: daily                             # daily | weekdays | weekly | monthly | adhoc
status: active                             # active | paused | abandoned
started_on: 2026-04-01
key_element: health                        # slug of a Key Element
tags:
  - health
---
```

Notes:
- `cadence` is the rhythm; `status` is whether you are currently doing it.
- Streak tracking is a body-level concern (or an extension), not a frontmatter field. Frontmatter holds the definition, not the daily log.
- Body section conventions: `## Why this habit`, `## What it looks like`, `## Reflection`.

### Topics - `PKM/My Life/Topics/<slug>.md`

```yaml
---
name: Pricing Strategy                     # required
key_element: business                          # slug of a Key Element
parent_topic: business-strategy            # optional, slug of a parent Topic
linked_projects:
  - ship-pricing-refresh                   # optional, slugs of Projects that work in this Topic area
linked_offers:
  - back-of-house                          # optional, slugs of related Offers
tags:
  - strategy
---
```

Notes:
- A Topic is a recurring subject of thought - lighter than a Project, broader than a single Document.
- Topics can nest via `parent_topic` to a single parent. Multi-parent is not supported - keep the tree clean.
- `linked_projects` is the reverse of `linked_topics` on Projects — keep both in sync when adding a link.
- Body section conventions: `## What I think about here`, `## Open questions`, `## Sources`.

### Key Elements - `PKM/My Life/Key Elements/<slug>.md`

```yaml
---
name: Work                                 # required
description_short: My professional life and the businesses I run
parent_key_element: business               # optional, slug of parent Key Element (enables nesting e.g. emails under business)
status: active                             # active | dormant
tags:
  - life
---
```

Notes:
- Key Elements are the top-level domains of life (Work, Health, Relationships, Money, Growth, etc.). There are typically 5 to 9 per user.
- `parent_key_element` enables a two-level KE tree (e.g. Business → Emails, Business → Socials). Max depth is two levels — do not chain further.
- Other entities point to a Key Element via the `key_element` field on Projects, Goals, Habits, and Topics.
- Body section conventions: `## What this covers`, `## What good looks like`, `## What I am ignoring`.

### Documents - `PKM/Documents/<slug>.md`

```yaml
---
title: Apartment Lease 2026                # required
doc_type: contract                         # contract | id | invoice | warranty | medical | tax | other
physical_location: top drawer of the desk
digital_location: Dropbox/Legal/2026-lease.pdf
issued_on: 2026-01-15
expiry_date: 2027-01-14
renewal_trigger: 2026-11-15                # date to act, not the document's own deadline
key_element: emails                        # optional, slug of the Key Element this document belongs to
linked_people:
  - jane-doe                               # tenant, landlord, etc.
linked_organizations:
  - acme-property-management
tags:
  - housing
---
```

Notes:
- `title` is the field, not `name` - aligns with SOP-002's `documents.title` column.
- `physical_location` and `digital_location` are independent. A document can have both, either, or neither.
- `renewal_trigger` is the date you want to be reminded to act. The actual `expiry_date` may be later.
- Body section conventions: `## Summary`, `## Key terms`, `## Notes`.

### Offers - `PKM/My Life/Offers/<slug>.md`

```yaml
---
name: Back of House                        # required
offer_type: offer                          # offer | freebie | low_ticket | asset
status: live                               # idea | live | geriatric | needs_edits | sunset
price_point: 297                           # number, in local currency, no currency symbol
sales_page_url: https://alyssacoleman.ca/back-of-house
theme:                                     # multi-select: email | pinterest | productivity | boh_systems | sales
  - email
  - boh_systems
tags:
  - business
---
```

Notes:
- An Offer is a distinct product, program, or service Alyssa sells or gives away.
- `offer_type` maps from Notion's Products DB Type field.
- `status` maps from Notion's Products DB Status field.
- `price_point` is a number only. Currency is assumed from context.
- `theme` is multi-value — an offer may carry more than one theme.
- Body section conventions: `## What it is`, `## Who it's for`, `## Where to find it`, `## Notes`.

### Signals - `Studio/Signals/signals-index.md` (entries within the index)

Signal entries live inside `signals-index.md` as sub-sections, not as individual files. Each entry tracks a recurring theme detected by SOP-004 semantic sweeps.

```yaml
# Inline block per signal — not a separate file frontmatter, documented here for schema clarity
recurrence_count: 5           # integer; incremented by each sweep that finds this theme
first_seen: 2026-06-01        # ISO date of first journal entry containing this theme
last_seen: 2026-06-15         # ISO date of most recent entry; updated every sweep
signal_status: surfaced       # incubating | surfaced | graduated | dismissed
connected_goal: back-of-house # optional; slug of a Goal this signal aligns with
```

Notes:
- `signal_status` thresholds: `incubating` (count < 3, no Goal); `surfaced` (count >= 3 OR Goal-linked); `graduated` (moved into a Goal/Project — Alyssa's call); `dismissed` (Alyssa chose not to act).
- Signals are NOT separate files. They are tracked sections in the index file.
- SOP-004 owns writes to this data. Do not edit counts manually.

---

## Non-entity files (Second Brain, routing guides, analysis)

Second Brain program content (workbooks, transcripts, slides, analysis files, routing guides) are not entities and are not migrated to SQLite. They use informal frontmatter with no schema enforcement. The accepted fields for these files are:

| Field | Purpose | Example |
|---|---|---|
| `name` | Slug identifier | `1.2-your-signature-dish` |
| `title` | Human-readable title | `"Your Signature Dish"` |
| `type` | Content type | `workbook` \| `transcript` \| `slides` \| `analysis` \| `framework` \| `routing-guide` \| `index` |
| `program` | Program this belongs to | `Back of House` |
| `phase` | Module phase | `"P1: The House Specials"` |
| `module` | Module number | `1.2` |
| `status` | Import/build status | `imported` \| `draft` \| `complete` |
| `last_updated` | ISO date | `2026-06-04` |
| `description` | One-line summary | used in routing guides and index files |

These files do not require a `tags:` field. The `type` property replaces content-format tags (no need to tag a file `workbook` when `type: workbook` is already set).

Do not apply entity schema rules to these files. Do not add them to SOP-002 migration tables.

## Provenance fields (`source_class`, `promoted_by`, `promoted_date`)

> **Added 2026-07-09.** Additive to everything above — no existing field changes. These fields make an address mean a level of trust, per [[GL-013-the-house-rules]] and [[GL-009-source-boundaries-and-promotion]]. They apply to **every file in the house**, entity and non-entity alike, not just the eight entity types.

### Why this exists

The house is organized by trust, not by birthplace. A reader must be able to tell, from a file's own frontmatter, whether it is reading Alyssa's mind, the team's opinion, business truth, a pointer, or a session product — without inferring it from the folder. `source_class` is that self-declaration. `promoted_by` / `promoted_date` are the stamp that lets a non-`raw` file earn a place on the Library shelf.

### `source_class` — allowed values

One value per file. Required on new files going forward (see migration plan for existing files).

| Value | Meaning | Typical home |
|---|---|---|
| `raw` | Alyssa-original. Her words, drafts, journal, life facts, verbatim published work. Agents read it, never write it (GL-013 Rule 1). | Notebook; verbatim work on the Library shelf |
| `facts` | Team-maintained business truth — the single home of a fact that agents keep current (prices, offer status, calendar). One home per fact (GL-013 Rule 3). | Studio/Library (facts layer, e.g. VAULT-MAP-registered homes) |
| `derived` | AI/team opinion, analysis, framework, synthesis. Useful, never source. Must cite what it came from and stay labeled interpretation (GL-013 Rule 2). | Studio |
| `map` | Pointer layer that routes to source without digesting it — INDEX, COMPASS, routing tables, this VAULT-MAP. | Beside what it routes |
| `output` | Session work product — reports, audits, plans, drafts, handoffs. Not durable knowledge yet. | `Deliverables/` |
| `task` | A concrete open loop with owner, status, next action. | `Team Knowledge/tasks/`, ready queues |

Relationship to [[GL-009-source-boundaries-and-promotion]]: `source_class` refines GL-009's `source` class into `raw` (Alyssa-original) and `facts` (team-maintained truth). `map`, `derived`, `output`, `task` are unchanged.

### Which value each zone expects

| Zone | Expected `source_class` |
|---|---|
| **Notebook** | `raw` (only Penn capture-transcription writes here) |
| **Studio** | `derived` primarily; also `map`, `facts`, `task` |
| **Library** | `raw` (Alyssa verbatim), or `facts`/`derived` that carry a promotion stamp |
| **Deliverables** | `output` (drains to Studio/Library/Archive over time) |
| **Archive** | preserves whatever class the file had when archived |

### `promoted_by` and `promoted_date`

Present **only** on files that have been promoted onto the Library shelf. Absent everywhere else — do not add empty keys to non-Library files.

```yaml
source_class: derived
promoted_by: alyssa
promoted_date: 2026-07-09
```

- `promoted_by` — who authorized the promotion. Per GL-013 Rule 2, no agent promotes its own work; in practice this is `alyssa`.
- `promoted_date` — ISO `YYYY-MM-DD` the file entered the Library.

### The Library stamp gate (hard rule)

**No `derived` (or `facts`) file may sit physically in the Library without a `promoted_by` stamp.** A `raw` file needs no stamp — it is Alyssa's verbatim work and is Library-native. Anything else on the shelf is there by promotion or it does not belong there.

Enforcement is light, at the seams (GL-013): the **weekly review ([[WS-006-weekly-review]])** lints for any Library file whose `source_class` is not `raw` and that lacks a `promoted_by` stamp, and either promotes it properly or moves it back to the Studio. This is not blocked at write time — it is caught and fixed weekly.

## How to extend this Guideline

Your myPKA grows. New fields will surface. Two acceptable extension paths:

1. **Add a new optional field to an existing entity.** Edit the entity's schema above. Add the field with its typing rule. Commit. The SQLite migration in [[SOP-002-convert-mypka-to-sqlite]] will pick up new optional columns gracefully (they default to `NULL` for older notes).

2. **Add a new entity type.** Higher cost. Requires a new folder under `PKM/`, a new schema in this Guideline, a new section in [[SOP-002-convert-mypka-to-sqlite]], and a new template in [[Templates/INDEX]]. Do not do this casually.

Two rules that apply to both paths:

- **Pick one, document, never invent ad-hoc.** If two notes use different field names for the same thing, search and migration both rot.
- **Never rename a field without the SOP.** A rename here without a matching update in [[SOP-002-convert-mypka-to-sqlite]] silently breaks the SQLite migration. Coordinate the change.

## Cross-references

- [[GL-001-file-naming-conventions]] - slug rules, ISO date format, filename patterns.
- [[SOP-002-convert-mypka-to-sqlite]] - the SQLite migration contract. This Guideline's field names match SOP-002's column names.
- [[Templates/INDEX]] - copy-and-edit starter templates for every entity type defined here.

## Updates to this Guideline

If the rules change, update this file. Do not duplicate the change into SOPs, Workstreams, or templates. They `[[wikilink]]` here and inherit the change automatically.

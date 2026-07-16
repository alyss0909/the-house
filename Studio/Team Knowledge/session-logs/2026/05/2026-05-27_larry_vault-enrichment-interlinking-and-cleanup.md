---
agent_id: larry
session_id: vault-enrichment-interlinking-and-cleanup
timestamp: 2026-05-27T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-002-schema-extensions]
mined: true
---

# Vault enrichment, mega interlinking, and tag cleanup

## Context

Long two-part session (ran out of context mid-way, resumed from summary). Alyssa came in to finalise the vault enrichment pass — KE files, offer files, CRM files — and then pushed into two new phases: a mega interlinking pass across all journal entries, and a tags/properties cleanup. The vault went from a well-structured but siloed set of files to a genuinely connected knowledge graph.

## What we did

**KE file enrichment (carried over from prior context)**
- **Larry** fixed the [[Notebook/Life/Key Elements/Life/becoming]] nav line — duplicate `[[life]] · [[life]] · [[home]]` corrected to `[[life]] · [[parenting]] · [[home]]`
- **Larry** updated [[Notebook/Life/Key Elements/Business/clients]]: added a **Current clients** section listing all four active clients (`[[alex]]`, `[[gillian]]`, `[[lara]]`, `[[maude]]`) with piped wikilink aliases, positioned after "What I am ignoring" and before Related notes, in vertical bullet list format

**Mega interlinking — 18 clusters, 167 notes**
- **Larry** inventoried the full journal (280+ notes), built 18 topic clusters from slug names + targeted reads, confirmed format with Alyssa (matching KE **Related notes** style: vertical bullets, piped aliases, blank line before **Connections:**)
- **Larry** confirmed "funnel assets" is a mental model only — no label written anywhere in files
- **Larry** ran the interlinking script: 165 notes updated in main pass, 2 edge cases patched manually (pin-design-inspo wrong year; tripwire file had written correctly despite stream error)
- Clusters: Garden, Mental load, Montessori activities, Norah life, Office & reno, Home rhythms, Mindset/Becoming, Recipes (sub-clustered by type), Email strategy, YOE, Pinterest, Social/content, BOH, Sales pages, Webinar pages, Opt-in/freebie, Fonts/brand, Shoots/visuals, Audience/research, Ads, Launch/promo, SLO

**Tag and properties cleanup**
- **Larry** audited all tags and properties across the full vault (not just PKM/) — identified three sources of noise: placeholder tags in Team Knowledge/Templates, inline hashtags from note body content, frontmatter topic tags now redundant with wikilinks
- **Larry** stripped 12 redundant topic tags from 15 journal notes: `business`, `garden`, `client`, `seo`, `ai`, `interesting`, `design`, `personal-development`, `freebie`, `email`, `productivity`, `pinterest` (plus low-count life/work/health/etc.)
- **Larry** cleaned placeholder example tags from 8 Team Knowledge template files
- Kept 8 content-type tags: `idea`, `inspo`, `copy`, `brand-words`, `musings`, `recipes`, `montessori`, `webinar`

## Decisions made

- **Question:** How should related notes look inside journal entries?
  **Decision:** Match KE format exactly — `**Related notes**` header, vertical bullet list with piped wikilink aliases, blank line separator before `**Connections:**`. No category tag-pills (those are KE-only).

- **Question:** Should "funnel assets" appear as a label in any files?
  **Decision:** No. It's a mental model for interlinking decisions only. Notes link to each other organically — no cluster labels written anywhere.

- **Question:** Which tags to keep vs. remove?
  **Decision:** Keep 8 content-type tags (`idea`, `inspo`, `copy`, `brand-words`, `musings`, `recipes`, `montessori`, `webinar`). Strip all topic-specific tags now redundant with wikilinks and Related notes.

- **Question:** Should Team/, Team Knowledge/, .claude/ be added to Obsidian excluded files?
  **Decision:** Deferred. Alyssa wants to understand the implications better before enabling. Not urgent — noise is minor.

- **Question:** clients.md — should Current clients sit at the top or after the body prose?
  **Decision:** After "What I am ignoring," before Related notes. List format, not inline.

## Insights

- Interlinking at scale is fastest when clusters are built from slug inference + targeted reads for ambiguous files, then merged so notes in multiple clusters get a union of related links in a single write pass. Read every file = too slow. Trust slugs = 90% accurate.
- The distinction between content-type tags (idea, inspo, copy) and topic tags (business, garden, client) matters: content-type tags survive wikilinks because they cut across all topics. Topic tags become redundant the moment wikilinks and Related notes exist.
- Tags panel "chaos" in Obsidian usually means system infrastructure files are being indexed alongside PKM content — not that the PKM itself is messy.

## Realignments

- **Format before committing:** Alyssa asked for the related notes to be in a vertical list after seeing the horizontal proposal, and to match the KE style exactly. Larry had proposed inline `·`-separated links. Alyssa: *"i want it to say related notes (like the others do) then list them vertically not horizontally — make it match closer to what we just did for KE."*

- **clients.md placement:** Initially placed Current clients at the very top (above body prose). Alyssa: *"can that sit under what im ignoring and before related notes, and in a list not in line next to eachother?"*

## Open threads

- [ ] **brand-world.md body prose** — "What this covers / What good looks like / What I am ignoring" still blank. Alyssa flagged this. Needs a riff before writing.
- [ ] **Maude Trottier CRM** — [[Notebook/Life/CRM/People/maude]] details pending. Alyssa said "let's fill in her details later."
- [ ] **Offer file formatting** — offer files still use H2 sections (`## What it is`, `## Who it's for`). Not yet reformatted to match new compact KE standard. Deferred.
- [ ] **Obsidian folder exclusion** — Team/, Team Knowledge/, .claude/ still polluting tags + properties panels with system noise. Alyssa wants to understand the feature before enabling. Revisit when ready.
- [ ] **Inline hashtag artifacts** — `#b5b1d8`, `#LIVE`, `#allthethings` etc. in journal note bodies still show as tags. Minor noise, not worth touching note content to fix.
- [ ] **Vera riff resume** — handover file at `Team Inbox/vera-riff-handover-2026-05-27.md` still waiting. Not touched this session.
- [ ] **WS-002 Notion import** — still at Step 3 (inventory). Not touched this session.
- [ ] **Topics for Socials** — candidate topics surfaced in prior riff, not created yet.
- [ ] **Habits** — deferred until Alyssa actually starts one rather than conceptualising.
- [ ] **Funnel-position tag vocabulary** (`#opt-in`, `#sales-page`, etc.) — surfaced as a future project, not actioned.

## Next steps

1. Riff on **brand-world.md** — Alyssa provides a few sentences on what Brand World covers, Larry writes the three prose fields.
2. Resume **Vera riff** from handover file when Alyssa is ready.
3. Pick up **WS-002** when import work resumes.

## Cross-links

- `[[2026-05-27_larry_pka-working-style-riff-and-ke-audit]]` — prior session: KE audit, Brand World creation, formatting standard agreed
- `[[2026-05-27_larry_journal-protocol-fix]]` — same day: journal gate wired into close-session protocol

---
agent_id: silas
session_id: silas-offers-csv-import
timestamp: 2026-05-26T00:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: ["WS-002-import-external-knowledge-base"]
linked_guidelines: ["GL-001-file-naming-conventions", "GL-002-frontmatter-conventions"]
---

# Offers CSV Import — Phase 3 (Products DB from Notion)

## Context

Larry dispatched Silas to execute Phase 3 of the Notion Products DB import. Source was a pre-extracted CSV at `D:\Alyssa\Downloads\ProductsDBnotion\extracted\Products DB 2f4c8b43e565816ebb3fd423cbe17080_all.csv`. Task was to create Offer entity files for all Live and Needs Edits records, then update the Offers INDEX.

## What we did

- Silas read operating contracts (Silas AGENTS.md, root AGENTS.md, GL-001, GL-002).
- Parsed the CSV: 41 total records.
- Applied status filter — kept Live (25) and Needs Edits (3) = 28 records. Skipped 13 records with status Idea, Geriatric, or Sunset.
- Mapped Notion Type field to GL-002 offer_type enum: Freebie → freebie, Low Ticket → low_ticket, Offer → offer, Asset → asset.
- Mapped Notion Theme multi-select to GL-002 theme enum: BoH Systems → boh_systems, Productivity → productivity, Email → email, Pinterest → pinterest, Sales → sales.
- Stripped currency symbols and commas from Price Point; left field blank for $0.00 records.
- Used Sales Page column (not Link to Product) as sales_page_url. Trimmed whitespace from URLs with trailing spaces.
- Wrote 28 Offer files to `PKM/My Life/Offers/<slug>.md`.
- Updated `PKM/My Life/Offers/INDEX.md` Active files section with all 28 entries, alphabetically sorted by slug.

## Decisions made

- **Question:** Price $0.00 — store as 0 or leave blank?
  **Decision:** Left blank (no value). GL-002 states price_point is optional. A $0 freebie does not have a meaningful price point to track.

- **Question:** CSV "Link to Product" vs "Sales Page" — which maps to sales_page_url?
  **Decision:** Used Sales Page column. "Link to Product" appears to be an internal Notion asset link (Google Sheets, internal template URLs), not the customer-facing sales page.

- **Question:** Notion "Tags" column (e.g. "1:1 Call", "Notion Template", "Back of House") — map to frontmatter tags or drop?
  **Decision:** Dropped. These do not map to any GL-002 field. The tags column in GL-002 schema carries `business` as the standard tag for all Offer files. Notion Tags content stored nowhere (body is blank pending content fill). If Alyssa wants these as a frontmatter field, GL-002 extension needed.

- **Question:** "Chat Word" column — map to frontmatter or drop?
  **Decision:** Dropped. No matching GL-002 field exists. Not schema-worthy without further user direction.

## Insights

- The Notion Products DB CSV has a "Link to Product" column that looks like a sales URL but is actually an internal asset link (Notion template download, Google Sheets, etc.). The "Sales Page" column is the correct source for sales_page_url. Watch for this in future Notion CSV imports.
- Several Sales Page and Link to Product cells had leading/trailing whitespace (e.g. `"https://alyssacoleman.ca/cold  "`). Trimmed during write. Upstream CSV cleanup would prevent this.
- 90d Clock In sales page had `www.` prefix without `https://` in the CSV. Written as `https://www.alyssacoleman.ca/clockin`.
- The 5 Minute Newsletter and Unignorable Subject Lines had sales_page_url values missing the `https://` scheme in the CSV (`alyssacoleman.ca/5m`). Corrected to `https://alyssacoleman.ca/5m` and left blank respectively (Unignorable Subject Lines had no sales page column entry).

## Realignments

- _(none this session)_

## Open threads

- [ ] Body sections for all 28 offers are blank. Penn or Alyssa to fill `## What it is`, `## Who it's for`, `## Where to find it`, `## Notes` from product knowledge.
- [ ] Notion Tags column values ("1:1 Call", "Notion Template", "Back of House") were dropped. Alyssa to decide if any warrant a new frontmatter field (would require GL-002 extension).
- [ ] "Chat Word" column (chat trigger keywords like "Softceo", "Sunday", "Claude") was dropped. Alyssa to decide if this warrants a `chat_trigger` field in GL-002.
- [ ] Unignorable Subject Lines has no sales_page_url in the CSV. Check if one exists.
- [ ] Bingeable Newsletters has no sales_page_url in the CSV. Check if one exists.
- [ ] Cold Subscriber Automation has no sales_page_url in the CSV. Check if one exists.
- [ ] Quarter Prompt has no sales_page_url in the CSV. Check if one exists.
- [ ] Simmer System has no sales_page_url in the CSV. Check if one exists.

## Next steps

- Larry to synthesize Phase 3 complete status back to Alyssa.
- Phase 4 (if any): import remaining Notion DB types (People, Organizations, etc.) via WS-002.

## Cross-links

- [[2026-05-26-00-00_silas_ke-topics-offers-scaffold]] — prior Silas session establishing the Offers folder scaffold.
- [[2026-05-26_larry_notion-import-inventory-and-scope]] — Larry's inventory session that scoped this import.

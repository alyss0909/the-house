---
agent_id: larry
session_id: sent-emails-db-curation-and-related-products
timestamp: 2026-07-17T16:00:00Z
type: close-session
linked_sops: ["SOP-040-the-compounding-loop"]
linked_workstreams: []
linked_guidelines: []
---

# Sent Emails DB: curated Kit history, Related Product audit, and team documentation

## Context

Alyssa wanted the Notion "Sent Emails" DB (Email Marketing → Sent Emails) built out into a real reference resource — past newsletters cataloged by type (Soft Sunday / Simmer / Promo / Soft Ceo Sesh) with verified links, dates, and open/click stats — so her content team can pull real subject-line trends and offer tie-ins instead of guessing. The session ran long and covered manual entry, a shelved "full Kit archive" idea, a pivot to her own Google Sheet as source of truth, a Related Product backfill audit, and finally documenting the resource for the team and closing.

## What we did

- Larry cataloged individual ckarchive.com links Alyssa pasted directly (Name + URL, "Soft Sunday" tag only when explicit in the subject).
- Larry pulled a curated "best of each type" batch via the Kit MCP, following Alyssa's scope rules: all Soft Sundays in (most carry an embedded offer), fixed counts for other types, most webinar invites/replays excluded, only the two strongest Soft Ceo Sessions kept, at least one promo email per live offer.
- A bigger "Kit Broadcast Archive" idea (new DB, all 535 broadcasts, Calendar/Top-Performers views) was scoped and then explicitly shelved — Alyssa: "wait dont do anything i jsut wanna talk about the plan." Not built.
- Larry pivoted to Alyssa's own Google Sheet (she'd added Type + Note/offer-tag columns herself) and brought over the net-new Type-tagged rows (29 from the main tab, 6 more from an older-years tab she pasted directly), using her Note column to set Related Product.
- Added Date, open rate, and click rate as real Notion properties on the DB (Alyssa created them mid-session) and populated them for all existing entries from her sheet/Kit data.
- Larry made two link mistakes mid-session (below, see Realignments) and corrected both; the DB's URL field now holds only Alyssa-verified ckarchive links or, where unavailable, Kit's internal report link built from `publication_id`.
- Ran a full Related Product audit: opened every Sent Emails entry with no Related Product set, read the actual email body (not just the subject), and proposed matches for her approval rather than auto-applying.
- Checked whether any of the 8 proposed Back-of-House matches specifically named "Simmer System" (a distinct sub-product) — none did; all 8 are straightforward Back of House promo copy, confirmed by reading full bodies, not just subjects.
- Added one new entry at Alyssa's request: "Wanna have me as an employee for a day? 👀" (Promo, 2025-12-04, open rate 47.71, click rate 0.86), linked to Quarter in a Day, using her ckarchive link.
- Documented the DB for the team: added it as a "Live externals" pointer in [[Studio/Hermes/SOURCES]], explaining what it contains, how the type + Related Product filters map to real past offer-selling copy, and that it should be checked before falling back to live Kit API calls.

## Decisions made

- **Question:** Build the full 535-broadcast Kit archive as its own Notion DB, or keep expanding the existing curated Sent Emails DB?
  **Decision:** Keep the existing curated DB; the full-archive idea is shelved, not deleted, pending Alyssa raising it again.
- **Question:** Where do content makers learn this DB exists and how to use it?
  **Decision:** Documented in `Studio/Hermes/SOURCES.md` under "Live externals" (the trust-tier file every writing pass loads before drafting) rather than a new standalone doc, per the vault's one-home-per-fact rule.
- **Question:** Do any of the 8 Back-of-House-tagged Related Product proposals actually belong to the more specific Simmer System product?
  **Decision:** No — checked every body, all 8 stay Back of House.

## Insights

- Reading the actual email body (not just the subject line) was necessary to propose accurate Related Product matches — several subjects gave no hint of the offer being pitched underneath.
- Kit's `get_broadcast.public_url` field is unreliable (looks like a real reader link, 404s even when `public: true`) and its report-URL reconstruction needs `publication_id`, not `id` — both now captured in Larry's cross-session memory (feedback: sheet-over-kit-api) so future sessions don't re-derive this the hard way.

## Realignments

- Alyssa: "wait did you edit the links? im getting 404s on them all now" — Larry had populated ~19 entries with Kit's constructed `public_url` links, all of which 404'd. Reverted to Kit's internal dashboard report link.
- Alyssa: "did you make those up? theyre all 404s not from the sheet?" then "just go find them in the sheet thats a better way dont go to kit man i have all the data here" — the reverted links themselves had a second bug (used broadcast `id` instead of `publication_id`); fixed by cross-referencing her sheet directly. This produced the standing rule: prefer her sheet/ckarchive links over live Kit API calls, captured in Larry's cross-session memory (feedback: sheet-over-kit-api).
- Alyssa clarified "only a couple of the good ones" meant the Soft Ceo Sesh count should stay near what's already curated, not expand — confirmed the 2 already in the DB satisfy this.

## Open threads

- [ ] Alyssa's approval still pending on the Related Product batch: 8 entries → Back of House, "Interview with 2026" → Plan Your Year/Best Year Yet. "DON'T grow your list" and "SECRETS of consistent entrepreneurs" have no product match and are recommended to stay unlinked.
- [ ] The "older tab" (23/24 years) she mentioned wanting to look at separately for outliers has not been started.
- [ ] Her earlier ask to trim Soft Sunday down to "like 2" and to identify what's unnecessary for Back of House specifically was partially analyzed (11 BOH-related entries ranked by click rate) but no final cut decision was made.

## Next steps

- Apply the 9-entry Related Product batch once Alyssa says go.
- Pick up the older-years tab review and the Soft Sunday/BOH trim analysis if she returns to them.

## Cross-links

- [[2026-06-04_larry_subject-line-analysis-v2]] — prior work on Kit broadcast subject-line data, same domain.

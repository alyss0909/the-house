---
type: close-session
agent: Larry
date: 2026-07-04
topic: sales-page-copy-recovery
---

# Sales Page Copy Recovery

## Summary

This session focused on fixing the offer-copy gap in `[[PKM/My Life/Offers]]`: many offer notes had `sales_page_url` metadata but no actual sales-page copy in the body.

Larry routed execution to Silas for structure/import cleanup, with Wren's rule applied: preserve Alyssa's words and use real sales-page copy as writing context, not generic summaries.

## What changed

- Audited `[[PKM/My Life/Offers]]` for missing `## Sales page copy` sections.
- Captured URL-backed sales/checkout/opt-in copy into `[[PKM/Second Brain/examples/sales-pages/INDEX]]`.
- Updated URL-backed offer notes to replace dead `## Where to find it` sections with:
  - a link to the full source-copy file
  - the public source URL
  - a practical top-page excerpt for offer context
- Updated `[[PKM/Second Brain/examples/INDEX]]` so sales pages now show 20 files.
- Added a helper script at `Team Knowledge/scripts/import-sales-page-copy.ps1` for repeatable sales-page URL capture.

## Source files created or confirmed

- `[[PKM/Second Brain/examples/sales-pages/best-year-yet-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/a-year-of-emails-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/biz-tracker-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/email-list-revival-plan-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/list-resuscitator-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/soft-ceo-monthly-notion-template-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/soft-ceo-sessions-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/soft-sundays-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/the-90-minute-reset-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/the-ceo-year-notion-planner-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/the-daily-profit-activities-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/the-numbers-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/the-promo-planner-in-notion-sales-page]]`

Previously handled/confirmed source files from this thread:

- `[[PKM/Second Brain/examples/sales-pages/boh-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/quarter-in-a-day-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/the-productive-entrepreneur-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/the-5-minute-newsletter-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/bingeable-newsletters-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/pin-planner-sales-page]]`
- `[[PKM/Second Brain/examples/sales-pages/90d-clock-in-sales-page]]`

## Corrections and realignments

- Alyssa clarified that Back of House already had the full canonical sales page copy. This was logged separately in `[[2026-07-04-19-51_larry_boh-sales-page-realignment]]`.
- The import helper was updated to exclude BOH from future batch captures.
- Promo Planner was corrected after discovery that its URL exposed mostly ThriveCart checkout/order-bump material; the offer note now favors the existing real offer copy already present in `[[the-promo-planner-in-notion]]`.
- A Year of Emails was confirmed from Alyssa's pasted source. The attached paste had encoding artifacts, so the cleaned decoded source copy was preserved and marked `status: confirmed_from_user_paste`.

## Open threads

These offers still lack usable sales-page copy because their offer files do not currently include a sales page URL:

- `[[cold-subscriber-automation]]`
- `[[quarter-prompt]]`
- `[[simmer-system]]`
- `[[rush-order]]`

These files still have `## Where to find it` sections because no source was available to replace them.

## Librarian notes

- Sales-page index has been updated.
- BOH is treated as complete/canonical and should not be overwritten by batch imports.
- Some pages are thin because the URL only exposed an opt-in or checkout surface, not a full long-form page.
- `[[90d-clock-in-sales-page]]` still includes `Select your state` from the user-provided checkout context; this is known checkout scaffolding, not a broken scrape.

## Next steps

1. If Alyssa provides source copy or URLs for `[[cold-subscriber-automation]]`, `[[quarter-prompt]]`, `[[simmer-system]]`, or `[[rush-order]]`, file them into `[[PKM/Second Brain/examples/sales-pages/INDEX]]` and update the offer notes.
2. Optional future cleanup: remove or replace `## Where to find it` from no-source offer files with a clearer `## Sales page copy` / `No source captured yet` section.
3. Optional future pass: manually inspect thin checkout-only source files and label them more precisely in the index.

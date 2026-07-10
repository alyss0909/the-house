---
name: Product CTA Bridge
type: product-cta-bridge
date: 2026-07-04
owner: Larry
status: ready-to-send
---

# Product CTA Bridge

The Notion Products DB is canonical for product facts and CTA/chat words.

Use local offer notes for meaning and positioning. Use Notion for current fields.

## Canonical Notion Products DB

Notion link:

`https://app.notion.com/p/alyssacoleman/2f4c8b43e565816ebb3fd423cbe17080?v=2f7c8b43e56580d18f79000c1b4dd816&source=copy_link`

Fields observed:

- Name
- Type
- Price Point
- Status
- Theme
- Sales Page
- Link to Product
- Tags
- Chat Word

## Local offer shelf

Local meaning and positioning live here:

`PKM/My Life/Offers/INDEX.md`

Use this shelf to understand what an offer is, who it is for, and how Alyssa positions it. Do not treat it as the final source for chat words.

## CTA accuracy rules

Never invent a chat word.

If Notion has a chat word, use the exact Notion value.

If Notion has a blank chat word, output:

`CTA/chat word: manual selection needed`

If Notion cannot be accessed, use the local offer file for meaning, but mark product facts and chat word as unverified.

## Known product map from current source audit

This table is a bridge, not the canonical database. Verify against Notion before using in final relay output.

| Product | Local offer file | Type | Themes | Observed chat word status |
|---|---|---|---|---|
| Soft Sundays | `PKM/My Life/Offers/soft-sundays.md` | Freebie | Email, Productivity, Sales, BOH Systems, Pinterest | `Sunday` observed in Notion context |
| Pin Planner | `PKM/My Life/Offers/pin-planner.md` | Freebie | Pinterest | `Pinterest` observed in Notion context |
| Back of House | `PKM/My Life/Offers/back-of-house.md` | Offer | BOH Systems | `Yes Chef` observed in Notion context |
| Bingeable Newsletters | `PKM/My Life/Offers/bingeable-newsletters.md` | Freebie | Email | Blank from observed Notion row |
| Email List Revival Plan | `PKM/My Life/Offers/email-list-revival-plan.md` | Freebie | Email | Needs exact Notion row |
| Soft CEO Sessions | `PKM/My Life/Offers/soft-ceo-sessions.md` | Freebie | Productivity | `Softceo` observed in Notion context |
| The Promo Planner in Notion | `PKM/My Life/Offers/the-promo-planner-in-notion.md` | Low ticket | Sales, BOH Systems | Blank from observed Notion row |
| Soft CEO Monthly Notion Template | `PKM/My Life/Offers/soft-ceo-monthly-notion-template.md` | Low ticket | Productivity | `Ceo` observed in Notion context |
| The CEO Year Notion Planner | `PKM/My Life/Offers/the-ceo-year-notion-planner.md` | Low ticket | Productivity | `Whimsy` observed in Notion context |
| List Resuscitator | `PKM/My Life/Offers/list-resuscitator.md` | Low ticket | Email | Needs exact Notion row |
| The 5 Minute Newsletter | `PKM/My Life/Offers/the-5-minute-newsletter.md` | Low ticket | Email | Needs exact Notion row |
| Unignorable Subject Lines | `PKM/My Life/Offers/unignorable-subject-lines.md` | Low ticket | Email | Needs exact Notion row |
| 90d Clock In | `PKM/My Life/Offers/90d-clock-in.md` | Low ticket | Productivity | Needs exact Notion row |

## Theme matching

Use the planning grid theme first, then match to the offer shelf:

- Email: Bingeable Newsletters, Email List Revival Plan, Soft Sundays, List Resuscitator, The 5 Minute Newsletter, A Year of Emails, Unignorable Subject Lines.
- Pinterest: Pin Planner, Slowly Viral, Back of House through a Pinterest angle.
- BOH Systems / Slow Marketing: Soft Sundays, Promo Planner, Back of House.
- Productivity: Soft CEO Sessions, Soft CEO Monthly, The CEO Year Notion Planner, 90d Clock In.

If theme and offer conflict, stop and flag the conflict rather than forcing a CTA.


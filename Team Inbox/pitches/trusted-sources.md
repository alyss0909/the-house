---
title: Trend Scout - Trusted Sources (locked 2026-07-07)
owner: Larry / Trend Scout role
purpose: the ONLY approved sources the Trend Scout reads. Two layers - niche swipe file (scraped) + macro trend feeds (read). Nobody watches copy daily.
scrape_cadence: monthly (automated routine - see bottom)
---

# Trusted Sources

Locked with Alyssa 2026-07-07. The value lives on the **cover + the slides**, NOT the caption. Scrapes pull **top posts by saves/reach** (winners only), then READ the slide images (vision/OCR) for covers + hooks + slide structure. Captions are low priority.

## Layer 1 - Niche emulation set (scrape monthly -> verbatim swipe file)

Her actual taste. Voice/hooks/vibe come from HERE, never from generic big-name marketers.

| Account | Why she saved it |
|---|---|
| @coolgirlceo | super viral - proven reach in her world |
| @ameliagonzamonte | super viral - proven reach in her world |
| @socialwithbecca | Pinterest craft |
| @prettydecent | art-girl visual vibe |
| @sunday.scaries | one-off / For The Girls; relatable-millennial-woman hooks |
| @xanthe.appleyard | great hooks; social-focused but audience overlaps hers |
| @ouiwegirl | good hooks (strong but a little on-the-nose - study, don't copy) |
| @thelizwilcox | email marketing, personality-forward |
| @kirstenroldan | email/list growth, less-content energy |
| @btlcopy | copywriting / hook + line craft |
| @kelly.mosser | aligned/sustainable growth, anti-hustle |
| @thesocialbungalow | premium branding/social aesthetic |
| @jennakutcher | Pinterest + email + life-first for women (also a competitor - study AND monitor) |
| @nanadelrey | why TBD - scrape + let data show |
| @greyandgoldcreative | why TBD - scrape + let data show |
| @mrs.vondy | why TBD - scrape + let data show |
| @isabelradford | art-girl indie - Alyssa's blow-up exemplar (added 2026-07-07, grounds the Suki hire) |
| @erifikii | art-girl indie - Alyssa's blow-up exemplar (added 2026-07-07, grounds the Suki hire) |
| @bookish.joo | art-girl indie - Alyssa's blow-up exemplar (added 2026-07-07, grounds the Suki hire) |

Could not scrape 2026-07-07 (private/unavailable - retry each run): @cassklass_, @hellomedia, @milanasarenac

## Layer 2 - Craft architecture only (reference, NOT scraped, NOT voice)

Steal slide structure only. Never voice.

- @shannonmckinstrie - carousel method, anti-"How to" hooks, caption-to-slide cross-pointing
- @thejustinwelsh - one idea per slide, bold minimal design, hook-to-payoff
- [[Team Inbox/pitches/craft-references/2026-07-09-tinna-loaiza-5-carousel-patterns|Tinna Loaiza - The 5 Patterns]] - carousel mechanics: intimacy, deprivation curiosity, tension, visual repetition, narrative. Suki-owned craft lens only; never voice, never Alyssa source.

## Layer 3 - Macro platform trends (read weekly, ~5 min, free)

What format/mechanic is hot platform-wide (e.g. DM-shares weighted 3-5x, follow-the-line, 15-20 words/slide). Feeds Mean Alyssa's "will it perform" ammo.

- https://newengen.com/insights/instagram-trends/ (updated weekly)
- https://creatorflow.so/blog/instagram-trends-2026-creators-marketers/

## The monthly scrape routine (automated - Alyssa never touches this)

Once per month: for each Layer-1 account, pull top posts by saves/reach, read the slide images, append covers + hooks + slide skeletons + engagement counts to `Team Inbox/pitches/swipe/YYYY-MM-swipe.md`. Retry the "could not scrape" accounts each run. Uses Apify (spend pre-approved for this routine).

**Canonical definition:** [[trend-scout-monthly-routine]] - the verbatim scheduled Claude Routine prompt (mechanism, cadence, output). Scheduled monthly, **next run 2026-08-01** (confirmed by Alyssa 2026-07-08). SOP-033 re-slices this output; it does not re-scrape.

---
name: Content OS Evidence System
type: guideline
date: 2026-07-05
owner: Larry
status: active
---

# Content OS Evidence System

This file is the working rule for how the Content OS finds and uses Alyssa-original examples.

The root problem is not "does every cell in the month grid already have a perfect carousel example." The root problem is whether the team can retrieve enough real Alyssa evidence to propose useful content without inventing strategy, offer facts, voice, or CTAs.

## Root Correction

Do not treat a missing exact carousel example as a blocked slot.

A content slot can be built from multiple evidence types:

- A real carousel or Instagram post for visual/post-structure precedent.
- A Soft Sunday or Simmer for voice, story, and idea framing.
- A sales email or sales page for offer positioning.
- A BOH lesson/transcript for teaching substance.
- A journal riff or Team Inbox capture for raw Alyssa thought.
- Kit performance data for subject/content resonance.
- Notion Products DB for current product facts and chat words.

The standard is source-grounded, not example-identical.

## Local Evidence Sources First

Use local vault sources before external scraping:

| Evidence type | Local home | Use for |
|---|---|---|
| Carousel/post examples | `PKM/Second Brain/examples/Carousels/` | Post type, caption, CTA style, visual lane, performance clues |
| Soft Sundays | `PKM/Second Brain/examples/soft-sundays/` | Newsletter voice, weekly rhythm, source ideas, email-to-carousel seeds |
| Simmers | `PKM/Second Brain/examples/simmers/` | Story-to-offer email structure, Right Time Offer logic |
| Sales emails | `PKM/Second Brain/examples/sales-emails/` | Offer angle, launch/promo email structure, webinar invites |
| Sales pages | `PKM/Second Brain/examples/sales-pages/` | Product positioning, promise, audience, objections |
| Offer shelf | `PKM/My Life/Offers/` | Stable offer meaning and positioning |
| BOH program material | `PKM/Second Brain/programs/back-of-house/` | Real teaching substance |
| Journal | `PKM/Journal/` | Raw ideas, hooks, unpolished language, strategy notes |
| Team Inbox | `Team Inbox/` and `Team Inbox/_Processed/` | Fresh captures, examples, links, screenshots |
| Kit stats | `Deliverables/kit-performance-chunks/` and Kit deliverables | Performance evidence for subject/content resonance |
| Hermes brain | `Hermes/` | Current voice, taste, offer, and craft operating rules |

If these sources already answer the question, do not reach for Apify.

## When To Use Apify Or Another External Pull

Use Apify, Instagram export, Kit export/API, or another external source only when the local vault is missing the actual artifact we need.

Good external-pull use cases:

- We need the full set of published Instagram posts for a date range.
- We need captions, timestamps, media URLs, slide images, comments, or engagement counts not present locally.
- We need to rebuild the carousel/post evidence table from the live archive.
- We need to verify whether a claimed post existed and what it actually said.

Do not use Apify for:

- Product facts, prices, offer status, sales links, or chat words. Use Notion Products DB.
- Voice rules. Use Alyssa-original corpus plus Hermes learning files.
- Strategic decisions. External data supplies evidence; Alyssa or Larry decides the operating rule.

## Evidence Table Fields

Every imported or classified content artifact should be captured with these fields:

| Field | Meaning |
|---|---|
| source_path_or_url | Local file path or external URL |
| date | Publish/capture date if known |
| channel | Instagram, Kit, sales page, webinar, journal, etc. |
| format | carousel, static, email, newsletter, sales email, sales page, webinar, journal riff |
| content_role | More specific role: trend report, manifesto, webinar RSVP, product reveal, etc. |
| theme | Email, Pinterest, BOH Systems, Productivity, Sales, or loose/mixed |
| post_type | Education, Offer, For The Girls, or non-social |
| ftg_lane | If FTG: affirmation, quote card, identity mirror, love letter, version-of-me, DITL, taste-world |
| related_offer | Offer/freebie/program if relevant |
| cta_word | Exact word if verified; otherwise `manual selection needed` or `none` |
| teaching_source | BOH module, offer file, or example that supplies the lesson |
| voice_source | Example used for voice calibration |
| confidence | verified, inferred, candidate, or gap |
| notes | Why it matters, what it can be reused for |

## For The Girls Rule

For The Girls is not a strict product/theme slot.

It is a loose identity and mood layer that can attach to the month or moment by resonance:

- Monthly affirmations can make sense in a Productivity week.
- A "for the version of me who..." lane can make sense with One Good Thought or a reflective webinar.
- Guest Cheque / quote-card content can make sense as BOH brand-world even when it is not teaching BOH.
- Valentine/love-letter content can carry a Pinterest/freebie CTA without becoming Pinterest teaching.

For The Girls posts should be classified by emotional job first, then by theme if useful. Theme is a retrieval aid, not a cage.

## Gap Handling

When a slot has no exact example, propose a grounded build path instead of stopping:

1. Name the missing exact example.
2. Pull the closest post-type precedent from any theme.
3. Pull teaching from the matched offer or BOH module.
4. Pull voice from the closest email/newsletter/post example.
5. Pull CTA rules from Notion/Hermes BUSINESS.
6. Mark remaining assumptions as `candidate`, not fake certainty.

Example: no Productivity Education carousel exists locally.

Do not stop. Build it from:

- Post-type precedent: Email/Pinterest education carousels.
- Teaching source: Soft CEO Sessions, Quarter Prompt, 90d Clock In, CEO Year, BOH Cozy Business Plan.
- Voice source: Soft Sundays or journal notes around planning, attention, monthly rhythm.
- FTG resonance if relevant: monthly affirmations, version-of-me, slow decision permission.

## Proposed Operating Loop

1. Rebuild the evidence table from local sources.
2. Identify true gaps: missing artifact, missing chat word, missing product distinction, missing gold-standard example.
3. Use Apify/exports only for missing published artifacts.
4. For each monthly slot, store a "build recipe" with evidence sources, not just a yes/no example status.
5. When output performs well, promote it back into the examples layer with its role, theme, post type, and result.

## Immediate Fix To The Content OS

The monthly grid should not be a rigid proof table. It should become a content-routing system:

- Weekly theme chooses the business lane.
- Post type chooses the job.
- For The Girls chooses the emotional lane.
- Offer/freebie chooses the CTA path.
- Evidence sources choose what the piece is allowed to sound like and teach.

This is how the team proposes solutions instead of only finding gaps.


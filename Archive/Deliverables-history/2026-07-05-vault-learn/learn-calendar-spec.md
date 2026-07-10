# Content OS — Content Calendar Spec (machine-usable)

> Batch-mode backbone for Alyssa Coleman's Content OS. Every claim is sourced to a vault file. Where a slot has no documented real-post example, it is marked **GAP** — those need her gold-standard input, not inference.
>
> Sources of truth:
> - Grid (theme/type/role/product/CTA per real post): `PKM/Second Brain/examples/Carousels/captions.md` + [[Studio/Analysis/carousel-slide-by-slide]]
> - Product/price/chat-word: [[Hermes/BUSINESS]] (Notion snapshot 2026-07-05) + `PKM/My Life/Offers/`
> - Batching method: `PKM/Second Brain/programs/back-of-house/3. Traffic Pantry/` (3.1 Bread and Butter, 3.3 The Batch, transcripts, slides)
> - Promo/monthly layer: [[Library/Programs/back-of-house/4. Soft Sales System/4.1 Promo Copy Planner]]
> - Taxonomy lock: [[Studio/Team Knowledge/session-logs/2026/07/2026-07-04-18-22_larry_carousel-notion-taxonomy-rule]]

---

## Controlled vocabulary (locked in Notion)

These are the ONLY valid values. More specific descriptors (Manifesto, Data Argument, Step Framework, Webinar RSVP, Trend Report) belong in the `Content role` free-text field, never in Theme or Post type. (Source: carousel-slide-by-slide.md lines 19-21; taxonomy-rule session log.)

- **Theme** (5): `Email` · `Pinterest` · `Productivity` · `BoH Systems` · `Sales`
- **Post type** (3): `Education` · `Offer` · `For The Girls`

---

## A. The weekly theme rotation (monthly cycle)

Themes rotate by week-of-month. Verified against every dated post in the dataset:

| Week | Theme | Evidence (posts tagged "Week N …" in Content role) |
|---|---|---|
| Week 1 | **Email** | 01-15 Slow Marketing Pt.1 ("Week 1 Email"), 01-20 What's Shifting Pt.2 ("Week 1 Email") |
| Week 2 | **Pinterest** | 01-29 Smart Founders, 02-06 Pinterest for Beginners, 02-10 Get Clients, 02-14 Valentines, 02-19 Sugar Mama, 02-24 Swapped IG, 03-07 March Affirmations — all "Week 2 Pinterest" |
| Week 3 | **BoH Systems** | 03-03 Organic Marketing Is Dying ("Week 3 BoH Systems") |
| Week 4 | **Productivity** | 02-01 Feb Is New Jan, 03-01 90 Day Clock In ("Week 4 Productivity") |

**Rotation = Email → Pinterest → BoH Systems → Productivity**, cycling monthly.

**Exceptions / notes:**
- **`Sales` is a 5th valid Theme but has NO week-slot and NO documented post** in this dataset. It is event-driven (promo windows / launches), overlaid on top of the rotation, not a fixed weekly slot — consistent with the Promo Planner living in a separate program (P4 Soft Sales System). See §E.
- The rotation is a 4-slot cycle across a ~4-week month; a 5th week (when the calendar has one) is undocumented — likely a "For The Girls" / catch-up / Sales overflow slot. **GAP.**
- Theme is assigned by week-of-month, but **within a theme week she posts multiple times** (Week 2 Pinterest has 7 documented posts across Feb) — so the theme is the container, the post-type rhythm (§B) fills the days.

---

## B. The weekly post-type rhythm (Education / Offer / For The Girls)

The dataset does NOT prove fixed weekday assignment (no post carries an explicit "Monday/Wednesday" tag; the one recurring day-anchor is **Friday**). What it proves is a **3-role rhythm within each theme week**, with one clear day rule:

| Role | Cadence signal | Evidence |
|---|---|---|
| **Education** | The default / lead post of a theme week — introduces the theme with a freebie CTA | 01-15, 01-20 (Email edu), 01-29, 02-10 (Pinterest edu) |
| **Offer** | The conversion post of a theme week — product reveal or webinar RSVP | 02-06, 02-19, 02-24 (Pinterest offer), 02-01, 03-01 (Productivity offer), 03-03 (BoH offer) |
| **For The Girls** | **Friday** — brand-world / identity / manifesto content, soft or no CTA | 01-22 "Friday brand-world content", 03-10 "Friday brand-world content"; 02-14 & 03-07 are seasonal FTG variants |

**The one hard day rule:** *For The Girls = Friday* ("Friday brand-world content" appears verbatim on 01-22 and 03-10). Source: captions.md lines 83, 367.

**Monday/Wednesday are NOT documented as fixed** in the vault. The safe modeled rhythm per theme week:
- **Post 1 = Education** (freebie-led, opens the theme)
- **Post 2 = Offer** (product/webinar, converts the theme)
- **Friday = For The Girls** (brand world, low/no CTA)

Exact Mon/Wed anchoring for Education vs Offer is a **GAP** — needs her confirmation.

---

## C. Slot → product / freebie / chat-word map

Each Theme×Type slot below is filled with the ACTUAL product + CTA word her real posts used. Chat words are verbatim from BUSINESS.md / captions (rule: chat words are verbatim or they don't exist).

| Theme | Post type | Real product / offer | CTA / chat word | Source post |
|---|---|---|---|---|
| **Email** | Education | Cold Subscriber Automation + re-engagement template (freebie) | **TEMPLATE** | 01-15 |
| **Email** | Education | List Resuscitator ($11 tripwire) via re-engagement emails freebie | **LIST** | 01-20 |
| **Email** | Offer | *(no documented Email-Offer post)* | — | **GAP** |
| **Email** | For The Girls | *(no documented Email-FTG post)* | — | **GAP** |
| **Pinterest** | Education | Pin Planner (freebie) | **PIN** | 01-29, 02-10 |
| **Pinterest** | Offer | Pin Planner (product reveal) | **PIN** | 02-06 |
| **Pinterest** | Offer | Back of House via Slowly Viral class (webinar RSVP) | **VIRAL** | 02-19, 02-24 |
| **Pinterest** | For The Girls | Pin Planner (seasonal, Valentines) | **PIN** | 02-14 |
| **Pinterest** | For The Girls | Back of House via Slowly Viral replay | **VIRAL** | 03-07 |
| **BoH Systems** | Offer | Back of House (flagship, $500 coupon) + BOH sales page | **YESCHEF** | 03-03 |
| **BoH Systems** | For The Girls | Back of House brand-world (quote card) | none | 03-10 |
| **BoH Systems** | Education | *(no documented BoH-Education post)* | — | **GAP** |
| **Productivity** | Offer | The CEO Year Notion Planner ($79) | **CEO** | 02-01 |
| **Productivity** | Offer | 90d Clock In ($19) | **CLOCK** | 03-01 |
| **Productivity** | For The Girls | Back of House waitlist seed (manifesto) | none | 01-22 |
| **Productivity** | Education | *(no documented Productivity-Education post)* | — | **GAP** |
| **Sales** | any | *(no documented Sales post)* | — | **GAP** (event-driven, see §E) |

### Full theme → offer shelf (from BUSINESS.md, for slots not yet posted)

Use this to fill Education/Offer slots that lack a real example, but treat as **candidate, not confirmed** — chat words marked `manual` require manual selection (never invent a placeholder word). Never pitch Sunset/Geriatric/idea-stage products.

| Theme | Freebies (top of funnel) | Paid ladder | Notes |
|---|---|---|---|
| Email | Soft Sundays (Sunday), Bingeable Newsletters (manual), Email List Revival Plan (List), Cold Subscriber Automation (Template) | Unignorable Subject Lines $9, List Resuscitator $11 (Cold), 5 Minute Newsletter $19, A Year of Emails $37 | Funnel: Email List Revival Plan → List Resuscitator tripwire; 5M Newsletter → Unignorable Subject Lines bump |
| Pinterest | Pin Planner (Pinterest / PIN) | — (Pin Planner is the whole lane) | Pin Planner ↔ BOH Phase 3 |
| Productivity | Quarter Prompt (Claude), Soft CEO Sessions (Softceo) | 90d Clock In $19 (Clock), Soft CEO Monthly $37 (Ceo), CEO Year Planner $79 (Whimsy), Best Year Yet $97 | 90d Clock In → Promo Planner 50% bump |
| BoH Systems | The Numbers (manual), Biz Tracker (manual) | **Back of House $3,000 (Yes Chef)** = hub; Productive Entrepreneur $11k, Private Mentorship $12k | Every satellite rehearses one BOH phase |
| Sales | Biz Tracker (manual) | The Daily Profit Activities $47, The Promo Planner $59 | Event/promo-window driven only |

Cross-theme (any): The 90 Minute Reset $333 (Prod/Email/BoH), Quarter in a Day VIP $2,000⚠ (price conflict — re-verify).

---

## D. Her own batching method = the OS operating procedure

The Content OS runs **her** system, not a generic calendar. Two nested batch engines:

### D1. Bread & Butter / cornerstone engine (M3.1) — the weekly container
Source: [[Library/Programs/back-of-house/3. Traffic Pantry/3.1 Bread and Butter Content]], transcript.
- **One cornerstone piece per week**, spun automatically into email + social + Pinterest + video. "You're not creating more content, you're creating smarter containers."
- **4 Signature Pillars** = the four things she wants to be known for. Each pillar must: (1) relate to an offer, (2) lead to a freebie, (3) carry a POV.
- Under each pillar, **13 post ideas** (= one quarter of weekly cornerstones per pillar; 4 pillars × 13 = 52 weeks).
- **These 4 pillars ARE the 4 weekly themes** of §A: Email / Pinterest / BoH Systems / Productivity. The monthly rotation cycles one pillar per week.

### D2. The 7×10×4×5 Pinterest batch engine (M3.3) — the traffic multiplier
Source: [[Library/Programs/back-of-house/3. Traffic Pantry/3.3 The Batch]], [[Library/Programs/back-of-house/3. Traffic Pantry/transcripts/3.3 The Batch Transcript]] (lines 112-130), [[Library/Programs/back-of-house/3. Traffic Pantry/slides/3.3 Pin Batching Slides]].
- **Goal:** 1,400 unique fresh pins from content you already have, scheduled to run daily for 6 months in one batch session.
- **The formula (7×10×4×5):**
  - **7 URLs** = 4 cornerstone blogs + freebie + tripwire + offer
  - **10 designs per URL** = 5 templates × 2 overlay text variations
  - **4** title/description combos per URL
  - **5** boards per URL
  - → 10 × 4 × 5 = **200 pins per URL** × 7 = **1,400 pins**
- **"Fresh" ≠ new content.** A fresh pin = new unique combo of image + title + description + URL + board.
- **The Rotation** (M3.3 second video): spacing logic guarantees the same URL+board combo never repeats within 7 days. "Trust the spreadsheet."
- **Posts 7 pins/day.** Output → Notion Social (paid, auto) OR Pinterest native bulk upload (free, manual).

### D3. OS operating procedure (restated)
1. **Set the 4 pillars = 4 themes** (Email, Pinterest, BoH Systems, Productivity), each with offer + freebie + POV.
2. **Monthly rotation:** assign one theme per week (W1 Email, W2 Pinterest, W3 BoH, W4 Productivity).
3. **Per theme week, batch 3 posts by role:** Education (freebie-led, opens) → Offer (product/webinar, converts) → Friday For The Girls (brand world).
4. **Attach the slot's product + verbatim chat word** from §C.
5. **Feed cornerstones into the 7×10×4×5 Pinterest engine** for evergreen traffic underneath the IG layer.
6. **Overlay promo windows / launches** (§E) on top when a conversion event or buying window fires.

---

## E. The monthly / promo overlay layer

The weekly grid is the always-on baseline. On top of it, promos and launches are planned via the **Promo Copy Planner** (M4.1), which is event-driven, not week-of-month driven.

Source: [[Library/Programs/back-of-house/4. Soft Sales System/4.1 Promo Copy Planner]].

- **Three email tracks per conversion event** (the psychological journey):
  - **PTR — Push to Register** (the invites): 4 emails (Announcement → Logical → Emotional → 1hr-before) + 5 social posts
  - **PTS — Push to Show** (the reminders, registrants only): 5 emails (You're In → Tomorrow → 1 Hour → Starting Now → 48hr Replay) + 5 social posts
  - **PTB — Push to Buy** (the sales emails, everyone): 5 emails (Announcement → Logical → Emotional → Last Day → Short&Sweet) + 5 social posts
- **Reusable blurb/snippet written first** unlocks consistency across all 14+ emails.
- **How it overlays the grid:** the PTR/PTS/PTB **social posts** map onto the weekly post slots during a launch window (e.g., the Feb Pinterest weeks doubled as Slowly Viral webinar PTR/PTS — see the VIRAL posts 02-19, 02-24, 03-07 which are Webinar RSVP / replay = promo overlay riding the Pinterest theme).
- **Buying windows / seasonal:** "Feb is the new Jan" (02-01) and seasonal FTG posts (Valentines 02-14, March affirmations 03-07) show monthly-moment framing layered onto the theme. Black Friday / holiday advent-calendar promos exist in Journal ideas (2023-10-20, 2024-07-16) — seasonal promo windows are a known layer but not yet formalized into the grid. **Partial GAP.**
- **Funnel chains** (BUSINESS.md) drive which tripwire the promo pushes: Email List Revival Plan → List Resuscitator; 5M Newsletter → Unignorable bump; 90d Clock In → Promo Planner 50% bump; Soft CEO Sessions → Soft CEO Monthly; 90 Minute Reset → $111 OTO; BOH → Rush Order (placement undecided).

---

## F. Gaps (need her gold-standard input)

1. **Weekday anchoring of Education vs Offer.** Only *Friday = For The Girls* is proven. Whether Education = Monday and Offer = Wednesday (or another split) is undocumented.
2. **Email — Offer slot** — no real post example. Which email product converts in Week 1? (candidates: List Resuscitator $11, 5 Minute Newsletter $19, Unignorable Subject Lines $9).
3. **Email — For The Girls slot** — no real post.
4. **BoH Systems — Education slot** — no real post (only Offer + FTG documented). Which freebie opens BoH week — The Numbers? Biz Tracker?
5. **Productivity — Education slot** — no real post (only Offer + FTG documented). Candidate freebies: Quarter Prompt (Claude), Soft CEO Sessions (Softceo).
6. **Sales theme** — a valid 5th theme with zero documented posts and no week slot. Is it a 5th-week slot, or purely promo-window overlay? Which products (Daily Profit Activities $47, Promo Planner $59)?
7. **5th-week behavior** — months with a 5th week have no defined theme/type.
8. **Seasonal promo windows** (Black Friday, holidays, "Feb is new Jan") — known but not formalized into the grid as recurring buying windows.
9. **Chat words marked `manual`** in BUSINESS.md (Bingeable Newsletters, The Numbers, Biz Tracker, 5 Minute Newsletter, A Year of Emails, Daily Profit Activities, Promo Planner, Best Year Yet, 90 Minute Reset, Quarter in a Day) — need verbatim words from Notion before those slots go live.

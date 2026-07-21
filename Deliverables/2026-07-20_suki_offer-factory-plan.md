---
date: 2026-07-20
author: suki
type: plan
status: awaiting-alyssa
task: tsk-2026-07-16-003
tags: [offers, pipeline, tripwires, rush-order]
---

# The Offer Factory — a plan to react to

**One-line:** Take the 3-stage lead-magnet machine you loved and add the three things paid needs — a checkout, a "you left something" email, and a purchase-triggered delivery — so a small paid offer ships as smoothly as a freebie does.

This is a plan, not a build. Read it, push back, and give me the decisions at the bottom. Nothing gets made until you do.

---

## The idea in one picture

Your lead-magnet pipeline is three moves: **write it → build the opt-in page + delivery email → flip it live in Kit.** A Notion DB tracks each one through Draft → Ready → Execute → Complete, and one thing (the Kit form UID) is a deliberate manual gate because Kit's API can't do it.

Paid is the same spine with three additions:

| Lead magnet has | Paid offer also needs |
|---|---|
| Opt-in landing page | **Sales page** (price, proof, guarantee) + **ThriveCart checkout** |
| Delivery email | Delivery email **+ an "oops" email** (abandoned checkout / recovery) |
| Kit form → delivery sequence | **Purchase tag → delivery sequence** (and abandoned-cart tag → oops) |
| Free = no gate on money | A **fulfillment gate** for high-contact offers (calls, spots, capacity) |

So: same rhythm, same Notion-tracked, same "one manual gate we can't automate away." The manual gate just moves from *Kit form UID* to *ThriveCart product + its Kit purchase tag*.

---

## The pipeline — 4 stages

I kept it to the same shape as the lead-magnet flow. Stage names below are placeholders for the eventual slash-commands; mirror the freebie names (`/offer`, `/sales-page`, `/execute-offers`).

### Stage 1 — `/offer` (research + write)
**Mirrors:** `/lead-magnet`
**Produces:**
- The offer's Notion content page (source of truth for what's *in* the offer — the ITO / deliverables).
- A pipeline entry in a new **Offer Factory Pipeline** Notion DB, Status = `Draft`.
- Slug, price, positioning angle, "who it's for."
**Reuses:** Hermes JUDGMENT layer for voice (same `Studio/Hermes/SOURCES.md` route the freebie writer uses); the offer's existing Library card under `Library/Offers/<slug>/`.
**Human gate:** You review the content page and advance Draft → `Ready` in Notion. Same as freebies — the command never advances past Draft on its own.

### Stage 2 — `/sales-page` (sales page + checkout)
**Mirrors:** `/landing-page`, but a sales page persuades and takes money; an opt-in page just collects an email.
**Produces:**
- Sales page HTML at `website/offers/<slug>.html`, built from your existing sales-page templates (the VIP Day page style for a standalone, the MPQ VIP style for an in-funnel upsell — both already named in your Rush Order notes).
- The checkout wiring: a ThriveCart **buy button / embed** on the page pointing at that offer's ThriveCart product URL. If the ThriveCart product ID isn't filled in yet, the page ships with a clearly-marked placeholder button instead of a dead link — exactly how the freebie page handles a missing Kit form UID.
**Reuses:** the same design system the freebie landing pages use (oat/linen, AT KING/Georgia, light-dark toggle) so paid pages look like family; your two ThriveCart page-style references.
**Human gate:** You decide **standalone page vs in-funnel OTO** (this is already an open question in your Rush Order notes), and you set the price on the page. You also create the ThriveCart product itself — like the Kit form, that's a manual step outside the pipeline.

### Stage 3 — `/sales-page` continued: delivery email **+ oops email**
Bundled into Stage 2's command like the freebie's delivery email is bundled into `/landing-page`.
**Produces two emails, saved to `offer-system/reference/emails/<slug>-*.md`:**
1. **Delivery email** — fires on purchase. For a *file/access* offer this hands over the link (same as a freebie delivery email). For a *high-contact* offer it does something more: welcomes them, sets expectations, and hands them the **booking link + group invite** — because the "product" is your time, not a PDF.
2. **Oops email** — fires when someone hits checkout and doesn't finish. Short, warm, "looks like the kitchen order didn't go through — here's your link back," optionally a nudge on the early-joiner bonus or spot scarcity.
**Reuses:** Hermes voice; your existing delivery-email format (`{{ subscriber.first_name }}`, Alyssa / alyssacoleman.ca byline, the honest-PS pattern).
**Human gate:** You approve both emails before they get wired. Advance `Ready` → `Execute`.

### Stage 4 — `/execute-offers` (wire it up + go live)
**Mirrors:** `/execute-lead-magnets`
**Produces / does:**
- Creates the Kit **delivery sequence** (`[Delivery] <Offer>`) and drops the delivery email in as email 1.
- Creates the **oops sequence/broadcast** (`[Recovery] <Offer>`) with the oops email.
- Verifies the ThriveCart product ID is present and the sales-page button isn't still the placeholder — if it is, it does **not** mark Complete (same guard the freebie pipeline uses for a pending Kit UID).
- Marks Status = `Complete`, commits the page + emails.
**Reuses:** the exact Status-gating / idempotency / "safe to re-run" logic from `/execute-lead-magnets`.
**Human gate:** the wiring that has no API is yours: in ThriveCart, connect the product's **"purchase" behaviour to apply a Kit tag** (e.g. `purchased-rush-order`) and its **abandoned-cart behaviour to apply a tag** (e.g. `abandoned-rush-order`). Those two tags are what trigger the Kit sequences. This is the paid pipeline's one true manual gate — the analog of creating the Kit form.

---

## The Notion DB — mirror, plus a few paid fields

New DB **Offer Factory Pipeline**, same Status lifecycle as Lead Magnet Pipeline (`Draft → Ready → Execute → In Progress → Complete`). Fields:

- Everything the freebie DB has: Name, Status, Slug, Notion URL, Sales URL.
- **Price** (number)
- **Offer mode** (select: `Standalone` / `OTO-in-funnel`)
- **Delivery type** (select: `File/access` / `High-contact`) — this decides whether the delivery email hands a link or a booking flow
- **ThriveCart Product ID** (text) — the manual gate field
- **Kit purchase tag** / **Kit abandoned tag** (text)
- **Spots cap** (number, blank = unlimited) — for capacity-limited high-contact offers

---

## Rush Order through the pipeline (the first pilot)

Walking the real thing through, concretely:

- **Stage 1 — write:** Almost free. The content page writes itself from `2026-06-03-rush-order-copy.md` — the ITO is already there (Prep Work / Order Flow / House Call / Notion Dash), price is $2,999, positioning is "Back of House on 2x speed." Library card exists at `Library/Offers/rush-order/`. Status → Draft, you glance, → Ready.
- **Stage 2 — sales page:** Full standalone sales-page copy (v2) already exists in the copy doc — headline, How It Works, Who It's For, What You Walk Away With, The Investment. Build it on the **VIP Day page style** if standalone, **MPQ VIP style** if you run it as the BOH order-bump/OTO. This is the one open decision your own notes flag. ThriveCart product for $2,999.
- **Stage 3 — emails:** Delivery email is **high-contact type** — it doesn't hand over a file, it hands over the **kickoff-call booking link** and welcomes them into the 6-week build. Oops email leans on the **Story Mining early-joiner bonus** ("6 are already gone") as the recovery nudge — that scarcity line is already written.
- **Stage 4 — wire + live:** ThriveCart `purchased-rush-order` tag → `[Delivery] Rush Order` sequence; `abandoned-rush-order` tag → `[Recovery] Rush Order`. Because it's high-contact with your calendar on the line, set a **Spots cap**.

### Sanity-check against your mini-program-inspo shape
Your 2021-12-20 sketch is the ruler: **light delivery, high contact, students set their own goals, and pointedly NO weekly modules** — just calls, a group, emails, reminders.

- **Fits ✅** — Rush Order is done-with-you and high-contact: a kickoff call, a co-working session, a custom blueprint, your hands on their system. That's the "VIP chef in the kitchen" energy, not a content treadmill.
- **Watch ⚠️** — the one place Rush Order could drift from your shape is **the Notion Dash + templates** reading like a module library. Keep it framed as *their live workspace we build together*, not a course you log into. Same for the "Execution Checklist" — a shared to-do, not lessons.
- **Honest flag 🚩** — the task title says "tripwires and small offers," and your inspo note is a *small* offer. Rush Order at **$2,999 high-touch is neither a tripwire nor small** — it's the top end of what this pipeline should carry. It's a great pilot for the *high-contact lane* and it de-risks the whole factory because the copy's already written. But it won't exercise the *low-ticket, file-delivery, self-serve tripwire* lane at all. So it proves half the machine. That's fine for pilot #1 — just know pilot #2 should be an actual small/file offer.

---

## Decisions I need from you

1. **Rush Order placement — standalone sales page or in-funnel OTO after BOH?** This is the fork your own notes left open, and it decides which template Stage 2 builds from (VIP Day vs MPQ VIP). Pick one for the pilot; the factory can support both modes later.

2. **Is ThriveCart the checkout of record** (with Kit tags for purchase + abandoned as the trigger), or do you want to try Kit Commerce and keep money and email under one roof? This sets what the "one manual gate" actually is. I've planned for ThriveCart because that's what your notes already reference — confirm or redirect.

3. **Two lanes, or one?** Rush Order is high-contact. Do you want the very first pipeline build to also handle **low-ticket self-serve tripwires** (delivery = a file, no calls, no cap), or build the high-contact lane first with Rush Order and add the tripwire lane as a fast-follow? My lean: build both delivery types into the Notion DB from day one (it's one extra field), but pilot only the high-contact lane with Rush Order so we ship something real fast.

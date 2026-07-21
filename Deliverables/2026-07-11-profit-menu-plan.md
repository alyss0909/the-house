# The Profit Menu — evolution plan

_Owned by [[tsk-2026-07-20-001-profit-menu-finish-build]]. Executed against in [[Deliverables/2026-07-16-profit-menu-handoff]]. Signal: `boh-daily-profit-activities` in [[Studio/Signals/signals-index]]. Offer facts: [[Library/Offers/the-daily-profit-activities/MAP]]._

Turning the *Daily Profit Activities* Notion template into **The Profit Menu**: same satisfying "pick by your energy" mechanic as the Dopamine Biz Boost, but fully your content, your kitchen metaphor, your soft-gorl BOH voice.

## The core idea

Your whole brand is already a kitchen — Sweet Segment, Simmer Story, Sign Off Specials, Back of House, "flavour enhancers." So the page isn't a "dashboard," it's a **menu**. Two tiers of content:

- **The House Classics** = your OG non-negotiables (the daily core: GROW 🌱 / MIND 🧠 / NOURISH 💦 / OFFER 💵). Short, self-explanatory, already good.
- **The Flavour Enhancers** = your newest ideas (Sweet Segments, Simmer Stories, Right-Time Offers + the one-off boosters). Richer descriptions, rewritten in your voice.

Both live in **one filterable database**, so people (and you) can sort by category · department · energy · time and pick what matches the day.

## What we keep vs cut

- **Keep:** OG NN tab (the 4-department classics) + NEWEST Ideas tab (flavour enhancers).
- **Cut:** the other tabs with weak descriptions.
- **Dedup:** the NEWEST tab has repeats (e.g. Inbox Mystic ×3, Sneak Peek ×2) — keep the strongest version of each, delete the rest.
- **Rewrite:** all Flavour Enhancer copy → your voice, using your 4-part description template (Hook → Why It Works → How-To → Tie-In to Offer).

## The database schema (so the CSV imports clean)

One Notion database, these properties:

| Property | Type | Values |
|---|---|---|
| Activity | Title | e.g. "The Sneak Peek" |
| Menu Section | Select | House Classic · Sweet Segment · Simmer Story · Right-Time Offer · Flavour Enhancer |
| Category | Select | 🌱 GROW · 🧠 MIND · 💦 NOURISH · 💵 OFFER |
| Department | Multi-select | 💌 Email · 💰 Promos · 🥖 Content · 📁 Internal · 💻 Client Work · 📌 Pinterest |
| Energy | Select | 🐌 low · 🐌🐌 medium · 🐌🐌🐌 deep |
| Est. Time | Select | 🧸 5 min · ☕ 30 min · 🌶️ 1 hr |
| Description | Text | the good copy |
| Plate it (Select for today) | Checkbox | feeds Today's Order |
| Done | Checkbox | clears from Today's Order |

> Your Flavour Enhancers tab already has Category / Department / Energy / Time filled — that's most of the schema done. The OG classics just need Energy + Time added (quick pass).

## The page layout (mirrors Dopamine Biz Boost)

- **Hero callout** — "The Profit Menu" + a warm one-liner.
- **Left column · Today's Order** — the "Plate it" = true view. Check Done → it clears.
- **Right column · How to Order** — 6-step key in your voice + energy/time legend.
- **Full-width · The Full Menu** — the database with saved views (All / by category / by time).
- **Footer · "There's more where this came from"** — soft nudge to BOH.

## The roadmap

1. **Approve the layout** (the mockup) — tweak colors, section names, copy. ← *you are here*
2. **Lock the schema** (above) so the CSV columns match.
3. **You clean the sheet** — cut weak tabs, dedup, add Energy/Time to OGs, rewrite Flavour Enhancer copy using your 4-part template.
4. **Export → CSV → import to Notion** — creates the database.
5. **I build the live page** around it — two-column layout, saved views, images, final voice copy.
6. **Polish** — icons/covers, the "more where this came from" block, mobile check.

## The original TODOs — mapped

- ✅ *Turn into the profit menu + revamp the list into little boosters* → House Classics + Flavour Enhancers structure.
- ✅ *Make it like the dopamine layout with images + a "today" spot* → Today's Order column.
- ✅ *Edit category text to soft-gorl BOH vibes* → step 3 rewrite + step 5 page copy.
- ✅ *Add "more where this came from"* → footer block.

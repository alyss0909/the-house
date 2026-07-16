# The Profit Menu — Project Handoff

_Notion database: "The Profit Menu" (Daily Profit Activities) · Prepared by Alyssa's assistant · July 16, 2026_

Related: [[Deliverables/2026-07-11-profit-menu-plan]] — the original evolution plan this session's work executes against. [[Library/Offers/the-daily-profit-activities/MAP]] — offer facts (price $47, status needs_edits, sales page alyssacoleman.ca/slo).

## 1. What This Project Is

"The Profit Menu" is a Notion database of Daily Profit Activities — a menu of marketing/business-building tasks Alyssa (and her audience) can pick from each day. Each activity lives in one of four categories, each with its own icon/theme:

- Grow 🌱 — audience & visibility building (16 activities)
- Mind 🧠 — mindset & self-care (16 activities)
- Nourish 💦 — nurturing your audience/list (16 activities)
- Offer 💵 — sales & promotion (17 activities)

Activities are also tagged by Type: "House Classic" (core, always-relevant activities) and "Flavour Enhancer" (optional variety), with some Flavour Enhancers further tagged Simmer Story, Sweet Segment, Right Time Offer, or Sign Off Specials.

Each of the 4 categories also has "The Big Four" — one flagship House Classic activity per category, linked via a relation property. This was broken and has been fixed (see Section 2).

## 2. Completed This Session

### 2.1 — Fixed "The Big Four" relation bug

Root cause: (a) 4 divider pages ("[the Details]") were mistakenly tagged Type = House Classic, inflating each category's count to 11 instead of 10, and (b) most real House Classic activities never actually had their "The Big Four" relation value set, despite earlier attempts claiming it was done.

Fix: stripped the incorrect Type tag (and one stray relation) from the 4 divider pages, then set "The Big Four" relation on every House Classic activity that was missing it. Verified via direct SQL in both directions — all four categories now show exactly 10/10 House Classics correctly linked to their Big Four page, and each Big Four page shows exactly 10 linked House Classics back.

### 2.2 — Rolled out custom cover icons to 42 of 65 activities

Alyssa designed a set of custom icon images in Canva (one per activity — cat for "Cat Mode", dice for a game-themed activity, etc.) intended to show as the card image throughout the database.

**Important bug found & fixed:** the database has a "Card Cover" property, but it is a plain URL (text link) property — Notion cannot render a URL property as an image no matter what link is in it. That is why nothing was showing up visually. The fix was to stop using that property and instead set the activity page's native Notion cover (the banner image), which IS rendered properly and is what gallery/board views pull from. This was verified visually via screenshot before rolling out to all 42.

Working image source: Alyssa's icon PNGs are hosted in a shared Google Drive folder (link in Section 4). The reliable hotlink format for Notion is:

```
https://drive.google.com/thumbnail?id={fileId}&sz=w1000
```

(The more obvious `https://lh3.googleusercontent.com/d/{fileId}` format did NOT reliably work — avoid it.)

**Workflow going forward:** Alyssa exports/finishes an icon in Canva → uploads the PNG as-is (unedited) to the "Profit Menu Icons" Drive folder → grab the file's ID from Drive → set it as that activity's page cover in Notion using the URL format above via the "cover" field on the page (not the "Card Cover" property, which should be considered deprecated/unused going forward).

### 2.3 — Icons matched & applied (42 activities)

Icons were matched to activities primarily by visual association (e.g. a cat photo → "Cat Mode", a martini glass → "Live Event"). Round 1 (21 activities) were confirmed/established together with Alyssa directly; Round 2 (21 activities) were matched independently per her instruction and should be spot-checked by whoever picks this up, since a handful were judgment calls.

**Round 1 — confirmed with Alyssa:**

|Category|Activity|Notes|
|---|---|---|
|Mind 🧠|Cat Mode|gray/white cat face|
|Grow 🌱|Pitch a Collab||
|Offer 💵|Pitch Live||
|Mind 🧠|Morning Lines||
|Offer 💵|Someone Else's Audience||
|Mind 🧠|Inspiring Podcast|Game Boy-style radio|
|Mind 🧠|Spa Break|cinnamon roll|
|Offer 💵|Voice Note|black volume knob|
|Mind 🧠|Wander & Wonder|baby deer/fawn|
|Mind 🧠|Love Bomb Yourself|black bra|
|Mind 🧠|Close One Tab|bar of soap|
|Offer 💵|Book a Call|teal rotary phone|
|Mind 🧠|Wealth Consciousness Book|stack of books|
|Nourish 💦|Aux Girlie|sugar bag|
|Grow 🌱|Offer Matchmaker|orange|
|Mind 🧠|Visualise Your Goal|vintage Mac w/ eye graphic|
|Nourish 💦|Blog Post|laptop + coffee|
|Grow 🌱|Post YouTube Vid with CTA|camcorder|
|Nourish 💦|Podcast|earbuds + claw clip|
|Nourish 💦|Stories|camera + pearl bracelet|
|Mind 🧠|Centering Yoga|seashell|

**Round 2 — matched independently (spot-check recommended):**

|Category|Activity|Notes|
|---|---|---|
|Offer 💵|Secret Bonus|tomato tied w/ ribbon|
|Mind 🧠|Meditation|full moon|
|Mind 🧠|5 Minute Journal|espresso cup|
|Offer 💵|The P.S.|torn receipt/note|
|Offer 💵|Template Spotlight|stack of file folders|
|Grow 🌱|Hot Take|folded newspaper|
|Nourish 💦|Mini Workshop|vintage Macintosh computer|
|Grow 🌱|Guest Blog|Ctrl key close-up|
|Offer 💵|Humble Brag|cash / dollar bills|
|Offer 💵|Call Back|dark vintage rotary phone|
|Nourish 💦|IG Nourisher|cut fig|
|Nourish 💦|Screenshot Resurection|pink floppy disk|
|Mind 🧠|Abundance Audio|coffee carafe|
|Grow 🌱|Add a Content Upgrade|open book|
|Offer 💵|Perk Alert|red ribbon bow|
|Offer 💵|Waitlist|service/desk bell|
|Nourish 💦|Confession Email|ashtray + cigarette|
|Offer 💵|Live Event|martini glass|
|Offer 💵|Sign Off Specials|blue vintage alarm clock|
|Nourish 💦|Welcome Message|stack of pancakes|
|Grow 🌱|Pop In|bowl of olives|

## 3. Still Missing Icons — 23 Activities

These activities have no cover image yet. Two are intentionally paused per Alyssa; the rest are simply not yet started.

|Category|Activity|Notes|
|---|---|---|
|Grow 🌱|Client Crush||
|Grow 🌱|Create & Post Pins||
|Grow 🌱|Host a Live Event||
|Grow 🌱|IG Post with a link||
|Grow 🌱|IG Story About Your Freebie||
|Grow 🌱|Mention Your Freebie Live||
|Grow 🌱|Pitch a Podcast||
|Grow 🌱|Post to Groups||
|Grow 🌱|Summit||
|Mind 🧠|Hype Up Video||
|Mind 🧠|Montage Music||
|Mind 🧠|Tapping||
|Nourish 💦|Hot New Thing|**PAUSED** — Alyssa has a different concept in mind, TBD (orange icon went to Offer Matchmaker instead)|
|Nourish 💦|Love Letter||
|Nourish 💦|Plot Twist||
|Nourish 💦|Show Your Notebook|**PAUSED** — Alyssa asked to hold off on this one|
|Nourish 💦|Simmer Email||
|Nourish 💦|Solve Live||
|Nourish 💦|Voice Note Segment||
|Offer 💵|Host a Joint Training||
|Offer 💵|Made for you||
|Offer 💵|Mini Case Study||
|Offer 💵|Send a Promo Email||

## 4. Key Links & Resources

**Notion database — "The Profit Menu":** https://app.notion.com/p/39ec8b43e5658002a691c562283cd1e1

**Google Drive — "Profit Menu Icons" folder (source PNGs, publicly viewable):** https://drive.google.com/drive/folders/1FizVn75nzzrGvhwDK9EqtrJilNYa3Piw

Note: this Drive folder also still contains one unused icon — a "clipboard with papers" image (originally filename `8.png`) — that was deliberately not assigned to any activity yet per Alyssa's instruction to "keep the clipboard aside." It may be intended for "Show Your Notebook" but that hasn't been confirmed.

## 5. Open Items / Next Steps for Whoever Picks This Up

- Design + source the remaining 21 icons (23 minus the 2 paused ones) in Canva, following the same unedited-PNG-to-Drive workflow in Section 2.2.
- Spot-check the Round 2 matches in Section 2.3 with Alyssa — a few (tomato+ribbon → Secret Bonus, Ctrl key → Guest Blog, ashtray+cigarette → Confession Email) were the assistant's best guess, not confirmed.
- Resolve "Hot New Thing" — Alyssa mentioned she has a different icon concept in mind and will follow up.
- Resolve "Show Your Notebook" and the unused clipboard icon — Alyssa asked to pause both; check in with her before assigning.
- Do NOT use the "Card Cover" property for new icons — it's a broken/legacy URL field. Always set the native page cover instead (see Section 2.2 for the exact URL format).

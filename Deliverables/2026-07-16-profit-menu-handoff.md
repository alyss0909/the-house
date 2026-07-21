# The Profit Menu — Project Handoff

_Notion database: "The Profit Menu" (Daily Profit Activities) · Prepared by Alyssa's assistant · July 16, 2026_

Open work from section 5 is tracked in [[tsk-2026-07-20-001-profit-menu-finish-build]].

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

### 2.4 — Round 3 applied (14 activities, July 21)

Alyssa delivered 18 new icons. Fourteen were matched and applied, bringing the database to 56 of 65 covered. Same method as 2.2 (native page cover, Drive thumbnail URL). Section 3 below is the pre-Round-3 list and is superseded by Section 6.

|Category|Activity|Icon|
|---|---|---|
|Grow 🌱|Create & Post Pins|pink milk crate|
|Grow 🌱|Host a Live Event|lips|
|Grow 🌱|IG Story About Your Freebie|chocolate squares|
|Grow 🌱|Post to Groups|bagel|
|Grow 🌱|Summit|sardine tin|
|Mind 🧠|Hype Up Video|red chili peppers|
|Mind 🧠|Montage Music|iPod|
|Nourish 💦|Love Letter|paper note strip|
|Nourish 💦|Plot Twist|spilled coffee mug|
|Nourish 💦|Simmer Email|snail|
|Nourish 💦|Solve Live|fortune cookie|
|Offer 💵|Made for you|takeout thank-you bag|
|Offer 💵|Mini Case Study|plate with butter knife|
|Offer 💵|Send a Promo Email|"be your own sugar daddy" mug|

Alyssa ruled on the two mugs in this batch: the "be your own sugar daddy" mug is in, the "Main Character" mug is out (its phrase already appears on the sardine tin).

## 3. Still Missing Icons — 23 Activities (pre-Round-3, superseded by Section 6)

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

## 6. Round 4 — full once-over (July 21, 2026)

Alyssa reviewed the whole gallery and called two mismatches. Both were right and both were applied, along with four moves that fell out of them.

|Activity|Now has|Was|Why|
|---|---|---|---|
|Spa Break|pink soap|cinnamon roll|Alyssa's call. The activity is a spa water break, so soap beats a pastry.|
|Hot New Thing|red chili peppers|(empty)|Alyssa's call. "Hot" reads literally. Unpaused — she released this one.|
|Show Your Notebook|composition notebook|(empty)|Unpaused by Alyssa. Exact match, and it retires the set-aside clipboard guess.|
|Close One Tab|dish rack|pink soap|Dishes done and drying is the same "you're finished, walk away" beat as the activity.|
|Hype Up Video|fried egg|red chili peppers|Sunny side up. Weakest match on the board — swap it when better art exists.|
|Client Crush|cinnamon roll|(empty)|"Cinnamon roll" is the idiom for a sweet, lovable person. Freed up by the Spa Break swap.|

**State: 59 of 65 covered.** Every delivered icon is now in use except one.

**Still needs new art (6).** Each needs something specific; the general-purpose objects are used up.

|Category|Activity|What the icon needs to be|
|---|---|---|
|Grow 🌱|IG Post with a link|something link-shaped: a paperclip, a chain, a hook|
|Grow 🌱|Mention Your Freebie Live|a mouth or a mic (lips went to Host a Live Event)|
|Grow 🌱|Pitch a Podcast|a mic or headphones (earbuds went to Podcast)|
|Mind 🧠|Tapping|a hand or fingertips|
|Nourish 💦|Voice Note Segment|something audio (iPod went to Montage Music)|
|Offer 💵|Host a Joint Training|two of something, a pair|

**Unused icons (3).** The clipboard-with-blank-paper from the original batch, plus the laundry basket and the "Main Character" mug from Round 3. Alyssa ruled the Main Character mug out because the sardine tin already carries that phrase. Nothing else fits the other two, so they stay in Drive rather than getting forced onto a card.

## 6b. Round 5 — clarity pass over all 65 (July 21, 2026)

With the contact sheet making every icon visible at once, Alyssa asked for a pass on which pairings were a stretch. Four upgrades applied.

|Activity|Now has|Was|Why|
|---|---|---|---|
|Someone Else's Audience|sardine tin|train ticket|A tin packed with fish reads as a crowd that isn't yours. Alyssa flagged the ticket as a stretch and was right.|
|Summit|train ticket|sardine tin|A summit is the ticketed event. The ticket's clearest home on the board.|
|5 Minute Journal|clipboard with blank paper|espresso cup|A blank page to fill. Puts the last unused original-batch icon to work.|
|Hype Up Video|espresso cup|fried egg|A shot of energy. Retires the fried egg, which was the weakest match on the board.|

**Fifth move, approved separately.** The Ctrl key moved off Guest Blog, where it meant nothing, onto **Close One Tab** — Ctrl+W literally closes a tab, the most precise association anywhere in the set. Guest Blog is now empty and on the needs-art list, and the dish rack came off Close One Tab and is unused.

**State after Round 5: 58 of 65 covered, 7 empty, 3 icons unused.** See Section 8 for the outstanding art list.

**Stretches with no better option in the library.** Each would need new art to fix; none is wrong enough to leave a card blank over.

- Offer Matchmaker (orange) — the orange carries no meaning here. Wants two things clicking together, or a key and lock.
- Abundance Audio (coffee carafe) — not audio at all, though a full pot does read as abundance. Every audio icon in the library is doing clearer work elsewhere.
- Aux Girlie (sugar box) — the sugar matches the activity's Sweet Segment tag, not the activity. The volume knob would be clearer but it is earning its place on Voice Note.
- Pitch a Collab (7-ball) — pool as a game you play with someone else. Mild but it holds.
- Morning Lines (cereal bowl) — reads morning, not writing.

## 7. The icon contact sheet — read this before touching Drive

**Drive filenames are meaningless and actively misleading.** `spa.png` is a Game Boy radio, not a spa image. `wander.png` is a black volume knob. `event.png` is a stack of books. Never pick an icon by its filename.

A labeled contact sheet of all 41 original-batch icons lives at [[Library/Offers/the-daily-profit-activities/assets/profit-menu-icon-contact-sheet.png]]. Labels are the Drive filenames, so it maps filename to actual image at a glance. Regenerate it by downloading `https://drive.google.com/thumbnail?id={fileId}&sz=w300` for each file and tiling them.

Which file is which, for the original batch:

|File|Image|Activity|
|---|---|---|
|`10 (1)`|ashtray and cigarette|Confession Email|
|`10`|gray and white cat|Cat Mode|
|`11 (1)`|Ctrl key|Guest Blog|
|`11`|maroon 8-ball|Pitch a Collab|
|`12 (1)`|folded newspaper|Hot Take|
|`12`|pink seashell|Centering Yoga|
|`13 (1)`|vintage Macintosh|Mini Workshop|
|`13`|two dice|Pitch Live|
|`14 (1)`|torn receipt|The P.S.|
|`14`|pink bowl of cereal|Morning Lines|
|`15 (1)`|pink floppy disk|Screenshot Resurection|
|`15`|sugar box|Aux Girlie|
|`16`|tomato tied with ribbon|Secret Bonus|
|`17 (1)`|manila file folders|Template Spotlight|
|`17`|train ticket|Someone Else's Audience|
|`18`|coffee carafe|Abundance Audio|
|`19 (1)`|open book|Add a Content Upgrade|
|`19`|cinnamon roll|Client Crush (moved off Spa Break)|
|`2 (1)`|cut fig|IG Nourisher|
|`2`|orange|Offer Matchmaker|
|`20`|dark rotary phone|Call Back|
|`21 (1)`|desk bell|Waitlist|
|`21`|fawn|Wander & Wonder|
|`22`|full moon|Meditation|
|`3 (1)`|red ribbon bow|Perk Alert|
|`3`|laptop and coffee|Blog Post|
|`4 (1)`|bowl of olives|Pop In|
|`4`|earbuds and claw clip|Podcast|
|`5 (1)`|martini glass|Live Event|
|`5`|camera and pearl bracelet|Stories|
|`6 (1)`|stack of pancakes|Welcome Message|
|`6`|vintage Mac with eye|Visualise Your Goal|
|`7 (1)`|blue alarm clock|Sign Off Specials|
|`7`|camcorder|Post YouTube Vid with CTA|
|`8 (1)`|espresso cup|5 Minute Journal|
|`8`|clipboard with blank paper|**unused**|
|`9 (1)`|cash|Humble Brag|
|`9`|teal rotary phone|Book a Call|
|`event`|stack of books|Wealth Consciousness Book|
|`love bomb`|black bra|Love Bomb Yourself|
|`wander`|black volume knob|Voice Note|
|`spa`|Game Boy radio|Inspiring Podcast|
|`spa (2)`|pink soap|Spa Break (moved off Close One Tab)|

Round 3's files are all named `Template*.png` and are listed in Section 2.4 by image.

### On renaming the Drive files

The connected Google Drive tools can search, read, copy, and create, but cannot rename. Renaming would have to happen another way.

Worth knowing: **renaming in Drive is safe.** Notion page covers point at Drive file IDs, not filenames, and a rename preserves the ID. So renaming files by hand in the Drive UI will not break a single cover. What is NOT safe is re-uploading renamed copies — a copy gets a new ID, which would break every cover pointing at the original and mean resetting all 60 by hand.

Given the table above already does the job renaming was meant to do, the recommendation is to leave the filenames alone. If she wants real names anyway, the cheapest correct path is a one-time script against the Drive API using `files.update` (preserves the ID), which is a Mack task, not something to do by hand across 60 files.

## 8. Outstanding art list (as of Round 5, July 21, 2026)

**58 of 65 covered.** Seven activities are empty and three delivered icons are unused. None of the three unused icons fits any of the seven empty activities, so they are orphaned rather than forced.

### Orphaned icons — no home on the board

|Icon|Drive file|Note|
|---|---|---|
|dish rack|`Template (10).png`|Held Close One Tab until the Ctrl key took it. Reads "chores," not "abundance."|
|laundry basket|`Template (11).png`|Never found a home.|
|fried egg|`Template (14).png`|Held Hype Up Video until the espresso took it.|

The "Main Character" mug from the Round 3 batch was ruled out by Alyssa and never uploaded to Drive.

### Empty activities and what each needs

|Category|Activity|What the icon should be|
|---|---|---|
|Grow 🌱|Guest Blog|writing done on someone else's turf — a typewriter, a byline, a doorstep|
|Grow 🌱|IG Post with a link|something link-shaped — a paperclip, a chain, a hook, a safety pin|
|Grow 🌱|Mention Your Freebie Live|a mouth or a mic|
|Grow 🌱|Pitch a Podcast|a mic, a boom arm, headphones|
|Mind 🧠|Tapping|a hand or fingertips|
|Nourish 💦|Voice Note Segment|a cassette, a Walkman, a soundwave|
|Offer 💵|Host a Joint Training|two of something — a pair|

### Optional replacements for known stretches

|Activity|Currently|Wants|
|---|---|---|
|Offer Matchmaker|orange|something romantic or matched — a key and lock, two halves, a wax seal|
|Abundance Audio|coffee carafe|something full AND audio — a stuffed Walkman case, a boombox, an overflowing jar with earbuds|

**The audio gap is the real one.** The library has exactly four audio objects (earbuds, volume knob, iPod, Game Boy radio) and all four are doing clear work. Three empty activities plus one stretch all want audio. Any new batch should be audio-heavy.

## 9. Round 6 (July 21, 2026) — 60 of 65

Alyssa uploaded a second Canva batch and called all four placements herself.

|Activity|Now has|Drive file|Was|
|---|---|---|---|
|Offer Matchmaker|matchbox with matches|`25.png`|orange|
|Love Letter|wax-sealed envelope|`Template (19).png`|paper note strip|
|IG Post with a link|"let's get this bread" yellow shirt|`Template (20).png`|(empty)|
|Tapping|"cutie" name tag|`Template (1).png`|(empty)|

The croissant from that Canva batch was never uploaded — no home was found for it (every breakfast slot is taken: pancakes on Welcome Message, cereal on Morning Lines, bagel on Post to Groups).

**Images with no home (5):** dish rack, laundry basket, fried egg, orange, paper note strip.

**Activities with no image (5):** Guest Blog, Mention Your Freebie Live, Pitch a Podcast, Voice Note Segment, Host a Joint Training.

Three of the five gaps still want audio (Mention Your Freebie Live, Pitch a Podcast, Voice Note Segment) and the library has no spare audio object. Guest Blog wants writing-on-someone-else's-turf; Host a Joint Training wants a pair.

## 10. Rounds 7-8 (July 21, 2026) — 61 of 65

Alyssa drove these directly, riffing off the contact sheet.

|Activity|Now has|Was|
|---|---|---|
|Aux Girlie|pink cassette (`_Temp 3.png`)|sugar box|
|Host a Joint Training|cherries (`_Temp 3 (1).png`)|(empty)|
|Guest Blog|espresso cup|(empty)|
|Sign Off Specials|fortune paper strip|blue alarm clock|
|Pitch a Collab|sugar box|7-ball|
|Voice Note|lips|volume knob|
|Podcast|volume knob|earbuds and claw clip|
|Pitch a Podcast|earbuds and claw clip|(empty)|

Two notes on the reasoning. The espresso moved to Guest Blog so the two blog activities read as a pair — Blog Post has laptop-and-coffee, Guest Blog has the cup. And the volume knob went to Podcast rather than Live Event specifically to free the earbuds for Pitch a Podcast, which had been stuck empty; taking Live Event instead would have left it stuck.

Hype Up Video and Host a Live Event were emptied by these moves (they gave up the espresso and the lips).

**Images with no home (6):** dish rack, laundry basket, fried egg, orange, blue alarm clock, 7-ball.

**Activities with no image (4):** Hype Up Video (wants a mirror, megaphone, sunglasses), Host a Live Event (stage, podium, mic stand), Mention Your Freebie Live (a mouth or a mic), Voice Note Segment (cassette, Walkman, soundwave).

**Still weak (1):** Post to Groups (bagel).

## 11. Complete — 65 of 65 (July 21, 2026)

Every activity in The Profit Menu now has a native page cover. Final placements from the last rounds:

|Activity|Icon|
|---|---|
|Book a Call|teal rotary phone (re-uploaded at correct size, `Temp Canva 1 (1).png`)|
|Voice Note Segment|flip phone (`Temp Canva 1.png`)|
|Post to Groups|goats (`_Temp 3 (2).png`)|
|Mention Your Freebie Live|bagel|
|Live Event|blue alarm clock|
|Host a Live Event|martini glass|
|Hype Up Video|`1j035B9KMjJbVYFsnMtFmoBeVUaHzc6Po`|

Both originally paused activities were resolved: Hot New Thing took the chili peppers, Show Your Notebook took the composition notebook.

**Icons with no home (6).** These stay in the Drive folder unused rather than being forced onto a card: dish rack, laundry basket, fried egg, orange, 7-ball, and the superseded oversized rotary phone (`9.png`). The "Main Character" mug was ruled out and never uploaded.

**Method reminder for any future icon:** upload the unedited PNG to the Profit Menu Icons Drive folder, grab its file ID, and set the activity page's native cover to `https://drive.google.com/thumbnail?id={fileId}&sz=w1000`. Never use the "Card Cover" property — it is a plain URL field and Notion cannot render it as an image. Never pick an icon by Drive filename; use the contact sheet and the table in Section 7.

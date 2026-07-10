# Social Media Strategist — Hire Research (SOP-001, Step 2)

- **Date:** 2026-07-07
- **Author:** Pax (Senior Researcher)
- **For:** Nolan (drafts the contract) → new hire identity + working method
- **Scope:** External craft only. Find what already exists to adopt; do NOT reinvent, do NOT design the agent.
- **Doctrine respected:** External craft makes the SYSTEM smarter (tests, taxonomy, mechanics). It never becomes Alyssa's voice or source. Hermes stays the only writer; this hire is a strategist, not a copy source.
- **Builds beyond:** `Deliverables/2026-07-05-social-skills-repo-intake/` (6 repos + 7 Blotato skills) and its 20-rule audit at [[Deliverables/2026-07-05-social-skills-repo-intake/extracted/2026-07-06-repo-alignment-audit]]. Baseline finding I am extending: those repos gave us *testing discipline + taxonomy*, not new hook shapes or on-persona strategist DNA. This brief supplies the two things that intake could not: (1) newer/better on-persona external artifacts, and (2) real practitioner playbooks to ground the identity.

---

## Executive summary

The best on-persona social strategist is not a "viral hook" person — she is a **buyer-psychology editor who hides the sell inside genuinely useful teaching**, engineered around one 2026 truth: **DM sends now beat saves as the top distribution lever.** Three real practitioners map cleanly to Alyssa's persona spec (Katelyn Bourgoin = the "sell-without-selling" brain; the Hormozi/GaryVee give-until-they-ask axis = the DR conversion engine; the design-led editorial-carousel school = the art-girl aesthetic). Of the new external artifacts I found, **three MIT-licensed repos are adopt-worthy for mechanics** (not copy), and the single most important *current* shift since our 2026-07-05 intake is the **sends-per-reach ranking signal** — which our baseline barely touched.

Confidence is **High** on the 2026 mechanics (multiple independent sources incl. Mosseri-attributed) and on the practitioner playbooks (primary books + multiple secondary). **Medium** on the exact internals of the newer repos (README + docs read, code not executed). **Low / flagged** on any single "art-girl brand that blew up" — that archetype is real and well-documented as a *category*, but I could not verify a single named indie account with hard growth numbers from open sources; treat the aesthetic archetype as pattern-level, not one canonical name.

---

## (a) Adopt-worthy repos / prompts / frameworks — shortlist with provenance + exact mechanic

Ranked by transferable value. Everything here is *new since the 2026-07-05 intake* unless noted. "Mechanic" = the specific thing to lift; never the copy.

| # | Artifact | Source | License | The exact transferable mechanic (not vibes) |
|---|---|---|---|---|
| 1 | **social-media-caption-generator-claude** (Roman Knox, @theromanknox, 280K IG) | github.com/rediumvex/social-media-caption-generator-claude | **MIT** | Encodes a **per-platform signal hierarchy** — for IG Carousel it optimizes *saves*; for Reels it optimizes *DM shares* — and states the ranking order **"shares > saves > comments > watch time > likes."** Also ships a "trigger-words that suppress reach" avoid-list and a hook library split by *provocation / curiosity / value / emotion*. Adopt the **signal-hierarchy-by-format table** and the **suppression-word lint** as strategist checklist lines. Built by a working 280K creator = credential, not theory. |
| 2 | **founder-playbook / 100m-leads** (Hormozi's book, operationalized as a SKILL) | github.com/getagentseal/founder-playbook/blob/main/100m-leads/SKILL.md | License **not stated in repo** — flagged; treat as **reference-only, no verbatim reuse** until a LICENSE is confirmed | Turns Hormozi into named, runnable mechanics: **Hook–Retain–Reward**, **Give-Give-Give-Ask cadence**, the **7-step lead-magnet system** ("pick the problem → make it darn good → make it easy to ask for more"), and **Rule of 100**. This is the clean, structured spine for "sell without being salesy" as a *content architecture*, not a slogan. Adopt the **Give-Give-Give-Ask ratio** and **Hook-Retain-Reward** as the strategist's default post-arc logic. |
| 3 | **threads-carousel-claude-skill** (itchernetski) | github.com/itchernetski/threads-carousel-claude-skill | **MIT** (verify LICENSE file at adopt time) | Text-post → multi-platform carousel image pipeline (IG / LinkedIn / TikTok / Threads) with browser preview + PNG/PDF export. Transferable mechanic: **one source → format-specific derivative rendering** — the *repurposing spine* Blacktwist's `content-repurposer-sms` described but didn't ship as a pipeline. Reference architecture only; Hermes still writes. |
| 4 | **open-carrusel** (Hainrixz) | github.com/Hainrixz/open-carrusel | **MIT** | *No* copy/strategy framework — purely design/export (chat → HTML/CSS slides → Puppeteer screenshot at exact 1080×1080 / 1080×1350 dims, "what you see is what you ship"). Value is **architectural**: subprocess-spawned AI agent + local file state + streamed UI. Flag for **Silas/Mack** as a future carousel-render layer, *not* for the strategist's brain. |
| 5 | **charlie947/social-media-skills** + **EvolutionAPI/evo-nexus** `social-carousel-writer` | github.com/charlie947/social-media-skills · github.com/EvolutionAPI/evo-nexus | Verify per-repo at adopt time | Convergent with Blacktwist's skill set (4-zone carousel: cover/context/body/CTA, "one point per slide non-negotiable"). **Low marginal value** — corroborates our baseline, adds no new shape. Log as *confirmation*, not adoption. |

**Cross-source note on the mechanic that matters most:** items 1 and the 2026 IG data below independently converge on **DM sends / "sends per reach"** as the current top distribution lever. Our 2026-07-05 audit optimized around *saves* (rule 17, rule set) and only glancingly at sends. This is the single biggest *update* to fold in.

**Licensing summary:** #1, #3, #4 = MIT (safe to adopt mechanics, attribute). #2 = license unstated → mechanic-reference-only until confirmed. #5 = verify before any use. Consistent with intake doctrine: adopt *mechanics*, never lift *copy*, never blend external text into Alyssa source without provenance.

---

## (b) Three real strategist archetypes/playbooks (so Nolan can ground identity + working method)

Each is a real, documented person/school — pick the *blend*, not one clone. Together they cover the full persona spec: "worked with Hormozi/GaryVee AND indie carousel brands," "sells without being salesy," "art-girl meets Gen-Z baddie."

**1. Katelyn Bourgoin — the "sell-without-selling" brain. (The core hire DNA.)**
Founder of *Why We Buy / Customer Camp*; built a **220K audience and seven-figure media company teaching buyer psychology through carousels and threads** (Growth In Reverse profile; multiple podcast primaries). Her documented method: reframe dry customer-research into **"why we buy" bite-size teaching**, and her named **Trigger Technique** (turn real buyer stories → testable growth ideas). *Why she's the anchor:* she is the living proof that value-first editorial teaching **is** the sell — the audience learns, trusts, then buys. This is exactly how Alyssa's own top posts win. **Confidence: High** (primary + multiple secondary).

**2. The Hormozi × GaryVee give-until-they-ask axis — the conversion engine.**
- **Hormozi ($100M Leads):** *"Give until they ask"* + **Hook–Retain–Reward** + the 7-step lead magnet + Core Four. The DR/attention rigor the persona names.
- **GaryVee (Jab, Jab, Jab, Right Hook):** *"give, give, give, then ask"* — and his own clarification that **jabbing doesn't entitle you to the hook; it earns you the audacity to ask**, and every jab must be **native to the platform**. *Why this axis:* it's the documented, cross-verified backbone of "sell without being salesy" from the exact DR world the spec references. Two independent canonical sources say the same thing = **High confidence**. The new hire should *think* in give-ratios, not sell-slots.

**3. The design-led editorial-carousel school — the art-girl aesthetic + save/share craft.**
Named exemplars of *educational-carousel-as-visual-workshop*: **Chris Do** (design/branding carousels, feed = "swipeable workshop," saved as learning resources) and **Ali Abdaal** (productivity frameworks, "each slide a mini-lesson"). The *aesthetic* layer — minimal / editorial / scrapbook / seamless-panoramic, premium visual identity, 2–3 locked brand colors+fonts, template systems per content type — is a well-documented 2025–26 category. *Why this school:* it supplies the "art-girl meets Gen-Z baddie" packaging discipline that turns teaching into *saveable, sendable* objects. **Confidence: High on the category and on Do/Abdaal as method exemplars; Low on any single indie "blew-up" account by name** (see limitation).

**How Nolan should blend them:** identity = **Bourgoin's editorial buyer-psychology instinct**, working method = **Hormozi/GaryVee give-ratio content architecture**, output packaging = **the editorial-carousel design school**. She is a *strategist who names the mechanic and the aesthetic*, and hands the actual words to Hermes.

---

## (c) What's genuinely current in IG carousel/growth for 2026

Cross-verified across TrueFuture, Buffer's 52M-post study, Socialinsider, creatorflow (Mosseri-attributed), and the Roman Knox skill. **Confidence: High** on all of the below.

1. **Sends-per-reach (DM shares) is now a top-3 ranking signal — and beats saves for *reach*.** Multiple sources (Mosseri Jan-2025 statements, creatorflow, Roman Knox skill) put it as **3–5× more valuable than a like**; "one DM share ≈ 200 likes." **Design the last slide as a send trigger**, not just a save trigger. *This is the biggest delta vs. our save-centric 2026-07-05 baseline.*
2. **Carousels lead engagement in 2026** — ~0.55% ER (vs Reels 0.50%, single image 0.35%); **~2× saves per impression** vs other formats; **~3× reach of a single image**. Carousels are the *save/send* workhorse; Reels still own cold discovery. Healthy mix: ~60–70% Reels for reach, ~20–30% carousels for saves/sends.
3. **The second-slide hook is real and load-bearing.** Slide 1 earns the pause; **slide 2 earns the commitment**; **slide 3 is the algorithm's key completion signal** (swipe-through past slide 3 → re-serve). Slide 2 pattern = *credibility + roadmap* ("why this matters" / "what you'll learn" / a proof or self-qualification line).
4. **The re-serve / open-loop loop.** High swipe-through carousels get **re-served 24–48h later**; unseen slides are treated as "new content" and reshown to the same non-finisher. Mechanic: **open loops** ("Next: the 2-minute fix") + **two CTAs** (soft mid-deck, hard last slide).
5. **Cover = promise + specificity + pattern-interrupt, made deliberately *incomplete***, ≤8–10 words (aligns with Alyssa's ≤7). Design move: cropped diagram / partial checklist / blurred result to force the swipe.
6. **Saves are made "rational" by utility.** Templates, scripts, checklists, frameworks = the artifacts people save-to-return-to. Ideal length 8–12 slides (12–20 for deep guides), completion rates >70% on tight 8–10 slide decks.
7. **DM-share CTA is now a named format:** *"Send this to the [person who handles X]"* and *"DM 'WORD' and I'll send the template."* This is the on-persona way to run a "sell" that reads as a gift — the exact trojan-horse the persona wants.

---

## Anti-patterns — what the mediocre version of this hire does (be ruthless; Nolan must fence these off)

1. **Optimizes for saves and forgets sends.** The 2026 mediocre strategist is still running a 2024 save-first playbook. The signal moved. Miss this and the whole account under-distributes.
2. **Treats "sell without being salesy" as a *tone*, not an *architecture*.** Mediocre = softer adjectives on the same pitch. World-class = Give-Give-Give-Ask *ratio* and Hook-Retain-Reward *structure* — the sell is the payoff of earned value, not a nicer sentence.
3. **Ships hook *libraries* as if they were strategy.** Our 2026-07-05 finding stands: **every external hook library re-invents Alyssa's existing 7 formulas and adds no new shape.** A hire who arrives with a 100-hook swipe file is bringing the low-value layer. The value is testing discipline (first-3-words gate, batch-variety, so-what bridge), not more templates.
4. **Blends external copy into Alyssa's voice.** Hard doctrine violation. External craft = mechanics and tests only. Hermes writes. This hire *names the move*; she does not *write the words*.
5. **Chases vanity benchmarks / generic "post daily" advice.** Benchmark against Alyssa's own historical averages only (baseline rule 17). "Post 60–70% Reels" is a *platform-mix* truth, not a mandate to abandon her carousel-led, email-first, slow-marketing identity.
6. **Aesthetic-first, mechanic-blind (or the reverse).** The art-girl packaging without save/send engineering = pretty and dead. The DR mechanics without the editorial taste = salesy and off-brand. The hire must hold *both*.

---

## Name candidates (short, single-word, no collision with Larry/Nolan/Pax/Penn/Mack/Silas/Hermes)

- **Vera** — *in use as a riff-persona per memory; flag to Nolan to avoid collision.* Prefer the below.
- **Suki** — art-girl / editorial energy, distinct.
- **Reeve** — sharp, editorial, gender-neutral.
- **Indie** — literally the indie-carousel archetype; on-nose but memorable.
- **Bexley / Bex** — Gen-Z baddie register, single-word "Bex."
- **Marlo** — creative-strategist feel, no collision.

(Recommend Nolan pick from **Suki / Reeve / Bex / Marlo** — all clean of existing team names and of Vera.)

---

## Methodology

Searched in three passes: (1) repos/AI-skills (GitHub topic + Claude-skill queries), (2) named practitioners/playbooks (Hormozi, GaryVee, carousel educators, buyer-psychology voices), (3) sell-without-selling models (trojan-horse/editorial/value-first). Started broad, narrowed to primary artifacts; fetched the four highest-value repos and one 2026-mechanics source directly rather than trusting search snippets. Every load-bearing claim (2026 signals, give-until-ask axis, carousel engagement lead) is carried by **≥2 independent sources**; single-source items are flagged inline. Filtered against our existing 2026-07-05 intake so this brief reports only *new or updated* material.

## Limitations

- **No single verified "art-girl indie brand that blew up" by name with hard numbers.** The archetype is real and category-documented; I could not source one canonical named account with growth data from open web. Treat as pattern, not a clone target. **(Low confidence on any single name.)**
- **Repo internals read from README/docs, not executed.** Mechanics are as-documented. **(Medium.)**
- **`founder-playbook` license unstated** — mechanic-reference-only until a LICENSE is confirmed. `charlie947` / `evo-nexus` licenses unverified.
- **Engagement-rate figures are directional**, drawn from vendor studies (Buffer/Socialinsider/carouselli) that use different methodologies; the *ordering* (carousels > reels > single image for ER; sends > saves > likes for reach) is consistent across them, the exact decimals are not authoritative.
- Blog-tier 2026 sources carry SEO-slop risk; I leaned on the ones that cite Mosseri/first-party data and cross-checked against Buffer's 52M-post study.

## Flags for the team (per Pax protocol — I flag, I don't write PKM)

- **New people worth a CRM/reference note:** Katelyn Bourgoin, Roman Knox (@theromanknox), Chris Do, Ali Abdaal — external practitioners, not contacts; Penn/Nolan decide if any warrant a card.
- **Repos to hand to Silas/Mack** for the *render/repurpose layer* (not the strategist brain): `open-carrusel`, `threads-carousel-claude-skill`.
- **Rule to fold into the pitch/hook system regardless of the hire:** add a **sends-per-reach / DM-share-trigger** check alongside the existing save-centric rules — this is the one baseline gap the 2026 data exposes.

---

## Sources

Repos/skills: [rediumvex/social-media-caption-generator-claude](https://github.com/rediumvex/social-media-caption-generator-claude) · [getagentseal/founder-playbook 100m-leads SKILL](https://github.com/getagentseal/founder-playbook/blob/main/100m-leads/SKILL.md) · [itchernetski/threads-carousel-claude-skill](https://github.com/itchernetski/threads-carousel-claude-skill) · [Hainrixz/open-carrusel](https://github.com/Hainrixz/open-carrusel) · [charlie947/social-media-skills](https://github.com/charlie947/social-media-skills) · [EvolutionAPI/evo-nexus social-carousel-writer](https://github.com/EvolutionAPI/evo-nexus/blob/main/.claude/skills/social-carousel-writer/SKILL.md)

Practitioners/playbooks: [Katelyn Bourgoin — Growth In Reverse](https://growthinreverse.com/katelyn-bourgoin/) · [Bourgoin Trigger Technique](https://learnwhywebuy.com/the-trigger-technique-turn-buyer-stories-into-smarter-marketing-campaigns/) · [Hormozi $100M Leads lead-magnet framework](https://blog.vidtao.com/alex-hormozi-lead-magnet-framework/) · [GaryVee — clarifying Jab Jab Jab Right Hook](https://garyvaynerchuk.com/the-one-thing-i-didnt-clarify-enough-in-jab-jab-jab-right-hook/) · [Chris Do / Ali Abdaal carousel educators](https://www.amraandelma.com/influencers-making-carousels-go-viral/)

2026 mechanics: [TrueFuture — Carousel Strategy 2026](https://www.truefuturemedia.com/articles/instagram-carousel-strategy-2026) · [Buffer — State of Social Engagement 2026 (52M posts)](https://buffer.com/resources/state-of-social-media-engagement-2026/) · [Socialinsider — 2026 IG benchmarks](https://www.socialinsider.io/social-media-benchmarks/instagram) · [creatorflow — IG Algorithm 2026 / Mosseri signals](https://creatorflow.so/blog/instagram-algorithm-2026/) · [carouselli — Carousel engagement 2026](https://carouselli.com/blog/instagram-carousel-engagement)

Sell-without-selling: [Built In — Trojan Horse selling](https://builtin.com/founders-entrepreneurship/product-trojan-horse) · [Brafton — editorial/advertorial content](https://www.brafton.com/blog/content-writing/editorial-content/)

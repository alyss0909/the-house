# Hermes v3 Web Research: Anti-AI Writing Fixes, Frameworks, Blotato

Compiled 2026-07-05 by Pax. Sources: 3 GitHub anti-slop skill repos (raw file contents pulled), Wikipedia:Signs of AI Writing, peer-reviewed stylometry research, practitioner copywriting/carousel guides. Cross-verification notes inline.

---

## (A) MASTER BANNED-LIST

Deduped across: `hardikpandya/stop-slop` (5.9k stars, raw [[Deliverables/2026-07-05-social-skills-repo-intake/repos/hardikpandya__stop-slop/references/phrases]] + [[Deliverables/2026-07-05-social-skills-repo-intake/repos/hardikpandya__stop-slop/references/structures]]), `Byk3y/no-slop` (raw `banned-vocabulary.md`, derived from Wikipedia:Signs of AI Writing), Wikipedia:Signs of AI Writing itself, and academic stylometry papers. Items appearing in 2+ independent sources are unmarked; single-source items flagged `[1-src]`.

### A1. Banned words (with plain replacements)

Verified across no-slop + Wikipedia + the medRxiv/arXiv "excess vocabulary" studies (21 focal words spiking post-ChatGPT: delve, intricate, commendable, meticulous, surpass, elevate, foster, tapestry, realm, navigate, landscape, pivotal, resonate, testament, underscore, showcasing, compelling, paramount, crucial, unwavering, alignment).

| Avoid | Use instead |
|---|---|
| delve / delve into | look at, dig into |
| tapestry | cut entirely |
| pivotal | important, key (rarely) |
| crucial | important, necessary |
| meticulous(ly) | careful, thorough |
| landscape (figurative) | field, market, space |
| testament (to) | proof, sign |
| underscore | show, prove |
| intricate / intricacies | complex, details |
| interplay | interaction |
| garner | get, earn |
| bolster | support, back |
| foster(ing) | encourage, build |
| showcase / showcasing | show |
| emphasize / emphasizing / highlighting | rewrite without it |
| enduring | lasting |
| enhance | improve, boost |
| renowned | well-known |
| groundbreaking | new, first |
| profound | deep, major |
| comprehensive | full, complete |
| multifaceted | complex, varied |
| leverage (verb) / harness / utilize | use |
| facilitate | help, allow |
| encompasses | includes |
| spearhead | lead, start |
| elevate | raise, improve |
| streamline | simplify |
| robust | strong, solid |
| seamless(ly) | smooth, easy |
| holistic | complete, whole |
| synergy / paradigm | cut entirely |
| ecosystem (figurative) | system, community |
| vibrant | be specific instead |
| compelling, paramount, unwavering, resonate, realm, commendable, surpass | plain equivalents [research lists] |
| additionally | also, and |

**Business jargon (stop-slop):** navigate (challenges) → handle; unpack → explain; lean into → accept; game-changer → significant; double down → commit; deep dive → analysis; moving forward → next; circle back → revisit; on the same page → aligned. `[1-src for the table, but overlaps Wikipedia's promotional-language list]`

**"Tapestry nouns" (borrowed-grandeur metaphors — Vollmer field guide, overlaps research lists):** tapestry, landscape, realm, mosaic, ecosystem, symphony, labyrinth, beacon, cornerstone, bedrock, testament, cacophony, kaleidoscope, odyssey.

**Adverbs (stop-slop hard rule; corroborated by "magic adverbs" in Vollmer):** kill all -ly words plus: really, just, literally, genuinely, honestly, simply, actually, deeply, truly, fundamentally, inherently, inevitably, interestingly, importantly, crucially, quietly, remarkably.

**Lazy extremes:** every, always, never, everyone, nobody — replace with specifics.

### A2. Banned phrases

**Throat-clearing openers (stop-slop):** "Here's the thing:", any "Here's what/this/that/why X", "The uncomfortable truth is", "It turns out", "The real X is", "Let me be clear", "The truth is,", "I'll say it again:", "I'm going to be honest", "Can we talk about", "Here's what I find interesting", "Here's the problem though".

**Emphasis crutches:** "Full stop." / "Period.", "Let that sink in.", "This matters because", "Make no mistake", "Here's why that matters".

**Filler phrases:** "At its core", "In today's [X]", "It's worth noting", "At the end of the day", "When it comes to", "In a world where", "The reality is".

**Meta-commentary:** "Hint:", "Plot twist:", "Spoiler:", "You already know this, but", "But that's another post", "X is a feature, not a bug", "Let me walk you through", "In this section we'll", "As we'll see", "Let's explore", "Let us delve into" (also flagged by no-slop + Wikipedia as "collaborative language").

**Significance inflation (no-slop + Wikipedia — high overlap):** "marks a pivotal moment", "represents a significant shift", "indelible mark", "deeply rooted", "rich history", "nestled in", "boasts a", "serves as a", "stands as a", "a testament to", "paving the way", "plays a crucial role", "in an era where", "the intersection of", "a beacon of", "sends a strong message", "it remains to be seen", "leaves an indelible mark", "marks a turning point".

**Vague declaratives (stop-slop):** "The reasons are structural", "The implications are significant", "The stakes are high", "The consequences are real" — replace with the specific thing.

**Vague attributions (no-slop + Wikipedia):** "Experts say", "Industry reports suggest", "Observers have cited", "Some critics argue" — name the source or cut.

### A3. Banned constructions (structural tells)

Verified across stop-slop structures.md + no-slop's 13 constraints + Wikipedia. This is the highest-value list for Hermes.

1. **Binary contrast / negative parallelism** — "Not X. Y." / "It's not X, it's Y" / "not just X but (also) Y" / "The answer isn't X. It's Y." / "X isn't the problem. Y is." / "doesn't mean X, but actually Y" / "X rather than Y". Fix: state Y directly, drop the negation.
2. **Negative listing (rhetorical striptease)** — "Not a X. Not a Y. A Z." / "It wasn't X. It wasn't Y. It was Z." Fix: state Z.
3. **Rule of three** — compulsive three-item lists. Fix: use two items or one.
4. **Dramatic fragmentation** — "[Noun]. That's it. That's the thing." / staccato stacked fragments / "This unlocks something. [Word]." Fix: complete sentences.
5. **Rhetorical setups / question-then-answer openers** — "What if...?", "Think about it:", "Here's what I mean:", questions answered immediately. Fix: make the point.
6. **False agency** — inanimate subjects doing human verbs: "the data tells us", "the culture shifts", "the decision emerges", "the market rewards", "a complaint becomes a fix". Fix: name the human actor (or "you").
7. **Narrator-from-a-distance** — "Nobody designed this.", "This happens because...", "People tend to..." Fix: put the reader in the room.
8. **Passive voice** — "mistakes were made", "it is believed that". Fix: actor first.
9. **Copula avoidance / elegant variation** (no-slop + Wikipedia) — "serves as", "stands as", "boasts", "features" instead of "is"; synonym-cycling for the same concept. Fix: just say "is"; repeat the word.
10. **Participle-chain endings** — trailing "-ing" clauses attaching unearned significance: "...highlighting its historical importance", "...showcasing", "...reflecting", "...ensuring". Research note: present participles alone are a near-sufficient stylometric classifier for AI text (arXiv stylometry paper).
11. **Challenges-and-prospects formula** (Wikipedia/no-slop) — "Despite its [strengths], [subject] faces challenges..." endings; rigid "Significance / Impact / Future Outlook" sectioning.
12. **Hedging seesaw** (anti-ai-slop-writing) — assert, then walk back, alternating. Also "Not always. Not perfectly." reassurance-hedging. `[2-src]`
13. **Wh-word and "So" sentence openers** — "What makes this hard is..." → "The constraint is..." `[1-src: stop-slop]`
14. **Uniform sentence length / every paragraph ending punchy** — vary rhythm and endings.
15. **Section recap paragraphs** and "key takeaways" boxes (Wikipedia).

### A4. Punctuation & formatting tells

- **Em dashes**: human prose 0–2 per 1000 words; AI output 6–12+ (carteakey.dev AIDAR analysis). Stop-slop rule: zero em dashes. No-slop rule: max one per paragraph. Recommend Hermes rule: near-zero, never two in one paragraph.
- Curly/smart quotes in plaintext contexts; title-case headings; over-bolding keywords; emoji as bullets/separators; horizontal rules before headings (Wikipedia).

### A5. Anti-pattern warning (the mediocre version)

The mediocre anti-AI system is a banned-word find-and-replace: swap "delve" for "dig into" and ship. The tells that actually flag text are **structural** (A3) and **rhythmic** (uniform cadence, punchy endings, rule of three). Wikipedia's page explicitly warns these are probabilistic signals, not proof — the fix is voice-forward rewriting (named actors, specifics over adjectives, varied sentence length, contractions), not word-swapping. Second trap: over-correction produces its own tell (aggressively choppy, adverb-free, contraction-heavy prose reads like a different kind of template — Rossmann's repo and unslop both address this by anchoring to a specific human voice profile, which is exactly what Hermes/me.md does).

---

## (B) COPYWRITING FRAMEWORKS QUICK REFERENCE

One-liners, cross-verified across Buffer, Copy Brothers, readstoleads, Shyam Govind guides:

- **AIDA** — Attention → Interest → Desire → Action. General-purpose; landing pages, longer emails.
- **PAS** — Problem → Agitate → Solve. Best default for short assets: emails, captions, ads.
- **BAB** — Before → After → Bridge. Paint current pain, paint transformed state, position offer as the bridge. Great for emails and transformation-driven niches (fits BOH).
- **4Ps / PPPP** — Promise → Picture → Proof → Push. Mid-form sales copy; the "Proof" beat is what AIDA lacks.
- **Hook-Story-Offer** (Brunson) — scroll-stopper → personal narrative → pitch. Warm-traffic sales videos, story emails, launch content.
- **PASTOR** — Problem, Amplify, Story, Transformation/Testimony, Offer, Response. Long-form sales pages and VSLs.
- **FAB** — Features → Advantages → Benefits. Product-descriptive copy; translate specs to outcomes.
- **Format matching (readstoleads):** short ad/email → PAS or BAB; mid landing page → PPPP or AIDA; long sales video → PASTOR or Hook-Story-Offer.

### Instagram carousel structure (practitioner consensus, instacarousel/postnitro/Resont/Pano guides)

- **5-stage arc: Hook → Context → Value → Proof → CTA.**
- **Slide 1 carries ~80% of the weight.** Must answer "Is this for me?" and "What do I get if I swipe?" in under 8–10 words. Formula: bold headline (largest text) + visual pattern interrupt + curiosity trigger (partial reveal, surprising stat, or open question).
- **Slide 2**: reduce skepticism, preview the structure, make the swipe the obvious next action.
- **Body slides**: one idea per slide, never two tips on one slide.
- **Final slide**: explicit next action (save/follow/comment keyword).
- Specs: 1080x1350 (4:5), 8–10 slides (engagement dips after slide 3, recovers at 8+). Carousels currently outperform Reels and statics on engagement rate (~1.92% vs 0.50%/0.45%). `[1-src on the exact numbers; direction corroborated across guides]`

### Hook writing (cross-guide consensus)

Hook types that recur across practitioner sources: contrarian claim ("Stop doing X"), specific-number promise ("7 ways to..."), curiosity gap ("The mistake nobody talks about"), call-out ("If you're a [audience]..."), before/after result, question the reader is already asking. Rule: hook states the payoff, not the topic.

---

## (C) BLOTATO WORKFLOW NOTES

**What it is:** AI social-media automation platform (blotato.com) built around "one idea → dozens of platform-native formats." Cross-posts to 9 platforms from a single workflow; positions against Repurpose.io.

**The repurposing model (the part relevant to Hermes pipelines):**
1. **Start from a topic or a single source asset** — idea, article, podcast, PDF, URL, or long video.
2. **Transform format-to-format**, not copy-paste: video → posts, article → scripts, thread → carousel, adjusting tone and length per platform.
3. **Anchor-asset cascade** (Sabrina's Playbook example): 1 long-form YouTube video → newsletter + social posts → 20 short-form TikToks → cross-posted/repurposed to remaining platforms via automation.
4. Batch output (50+ pieces/week) with scheduling/publishing in the same pipeline.

**Takeaway for Hermes:** the model Alyssa is pointing at is *anchor content → platform-native derivatives*, where each derivative is rewritten for the platform's format rules (carousel structure, email framework, caption hook), not truncated. Hermes can replicate the transformation layer; Blotato's differentiator is the publishing/API layer.

---

## (D) SOURCE LINKS

**Anti-slop repos (lists pulled raw):**
- https://github.com/hardikpandya/stop-slop (+ raw references/phrases.md and references/structures.md)
- https://github.com/Byk3y/no-slop (+ raw banned-vocabulary.md)
- https://github.com/jalaalrd/anti-ai-slop-writing (35+ phrases, 16 openers, 10 structural patterns; lists behind repo files)
- https://github.com/theclaymethod/unslop (voice-preset approach)
- https://github.com/conorbronsdon/avoid-ai-writing (44-category deterministic detector)
- https://github.com/shannhk/avoid-slop (directory of anti-slop tools)
- https://github.com/realrossmanngroup/no_ai_slop_writing_rules (voice-anchored CLAUDE.md approach)

**Research / documented tells:**
- https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing
- https://arxiv.org/abs/2406.07016 (excess vocabulary, 15M abstracts)
- https://www.medrxiv.org/content/10.1101/2024.05.14.24307373v1.full.pdf (21 focal words)
- https://arxiv.org/html/2507.00838v2 (stylometry, short samples, participle classifier)
- https://carteakey.dev/blog/aidar-tracking-ai-writing-drift/ (em-dash density)
- https://matthewvollmer.substack.com/p/i-asked-the-machine-to-tell-on-itself (field guide: tapestry nouns, magic adverbs)

**Frameworks / carousels:**
- https://buffer.com/resources/copywriting-formulas/
- https://thecopybrothers.com/blog/copywriting-Studio/Analysis/Frameworks/
- https://www.readstoleads.com/blog-article/best-copywriting-formulas
- https://shyamgovind.com/blogs/pppp-4ps-framework-copywriting/
- https://instacarousel.com/blog/instagram-carousel-guide-2026/
- https://postnitro.ai/blog/post/instagram-carousel-post
- https://resont.com/blog/top-instagram-carousel-hooks/
- https://panocollages.com/blog/best-practices-for-first-slide-carousel-hooks

**Blotato:**
- https://www.blotato.com/
- https://help.blotato.com/tips-and-tricks/sabrina-playbook
- https://help.blotato.com/blog/cross-post-all-platforms-one-workflow
- https://www.blotato.com/blog/blotato-vs-repurpose-io

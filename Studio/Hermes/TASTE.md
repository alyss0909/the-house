> Downstream reference (2026-07-10): house voice authority is [[Studio/Voice/README]] + [[Library/Examples]]; on conflict, they win. See AGENTS.md "Voice is house-level".

<!-- token_ceiling: 2000 | the me/not-me detector + scoring rubric -->

# TASTE.md — Me / Not-Me Detector

Use this to judge ANY draft (yours or anyone's) before it ships. The failure mode this file exists to catch: copy that is technically fine, on-format, rule-compliant — and has no Alyssa in it. The single most reliable "too AI" tell in the corpus: **a clean label + description with zero voice injected** (see `Library/Examples/bad/`).

## Loves (gravitates toward, rewards)

- Absurdist precision: 5848 tabs, 584 dirty dishes, two hundred jars of tomato sauce.
- Permission that is also architecture: "So, go ahead, waste your time" — the system earns the rest.
- Strikethrough reframes performed in real time; visible revision as honesty.
- One small real moment elevated to universal law (auction woman, Portugal, the full-but-useless fridge).
- Documentary order: symptoms → diagnosis → prescription. Belief before the how.
- The pumpkin farmer (no website, no Google Maps, sells out yearly): "there is another way."
- Deliberate imperfection left in (the typo that proves a human), obsessives as heroes, wise old men quoted sincerely with a cringe, understatement after weight.
- Contentment over relevance. Depth over reach. History over prediction.

## Disgusts (instant not-me)

- "Value" as a vague noun. Motivational-poster verbs (level up, crush, hustle, show up authentically).
- Corporate positivity ("We're so excited to share…"). Exclamation-point sincerity ("You've got this!").
- **Fake urgency — theatrical/resettable countdowns with no real deadline.** Resolved 2026-07-07: a timer tied to a genuine per-subscriber expiry (ORDERUP on the BOH page) is NOT this disgust — it's her own taught doctrine ("We always include a seven minute countdown timer... make these real don't fake it... After seven minutes the page expires," 1.5 The Perfect Apps Transcript). The line is real-expiry vs. theater, not timer-vs-no-timer. Testimonials that parrot sales-page language.
- Subject lines that summarize. Listicles wearing a personality wig ("5 tips for…").
- Daily posting as strategy; virality as strategy ("the casino approach... unless you're Mr. Beast, this might genuinely be a delusion").
- Marketing that makes the reader feel broken. Beginner-splaining to a sophisticated audience.
- Laptop-on-a-beach lifestyle fantasy; "passive income" with the setup work hidden.
- Aesthetic-cozy with no business outcome ("Cozy is the atmosphere. Client flow is the promise.").
- AI-obvious voice: "emails from a dentist." Extended cooking allegory mid-argument (metaphor as wallpaper).
- **Weekend-work or always-on offers** — "i would NEVER work on a weekend this offer is against everything i stand for as a soft ceo" (2026-07-05). Nothing that puts her OR her buyers into weekend/always-on work.
- **Norah's name in a subject line** — "i dont use my daughters name in subject lines are you daft?" (2026-07-05). Family texture is body-copy only, sparing.

## The 8 red flags (from Alyssa's clone key — any hit = fail)

1. Writes for total beginners by default.
2. Invents offers, CTAs, chat words, product links, or themes.
3. Treats analysis files as if they were Alyssa-original examples.
4. Flattens nuance into broad marketing advice.
5. Makes every post sound like a sales post.
6. Treats Friday For The Girls posts as disposable personality content.
7. Ignores BOH modules when the idea needs a stronger teaching point.
8. Outputs content Alyssa still has to wrestle into being.

## "Too AI" tells (from the flagged email teardown, Library/Examples/bad/)

- Label + generic description lists; parallel-structured strategy items with no texture per item.
- Bold-density collapse (no skim path; nothing stands out).
- Missing named pivot — concept-label transition ("The experts call it: X") instead of discovered parallel ("I couldn't help but see the parallels").
- Neat resolutions; no mess, no self-interruption, no aside.
- Enthusiasm markers absent exactly where the copy claims to be excited.
- Rule of repair: every item in any list must carry one detail that could not be invented (a real jar count, a real client, a real Tuesday).

## Banned LLM constructions → [[Hermes/ANTI-AI]] (HER OWN saved rules — mandatory pass before scoring)

Alyssa keeps her own anti-AI rules in the vault (journal 2026-04-27, "It's not [X], it's [Y]"): the 15 negative-parallelism shapes, banned vocabulary, dead openings/transitions, rule-of-three ban, plus her 2026-07-05 punctuation corrections (em-dashes: ZERO; staccato periods: near-zero; "its not this its that" banned in ALL forms incl. hooks and headers). Run the full [[Hermes/ANTI-AI]] final-pass checklist on every draft BEFORE this rubric. Two gates have now died on drafts that scored well here but hit her banned shapes — the ANTI-AI pass is the senior gate.

## Scoring rubric (score 0-2 per axis; judge with 2 real passages side-by-side)

| Axis | 0 | 1 | 2 |
|---|---|---|---|
| Hard refusals & red flags | any banned phrase / red flag | — | clean |
| Rhythm | uniform sentences | some variation | long-setup→short-punch lands ≥once; fragments used |
| Specificity | generic claims | some texture | ≥2 details that couldn't be invented |
| Humor placement | announced/absent/misplaced | present but decorative | structural (aside, reversal, strikethrough); silent in vulnerable beats |
| Metaphor altitude | allegory wallpaper | inconsistent | structural naming + contextual density |
| Pain framing | personal/shame | mixed | structural, validated, one layer deeper |
| CTA | command ("Buy Now") | on-list but flat | inner-monologue / food-world / comment-word, correctly matched |
| Audience level | beginner-default | uneven | sophisticated, obsessive-coded |
| Would she have to wrestle it? | rewrite needed | edits needed | publishable with light touch |

**Kill threshold:** any 0 on refusals, pain framing, or CTA = fail outright. Otherwise ≥14/18 to pass. Final gate is the **lineup test**: hide the draft among 3 real passages from `Hermes/examples/good/` (curated verbatim excerpts with source paths) or the full originals in `Library/Examples/<format>/` — if a fresh reader can spot the fake, it fails no matter the score.

---
title: Voice metabolization gap audit
source_class: output
date: 2026-07-10
owner: Larry
status: REPORT ONLY — nothing in Studio, Hermes, or Archive was edited to produce this
---

# Voice metabolization gap audit

_Consumed by [[Studio/Voice/README]] and [[Studio/Voice/formats/README]] — read the MISSING queue below before deepening any format file._

Alyssa's concern: "i dont think the voice files have been appropriately metabolised." This audit compares the new authority — [[Studio/Voice/README]], [[Studio/Voice/KILL-LIST]], [[Studio/Voice/formats/README|Studio/Voice/formats/*]] — against the old knowledge base it was meant to digest: [[Hermes/SOUL]], [[Hermes/STYLE]], [[Hermes/TASTE]], [[Hermes/ANTI-AI]], `Studio/Hermes/craft/*`, [[Hermes/learning/inbox]], [[Hermes/LEARNING]], `Studio/Hermes/learning/log`, `Studio/Hermes/learning/deep-reads/*`, [[Hermes/MEAN-ALYSSA]], and the three archived analysis files at `Archive/Studio-Analysis-voice-retired-2026-07-10/`.

Finding up front: **the concern is correct.** The Voice layer was built by pulling one short "what makes hers hers" bullet list per format straight from [[Library/Examples]], and by copying the ANTI-AI checklist near-verbatim into the KILL-LIST. It was not built by reading STYLE.md's deep-read layers, the craft files' hard guards and forensic numbers, or the three scheduled `hermes-deep-voice-study` months of corpus work. The KILL-LIST is a faithful subset of ANTI-AI (no drift found — see below), but the format files are a fraction of the depth in the matching craft files. Nearly all of the granular, corpus-measured, number-backed rules live only in Studio/Hermes and never made it across.

## Counts

| Class | Count (approx.) | Meaning |
|---|---|---|
| ABSORBED | ~14 | Present in Voice layer already, confirmed by source |
| MISSING | ~55 | Real Alyssa-derived rule/finding absent from Voice — the merge queue below |
| CONTRADICTS | 0 | No direct rule collision found between Voice and old files |
| STALE/UNCONFIRMED | ~6 | AI-mined speculation, open inbox flags, or provisional notes never confirmed by her — candidates to drop |

These are approximate because many old-file entries are compound (a single deep-read bullet often folds 2-3 discrete claims); I counted at the granularity useful for a merge pass, not maximal atomization.

## ABSORBED — already present in the Voice layer

- Zero em-dash rule — [[Studio/Voice/KILL-LIST]] Punctuation checklist ↔ [[Hermes/ANTI-AI]] "Em-dashes (—): ZERO."
- Negative-parallelism ban, all 15 shapes + sneaky setups + grandfathered-verbatim-only carve-out — [[Studio/Voice/KILL-LIST]] ↔ [[Hermes/ANTI-AI]] (near word-for-word copy).
- Banned vocabulary list (quiet/quietly total ban, her bot's list, standard LLM list, copulatives) — [[Studio/Voice/KILL-LIST]] ↔ [[Hermes/ANTI-AI]].
- Dead openings/transitions list — [[Studio/Voice/KILL-LIST]] ↔ [[Hermes/ANTI-AI]].
- Rule-of-three ban (with the "deep 3-act structure is not a violation" carve-out) — [[Studio/Voice/KILL-LIST]] AI pattern checklist ↔ [[Hermes/ANTI-AI]].
- Rule priority order (accurate → clear → specific → human → style) — [[Studio/Voice/KILL-LIST]] ↔ [[Hermes/ANTI-AI]].
- Staccato-run guard + "her style is caps, stretched vowels, run-ons, dots, asides, not minimalism" over-correction warning — [[Studio/Voice/KILL-LIST]] Punctuation checklist ↔ [[Hermes/ANTI-AI]].
- "-ing significance clauses" ban — both files.
- Trailing-dot / period-density ratio (roughly 1 per 2 hard periods, structural lists exempt) — [[Studio/Voice/KILL-LIST]] ↔ [[Hermes/ANTI-AI]] / [[Hermes/STYLE]] §1.
- Comment-word CTA as single all-caps word, always named — [[Studio/Voice/formats/carousels]] ↔ [[Hermes/craft/captions-carousels]] rule 5.
- Grandfathered "Less X, more Y" hits (Jan 15 / Feb 24 captions) stay verbatim, never regenerated — [[Studio/Voice/formats/carousels]] ↔ [[Hermes/ANTI-AI]] deep-read addition 2026-07-07.
- Zero em-dashes on the live About page as the longest-standing confirmation — [[Studio/Voice/formats/about-page]] ↔ [[Hermes/craft/web-pages]].
- "(micro)manage" / misfired-idiom load-bearing status — [[Studio/Voice/formats/about-page]] ↔ [[Hermes/ANTI-AI]] deep-read 2026-07-07.
- Marquee ticker header with mid-repeat truncation — [[Studio/Voice/formats/home-page]] ↔ [[Hermes/craft/web-pages]] home-page register.

## MISSING — the merge queue (quoted, with source)

Grouped by what they'd feed into. This is real metabolization debt: findings that exist nowhere in [[Studio/Voice/README]], [[Studio/Voice/KILL-LIST]], or `Studio/Voice/formats/*` today.

### Corpus-measured hard numbers (STYLE.md §1, would sharpen every format file)

- "**HARD LENGTH CAP (2026-07-05 correction: 'all subj lines are too long'): ≤40 characters before any wrapper; front phrases 2-6 words.**" — [[Hermes/STYLE]] §7 / [[Hermes/craft/subject-lines]]. Nothing in [[Studio/Voice/formats]] covers subject lines at all — there is no subject-line format file.
- "**Norah's name NEVER appears in a subject line**" — same source, her verbatim correction 2026-07-05. Family texture is body-copy only. Not in the Voice layer anywhere.
- "**ALL-CAPS emphasis is REQUIRED at 18-50 words per email** (the AI email had 10 — under-capping flattens to AI)." — [[Hermes/STYLE]] §1. This is a floor, not just a ceiling — absent from Voice.
- "**Vowel-stretching ≥2-3 per email** ('Buuuut,' 'Soooo,' 'juuust')." — [[Hermes/STYLE]] §1/§2. Absent.
- "**Bold = the skim path**: ~3-6 bolds per 200 words in teaching sections; never bullet-list what bolding can do." — [[Hermes/STYLE]] §2. Voice format files never state a bold density.
- "**Staccato one-word-per-line run: max ONE per email, at the emotional peak only.**" — [[Hermes/STYLE]] §1. The Voice carousels/simmers/soft-sundays files show the device exists but never state the "max one, at the peak" constraint.

### Subject-line craft (whole missing format)

There is no `Studio/Voice/formats/subject-lines.md`. Everything in [[Hermes/craft/subject-lines]] is un-metabolized, including:
- "readers open for Alyssa-the-person, click for Alyssa-the-strategist. One job per line."
- The winning-pattern taxonomy with real Kit numbers: confession/vulnerability, faux-logistics/fake-reply, deliverable-inside, anti-advice reframe, personified objects, Soft Sunday wrapper, segment intimacy — each with a real percentage.
- "Deliverable-inside brackets drive clicks: [replay inside], [PLAN INSIDE]... 'Inside' alone = nothing."
- Never list: exceed 40 chars, Norah's name, summarize the content, over-explain, long subjects on sales emails, fake-reply on cold lists, off-register randomness ("Stoner Math" 22.4% kept as a contrast case).

### Carousel cover/hook mechanics (STYLE + craft/captions-carousels — the densest gap)

- "**WEIRD BEATS FORMULA**... A coined concept... beats any pattern-matched winner. NEVER recycle a construction from a documented winner." — [[Hermes/craft/captions-carousels]] cover rule 0.
- "**Under 7 words** (her stated cap, 2026-07-05)." — cover rule 1. Voice/formats/carousels never states a word cap.
- "**A payoff is MANDATORY on the cover** — one of five: fix, threat, confession, series stake, or joke. No payoff = not a hook." — cover rule 2.
- "**NEVER a reframe shape on a cover** ... a reframe resolves itself in the same breath, so there's nothing left to swipe for." — cover rule 3. This is a stronger, cover-specific version of the general negative-parallelism ban already in KILL-LIST — worth a pointer at minimum.
- "**Talk TO the reader (her ruling 2026-07-06, overrides the old no-'you' rule)**... second-person 'you/your' is now LEGAL on covers." — cover rule 4. Important because it reverses an earlier corpus-derived rule; the Voice layer has no record this reversal happened.
- "**Period or nothing at the end, never a question mark.**" — cover rule 5.
- "**THE flow (Alyssa's canonical spine, stated verbatim 2026-07-05)**": cover → open-loop secondary hook → agitate → 4 value slides teaching real material → slide 8 aha/reversal → CTA, with the pattern-interrupt visual break at ~75-80%, never last. This entire nine-slide spine — the single most load-bearing structural rule for carousels — is absent from [[Studio/Voice/formats/carousels]], which only covers captions, not slide architecture.
- The 7 named hook formulas from `social-hooks.md` (Paradox, Bold Outcome Promise, Personal Testimony, Trend Alarm, Reframe Question, Audience Identity, Visual Joke/Strikethrough), each with real performance numbers (e.g., "Mar 3's 'Organic Marketing Is Dying' drove 491 follows... on exactly this shape").
- Texture floor: "**~1 un-inventable detail per VALUE SLIDE**... her real decks are lopsided, one item always breaks the pattern." — the corpus-measured anti-"label + description" standard; Voice/formats/carousels has nothing like this floor stated as a number.
- "**For The Girls posts have their own dedicated writing skill**" ([[Hermes/craft/for-the-girls-posts]]) — permission-slip litany, often no CTA slide, close on open question. Not referenced anywhere in the Voice layer; FTG is a distinct format with zero Voice coverage.

### Sales-email / Simmer / Soft Sunday hard guards (craft files — quantified, corpus-tested)

- Simmer **pivot-to-business ceiling**: "**Pivot to business by 35% of body**... A static scene earns zero extension." — [[Hermes/craft/emails-simmer]] Hard guards. Absent from [[Studio/Voice/formats/simmers]].
- Simmer **scene-stakes test**: "the seed must score ≥2 of 4 - conflict / loss-or-stakes / absurdity / emotional charge... Wanting is not conflict." Absent.
- Simmer **metaphor-nuance test** (3 required conditions, "one flat 1:1 mapping = 'too obvious and un-nuanced'" — her verdict). Absent.
- Simmer **promo vs nurture variant split**: "Most simmer emails are simple one or two line replies, but sometimes I'll write a simmer email that's more of a promo" (her verbatim ruling) — the ~40% offer-block promo mode is a distinct, confirmed variant. [[Studio/Voice/formats/simmers]] shows only the nurture-style examples; the promo variant and her ruling that confirmed it are missing entirely.
- Soft Sunday **bold density ceiling** (3-6/200 words) plus the still-open question that long-form origin-story emails run 15-20+/200 words — a real tension in her own corpus that Voice has no record of.
- Sales-email **launch doctrine**: "A launch = one conversion event + five promo emails... Reuse 80%+ of launch copy each cycle." — [[Hermes/craft/sales-emails]]. Absent.
- Sales-email **segment register shift** with real Kit numbers (full-list 40-51% open vs. buyer-segment 60-900 range, "you coming?" 76.7%). Absent from [[Studio/Voice/formats/sales-emails]], which quotes lines but never the performance data behind why those lines work.
- "**One coherent emoji family per email, food optional in body**" — the emoji-as-mood-arc device (🪄→🧚‍♀️→🧙‍♂️) confirmed across two deep reads. [[Studio/Voice/formats/sales-emails]] only says "emoji used as punctuation," missing the family-coherence rule.

### Sales-page / web-page architecture (craft/sales-pages, craft/web-pages)

- The full **12-beat page skeleton** (pain-state open → structural refrain → validation-before-dismantle → contrarian authority → origin story → metaphor-named system reveal → two-scene contrast → mirrored-pivot offer reveal → value stack → three-wave testimonials → FAQ → escalating CTAs) — [[Hermes/craft/sales-pages]]. [[Studio/Voice/formats/sales-pages]] names several of these as isolated bullets but never states them as an ordered architecture, which is exactly what a writer needs to build a new page.
- "**Sell the Hawaii, not the flight**" — her own named rule from the sales-page teaching module, plus the disruption check ("is this bacon and butter, or am I giving oatmeal?"). Not in Voice.
- "**Register calibration by product tier**": flagship gets full metaphor, low-ticket tool pages (Biz Tracker, CEO Year) drop metaphor to accent-or-zero — "do NOT force the food thing onto a $19 Notion template." This is a real risk if a writer only has the Voice format file, which shows only the flagship BOH example.
- Warning list of **stale-voice pages to not imitate** (The Numbers, Daily Profit Activities, TPE — "pre-soft-CEO era"). Absent from Voice — without it, a writer could pull one of these into a "real example" reading pass and imitate a retired register.
- About-page **full story skeleton** (dream-question headline → instant kinship → hedged confession → 5-item bio list escalating to absurd → announced climax hands page to reader → crisis scene → burn-it-down pivot → rabbit-hole reveal → offer 600+ words in → moral → aphorism-permission couplet → soft close). [[Studio/Voice/formats/about-page]] has isolated bullets, no ordered skeleton.
- "**Verse pacing ships on web pages**": clause stacks broken across lines, four-dot ellipses, spaced mid-sentence ellipsis. Absent.
- "**Credentials only ever mid-sentence in a because-clause**, never a bio flex." Absent — this is a specific positive replacement rule for a common AI tell (credential-leading).

### ANTI-AI depth beyond the KILL-LIST (nuance the KILL-LIST condensed away)

- Her verbatim 2026-07-05 sitting ruling on the negative-parallelism carve-out: "let's keep the total ban unless it's specifically inside my actual source material... Use them lightly and make sure Mean Alyssa does multiple checks if you are near something that has a ban." KILL-LIST states the carve-out as a rule but drops her actual words and the "multiple checks near a ban" instruction.
- The **genuine-typo-vs-voice-device distinction** (the home-page orphaned parenthesis ruled a typo, not a device: "imitate imperfections that ship *readable* mess; don't generate broken punctuation"). This is a judgment call a writer will need and isn't in KILL-LIST.
- The **ORDERUP real-urgency vs. theatrical-urgency resolution** (real per-subscriber expiry is legal, resettable theater is not) — resolved in TASTE.md/ANTI-AI, absent from KILL-LIST and from the Voice layer generally, which has no urgency/CTA-timer guidance at all.
- "**Rule-of-three clarification**: a real email built its entire teaching spine on three numbered reasons, each 300-500 words with its own scene... don't block a draft for using three well-textured sections." KILL-LIST states the general ban but drops this real-example anchor.
- Emoji-as-grammar device: "🤝 = conjunction... a single mid-prose 👏 at a decision beat." Confirmed on the flagship sales page, absent from any Voice file.

### Judgment / gate infrastructure (MEAN-ALYSSA.md — not format rules, but load-bearing)

- "**Published is not approved.** Provenance never overrules the tells: judge every piece against ANTI-AI/TASTE even when it is (or reads as) her real published work — the corpus contains pieces she later flagged as too-AI ([[Library/Examples/soft-sundays/me-i-need-ideas-i-already-had]])." This is directly relevant to the Voice layer's authority claim that real examples are the primary source — it is the one documented case where a real, shipped example was later flagged as not-her. The Voice README should at minimum footnote this so nobody treats every file in Library/Examples as automatically safe to imitate wholesale.
- The Mean Alyssa verdict vocabulary (`proceed` / `read-first` / `search-first` / `use-existing` / `archive-delete` / `ask-Alyssa`) and the "Version A / Version B" doctrine for taste calls — infrastructure, not voice per se, but nothing in the Voice layer tells a writer what to do when a format genuinely has no real example yet (the current answer, buried in MEAN-ALYSSA, is `ask-Alyssa`, never invent).

## CONTRADICTS — none found

No rule in [[Studio/Voice/README]], [[Studio/Voice/KILL-LIST]], or `Studio/Voice/formats/*` was found to directly conflict with a rule in the old Hermes files. Where overlap exists, the Voice layer is a strict subset or shallower restatement, never an opposing claim. The KILL-LIST in particular is not a drifted or diverged version of ANTI-AI — it is a faithful, if compressed, copy, with every rule still crediting [[Hermes/ANTI-AI]] as source. This is good news: the merge work below is additive (paste in missing depth), not adjudicative (nothing needs Alyssa to referee a conflict).

## STALE/UNCONFIRMED — candidates to drop, not merge

These are open inbox flags or provisional notes that were never confirmed by Alyssa and should not be promoted into the Voice layer as-is:

- "**Open question — bold density in long-form origin-story emails**: this document runs 15-20+ bolds/200 words... Provisional; not yet promoted to a rule." — [[Hermes/craft/emails-soft-sunday]], still sitting in [[Hermes/learning/inbox]] territory in spirit (the number conflicts with the 3-6 ceiling and was never resolved). Do not merge either number into Voice until she rules.
- Two genuinely open inbox items from [[Hermes/learning/inbox]]: whether verbatim cross-post phrase reuse is sanctioned voice or an imitation tell (2026-07-06, still open), and the Feb 24 post's "metaphor wallpaper" false-flag / BOH-brand-world carve-out question (2026-07-06, still open, post still benched from test controls). Neither should enter Voice as a rule in either direction until she sits on them.
- The AI-mined "productive contradictions" framing in [[Hermes/SOUL]] (anti-hustle brand / ferocious work ethic, etc.) is useful *thinking* but is analysis-generated pattern-naming, not a rule she stated — fine as downstream reference, wrong shape for a Voice format file.
- Speculative stylometry citation in [[Hermes/ANTI-AI]] ("Stylometry research agrees: 6-12 em-dashes/1000 words = LLM; 0-2 = human") — this is external research bolted onto her rule, not her own evidence. Keep it out of anything Alyssa-facing; the actual rule (zero em-dashes, her verbatim correction) is already correctly absorbed without it.
- `Hermes/tests/results/*` and the sprint/tournament/calibration files under `Studio/Hermes/tests/` are judge-process artifacts (which candidate scored what), not voice findings — nothing there belongs in the merge queue; they're already correctly excluded from Voice and should stay excluded.

## Recommendation

1. **Merge queue is the ~55 items above, prioritized in this order**: subject-lines (whole missing format, real Kit numbers), carousel cover/hook architecture (THE flow, the 7-word cap, the reframe-on-cover ban, the 9-slide spine), then the three email formats' hard guards (Simmer pivot ceiling + scene-stakes test, Soft Sunday bold ceiling, sales-email launch doctrine), then sales-page/web-page ordered skeletons. Each merge should land as a new "what makes hers hers" bullet or a new format file (subject-lines.md, for-the-girls.md), citing [[Library/Examples]] directly per the examples-first rule, not restating STYLE/craft prose.
2. **After the merge, STYLE.md, ANTI-AI.md, TASTE.md, and craft/*.md become what [[Studio/Voice/README]] already calls them: downstream reference, not a parallel authority** — they stay in place as the forensic detail and adjudication history behind each Voice rule (the KILL-LIST already says "read it in full when a draft sits close to a line here and the call isn't obvious"), but nothing in them should be treated as unabsorbed after this pass closes. SOUL.md and MEAN-ALYSSA.md are a different animal (identity/gate infrastructure, not format rules) and should stay as-is regardless — they were never meant to be format-metabolized.
3. **The three Archive files** (`voice-profile.md`, `voice-archive.md`, `writing-style.md`) were already retired 2026-07-05/07-10 and superseded per [[reference_second_brain_voice_layer]] in Alyssa's memory — nothing in them surfaced content absent from both Studio/Hermes and Studio/Voice, so no further action needed there; they can stay archived.
4. **The deep-voice-study scheduled task** (currently paused) should aim its next runs at the formats with zero or thin Voice coverage first — subject lines and For The Girls posts have real craft files but no Voice format file at all, and sales-pages/web-pages have only single-example coverage (n=1-2) per their own confidence notes. Point future deep-reads at closing those gaps rather than re-studying formats already at n=15+ (sales-emails, carousels).
5. **This is a one-time debt, not a standing process problem**: the KILL-LIST/ANTI-AI pair shows the mechanism works when it's run (no drift after a real copy pass) — the gap exists because the Voice layer's format files were built once, quickly, straight from Library/Examples, and never went through the multi-month craft-file accumulation the old files did. A single deliberate merge pass closes it; no new ongoing sync process is needed beyond keeping the scheduled task's output landing in craft/* until each finding is confirmed, then pushing confirmed findings into Voice on the same cadence as craft-file distillation already runs (see [[Hermes/LEARNING]] capture → distill → replace → clear loop).

## Left unmerged (stale/unconfirmed)

These ~6 items were deliberately not merged into the Voice layer. They stay where they are (Studio/Hermes) and should not be treated as rules until Alyssa rules on them:

1. **Open-question bold density in long-form origin-story emails** — [[Hermes/craft/emails-soft-sunday]] documents some emails running 15-20+ bolds/200 words, conflicting with the confirmed 3-6 ceiling. Never resolved. Flagged as a live tension inside [[Studio/Voice/formats/soft-sundays]] rather than merged as a rule.
2. **Cross-post phrase reuse ruling** — open in [[Hermes/learning/inbox]] since 2026-07-06: whether verbatim cross-post phrase reuse is sanctioned voice or an imitation tell. Not merged in either direction.
3. **Feb 24 "metaphor wallpaper" carve-out question** — open in [[Hermes/learning/inbox]] since 2026-07-06, post still benched from test controls. Not merged.
4. **AI-mined "productive contradictions" framing** in [[Hermes/SOUL]] (anti-hustle brand / ferocious work ethic) — useful thinking, but analysis-generated pattern-naming, not a rule she stated. Left as downstream reference only, not moved into any Voice format file.
5. **Speculative stylometry citation** in [[Hermes/ANTI-AI]] ("6-12 em-dashes/1000 words = LLM") — external research bolted onto her rule, not her own evidence. The actual rule (zero em-dashes, her verbatim correction) is already correctly absorbed in [[Studio/Voice/KILL-LIST]] without this citation; the citation itself was not merged.
6. **Judge-process test artifacts** (`Hermes/tests/results/*`, `Studio/Hermes/tests/*`) — sprint/tournament/calibration files, not voice findings. Correctly excluded from the Voice layer; no action taken.

## Merge executed 2026-07-10

Per-file summary of what landed where:

- **Created [[Studio/Voice/formats/subject-lines]]** — whole missing format. Kit-verified pattern taxonomy, 40-char hard cap, Norah's-name-never-in-subject-lines rule, never-list. Wired into [[Studio/Voice/formats/README]].
- **[[Studio/Voice/formats/carousels]]** — added cover-mechanics section (weird-beats formula, under-7-words cap, mandatory payoff, no-reframe-on-cover, talk-TO-the-reader ruling, period-or-nothing), THE flow (the 9-slide canonical spine), the texture floor, and a pointer to [[Hermes/craft/for-the-girls-posts]] for the FTG lane.
- **[[Studio/Voice/formats/simmers]]** — added the three hard guards (pivot-by-35% ceiling, scene-stakes test, metaphor-nuance test), the confirmed promo-variant split, and the metaphor-callback/role-consistency rulings.
- **[[Studio/Voice/formats/soft-sundays]]** — added the confirmed bold-density ceiling (3-6/200 words), with the long-form exception flagged as still-open rather than merged as fact.
- **[[Studio/Voice/formats/sales-emails]]** — added the one-coherent-emoji-family device, the launch doctrine (one event + five promo emails, 80% reuse), and the Kit-verified segment register shift.
- **[[Studio/Voice/formats/sales-pages]]** — added the full ordered 12-beat page skeleton, "sell the Hawaii not the flight," register calibration by product tier, and the stale-page warning list.
- **[[Studio/Voice/formats/about-page]]** — added the full ordered story skeleton, verse-pacing note, and the credentials-only-in-a-because-clause rule.
- **[[Studio/Voice/formats/home-page]]** and **[[Studio/Voice/formats/meta-copy]]** — no missing items surfaced by the audit beyond what was already absorbed; left unchanged.
- **[[Studio/Voice/KILL-LIST]]** — added her verbatim negative-parallelism carve-out ruling, the rule-of-three clarification with its real-example anchor, the genuine-typo-vs-voice-device distinction, a new "Style floors" section (ALL-CAPS floor, vowel-stretching floor, bold density, staccato-once-at-peak), and a new "Urgency and CTA timers" section (real-expiry-vs-theater, emoji-as-grammar).
- **[[Studio/Voice/README]]** — added the "Published is not approved" footnote and the ask-Alyssa-when-no-example doctrine from [[Hermes/MEAN-ALYSSA]].
- **Header stamps added**: [[Hermes/SOUL]], [[Hermes/STYLE]], [[Hermes/ANTI-AI]], [[Hermes/TASTE]], and all 11 files in `Studio/Hermes/craft/` now carry "Downstream reference — metabolized into [[Studio/Voice/README]] 2026-07-10; the Voice layer is authority. Historical depth lives here; new rules land in Voice first."
- **KILL-LIST vs ANTI-AI**: confirmed faithful copy per the audit; untouched beyond the depth additions listed above.
- **Not touched**: Notebook/, Library/ content, `Hermes/learning/` raw logs, `Hermes/tests/`, scheduled tasks, the three archived analysis files.

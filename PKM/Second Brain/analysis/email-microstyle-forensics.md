# Hermes v3 — Alyssa Coleman Micro-Style Forensics

Forensic stylometric pass over Alyssa's real copy. Purpose: convert her three verbatim corrections ("i dont use em dahses", "i dont use that many periods", "i dont do the its not this its that shit") into mechanically-checkable micro-rules with counts as evidence.

**Corpus analyzed (19 files, read end to end):**
- Simmers (3): my-existential-crisis-and-pinterest, gentle-parent-your-business-model, when-delta-stole-my-business-idea
- Soft Sundays (8 real + 1 flagged): i-fixed-your-email-list, your-list-called-theyre-hungry, i-failed-formula-for-growth, ur-not-new-march-plan, if-lorelai-had-an-online-biz, why-i-burned-down-my-business, marketing-predictions-2026 + **me-i-need-ideas-i-already-had (flagged TOO-AI, analyzed separately)**
- Sales emails (5): boh-sales-email-pinterest-plan, slowly-viral-webinar-invite, slow-marketing-plan-webinar-invite, silent-killer-of-good-work, email-list-resuscitator-oops-email
- Pages (2): about-page, home-page
- Carousels (1): captions.md (14 real IG captions in code-fenced blocks)

**Critical methodology note:** These .md files contain THREE layers: (a) YAML frontmatter + scaffold metadata (machine-written), (b) markdown structure (headings, product-spec bullet blocks, recurring footer/section templates), and (c) Alyssa's actual body prose. Raw grep counts conflate all three. The rules below are derived from layer (c) only. This distinction is the whole story on em-dashes.

---

## 1. PUNCTUATION FORENSICS

### Em-dash ( — ) — HER PROSE USES ~ZERO
Raw corpus count: **62**. But when you strip metadata, headings, and templated blocks, em-dashes in Alyssa's genuine sentence-level prose collapse to essentially **zero**. Breakdown of where the 62 live:

- **captions.md: 14 → all 14 are in machine-generated section headings** (`## 2026-01-15 — Slow Marketing Trends Pt. 1`). Inside the code-fenced caption bodies (her actual IG voice): **0 em-dashes.** Confirmed by `awk` extraction of fenced text = 0.
- **marketing-predictions-2026.md: 13 →** 2 in frontmatter description/preview; ~7 in the "Just Upgraded / CEO Year" product-feature bullet block (lines 148–162: `**Your All-in-One Planning Hub** — Map out...`) which is templated product-spec copy; the remainder are parenthetical asides in quoted blocks. Genuine narrative-prose em-dashes: near 0.
- **Sales-email H1 titles** (`# BOH Sales Email — Pinterest + Email Plan`, etc.): 3, all in the machine title, not body.
- **i-fixed-your-email-list.md:** the em-dashes are in day-plan headings (`**DAY ONE — Find Cold Subscribers**`).
- **Actual body-prose em-dashes found in the ENTIRE real corpus (excluding the flagged AI email):** effectively 2 borderline cases — `why-i-burned-down:21` ("...swirling in the air right now — Am i right?") and `ur-not-new:65` ("...don't need a new offer — you just need..."). Both could be rewritten with `..` or a comma and would read more like her.
- **The flagged TOO-AI email (me-i-need-ideas): 5 em-dashes** in a much shorter file — a notably higher density in prose, e.g. line 38 "**re-commerce** 🤓 — More and more businesses...". This is corroborating evidence the flag is real.

**Verdict: em-dashes are a machine/scaffold artifact, not Alyssa. Her voice = 0.** She replaces the em-dash's job (mid-sentence pivot, dramatic aside) with `..`, `...`, commas, and parentheses.

### Spaced hyphen " - "
Total: ~19, and its function is narrow and specific. It appears as:
1. **Recurring footer-CTA separators** (templated): "Strategy meets softness, once a month - [Reserve a table]" — appears identically in gentle-parent, delta, and other footers.
2. **A rare mid-sentence aside substitute**: "turns out wind turbines are a big buzzkill to live near - and also kill a lot of birds FYI" (i-failed:27). This is her using `-` where AI would use `—`.

She does NOT use " - " as a rhetorical antithesis device. It's a light connective/aside dash.

### Ellipsis forms — THIS IS HER SIGNATURE PUNCTUATION
Combined `..` (44) + `...` (~15) + `…` (51) = **~110 trailing-dot events across the corpus.** This dwarfs her em-dash usage and rivals her period usage. Three forms, all in active rotation, all doing the same trailing/trailing-off job:
- **`..` (two dots)** — her most characteristic tic. Trails a thought, adds a beat, softens: "at the thrift store.. 🙃", "too hot for knits..", "I just don't have enough leads", "you're not getting as many replies", "is it you?.. is it them?"
- **`…` (unicode) and `...`** — same function, interchangeable with `..`: "the leads would stop trickling in...", "then…crickets".
- **Function:** suspense, comedic timing, softening a hard claim, mimicking speech rhythm. She trails off MID-thought and MID-email constantly. This is the single biggest positive marker of her voice.

### Question marks
Range 0–20 per file; heavy in reflective/pep-talk emails (why-i-burned=20, i-fixed=18). She asks the reader direct rhetorical questions in clusters: "Is it you? 🥲 Is it them? 🥹". Not evenly distributed — they bunch in the emotional "pep talk" beats. Sales emails run lean (boh=1, slowly-viral=0).

### Exclamation points
Range 0–9 per file, typically **3–6 per email**. Present but not spammy. Often paired with all-caps or emoji for a single punch ("HARD WORK PAYS OFF", "THIS IS THE YEAR!"). Never in long runs of `!!!`.

### ALL CAPS words
Very high and very deliberate — 10–63 per file. This is a core emphasis tool alongside **bold**. She caps for shouting/emphasis: "NOTHING", "CAT IN WATER MODE", "NONE OF THAT EVER HAPPENED", "EVERGREEN", "COULDN'T. REMEMBER. ANY OF IT." Caps + bold + italics stack freely. (Note: the flagged AI email has the LOWEST caps count of the Soft Sundays at 10 — under-emphasized, another AI tell.)

### Emoji as punctuation
Pervasive and structural. Emoji terminate lines, replace bullets, and act as tone markers mid-sentence: "🫠", "🙃", "💅", "🤎". The 🤎 (brown heart) is her signature sign-off. Emoji frequently stands in for a terminal period — a line ends in emoji, not a full stop. This is part of WHY her period count is low.

---

## 2. SENTENCE / PARAGRAPH SHAPE

### The period paradox (proves "i dont use that many periods")
Measured on body prose only (frontmatter + links stripped), terminal `. ` vs trailing-dots (`..`/`…`) vs `!` vs `?`:

| Email | periods | ellipsis/dots | excl | ques | short-lines(≤4wd) |
|---|---|---|---|---|---|
| gentle-parent (real) | 8 | 8 | 4 | 2 | 2 |
| your-list-hungry (real) | 5 | 6 | 3 | 4 | 2 |
| when-delta (real) | 15 | 3 | 0 | 3 | 6 |
| silent-killer (real) | 9 | 7 | 1 | 5 | 7 |
| **me-i-need-ideas (FLAGGED AI)** | **21** | **1** | **0** | **3** | **1** |

**The flagged AI email has period=21, ellipsis=1 — the exact inversion of her voice.** In real Alyssa, trailing-dots meet or exceed periods, and hard periods stay in the single digits. She avoids the clean declarative full stop; she trails, she runs on with commas, she ends on emoji. When periods dominate and dots vanish, it reads as AI.

### Fragment / staccato usage — SHE USES IT, BUT SPARINGLY AND FOR PEAK MOMENTS
Real emails contain roughly **2–7 short/fragment lines total**, and the true one-word-per-line staccato run is used **once, maybe twice per email, at the emotional climax only:**
- delta email: "I COULDN'T. / REMEMBER. / ANY OF IT." (one run, the peak)
- delta: "Gone." / "Not tucked in my book." (short punches, clustered in one story beat)
- gentle-parent: "**We're back at square one.**" / "Not because the launch flopped. / But because people FORGOT."

The staccato is a SPICE, deployed at the single most dramatic point. Generated copy over-uses it (a fragment punch every 2–3 lines). **Her real rate: ~1 true staccato run per email, plus 2–5 scattered short lines. Not more.**

### Paragraph shape
Short. Mostly 1–3 sentences per paragraph, separated by blank lines and `---` dividers. Heavy use of one-line paragraphs (a single bolded sentence standing alone). But those one-liners are usually a FULL thought or a bolded emphasis line, not a clipped sentence fragment. Long paragraphs appear only in reflective origin-story beats (why-i-burned).

---

## 3. CONTRAST / NEGATION INVENTORY (proves "i dont do the its not this its that shit")

Every contrast/negation instance in the real corpus, quoted verbatim:

**A. Crisp antithetical "It's not X, it's Y" — RARE, ~1 per email max, and softened when used:**
- gentle-parent: "Not because the launch flopped. / But because people FORGOT." → note: split across two lines with a beat, not "it's not X it's Y" on one line.
- why-i-burned: "**Because it's not just about automating, it's about automating with intention.**" ← the closest to the banned shape; note the "**not just** about... it's about" softener.
- me-i-need-ideas (FLAGGED AI): "Re-commerce **isn't just** a business strategy. It's a mindset." ← the crisp AI form; appears in the flagged email, corroborating the flag.

**B. "not because / it's not because" (concessive) — used, feels human:**
- home-page: "And it's **not because** your offer isn't good enough. / Or because you're not posting enough."
- gentle-parent: "**Not because** the launch flopped."

**C. "it's not just X" (inclusive, additive) — used, feels human:**
- i-fixed: "And i KNOW **it's not just** me!"
- your-list: "**it's not juuust** that there wasnt anything that i WANTED, it was the fact that..."
- predictions: "**It's not a matter of** doing more trial reels... we're just being priced out."

**D. "Instead / instead of X" and "less X, more Y" and "stop X, start Y" — her PREFERRED contrast vehicles:**
- if-lorelai: "**Instead:** we keep selling your signature dish."
- predictions: "**Instead of** pouring your energy into the feed, I'd start reallocating..."
- silent-killer: "**Not** to make you do more, **but** to make sure what you do (once) actually works."
- recurring brand line: "**stop feeding the algorithm**, and start **feeding their creativity**" (footer template)
- burned-down: "spend **less time** in the admin and **more time** dreaming"

**Precise ruling on the ban:**
- **BANNED (never, or she flags it as AI):** the crisp single-line antithesis "It's not X. It's Y." / "This isn't about X, it's about Y." delivered as a punchy standalone. The one clean instance ("Re-commerce isn't just a business strategy. It's a mindset.") lives in the email SHE flagged as too-AI. That is the shape she means.
- **ALLOWED, sparingly (~1x/email):** the softened/split forms — "not just X" (additive), "not because X / but because Y" (split across lines with a beat), and especially the "**Instead of** X, [do] Y" / "**less** X, **more** Y" / "**stop** X, **start** Y" constructions. These are her natural contrast tools and don't read as AI.

The distinction: AI-slop antithesis is **symmetrical, standalone, and declarative**. Her contrast is **asymmetrical, embedded in a run-on, softened with "just," and often split across two lines with an emoji or beat between them.**

---

## 4. OPENERS AND TRANSITIONS

**How her pieces open (first 1–2 lines, verbatim):**
- existential-crisis: "whats up [FIRST NAME], / I just finished re-organizing my closet (& NOTHING was sparking joy 🫠)."
- gentle-parent: "K, so I have this problem, [FIRST NAME]. / **My daughter HATES getting her hair washed.**"
- delta: "Did i ever tell you about the time **I almost quit my business because of delta.**"
- your-list-hungry: "**I cried into my fridge this week, [FIRST NAME].**"
- i-failed: "**I failed statistics in university [FIRST NAME] … twice**"
- burned-down: "New year / new me / new goals / new vision / new life loading / vibes... Am i right?"
- silent-killer: "Hi [FIRST NAME] / You know those people who just… / **make things?**"
- slowly-viral: "When people talk to me about their marketing, [FIRST NAME], they often say something along the lines of..."

**Pattern:** Almost every email opens **in the middle of a personal scene or confession** — a mundane domestic moment (closet, bath, fridge, flight) that becomes the business metaphor. Name-drop `[FIRST NAME]` lands in the FIRST or SECOND line, mid-sentence, casually. Frequent opener words: "K,", "so,", "Ok,", "Hey,", "whats up", "Listen,". Lowercase sentence starts are common and intentional.

**Her real transition phrases (verbatim):**
- "But here's the thing…" / "Here's the deal…" / "Here's why:" / "here's the kicker:"
- "And that's when I saw it." / "And that's when I decided..."
- "Buuuut" / "Soooo" / "..but EVERY year" (stretched vowels as a transition/tone device)
- "So while..." / "Anyway," / "Well, here's why:"
- "And as i was ...it got me thinking about the marketing version of this:"
- "But that doesn't mean..." / "..and i convince myself"
- The metaphor-to-lesson pivot is often literally flagged: "**got me thinking about the marketing version of this**" / "**I couldn't help but see the parallels**" / "**it reminded me of exactly how I used to feel after a launch**".

Vowel-stretching ("waaaant", "Buuuut", "Soooo", "juuust", "annnnd", "reallyyyy") is a HIGH-frequency voice marker and does transition work.

---

## 5. THE TOO-AI CONTRAST CASE (me-i-need-ideas-i-already-had)

Quantitatively, what the flagged email does that the real ones don't:

| Metric | Flagged AI email | Real Alyssa emails |
|---|---|---|
| Periods (body prose) | **21** | 5–15 |
| Trailing dots (`..`/`…`) | **1** | 3–8 (meets/exceeds periods) |
| Em-dashes in prose | **5** (high density for length) | ~0 |
| ALL-CAPS words | **10** (lowest of the set) | 18–49 |
| Vowel-stretch ("Buuut" etc) | 0 | multiple per email |
| Staccato/fragment climax | absent | 1 per email |
| Crisp antithesis | "Re-commerce **isn't just** a business strategy. It's a mindset." | avoided/softened |

**Qualitative tells in the flagged email:**
- Clean, symmetrical, declarative sentences with hard periods. "Repurpose old workshops, client resources, live event recordings into low ticket offers, course bonuses, or sellable recordings." ← list-of-three, evenly balanced, no personality, no dots, no caps, no emoji mid-sentence.
- The banned antithesis appears here and essentially nowhere else in real form.
- Missing: the mid-scene personal confession, the vowel stretches, the trailing `..`, the emoji-as-terminal-punctuation, the dense caps emphasis. The prose is *tidy*. Alyssa's real prose is deliberately *messy*.

**One-line diagnosis:** the AI email is punctuated by periods and em-dashes and balanced antitheses; the real ones are punctuated by trailing dots, caps, emoji, and run-ons.

---

## 6. HARD MICRO-RULES (mechanically checkable)

1. **Em-dashes ( — ): 0 allowed in body prose.** Not one. Replace every pivot/aside with `..`, a comma, or parentheses. (Evidence: genuine-prose em-dash count across the entire real corpus ≈ 0; the ones that exist are in headings/metadata/the flagged AI email.)

2. **Trailing dots are mandatory: minimum ~1 `..` or `…` for every ~2 hard periods.** If an email has more periods than trailing-dot marks, it reads AI. (Evidence: real emails run dots ≥ periods; flagged AI email ran 21 periods to 1 dot.)

3. **Hard periods stay low: aim ≤ ~12 sentence-ending `. ` in a full-length email body,** favoring commas, run-ons, and emoji/dot line-endings instead. (Evidence: real range 5–15, skewed low; AI email = 21.)

4. **Crisp antithesis "It's not X. It's Y." — 0 allowed** as a standalone punchy line. This is the exact "its not this its that shit." If you must contrast, use the softened/split forms below. (Evidence: the one clean instance lives in the email Alyssa flagged as too-AI.)

5. **Contrast, when used, max ~1 per email, and only in her forms:** "**Instead of** X, [Y]" / "**less** X, **more** Y" / "**stop** X, **start** Y" / "not **just** X" (additive) / "not because X" split across two lines with a beat. (Evidence: her real contrasts are all asymmetrical/softened/embedded.)

6. **Staccato one-word-per-line run: max 1 per email,** placed at the single emotional peak. Scattered short lines (≤4 words): max ~5–7. Do not punch a fragment every few lines. (Evidence: real emails = 1 true staccato run; 2–7 short lines total.)

7. **ALL-CAPS emphasis: high and required — expect 18–50 caps words per full email,** stacked with **bold** and _italics_. Under-capping is an AI tell. (Evidence: real 18–49; flagged AI = 10.)

8. **Emoji as terminal punctuation and mid-sentence tone marker throughout;** many lines end in emoji, not a period. Sign-off heart = 🤎. (Evidence: pervasive in every real file; sparse in the AI email.)

9. **Open mid-scene with a personal/domestic confession, name-drop `[FIRST NAME]` in line 1–2, mid-sentence.** Lowercase sentence starts and opener words "K," / "so," / "Ok," / "Hey," are on-brand. (Evidence: every real email opens this way.)

10. **Vowel-stretching is a required voice marker: ≥2–3 per email** ("Buuuut", "Soooo", "waaaant", "juuust", "annnnd", "reallyyyy"). Its absence flattens the voice to AI. (Evidence: multiple per real email; 0 in the flagged AI email.)

11. **Spaced hyphen " - " only for light asides or the templated footer-CTA separators — never as a rhetorical antithesis dash.** (Evidence: only appears as connective/aside or in recurring footers.)

12. **Exclamation points: 3–6 per email, never in `!!!` runs;** pair a single `!` with caps/emoji for a punch. (Evidence: real range 0–9, usually mid-single-digits.)

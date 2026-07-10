# Anti-Slop Crosswalk

Status: extracted 2026-07-05

## Sources

- `hardikpandya__stop-slop` | SKILL.md, references/phrases.md, references/structures.md
- `aaaronmiller__create-viral-content` | references/ai-tells.md
- [[Notebook/Journal/2026/05/2026-05-28-githubs-im-into]] | notes `WRITING.md -- Anbeeld` as a humanizer reference (link only, not mined here — description in that journal entry is just the label "*(humanizer)*"; no rules text saved in the vault to crosswalk against)
- [[Hermes/ANTI-AI]] | SENIOR GATE — Alyssa's own saved rules + her 2026-07-05 corrections. This file outranks everything below. Nothing in this crosswalk edits it, adds to its authority, or overrides its carve-outs.

## Rule

External anti-slop material is a support layer under Hermes/ANTI-AI.md. Where the two disagree, ANTI-AI.md wins, full stop. This document exists to (1) prove we already catch most of what these repos catch, and (2) surface the small set of NEW tells worth adding to mechanical lint — never to relitigate anything ANTI-AI.md already settled.

---

## Section 1 — Overlap (we already ban this)

Kept short. These are tells the external repos flag that Hermes/ANTI-AI.md already bans, usually more precisely.

| External tell | Our rule (ANTI-AI.md) |
|---|---|
| Binary contrasts / "Not X. It's Y." / negative listing / reframe setups | "Negative parallelism and reframe ban" — the 15 banned shapes, total ban, her own words |
| Em-dash overuse | "Em-dashes (—): ZERO." — stricter than stop-slop's "remove" or ai-tells.md's "max 1/500 words" |
| Rule of three / three-item lists | "Rule of three" — AI pattern when shallow; carved out for real deep 3-act structure |
| Sentence starting with Wh- word | Not explicitly named in ANTI-AI.md, but functionally covered by "Dead openings and transitions" + staccato/throat-clearing bans (see Section 2 — partial, adding as new) |
| Throat-clearing openers ("Here's the thing:", "Let's dive in", "The truth is") | "Dead openings and transitions" list covers most; stop-slop/ai-tells add a few more variants (see Section 2) |
| Corporate jargon / LLM vocabulary (leverage, unlock, robust, streamline, seamless, etc.) | "Banned vocabulary" — our list is longer and Alyssa-specific (includes her bot's banned words: ditch, hustle, quiet/quietly, boss babe, etc.) |
| Vague declaratives ("The implications are significant") | "Vague → specific" in Final pass checklist; also "Puffery" rule |
| False agency / personification ("the decision emerges," "culture shifts") | "Personification-for-dread stacks" partially covers the dread subset; broader false-agency ban not explicit — adding as new (Section 2) |
| Trailing "-ing significance clauses" | Explicitly named, called "the single strongest stylometric LLM tell," zero tolerance — stronger than anything in the external repos |
| Meta-commentary ("I'll explain how...", "This post will cover...") | "Meta commentary — never announce the writing" |
| Adverbs (-ly words, "really," "just," "actually," "honestly") | Not explicitly banned in ANTI-AI.md as a class — she doesn't ban adverbs wholesale (this would conflict with her long-sentence, run-on, asides style). NOT adopting stop-slop's blanket adverb kill — see Section 4. |
| Passive voice | Not explicitly banned in ANTI-AI.md. Her rule priority is accuracy/clarity/specificity/human/style — passive voice isn't flagged as an automatic tell in her source material. Not adopting a blanket ban — see Section 4. |
| Hedging ("It's worth noting," "That said," "On the other hand") | "Furthermore," "Additionally," "Moreover," "That said," "With that in mind," "On top of that" already in Dead openings/transitions list |
| Engagement bait closers ("Agree?", "Drop a comment") | Not explicit in ANTI-AI.md — platform-specific, likely out of scope for prose-level lint (see Section 2 as optional addition) |

This proves solid coverage: the two biggest external "big rules" (reframe/binary-contrast bans, em-dash bans) are already senior-gate law here, and ours is stricter in both cases.

---

## Section 2 — NEW tells not yet caught

Each entry: the tell, an example, and a voice-conflict check against ANTI-AI.md's carve-outs (her caps, dots, run-ons, asides, long sentences, staccato-at-peak-only, register-scoped period density).

### 2.1 Wh- word sentence openers
**Tell:** Sentences starting with What, When, Where, Which, Who, Why, How as a rhetorical setup.
**Example:** "What makes this hard is the timing." / "Why does this keep happening?"
**Voice check:** SAFE to lint. Doesn't touch caps, dots, run-ons, or long sentences — it's about the opening word, not sentence length or punctuation. No conflict.

### 2.2 False agency (broader than dread-personification)
**Tell:** Inanimate/abstract nouns doing human verbs, hiding the actor. "The complaint becomes a fix." "The data tells us." "The market rewards." "The conversation moves toward."
**Example:** "The feedback becomes a redesign" instead of "She redesigned it after the feedback."
**Voice check:** SAFE. ANTI-AI.md already bans the dread-specific subset (silently/quietly). This generalizes the mechanism, not the tone — doesn't touch her caps/asides/run-ons. Low risk of false positives IF scoped to a verb list (becomes, emerges, shifts, moves toward, tells us, rewards, unlocks) rather than banning all abstract subjects, since she does write abstractly at times in asides.

### 2.3 Narrator-from-a-distance
**Tell:** Lecturer voice floating above the scene instead of speaking to "you." "Nobody designed this." "This happens because..." "People tend to..."
**Example:** "People tend to avoid hard conversations." vs. her actual pattern of speaking directly to the reader.
**Voice check:** SAFE, and actually reinforces her real voice — she writes "you," not "people." No conflict; this is a *supports-her-voice* addition, not just an anti-AI catch.

### 2.4 Structure Tells — rigid list scaffolding in prose
**Tell:** "First... Second... Third... Finally...", numbered lists imposed on narrative prose, headers for every paragraph.
**Example:** A caption structured as "1. The problem 2. Why it matters 3. What to do."
**Voice check:** CONFLICT RISK — flag only for narrative/confession register, per ANTI-AI.md's register-scoping rule (period density note explicitly carves out "list-built sections, labeled steps, feature stacks" as exempt/structural). Only lint this in registers where she doesn't intentionally use labeled steps. Must NOT fire on legitimate teaching frameworks (e.g., "Reason nO1/nO2/nO3" — explicitly grandfathered in ANTI-AI.md's deep-read addition).

### 2.5 Enthusiasm/hype adjectives
**Tell:** "Revolutionary," "groundbreaking," "mind-blowing," "incredible," "game-changer," "I'm excited to share."
**Example:** "This is a game-changer for your business."
**Voice check:** SAFE — largely overlaps with her existing banned vocabulary list (game-changer already banned) but ai-tells.md adds more (groundbreaking, mind-blowing, transformative, incredible). No conflict with her caps/dots/asides — this is about hollow hype words, not her expressive punctuation.

### 2.6 Engagement-bait closers
**Tell:** "Change my mind," "Let me know in the comments," "Tag someone who needs this," "Agree or disagree?"
**Example:** Ending a caption with "Drop a comment if this resonated!"
**Voice check:** SAFE to lint as support-layer only. Some closers of this shape could overlap with legitimate CTA copy she does want (asking for engagement isn't inherently AI) — so this one is lower-confidence and belongs in support layer, flagged for human review, not mechanical near-kill.

### 2.7 Pleonasms and tautologies
**Tell:** Redundant word pairs. "true fact," "end result," "completely eliminate," "collaborate together," "revert back," "repeat again."
**Example:** "The end result was a completely eliminated backlog."
**Voice check:** SAFE. Pure redundancy catch, doesn't touch rhythm, caps, or asides. Genuinely mechanical and low-risk.

### 2.8 Burstiness / uniform sentence length
**Tell:** Every sentence 15-18 words, no variation.
**Voice check:** SAFE and actually aligned with her rule ("Alyssa always does long sentences," staccato max one at the peak) — this external check reinforces her rule, doesn't conflict. Good candidate for a length-variance heuristic (flag if 4+ consecutive sentences fall within a narrow word-count band).

### 2.9 Paragraph starters: However/Moreover/Overall/Furthermore/Importantly + comma
**Tell:** Paragraph opens with a hedge/transition word followed immediately by a comma.
**Voice check:** SAFE — already 90% covered by ANTI-AI.md's Dead openings list (Furthermore, Additionally, Moreover, That said are already there). Adding "Overall," and "Importantly," as the two not explicitly named, plus generalizing to a regex on the paragraph-start position specifically (not just anywhere in text).

### 2.10 Multi-syllable/Latin-root word density
**Tell:** Overuse of "utilize," "demonstrate," "facilitate," "approximately" instead of plain words.
**Voice check:** Mostly SAFE, but do NOT adopt the raw "under 20% multi-syllable vocabulary" threshold as a hard rule — that's the kind of over-correction that produces choppy, dumbed-down prose ANTI-AI.md explicitly warns against ("aggressively choppy, adverb-free prose is its own AI template"). Use only the specific-word list (utilize→use, demonstrate→show, facilitate→help), not a vocabulary-density score.

---

## Section 3 — WS-008-style lint spec addition (SUPPORT LAYER ONLY)

**A hit below = flag for human review. Never an auto-kill. ANTI-AI.md stays senior; nothing here overrides its carve-outs (caps, dots, run-ons, asides, long sentences, register-scoped periods, staccato-at-peak-only).**

```
# --- WH- OPENERS (2.1) ---
^(What|When|Where|Which|Who|Why|How)\b.*\?  # sentence-initial Wh- word

# --- FALSE AGENCY VERBS (2.2), scoped verb list only ---
\b(the \w+ (becomes|emerges|shifts|unlocks))\b
\bthe data (tells|shows) us\b
\bthe market rewards\b
\bthe conversation moves (toward|to)\b

# --- NARRATOR-FROM-A-DISTANCE (2.3) ---
\bnobody (designed|planned|decided)\b
\bpeople tend to\b
^this happens because\b

# --- RIGID LIST SCAFFOLDING (2.4) — narrative/confession register ONLY, skip if register = list-built/steps/framework ---
^(First|Second|Third|Finally)[,:]
\bin conclusion\b
\bto summarize\b
\blet'?s (break this down|dive in|explore|unpack)\b

# --- HYPE ADJECTIVES (2.5), beyond existing banned-vocab list ---
\b(groundbreaking|mind-blowing|incredible|transformative|revolutionary)\b
\bi'?m excited to share\b

# --- ENGAGEMENT BAIT CLOSERS (2.6) — low confidence, human review only ---
\bchange my mind\b
\blet me know in the comments\b
\btag someone who\b
\bagree or disagree\??\b

# --- PLEONASMS / TAUTOLOGIES (2.7) ---
\btrue fact\b
\bend result\b
\bfinal outcome\b
\bcompletely eliminate\b
\bclose proximity\b
\bcollaborate together\b
\bjoin together\b
\brevert back\b
\brepeat again\b

# --- BURSTINESS (2.8) — not regex, needs a script check ---
# Flag if 4+ consecutive sentences all fall within a 15-18 word band (or any single ~4-word band).
# Cross-check against staccato rule: legitimate single staccato-at-peak should NOT trip this.

# --- PARAGRAPH-INITIAL HEDGES (2.9) — position-anchored, new terms only (existing 4 already in ANTI-AI.md) ---
^(Overall|Importantly),\s

# --- LATIN-ROOT SWAPS (2.10) — word list only, NOT a density score ---
\butilize\b
\bdemonstrate\b
\bfacilitate\b
\bapproximately\b
```

Notes for whoever wires this into The Pass station:
- Run register-detection before 2.4 and the period-density checks — the same text that fires false-positive on "structure tells" in a narrative caption may be a legitimate labeled-steps framework in a teaching email.
- 2.6 (engagement bait) and 2.8 (burstiness) are lower-confidence than the rest — route these to a "review, don't flag hard" bucket rather than treating hits the same as 2.1/2.2/2.7 hits.
- None of this touches em-dashes, negative parallelism, or vocabulary — those already have senior mechanical checks per ANTI-AI.md; don't duplicate, just make sure The Pass runs both layers.

---

## Section 4 — Over-correction traps (do NOT adopt)

External material that would actively HARM her voice if applied mechanically:

1. **stop-slop's blanket adverb ban ("Kill all adverbs. No -ly words.")** — Direct conflict. Her voice runs on run-ons, asides, and natural spoken rhythm; adverbs are part of normal speech, not a tell by themselves. ANTI-AI.md never bans adverbs as a class. Adopting this would sand down exactly the "aggressively choppy, adverb-free" template she explicitly warned against.

2. **stop-slop's blanket passive-voice ban ("Every sentence needs a human subject doing something")** — Too rigid for her long, winding sentence style; some passive constructions are natural inside a run-on aside and don't read as AI. Not in her source rules. Reject as a mechanical hard-kill; at most a soft note.

3. **stop-slop's "two items beat three" / "no three-item lists ever"** — Already directly addressed by her own deep-read ruling: real three-act/three-reason structures are grandfathered, and the ban targets shallow enumeration only. A blanket "always cut to two" rule would have flagged her own real "Reason nO1/nO2/nO3" email. Use her narrower version, not stop-slop's blanket one.

4. **ai-tells.md's Oxford comma inconsistency heuristic** ("Humans are inconsistent, vary it") — Manufacturing artificial inconsistency to "seem human" is itself a tell-chasing trap; it's solving for detector-evasion, not for her actual voice, and isn't grounded in anything she corrected. Skip entirely.

5. **ai-tells.md's "read aloud, bar test" as an automated heuristic** — Fine as human guidance, not translatable to mechanical lint; including it as a "rule" risks someone hard-coding a fake proxy for it (e.g., punishing all long sentences) that would directly collide with "Alyssa always does long sentences."

6. **stop-slop's "no em dashes at all" framed as new** — Not new (already senior and stricter in ANTI-AI.md), but worth flagging: don't let a second, laxer em-dash rule (ai-tells.md's "max 1 per 500 words") get wired in anywhere by mistake. Zero means zero, not a budget.

7. **General over-correction risk named directly in ANTI-AI.md itself**: "aggressively choppy, adverb-free prose is its own AI template. The fix is never less style, it is HER style." Every addition in Section 3 was screened against this line — anything that would push toward flatter, more mechanical prose was excluded or downgraded to human-review-only.

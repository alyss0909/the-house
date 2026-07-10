# Round 2 Verdict — Sprint Lineups, 2026-07-06 (Mean Alyssa v2 protocol)

Scored per the panel-map protocol against the ROUND 2 section of `KEY-do-not-open.md`. Judges J4, J5 (fresh, blind). Candidates: v2 rewrites of posts 1–4 only (posts 5–6 survived round 1, excluded).

---

## 1. Calibration gate (Lineup A, all-real controls)

### J4 — PASS (at the line)
- Item 1 (real, Feb 24, "Swapped Instagram for Pinterest") → LEAN-FAKE — **1 false positive**
- Item 2 (real, Mar 1) → LEAN-REAL — correct
- Item 3 (real, Mar 3) → SURE-REAL — correct
- Item 4 (real, Jan 22) → SURE-REAL — correct
- Tally: 1 LEAN-FAKE, 0 SURE-FAKE. Passes at the maximum allowed threshold. Note: Feb 24 is the same real deck J3 SURE-FAKED in round 1 — this post has now drawn false flags from two different judges (protocol-tuning signal, see §4).

### J5 — PASS (clean)
- All 5 controls (Feb 19, Feb 6, Mar 10, Jan 29, Mar 7) → 3 SURE-REAL, 2 LEAN-REAL. Zero false positives, zero abstentions. The only fully clean calibration pass of the sprint.

**Calibrated pool: J4 and J5. Both candidates' verdicts count; J5 carries more precision weight.**

---

## 2. Candidate scoring (Lineup B, calibrated judges only)

| Candidate (v2) | J4 | J5 | Outcome |
|---|---|---|---|
| post-1 "The Step You Skip Before Writing." | **LEAN-FAKE** (Item 3) | **LEAN-FAKE** (Item 6) | **CAUGHT** — unanimous |
| post-2 "You're Probably Playing Too Small." | COIN-FLIP (Item 7) | COIN-FLIP (Item 2) | **SURVIVED** — two honest coin-flips, no catch |
| post-3 "You're Using Pinterest At The Wrong Ratio." | **LEAN-FAKE** (Item 1) | **LEAN-FAKE** (Item 8) | **CAUGHT** — unanimous |
| post-4 "You're Automating The Wrong Third." | **LEAN-FAKE** (Item 5) | **SURE-FAKE** (Item 4) | **CAUGHT** — strongest catch of the round (but see §3 note on the false "Claude" tell) |

**3 of 4 caught. 1 survived.**

### False positives by calibrated judges on real items in Lineup B
- **None.** J4: 4/4 reals called SURE-REAL. J5: 3 SURE-REAL + 1 LEAN-REAL on 4 reals. Zero false positives in the test round — a major precision improvement over round 1. Caveat: J4's perfect real-item record is partly leakage-driven (§4), so it overstates J4's true discrimination ability.

---

## 3. Tell extraction (caught candidates → back to the writer)

### post-1 v2 — "The Step You Skip Before Writing." — CAUGHT (unanimous LEAN-FAKE)
J4:
- "'Draft Punk' and 'The Second Brain Club' are invented specific product names not cross-referenced anywhere in the loaded material (TASTE red flag #2: 'invents offers... themes')." *(Scorer note: if these ARE real product/example names, this tell needs writer verification the same way "comment Claude" did — flag to writer.)*
- "every paragraph in the caption executes one craft rule in turn (confession→proof→CTA) with no mess or self-interruption."
J5:
- "The refrain 'One crappy email beats no email, every single time' (slide 7 + caption, restated as a tidy maxim) is a manufactured aphorism/slogan-pair in the banned-adjacent family... this doesn't match any documented real line."
- "The five teaching slides are almost too evenly built — each is a clean label + explanatory body + closing maxim... rather than the 'lopsided, one item always breaks the pattern' real-deck signature."
**Rewrite instruction:** kill the repeated maxim (or replace with one of her grandfathered lines), break the even slide rhythm (one slide must be lopsided/messy), and let one beat go unresolved. Verify Draft Punk / Second Brain Club against BUSINESS.md; if real, log as a J4 false tell.

### post-3 v2 — "You're Using Pinterest At The Wrong Ratio." — CAUGHT (unanimous LEAN-FAKE)
J4:
- "restated three times across slides 4/5/8 and again in caption ('Pinterest does one job... Email does the other job') — this is elegant variation / concept restated, not a single load-bearing line reused."
- "No un-inventable detail (no real number, no named person/moment) — 'it carried mine' is vague, not a hard specific." *(J5 disagrees here — cites "checking the app 14 times before lunch" as good texture; J5's tell below is the sharper one.)*
- "Caption's 'Confession:' label-opener is a summary-style opening STYLE.md bans."
J5:
- "**'Less content, better leads. That's the whole recipe.'** — a compressed two-term contrast-pair slogan (X, better Y) in the exact family ANTI-AI bans... and this pairing doesn't appear anywhere in the cited real corpus." *(Scorer note: round-1 J3 asserted "Less content, better leads" IS her established line per STYLE §6 — this exact phrase is now disputed across rounds. Writer must verify against STYLE.md/BUSINESS.md before rewriting; if grandfathered, J5's primary tell collapses and only J4's restatement/Confession tells stand.)*
**Rewrite instruction:** stop restating the ratio concept (say it once, load-bearing), drop or verify the closing slogan, replace the "Confession:" opener.

### post-4 v2 — "You're Automating The Wrong Third." — CAUGHT (LEAN-FAKE + SURE-FAKE)
J5 (SURE-FAKE, two claimed tells — one now known false):
- Tell 1 (STANDS): "Slide 7 — 'Turns out most of us were never scared of automating too much. We were scared of automating the wrong third.' — a negation-first reframe variant of the banned 15 shapes... structurally identical to 'Not X. Y.'"
- Tell 2 (**FALSE TELL — struck by scorer**): the "comment Claude" CTA. Writer has verified "Claude" is a verbatim-live comment word in BUSINESS.md (Quarter Prompt freebie | Claude). J5 couldn't know this (BUSINESS.md was not in J5's load list), so it's an honest miss, but it does NOT count as a tell. J5's SURE confidence rested partly on this false tell — effective confidence discounted to LEAN-equivalent.
J4 (LEAN-FAKE, independent tells — all stand):
- "the hands/head/heart taxonomy is delivered too cleanly parallel across slides 4-6... 'the heart' gets a mini scene, but hands/head don't, so the parallelism reads assembled rather than organic."
- "'no ceremony, goodbye' and 'Get the split right and the fear runs out of things to point at' have a faint puffery/aphorism cadence — abstract wrap-up lines that restate the point."
**Outcome stands as CAUGHT:** even with the Claude tell struck, three independent concrete tells remain (banned reframe shape on slide 7, even rule-of-three parallelism, repeat-the-point aphorism endings) from two judges.
**Rewrite instruction:** rewrite slide 7 without the negation-first reframe shape; give hands and head their own uneven scenes (or collapse to a lopsided two-plus-one); cut both aphorism wrap-up lines. Keep "comment Claude" — it is canonical.

---

## 4. Judge-precision notes (calibration intel)

- **J4's "matches reference-doc quote = SURE-REAL" heuristic is leakage-driven.** All 6 of J4's SURE-REAL calls cite verbatim recurrence in craft/captions-carousels.md or STYLE.md as the primary signal ("This is the known source example," "the cited canonical real example"). That is answer-key leakage, not discrimination: any real post quoted in the loaded reference docs is trivially identifiable, and the flip side actively harms candidates and unquoted reals — J4's only calibration false positive (Feb 24) landed on a real deck NOT quoted in the craft files, and J4's post-2 coin-flip explicitly reasons "nothing here cross-references a documented real product/stat the way items 2/4/6 do." J4 is partly grading corpus-membership, not authenticity. **Protocol fix for round 3+:** either (a) build controls exclusively from reals not quoted in the judges' loaded reference files, or (b) strip the verbatim-example blocks from the judge-load versions of the craft files. Until then, J4-style SURE-REALs should be recorded as `[LEAKAGE-ASSISTED]` and per-judge precision computed only over non-quoted items. (J5 noticed the same recurrence but drew the correct calibration lesson from it — "verbatim-recurrence is NOT itself a fake signal" — rather than using it as the verdict driver.)
- **Feb 24 "Swapped Instagram for Pinterest" has now been false-flagged by two different judges across two rounds** (J3 SURE-FAKE round 1 on the "Most people think X... BUT Y" shape; J4 LEAN-FAKE round 2 on the clean-parallel emoji list). This real post genuinely breaks two stated rules. Treat like the Jan 15 em-dash post: exclude from future controls pending an Alyssa ruling, and add a real-source carve-out note to ANTI-AI.md for the sneaky-setup shape when it appears in her verified corpus.
- **"comment Claude" false tell:** logged. The canonical-comment-word list judges are given must be synced with BUSINESS.md before round 3 — a judge was pushed to SURE confidence partly by an incomplete reference list, which is a protocol defect, not a judge defect.
- **Disputed line "Less content, better leads":** J3 (round 1) claims it is grandfathered per STYLE §6; J5 (round 2) claims it appears nowhere in the cited corpus. One of the loaded reference files is ambiguous or the judges' loads differ. Resolve before round 3 — it is the primary tell on post-3 v2.

---

## 5. Round outcome, round 3, and cumulative sprint status

- **Calibration:** J4 pass (at threshold, precision partly leakage-inflated), J5 pass (clean — best-calibrated judge of the sprint).
- **Round 2 results:** post-2 v2 SURVIVED (two honest coin-flips). post-1 v2, post-3 v2, post-4 v2 CAUGHT with concrete, mostly-independent tells (one J5 tell struck as false per writer verification).
- **Cumulative sprint status:**

| Post | Status |
|---|---|
| post-1 (Email/Edu) | CAUGHT round 1 and round 2 — needs v3 rewrite |
| post-2 (Offer dual-CTA) | **SURVIVED round 2** (v2) |
| post-3 (Pinterest/Edu) | CAUGHT round 1 and round 2 — needs v3 rewrite (pending "Less content, better leads" verification, which could soften the round-2 catch) |
| post-4 (Productivity/Edu) | CAUGHT round 1 and round 2 — needs v3 rewrite |
| post-5 (FTG Manifesto) | **SURVIVED round 1** |
| post-6 (Wildcard single-image) | **SURVIVED round 1** |

- **Round 3 required: YES**, for posts 1, 3, 4 (v3 rewrites per instructions in §3). Before running it: (1) fix the leakage problem — judge loads must not contain verbatim quotes of the control reals; (2) sync the canonical comment-word list with BUSINESS.md; (3) resolve the "Less content, better leads" grandfather dispute; (4) exclude Feb 24 (alongside Jan 15) from controls pending Alyssa's carve-out rulings.
- Survived posts (2, 5, 6) are cleared for the pipeline; 3 of 6 through after two rounds.

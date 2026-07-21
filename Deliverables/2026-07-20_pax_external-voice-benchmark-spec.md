---
title: External Voice Benchmark — Spec for Alyssa to react to
author: Pax (Research)
created: 2026-07-21
status: opinion / spec — NOT run. A plan for Alyssa to approve or kill. No accounts created, no tools run, no data sent anywhere.
task: Agent Tasks — "Run the external voice benchmarks" (assignee Pax)
relates_to: [[Studio/Content/METHOD]], [[.claude/commands/content-run]], [[Studio/Content/taste-ledger]], [[Studio/Content/her-carousel-voice]], [[Studio/Team Knowledge/session-logs/2026/07/2026-07-17-23-30_fable_content-engine-rebuild-and-voice-diagnosis]]
---

# The one outward-looking test

Every fix for "it doesn't sound like me" so far has been **internal**: more rules, more exemplars, the copy-paste law, the density floor, the Stage 5.5 human seat. All of it assumes the fix lives inside our pipeline. This benchmark is the only idea that looks **outward** and asks a different question:

**Is AI-written voice inherently flatter than Alyssa's, or is our WORKFLOW the thing that's flattening it?**

Two external tools answer that from two different angles. Ghostwriter tests whether a better voice *architecture* fixes it cheaply, inside our own runtime. Spiral tests whether a purpose-built commercial engine beats us outright. Together they triangulate the root cause we've been circling since 2026-07-17.

---

## 1. What Ghostwriter and Spiral actually are

### Ghostwriter — a Claude Code voice skill (runs inside our own runtime)

"Ghostwriter" is not one product; it's a **category of open Claude Code / agent skills** that build a reusable voice profile from a writer's samples and then draft in that voice. Confidence: **High** that the category exists and runs in Claude Code; **Medium** on which specific one to test (the name is generic — flag below).

The strongest-matching specific tool is **robertguss's `ghost-writer`** (part of a Claude Code toolkit):
- It **consumes** a "Voice DNA Document" produced by a separate upstream `writing-dna-discovery` skill that analyzes samples for sentence structure, word choice, punctuation, tone, and reader relationship.
- It outputs **two meaningfully different draft versions**, with headline options, a **confidence rating**, and notes on which voice patterns it applied — architecturally almost identical to our own `/content-run` (two versions, five hooks, a checker). License: **proprietary** (not free), Claude Code-native.
- Source: robertguss Claude-Code-Toolkit `ghost-writer/SKILL.md` (primary); mcpmarket / skillsmp listings (secondary).

Open-source siblings do the same job for $0: `angelarose210/ghostwriter` and `BayramAnnakov/founder-voice-ghostwriter` on GitHub reverse-engineer a **YAML voice profile** from 3-5 samples, ship a 200+ item "AI tells" banned-word/phrase database, and enforce **sentence-length variance** (humans swing 3 to 40 words; AI clusters at 15-20). Source: GitHub repos (primary) + two independent Substack write-ups (secondary). Confidence: **High**.

**The load-bearing fact:** Ghostwriter runs inside Claude Code — the house's existing runtime. No external account, no data leaves the house. "Signing up" means Mack installs a skill. Cost is $0 (open-source variant) to a one-time skill fee.

### Spiral — Every's commercial AI writing partner (external SaaS)

Spiral (writewithspiral.com, evolved from spiral.computer) is a paid web app built by **Every** (every.to, the media/software company). Confidence on maker: **High** (multiple sources). *Note: an "Andrew Lee" association surfaced in one search and could NOT be confirmed — treat as unverified, ignore it.*

What it does (**High** confidence, triangulated across Every's own copy, Product Hunt, and three review aggregators):
- You give it **samples of your published writing**; it builds a style fingerprint via **stylometry** — it measures sentence length, word choice, and how you open and land a thought — then writes new pieces carrying that signature.
- Its origin and sweet spot is **repetitive, templatable content**: turn one good example into a reusable "spiral" you re-run (tweets, summaries, proposals, repurposing). It is a *workflow* tool, not just a chatbot.

Pricing (**Medium-High** confidence — from review aggregators, not a clean primary pull; the site 403'd our fetch):
- **Personal: ~$25/mo** — 50 writing sessions, unlimited messages, private workspace.
- **Teams: ~$35/seat/mo** (min 3 seats) — not relevant to us.
- **Every bundle: ~$30/mo** — Spiral plus Every's other AI apps and newsletter.
- Free trial exists but is **limited** — reviews report it restricts viewing final outputs, so a real test likely needs one paid month.

**The load-bearing fact:** Spiral is the true *outside* benchmark, but it is a paid external account and **her real writing gets uploaded to a third party (Every's servers)**. That is the cost beyond dollars.

**Anti-pattern flag (what the mediocre version of this test looks like):** signing up for Spiral, pasting in a vague prompt, eyeballing one output, and declaring a winner. That tests the tool's default chat mode, not its voice engine, and it tests *our* judgment when it's not blind. The whole value is in the controlled, blind protocol below.

---

## 2. The Ghostwriter spec test (exact protocol)

**Goal:** does a purpose-built voice-profile architecture, fed her real writing, beat our in-house `/content-run` on the *same* brief — judged against a real piece she actually sent?

**Materials (all already in the house):**
- **Seed set (what the tool learns from):** 3-5 of her real sent pieces from `Library/Examples/` — mix registers: 1-2 Simmers, one Soft Sunday, one real sales email. (Open-source guidance: three 500-word samples beat one 1500-word sample — favor several short real pieces.)
- **The blind target (ground truth):** ONE real piece she wrote and sent that is **held out** of the seed set and that neither tool nor our pipeline has seen. This is the answer key. Its brief is the test brief.

**Steps:**
1. Reconstruct the one-line brief behind the held-out piece (offer + buying belief + format).
2. Produce four outputs on that identical brief:
   - **A — her real sent piece** (ground truth, held out).
   - **B — in-house `/content-run` output** (our current pipeline, run clean).
   - **C — Ghostwriter output** (seeded on the seed set).
   - **D — Spiral output** (see §3; if Spiral is deferred, run A/B/C only).
3. Strip all attribution. Randomize order. Hand to scoring (§4).

**Why this is the sharpest version:** it holds the brief constant, includes her real writing as the ceiling, and puts our pipeline and the external tool on the exact same start line. Anything less isn't a benchmark, it's a vibe check.

---

## 3. The "Spiral month" (what one month actually tests, and costs)

A one-month Personal trial (~$25-30) tests the thing Ghostwriter can't: **does a commercial engine built entirely for voice-cloning beat a general-purpose runtime with a good skill bolted on?**

What the month buys, concretely:
- **Week 1:** seed Spiral with the same seed set; build one "spiral" (reusable tool) for each of her two highest-frequency formats — Simmer and sales email. This is the real test of its *workflow* claim, not just one draft.
- **Weeks 2-4:** run those spirals on 4-6 real briefs from the calendar. Log every output into the blind pool.
- **End of month:** blind-score Spiral's outputs against her real sent pieces and against in-house output on the same briefs (§4).

**Cost to say yes:** ~$25-30 for the month + the data-privacy cost of uploading her real writing to Every + ~2-3 hours of her time (seeding, then the blind rank at the end). Everything else is the team's.

---

## 4. The scoring rubric (objective-ish)

Two independent scores per output, kept separate so they can't contaminate each other.

**Score 1 — Blind rank (her taste, the real judge).**
All outputs (A/B/C/D) are stripped of source, randomized, and presented as an unlabeled A/B/C/D lineup. Alyssa answers one question only: **"Rank these by how much they sound like me."** She does not know which is her own. The test passes for a tool only if its output ranks at or above our in-house output — and the honest ceiling check is whether *anything* ties her real piece (A). We log her one-line reason per rank, verbatim, into the taste-ledger.

**Score 2 — The tells checklist (mechanical, from her own corpus).**
Score each output 0-2 on ~8 signature markers already documented in `taste-ledger.md` and `her-carousel-voice.md`, so this isn't invented:
- Parentheticals carrying the nuance (her single most consistent tell)
- Extended-vowel intensity ("BUUUT"), never stacked punctuation
- "&" connectors / phonetic spellings / lowercase-where-it-wants
- Short verdict/coinage headers (3-7 words), not tidy title-case claims
- Real numbers from her data (sub-1% organic reach, ~43% Simmer open), never invented
- Dual register: editorial claim + casual spoken aside in one beat
- "Something slightly wrong on purpose" — looseness, not polish
- Names her mechanism (a coinage a reader could repeat)

Max 16. This gives a number to argue with; the blind rank is the verdict. When they disagree, **the blind rank wins** — her taste outranks the checklist, always (house rule).

**The tiebreak = the lineup test from METHOD §7:** set each AI output beside her real piece. If it reads flatter, more symmetrical, or more polished than hers, it fails regardless of score.

---

## 5. The decision this informs

This benchmark has only two possible outcomes and each has a clear action:

- **If an external tool clearly beats in-house** (ranks above B, near A): the problem was our **workflow**, and we **adopt or steal the winning mechanism**. Concretely that most likely means replacing our per-run exemplar loading with a **persistent Voice DNA profile artifact** (Ghostwriter's model) or a **stylometry fingerprint** (Spiral's model) that every writer inherits — not shopping for yet another rule.

- **If the external tools also read flat** against her real sent piece (A stands alone at the top): the problem is **AI voice generally**, not our pipeline. That **validates the Stage 5.5 human voice-edit seat as the real fix** and tells us to **stop buying tools** and instead protect her 15-30 minutes of rewriting dead lines. This is the more likely outcome given everything in the taste-ledger ("even a writer saturated with her exemplars reads flatter than she does") — and proving it *outside* our own four walls is exactly why the test is worth running.

Either way she wins: one result tells her to change the workflow, the other tells her to stop looking and commit to the human seat. Right now she's paying for the uncertainty every session.

---

## 6. What she'd need to say yes to

| | Ghostwriter | Spiral month |
|---|---|---|
| **Account / signup** | None external — Mack installs a Claude Code skill | A paid Every account |
| **Cost** | $0 (open-source) to a one-time skill fee | ~$25-30 for one month |
| **Her data** | Stays in the house | **Uploaded to Every (third party)** |
| **Her time** | ~1 hr (seed + blind rank) | ~2-3 hrs (seed, run spirals, blind rank) |
| **What it proves** | Is a better voice *architecture* the fix? | Does a commercial voice engine beat us? |
| **Commitment** | Low — reversible in a session | Real dollars + data leaves the house |

**Recommended sequence:** run **Ghostwriter first** (cheap, private, this week). If it moves the needle, the workflow fix is confirmed and the Spiral month may be unnecessary. If Ghostwriter also reads flat, *then* the Spiral month is worth ~$25 as the final outside check before we commit to the human seat and stop tool-shopping.

**The single sentence she's actually signing up for:** *"Install one Claude skill and give me one hour to blind-rank four drafts against a real email I sent — and if that's inconclusive, ~$25 and my writing uploaded to Every for a month to settle it for good."*

---

## Methodology & limitations

- **Sources:** Every/Product Hunt/three review aggregators for Spiral; robertguss SKILL.md + two GitHub repos + two Substack write-ups for Ghostwriter. Every load-bearing claim carries a confidence level inline.
- **Single-source / unverified, flagged:** exact Spiral pricing (site fetch 403'd — pricing is from review aggregators, **Medium-High**, confirm on signup); the "Andrew Lee" maker claim (**unverified — ignored**); *which* specific "Ghostwriter" to install (**Medium** — the name is generic; I recommend testing the open-source YAML-profile variant first for $0, and only paying for robertguss's if the free one underperforms).
- **Out of scope:** I did not install, purchase, or run either tool, and no data was sent anywhere. This is a spec to react to, per the ask.
- **Biggest risk to the test:** contaminating the blind rank. If Alyssa can tell which output is her own real piece, Score 1 is dead. The held-out piece must be old enough / obscure enough that she won't recognize it on sight — the team should pick it, not her.

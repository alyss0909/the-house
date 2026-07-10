# The Intelligent System: Full Design Plan
**Prepared by:** Larry (via Cowork session)
**Date:** 2026-06-27
**Purpose:** Complete redesign of the myPKA review and intelligence architecture — from a filing system that gets bigger to a learning system that gets exponentially smarter and more Alyssa the more she uses it.

---

## The Core Problem (stated once, then never again)

The current system is **additive**. You put 100 things in, you get 100 things back. It gets bigger, not smarter. The inbox grows, the open thread count climbs from 21 to 23, and you come out of every session with more paperwork than you started with.

What this plan builds is a **metabolic** system. Input gets transformed into intelligence. Each thing you add doesn't just sit — it connects, develops, teaches the system something, and makes the next output more Alyssa than the last. The growth is exponential because each loop produces an artifact that feeds every other loop.

---

## The Architecture: Five Layers

```
LAYER 1: CAPTURE
Raw voice → journal entries, voice memos, inbox captures, saved inspo

LAYER 2: PATTERN RECOGNITION  
Semantic sweep → signal clusters → developing ideas → thesis drafts

LAYER 3: VOICE INTELLIGENCE
voice-profile.md + writing-style.md + Wren's memory.md + taste-log.md

LAYER 4: PRODUCTION
Emails, socials, carousels, offer pages, frameworks, briefs — actual output

LAYER 5: LEARNING (the feedback layer that makes it exponential)
Post-task calibration → approval pattern tracking → thesis reactions → voice fingerprint updates
```

The current system runs Layers 1 → 4 in a straight line. Things come in, get organized, and go out. Layer 5 barely exists. The feedback loops — where output teaches the system so the next output is better — are almost entirely absent.

This plan builds Layer 5 and closes the loops between all five layers.

---

## The Four Loops

### Loop 1: The Voice Loop
**Makes Wren smarter every single task.**

**Current state:** Wren was hired in W23 and has produced zero real tasks. The June 6 BOH launch voice memo — Alyssa's most authentic voice moment in 3 months — is sitting in a journal file. Wren's `memory.md` doesn't exist. Every session starts from the same calibration baseline.

**How the loop works:**

```
Alyssa produces something authentic (voice memo, braindump, email) 
→ Larry extracts 3-5 "voice fingerprint" notes from it
→ These go into Wren's memory.md AND update voice-profile.md
→ Wren reads memory.md at the start of every task
→ Wren produces output
→ Alyssa reacts (edits, approves, or says "not quite")
→ Larry extracts: what specifically was right + what specifically was wrong
→ That goes back into Wren's memory.md as calibration entries
→ Next output is more Alyssa than the last
→ Repeat — calibration compounds
```

**What makes it exponential:** After 20 calibration entries, Wren stops making the same mistakes. After 50, she anticipates what Alyssa wants before being told. After 100, she's producing near-final-draft quality. Alyssa's correction time drops toward zero. The energy she was spending fixing Wren goes back into producing more authentic source material — which feeds the loop faster.

**What needs to be built:**

`Team/Wren - Brand Voice Partner/memory.md` — a reverse-chronological log of everything the system has learned about Alyssa's voice through Wren's tasks. Structure:

```markdown
## [date] — [task slug]
**What worked:** [1-2 sentences, specific]
**What she changed:** [verbatim if possible — this is the gold]
**Pattern note:** [is this a recurring correction or new?]
**Voice fingerprint update:** [specific thing added to our model of Alyssa]
```

This file gets read by Wren at the start of every task. It never gets deleted — it only grows. Six months from now it's the most valuable document in the vault.

`SOP-031-voice-calibration.md` — the procedure Larry runs after every Wren task to extract calibration entries. Three questions: (1) What did Alyssa change? (2) What did she not change? (3) What does this tell us about her voice we didn't know before?

**The immediate action:** Before Wren does her first real task, pre-seed `memory.md` with everything we already know from the June 6 voice memo, the writing-style.md analysis, and the voice-archive.md gap interview. She starts with ~20 calibration entries instead of zero. First output will be significantly better.

---

### Loop 2: The Pattern Loop
**Makes the ideas in the vault smarter by letting them develop instead of die.**

**Current state:** The signals-index.md is completely empty. SOP-013 has never run. Ideas accumulate in journal entries but don't know they're related. The "middle ground entrepreneur" thesis, the "easiest email = highest return" insight, the "people undervalue their niche obsessions" positioning — these are three facets of one intellectual idea Alyssa has been circling for 3+ months without naming it.

**How the loop works:**

```
Journal entries accumulate on a theme
→ Weekly semantic sweep names the cluster + counts instances
→ Cluster hits 3 instances: becomes a Developing Idea note (not just a signal)
→ Developing Idea note collects all related journal entries + Second Brain connections
→ Cluster hits 6 instances: Larry writes a thesis draft paragraph
   "Here's what I think you're actually saying across all these entries"
→ Alyssa reacts to the thesis draft (yes/no/not quite/exactly, and also...)
→ Reaction develops the thesis further
→ Thesis hits a shape Alyssa recognizes: it becomes something
   (a product, a Simmer email series, a BOH module, a launch positioning)
→ The something goes back into the Second Brain as an example/framework
→ The Second Brain now has richer material for the next production task
→ Better production makes Alyssa more enthusiastic → more authentic captures → richer raw material → better patterns emerge
```

**What makes it exponential:** The pattern loop and the voice loop feed each other. When the pattern loop surfaces a developed thesis, Wren uses it to produce better copy. When Wren produces better copy, Alyssa reacts more enthusiastically. Enthusiastic reactions are richer calibration data. Richer calibration makes Wren better. Better Wren outputs validate the thesis more quickly. The thesis develops faster. The ideas get smarter faster.

**What needs to be built:**

`PKM/Developing Ideas/INDEX.md` — the idea garden. Not a task list. A living collection of ideas that are growing. Each idea has a note. Each note is a growing organism.

`PKM/Developing Ideas/_template.md`:

```markdown
---
signal_slug: [kebab-case-name]
content_type: idea | content | teaching | voice
first_seen: YYYY-MM-DD
last_seen: YYYY-MM-DD
recurrence_count: N
signal_status: incubating | developing | thesis-ready | becoming | graduated | dismissed
second_brain_connections: []
team_brief: null
---

# [Signal Name]

## What keeps showing up
[Larry's description of the pattern in plain language — not academic, warm and direct]

## The entries that feed this
[wikilinks to all journal entries in this cluster]

## What it's connecting to in the Second Brain
[wikilinks to relevant programs, examples, frameworks, voice files]

## What I think you're actually saying
[Larry's thesis draft — appears when recurrence_count hits 6]
[Alyssa edits this section directly. Her edits ARE the loop.]

## What this wants to become
[emerges from Alyssa's reactions — offer / email series / BOH module / positioning / framework / personal thesis]

## Team brief dispatched
[who got what assignment and when]

## Check back
[date]
```

**Status vocabulary update for SOP-013:**
- `incubating` — 1-2 instances, just noticed
- `developing` — 3-5 instances, has a Developing Idea note, Larry is watching it
- `thesis-ready` — 6+ instances, Larry has written the thesis draft paragraph, awaiting Alyssa's reaction
- `becoming` — Alyssa has reacted and it's taking shape as something specific
- `graduated` — became a real thing (offer, campaign, module, personal essay)
- `dismissed` — Alyssa explicitly decided not to pursue

**The content-type tag added to SOP-013 Step 2:**
Every cluster gets typed: `idea` (project/goal territory) | `content` (output territory — wants to become an email, social, carousel) | `teaching` (BOH module territory) | `voice` (goes into voice-profile/writing-style). This determines who gets the team brief.

**Second Brain cross-reference added to SOP-013 Step 4.5:**
For every `developing` or higher signal, Larry checks: does anything in `PKM/Second Brain/` already cover this? If yes, that material gets wikilinked into the Developing Idea note and surfaced as context for the team brief. The Second Brain stops being a library you look things up in and becomes a layer that actively enriches developing ideas.

---

### Loop 3: The Taste Loop
**Makes Larry smarter about what Alyssa actually acts on — so he stops bringing her things she'll ignore.**

**Current state:** Every inbox session starts from zero. Larry doesn't know that Alyssa consistently acts fast on anything about email simplicity, BOH positioning, and authentic voice — but consistently parks anything about social media strategy and systematic content calendars. Six weeks of approval data has evaporated.

**How the loop works:**

```
Every inbox triage: Larry logs 3 data points per item
  → Did Alyssa approve immediately / deliberate / pass?
  → What tag/topic was it?
  → What content type was it (inspo / copy fragment / offer idea / process)?
→ After 4 weeks: Larry runs a pattern review on taste-log.md
→ Writes a 1-page "Alyssa's Yes Pattern" brief
  → What she acts on immediately
  → What she consistently parks (these stop appearing in triage)
  → What her "no" looks like vs. her "not right now"
→ Brief goes into Larry's agent contract + gets shared with all specialists
→ Team generates proposals through the filter of this brief before presenting
→ The inbox gets smaller because items that would get a "no" get handled without Alyssa
→ The inbox gets smarter because items that do appear are ones she'll care about
→ Over time: Larry is proactive, not reactive — brings things Alyssa would have asked for anyway
```

**What makes it exponential:** The taste loop reduces cognitive overhead. Every "no" Alyssa doesn't have to give back is attention that goes back into creative thinking. As the inbox gets more relevant, Alyssa engages more deeply with each item. Deeper engagement produces richer signals. Richer signals feed the pattern loop. The pattern loop produces better thesis drafts. Better thesis drafts get stronger reactions. Stronger reactions are more useful data for all loops.

**What needs to be built:**

`PKM/Signals/taste-log.md` — Larry's running log of approval patterns. Simple format:

```markdown
## [date] session

| Item | Tag | Type | Decision | Speed | Notes |
|---|---|---|---|---|---|
| BOH launch email sequence | copy | voice-capture | approved | immediate | — |
| Telegram bot repo | ai | process | approved | deliberate | needed context |
| Types of carousels | inspo | content | approved | immediate | — |
| Camila regroup draft | copy | ops | passed | — | timing sensitive |
```

After 4 weeks, Larry reads across all sessions and writes:

`PKM/Signals/yes-pattern.md` — a standing brief for all specialists. The filter every proposal goes through before it reaches Alyssa.

---

### Loop 4: The Content Activation Loop
**Turns inspo from dead filing into live production fuel — every week.**

**Current state:** Inspo arrives, Penn files it, it sits. The BOH launch voice memo has been in the vault for 3 weeks. The hook framework from April is gorgeous and untouched. The email-to-carousel pairs are a ready-made brief that nobody wrote. The Ready Queue doesn't exist.

**How the loop works:**

```
Inspo/copy/good-idea tagged item arrives in inbox
→ Penn files it as a journal entry (no change here)
→ Larry adds a "team brief" line to the approval table:
  "Wren: draft 3 subject lines in this register"
  "Wren: turn this hook into a 5-slide carousel brief"
  "Charta/Pixel: visual reference for [X]"
→ Approved brief goes into the Ready Queue
→ Weekly review: Larry presents top 3 from Ready Queue (ranked by creative momentum)
→ Alyssa confirms or reranks
→ Top 3 become actual team assignments with due dates
→ Team produces the output
→ Output gets filed into Second Brain as a new example
→ New example enriches the next production task
→ Second Brain becomes more generative the more examples it has
→ Better examples → better Wren output → better calibration → voice loop accelerates
```

**What needs to be built:**

Add column to WS-004 approval table — "Team brief (what we can make from this right now)." One sentence, named specialist, specific ask. Larry fills this during triage, before Alyssa's approval step.

`PKM/Second Brain/ready-queue.md` — a running list of approved briefs waiting to become assignments. Sorted by creative momentum (how much existing material supports this? how many loops does it feed?). Larry maintains this. Weekly review consumes from the top.

---

## The Redesigned Weekly Review

**Old:** 23-item open thread list sorted by area. Status report. More paperwork.

**New:** Four phases, ~35 minutes, output is always the same two things: Alyssa knows something she didn't know before. Team has specific creative assignments.

### Phase 1 — The Brew (10 min)
Larry runs the semantic sweep for the week. Presents:
- New signals found (with content-type tags)
- Existing Developing Ideas that got new entries this week
- Any signal that crossed a threshold (hit `developing` or `thesis-ready`)

Format: 3-5 bullets, plain language. Not a report — more like "here's what I noticed."

### Phase 2 — The Thread (10 min)
For each developing idea or thesis-ready signal, Larry shows the full shape: here are all the entries that have fed this idea, here's what it's connecting to in the Second Brain, here's the thesis draft (if it's ready).

Alyssa reads the thesis draft. She reacts. Her reaction is the input: she edits the "what I think you're actually saying" section in the Developing Idea note directly. Her edits ARE the intelligence update.

### Phase 3 — The Queue (10 min)
Larry presents the top 3 from the Ready Queue. These are the inspo/copy items that have been waiting for an assignment. Alyssa confirms or reranks. Brief conversation: "Is this the right specialist? Is the brief right? Any context I'm missing?"

Top 3 become live assignments. Specialist, deliverable, due date.

### Phase 4 — The Hand-Off (5 min)
Larry summarizes what the team is doing this week. Not a status check — Alyssa doesn't manage this. It's a one-paragraph "here's what I'm dispatching" that she can react to if anything's wrong, then forget about. The team owns execution.

**What does NOT appear in this review:** open thread counts, meta-tasks about the system, approval decisions that could happen asynchronously, anything that requires Alyssa to remember a previous session.

---

## The Monthly Intelligence Update (WS-009)

Once a month, Larry runs a meta-loop: he reads back across the month's calibration entries, taste logs, and thesis development notes and writes a 1-page "What the system learned about Alyssa this month."

Sections:
- **Voice fingerprint updates** — what Wren learned, what's now in memory.md, what never happens again
- **Taste pattern update** — what the yes-pattern brief says now vs. last month
- **Developing ideas movement** — what crossed a threshold, what got a thesis draft, what became something
- **What the team got better at** — concrete examples of better output vs. last month

Alyssa reads this once a month and reacts. Her reactions update the system's model of her. This is the compounding review — the review of reviews.

---

## What Needs To Be Built: Full File Inventory

### New files

| File | Owner | Purpose |
|---|---|---|
| `Team/Wren - Brand Voice Partner/memory.md` | Wren + Larry | Calibration log — reads at start of every Wren task |
| `PKM/Signals/taste-log.md` | Larry | Approval pattern tracking |
| `PKM/Signals/yes-pattern.md` | Larry | Standing filter brief for all specialists |
| `PKM/Developing Ideas/INDEX.md` | Larry | The idea garden index |
| `PKM/Developing Ideas/_template.md` | Larry | Template for developing idea notes |
| `PKM/Second Brain/ready-queue.md` | Larry | Content activation queue |
| `Team Knowledge/SOPs/SOP-031-voice-calibration.md` | Larry | Post-Wren-task calibration procedure |
| `Team Knowledge/Workstreams/WS-008-content-activation.md` | Larry + Penn + Wren | Inspo → assignment pipeline |
| `Team Knowledge/Workstreams/WS-009-intelligence-update.md` | Larry | Monthly meta-loop |

### Updated files

| File | What changes |
|---|---|
| `Team Knowledge/SOPs/SOP-013-semantic-sweep.md` | Add: content-type tagging (Step 2.5), Second Brain cross-reference (Step 4.5), `developing` status, team dispatch step (Step 5.5), Developing Idea note creation |
| `Team Knowledge/Workstreams/WS-004-inbox-processing.md` | Add: "team brief" column to approval table in Step 2; add Ready Queue update to Step 3 |
| `Team Knowledge/Workstreams/WS-006-weekly-review.md` | Full redesign: replace 9-step report with 4-phase Brew + Thread + Queue + Hand-Off structure |
| `PKM/Signals/signals-index.md` | Seed with first real entries from 90-day sweep |
| `Team/Wren - Brand Voice Partner/AGENTS.md` | Add: mandatory memory.md read at start of every task; add calibration step to close-task protocol |
| `AGENTS.md` | Add WS-008 and WS-009 trigger language; add taste-log update to session close triggers |

---

## The Build Sequence

### Phase 0 — This session (today)
Do this before anything else. These are the seeds — nothing compounds without them.

1. **Run the 90-day semantic sweep** — March through June journal entries. Seed signals-index.md with the first real clusters. I already know from the manual read there are at least 5 strong signals: `middle-ground-entrepreneur-positioning`, `easiest-email-highest-return`, `people-undervalue-niche-obsessions`, `slow-biz-as-creative-freedom`, `boh-as-systems-not-social`. Create the first Developing Idea notes for each.

2. **Pre-seed Wren's memory.md** — Extract everything we already know about Alyssa's voice from: the June 6 voice memo, writing-style.md, voice-archive.md, voice-profile.md. Give Wren ~20 calibration entries before her first real task.

3. **Create taste-log.md** — Seed with what I already know from the inbox approval reports (June 9, 10, 11, 12, 13, 15). Enough to write a first draft of yes-pattern.md.

4. **Create the Ready Queue** — Seed with the 5 highest-leverage items already sitting in the vault: (1) BOH launch email sequence → Wren, (2) Hook framework → Wren carousel brief, (3) Email-to-carousel repurposing pairs → Wren brief, (4) Easiest emails insight → Simmer email concept for Wren, (5) Types of carousels → Charta brief.

### Phase 1 — This week
5. **Write the BOH launch brief for Wren** — based on the June 6 voice memo. This is 3 weeks overdue and it's the highest-leverage content action in the vault right now. Full brief: what she's saying, who it's for, the 3-email sequence, the tone notes, the lines she HAS to keep verbatim.

6. **Update WS-004** — add the "team brief" column. From this point forward, every inspo item that enters the inbox gets a production brief on the way in.

7. **Create PKM/Developing Ideas/** — folder + INDEX + template. Move the 5 seeded signals from the sweep into proper Developing Idea notes.

### Phase 2 — Week 2
8. **Rebuild SOP-013** — full redesign with all new steps (content-type tagging, Second Brain cross-reference, `developing` status, team dispatch).

9. **Rebuild WS-006** — replace the current 9-step report structure with the 4-phase review.

10. **Write WS-008 (Content Activation)** — the full inspo-to-assignment pipeline with Ready Queue mechanics.

11. **Write SOP-031 (Voice Calibration)** — the post-Wren-task calibration procedure.

12. **Update Wren's AGENTS.md** — add mandatory memory.md read and calibration step.

### Phase 3 — Month 2
13. **First real Wren task completes** → run SOP-031 → first calibration entries from actual output.

14. **First taste pattern review** → Larry writes first yes-pattern.md brief based on 4 weeks of taste-log data.

15. **First thesis draft surfaced** — whichever Developing Idea hits `thesis-ready` first gets Larry's paragraph. Alyssa reacts. The loop closes for the first time.

16. **Write WS-009 (Intelligence Update)** — once there's enough calibration data to review.

### Phase 4 — Month 3+
By this point the system is compounding:

- Wren has 40+ calibration entries. First drafts are near-final. Alyssa's correction time is close to zero.
- The taste log has 12+ sessions logged. Yes-pattern.md is accurate enough that Larry stops presenting things Alyssa will pass on.
- 3-5 Developing Ideas have been through the full loop and become real things (emails, offers, frameworks, launch campaigns).
- The Second Brain has examples from real Wren output — not just imported material, but things that were created inside the system and fed back in.
- The weekly review takes 30 minutes instead of 60 because the inbox is smarter, the ready queue is relevant, and the team is executing independently.

---

## The Exponential Growth Mechanism (explicit)

Here's why this compounds instead of just adding linearly:

Each loop produces an artifact that feeds every other loop:

- **Voice loop** produces `wren-memory.md entries` → richer calibration → Wren produces better content → better content gives Pattern loop richer examples → Pattern loop finds more specific signals → Content Activation loop generates more targeted briefs → better briefs → better Wren output → faster voice loop

- **Pattern loop** produces `thesis drafts` → Alyssa's reactions are the most authentic voice material in the system → reactions feed Voice loop → Wren uses thesis language in copy → copy that uses thesis language resonates stronger with audience → audience responses feed back as signals → Pattern loop gets validated faster

- **Taste loop** produces `yes-pattern.md` → team stops generating things Alyssa ignores → Alyssa's attention is fully on things that matter → she engages more deeply → deeper engagement = richer reactions = better calibration = faster Voice loop = stronger Pattern loop

- **Content Activation loop** produces `Second Brain examples` → every piece of real output filed back in enriches the source material → richer source material = better Wren output = faster Voice loop calibration = more authentic examples = even richer source material

After month 3, these loops are all running simultaneously and feeding each other. The system isn't just getting bigger — it's getting smarter about being Alyssa. Every session makes every future session more efficient. Every output makes every future output more resonant. Every reaction teaches the system something that every specialist uses.

This is what metabolic looks like: input transforms into intelligence, intelligence transforms into output, output transforms back into richer input.

---

## The First Signal: The Thesis You've Been Circling

From the 90-day manual read, here is the idea that appears most consistently across your journal entries, voice memos, and strategic notes — from at least 8 separate instances:

**Working title:** `people-undervalue-niche-obsessions`

**Entries it appears in:**
- March 6: "the most important things to have in your boh" — the idea that BOH isn't a funnel, it's a system that frees you up
- April 13: "easiest email to send = highest return" — the people who do it sustainably don't overcomplicate
- April 28: "the monthly just works" — wanting to know the minimum viable rhythm
- April 30: Hooks — "the business in your head and the one eating your weekends aren't the same one"
- May 20: "daily non-negotiables" — the end :)
- June 6: The voice memo — "what if we didn't care about that, what if instead of spending all our time trying to get Claude to come up with the perfect carousel and sounding just like everyone else, we had these things that were totally agnostic of that, and we could finally just go down these rabbit holes"

**What I think you're actually saying:**

The people who build sustainable creative businesses aren't the ones who master marketing — they're the ones who give a shit about something specific and build a back-of-house that means they never have to stop giving a shit. Social media literacy is a trap. The real unlock is: a system so quiet and so solid that you can be fully yourself, go down your rabbit holes, and the business runs. BOH isn't a product. It's permission to be obsessed.

*Edit this section. Your edits develop the thesis.*

---

## Open Decisions for Alyssa

These are not tasks. These are reactions the system needs from you to develop properly:

1. **Does the thesis draft above feel right?** Edit it or say "not quite, more like..." — that's the first real input to the Pattern Loop.

2. **Wren's first real task:** do you want the BOH launch email sequence (highest leverage, most material) or something smaller first to test the calibration process?

3. **The Developing Ideas layer:** does "idea garden" feel right as the mental model for you? Or is there another metaphor that fits how you actually want to think about developing ideas?

---

*This document is a seed, not a spec. The plan develops every time Alyssa reacts to something in it. Her reactions are the intelligence.*

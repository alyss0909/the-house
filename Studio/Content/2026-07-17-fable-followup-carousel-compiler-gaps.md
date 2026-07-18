---
title: Fable Follow-Up: Carousel Compiler Gaps
type: review-handoff
status: ready-for-fable
date: 2026-07-17
owner: Larry
reviewer: Fable
related:
  - "[[Studio/Content/2026-07-17-carousel-compiler-fable-handoff]]"
  - "[[Studio/Content/2026-07-17-carousel-compiler-pressure-test]]"
  - "[[Studio/Content/carousel-dispatch]]"
  - "[[Studio/Content/writer-kit]]"
  - "[[Studio/Content/briefs/INDEX]]"
  - "[[Studio/Analysis/Frameworks/carousels/for-the-girls]]"
  - "[[Studio/Hermes/craft/for-the-girls-posts]]"
---

# Fable Follow-Up: Carousel Compiler Gaps

## Why This Report Exists

Fable's pressure test found real holes. The fixes are directionally right, but some of them risk creating the same problem in a new outfit: more small rules, more surfaces, more places for agents to follow procedure without understanding the actual offer, belief, or Alyssa logic.

Alyssa's correction after reading the pressure test:

> "Can't it just say brief not slot?"

> "Seems like the briefs themselves are shit"

> "Idk this is too rigid? I want it to understand not follow rules - come up with ideas from understanding deeply"

> "I have a for the girls file it can be used to come up with good ideas idk why there's more mood shit being proposed"

This report should guide the next Fable pass.

The job is not to add more architecture. The job is to make the architecture produce better judgment.

## Executive Read

The carousel compiler now has a good spine:

1. carousel outline first
2. concept lock second
3. one framework card
4. one brief
5. source receipt
6. two full drafts
7. checker
8. Alyssa reaction back into the system

The weak layer is the brief layer.

The system can now force a writer through the right steps, but if the brief is thin, confused, or over-literal, the output will still be trash. The writer will obey the process while misunderstanding the offer.

That means the next fix should not be another rule gate. It should be better briefs.

## Finding 1: Use "Brief," Not "Brief Slot"

### Problem

"Brief slot" is technically precise, but it sounds like system language. Alyssa will not use it, and agents will turn it into one more abstraction.

### Better Language

Use **brief** everywhere.

Definition:

> Brief = the source packet for this post.

A brief can be:

- an offer brief
- an angle brief
- a For The Girls brief

Do not call it "brief slot" in production docs.

### Solution

Update active surfaces to say:

```md
Each writer loads:
1. writer-kit
2. her-carousel-voice
3. one brief
4. one framework card
```

Then define:

```md
The brief is the source packet for the post. For an offer post, use the offer brief. For a non-offer angle, use an angle brief. For FTG, use the FTG source brief.
```

This keeps the loading model simple without pretending every post is an offer post.

## Finding 2: The Briefs Are The Real Weak Point

### Problem

The current brief system is better than summaries, but it is not yet the thing Alyssa actually needs.

Some briefs are still too thin, too literal, or internally confused.

The biggest example is [[Studio/Content/briefs/the-5-minute-newsletter]]:

- The live test locked "gourmet email is out / one-pan simmer is in."
- The brief still centers "six burners going when one will do."
- Both are real Alyssa ideas.
- They are not the same post.

This means the test succeeded partly because the prompt overrode the brief, not because the brief itself made the right post obvious.

That is fragile.

### Deeper Diagnosis

A good brief cannot only be a bank of verbatim lines.

It needs to metabolize the offer into usable writing judgment:

- what this offer is really selling
- what someone needs to believe before buying or downloading
- what old beliefs it attacks
- what angles are adjacent but should not be mashed together
- what examples and metaphors belong to which argument
- what lines are verbatim source
- what must not be paraphrased
- what is still uncertain or needs Alyssa

Right now the brief layer is half copy bank, half rough notes. That is not enough.

### Solution

Rebuild the offer briefs as **offer intelligence briefs**, not just copy banks.

Recommended shape:

```md
# Offer Brief

## What This Is
Plain description of the product/freebie. Name the thing: Notion planner, free guide, class, etc.

## What It Sells
The real outcome, in Alyssa logic.

## Buying Beliefs
1 to 3 things someone needs to believe before the CTA makes sense.

## Approved Argument Lanes
Each lane is a coherent post argument.

### Lane A
Point:
Villain:
Promise:
Best frameworks:
Use when:
Do not mix with:
Verbatim source lines:

### Lane B
Point:
Villain:
Promise:
Best frameworks:
Use when:
Do not mix with:
Verbatim source lines:

## Verbatim Copy Bank
Sorted by job: belief, pain, teaching, product, CTA, proof.

## Boundaries
Angles to avoid, offers not to mention, claims not proven.

## Open Questions
Only what Alyssa actually needs to answer.
```

Important: "Approved Argument Lanes" should not become rigid templates. They are there to stop concept mashups and preserve understanding.

## Finding 3: Do Not Make Concept Lock Too Rigid

### Problem

Fable's concept-lock fix is good because it prevents two villains. But if every concept must come from a pre-approved lane, the system may get too stiff.

Alyssa does not want agents only following rules. She wants them to understand deeply enough to come up with good ideas.

### Better Model

Concept lock should have two modes:

1. **Use an existing argument lane** when the brief already has the right one.
2. **Propose a new argument lane** when the source material supports a better idea.

The second mode is important. The system should be allowed to think.

But it has to prove the idea came from the offer, not from generic marketing brain.

### Solution

Add this rule to concept lock:

```md
If the brief has an approved argument lane that fits, use it.

If none fits, propose a new lane with:
- point
- villain
- promise
- source lines that prove it
- what it is NOT about
- why this should exist as its own post

Do not draft from a new lane until the orchestrator accepts it or flags it for Alyssa.
```

This gives the agent room to make intelligent ideas without letting it invent adjacent beliefs.

## Finding 4: FTG Does Not Need A New Mood System

### Problem

Fable created [[Studio/Content/briefs/ftg-moods]] because dispatch said FTG needed a brief and none existed.

The gap was real.

But the solution may be pointing in the wrong direction if it becomes a new "mood file" the team maintains separately from the real FTG source.

Alyssa already has a For The Girls file:

- [[Studio/Hermes/craft/for-the-girls-posts]]
- [[Library/Examples/Carousels/for-the-girls-slide-copy]]
- [[Studio/Analysis/Frameworks/carousels/for-the-girls]]

Those should be the core. The team should not invent a parallel mood taxonomy when the actual FTG method and examples already exist.

### Deeper Diagnosis

FTG ideas should come from understanding:

- the cultural tone from saves, trend briefs, season, and current pressure
- the FTG style from her real examples and FTG writing file
- the specific feeling the post should make someone feel

The mood is not a standing database item. It is a live input to a specific post.

### Solution

Keep one FTG brief, but make it a **source brief**, not a mood database.

Better title:

> For The Girls Brief

Better job:

```md
This is the source packet for FTG posts. It points to the FTG method and real examples, defines what a live mood is, and tells the writer how to form one from current saves/trends without creating a second taxonomy.
```

Do not maintain a long "live moods" list unless Alyssa picked or edited those moods.

Instead:

- `/saves-sweep` proposes the live mood on the Notion option row.
- `/content-run` loads that row plus the FTG brief.
- If Alyssa picks or edits a mood, then it can be logged in [[Studio/Content/taste-ledger]].
- Only recurring or Alyssa-approved mood patterns get added back to the FTG brief.

This preserves compounding without making another pile.

## Finding 5: FTG Needs A Checker, Not An Exemption

### Problem

Normal source trace and density checks do not cleanly apply to FTG. Fable is right about that.

But "does not apply" cannot mean "passes on vibes."

FTG still needs a quality gate.

### Solution

Add an FTG-specific checker:

```md
FTG checker:
- Names one felt pressure, guilt, or quiet resentment.
- Uses one concrete little detail.
- Reclassifies something "unproductive" as part of the work, process, or better business.
- Includes one principle line that makes the post more than a mood.
- Uses FTG line style: short, specific, intimate, lightly absurd or emotionally familiar.
- Has no tactical steps.
- Has no hard CTA.
- Does not explain the business point directly.
- Would someone repost this to say "me"?
```

This should live in [[Studio/Analysis/Frameworks/carousels/for-the-girls]] and be referenced by `/content-run` Stage 5.

## Finding 6: Her Carousel Voice Must Be Mandatory, But The Load List Should Have One Owner

### Problem

Fable correctly found that [[Studio/Content/her-carousel-voice]] was missing from the writer load. That was a serious hole.

But updating the load list in many places creates the next drift risk.

Current risk:

- dispatch has one load list
- MAP has another
- writer-kit describes another
- TEAM-BRAIN summarizes another
- `/content-run` has another

That is how "fixed" systems rot.

### Solution

Make [[Studio/Content/carousel-dispatch]] the source of truth for writer load.

Other files should say:

```md
For the current carousel writer load, follow [[Studio/Content/carousel-dispatch]].
Non-negotiable: [[Studio/Content/her-carousel-voice]] stays in that load.
```

TEAM-BRAIN should not restate the whole list. It should only preserve the durable warning:

> Cutting [[Studio/Content/her-carousel-voice]] caused the "doesn't sound like me" loop. It is mandatory unless Alyssa explicitly changes that.

## Finding 7: Fable's Report Slightly Overclaims

### Problem

The pressure-test report says several things as if fully proven.

Some are true.
Some are documented.
Some are not fully durable yet.

Examples:

- "House Report retired everywhere" is not literally true while briefs still list it.
- The cold-writer test is preserved in the report, but the proof is self-reported, not an independently inspectable run artifact with a separate checker transcript.
- "Mechanically blocks every failure" is too strong. It has gates for the named failures. It still depends on agents obeying the gates.

### Solution

Adjust language in Fable's review standard:

Use:

> The system now has gates for the named failures.

Not:

> The system mechanically blocks every failure.

Use:

> The test artifact suggests the narrow-load path can work.

Not:

> The system is proven.

This keeps the report honest and makes the next test sharper.

## Finding 8: Clean The Remaining Stale Wording

### Problem

Small contradictions teach agents that instructions are negotiable.

Known cleanup targets:

- Any offer brief that still lists House Report as a framework default.
- `/content-run` Stage 7 still says run receipts include "image files" even though decks are copy-only.
- Any active file saying "offer brief" when it should say just "brief."
- Any active file that restates the writer load instead of pointing to dispatch.

### Solution

Run a scoped contradiction sweep after Fable decides the final fixes:

```md
Search active files for:
- House Report
- offer brief
- FTG exception
- image ideas
- image files
- pack
- one writer
- two versions
- her-carousel-voice
```

Fix active production docs only. Leave old drafts alone as history.

## Recommended Fix Order

1. Replace "brief slot" thinking with plain **brief** language.
2. Rebuild the briefs as offer intelligence briefs, starting with [[Studio/Content/briefs/the-5-minute-newsletter]].
3. Add approved argument lanes, but allow a "propose new lane from source" mode.
4. Convert [[Studio/Content/briefs/ftg-moods]] into a clean FTG source brief, not a growing mood database.
5. Add the FTG-specific checker.
6. Make [[Studio/Content/carousel-dispatch]] the single owner of the writer load, with [[Studio/Content/her-carousel-voice]] as the non-negotiable.
7. Clean stale wording after the structure is settled.

## What Fable Should Not Do

Do not add another big report.

Do not add more labels.

Do not make every possible argument pre-approved before the system can write.

Do not create a separate FTG mood database unless Alyssa's reactions prove the moods are reusable.

Do not solve "briefs are weak" by making writers load more source every time. The brief should get smarter.

## The Actual Next Move

Pick one offer, probably [[Studio/Content/briefs/the-5-minute-newsletter]], and rebuild the brief into an offer intelligence brief.

Then rerun one carousel from that improved brief.

The test question:

> Can the writer come up with a strong, coherent carousel idea from understanding the offer, without being spoon-fed the exact concept in the prompt?

If yes, the compiler is starting to work.

If no, the process is still forcing compliance instead of creating understanding.

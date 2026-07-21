---
title: Carousel Dispatch
type: production-router
status: active — v2 2026-07-17, rebuilt on Alyssa's ruling: sequences over paperwork, one pre-writing artifact, five frameworks, understanding over rule-following
source_manual: "[[Studio/Analysis/carousel-winning-flow-report]]"
writer_rules: "[[Studio/Content/writer-kit]]"
---

# Carousel Dispatch

The front door for carousel production. Its job: get the writer to a good copy sequence FAST, with her real source in hand, and put two full drafts on Alyssa's desk. Minimal paperwork; the sequence is the plan.

## The load (this file is the ONLY owner of the writer load; other files point here)

Orchestrator loads:

1. This file.
2. The one brief from `Studio/Content/briefs/` (offer brief, angle brief, or the For The Girls brief).
3. [[Studio/Content/taste-ledger]] only if the offer or angle has live corrections there.

Each writer subagent loads only:

1. [[Studio/Content/writer-kit]]
2. [[Studio/Content/her-carousel-voice]] — NON-NEGOTIABLE. Cutting it caused the "doesn't sound like me" loop (taste-ledger 2026-07-17). It stays unless Alyssa herself removes it.
3. The same brief. Open the full sales page or deliverable the brief names only when the angle needs more verbatim lines than the brief holds.
4. One framework card:
   - [[Studio/Analysis/Frameworks/carousels/house-report]]
   - [[Studio/Analysis/Frameworks/carousels/how-to]]
   - [[Studio/Analysis/Frameworks/carousels/old-way-new-way]]
   - [[Studio/Analysis/Frameworks/carousels/hot-take]]
   - [[Studio/Analysis/Frameworks/carousels/for-the-girls]]

Do not load METHOD, hook-forensics, or the full slide-by-slide during a normal run. They are card-rebuilding sources, not writing loads.

## Step 0: Her-piece mode check (her ruling 2026-07-19, runs before everything)

If Alyssa supplied a finished piece of her own writing as the source (an email, a Simmer, a caption, a script), the whole card machinery below is OFF. Her piece already contains the persuasive shape; forcing it through a card destroys it (proven 2026-07-19: two card-built decks killed, the no-card rebuild called "20x better").

In her-piece mode:
- Writer load: [[Studio/Content/writer-kit]] + [[Studio/Content/her-carousel-voice]] + her piece pasted verbatim + the offer brief (for supplemental verbatim lines only, usually the receipts beat).
- No framework card. No sequence fill. The orchestrator passes one guiding question: "HOW would someone persuasive write a helpful post?"
- One version, not two. She gave the shape; the options live in covers and hooks.
- The one-slide payoff law binds: any stealable asset in the piece (template, checklist, prompt) lands whole on ONE slide as the earned payoff; every slide before it builds why they need it.

## Step 1: The sequence fill (the ONLY pre-writing artifact — skipped entirely in her-piece mode)

Pick the framework card whose "when to use" line fits. Then fill one block, in plain language:

```md
This post argues: (her belief line, verbatim from the brief, or an argument lane from the brief)
Villain (exactly one):
NOT about:
The card's forward sequence, one line per step, each teaching step naming the source line it will use:
1.
2.
3.
...
```

Rules:

- The forward sequence on the card IS the slide plan. A deck that is merely "about" the topic but does not march the sequence fails.
- One villain. If a second villain appears, stop and split into two posts.
- If the brief's argument lanes fit, use one. If the source material supports a better idea, PROPOSE a new lane: point, villain, promise, the source lines that prove it, what it is not about, and why it deserves its own post. Do not draft from a new lane until the orchestrator accepts it or flags it for Alyssa. The system is allowed to think; it is not allowed to invent beliefs adjacent to hers.
- If any step is vague, fix the fill, not the draft.

There is no separate carousel outline, concept lock, framework outline, or source receipt anymore. This one block does all four jobs. The seven-job spine (cover hook, second hook, old way, proof or validation, teaching, turn, CTA) is the CHECKER'S rubric; writers do not paperwork it separately.

## Step 2: Route two full versions

Pick the two strongest routes from the five frameworks. Version B must differ from Version A by framework, buying belief, pressure, or content role, never by hook alone.

## Step 3: Writer subagents

One writer per version, clean context, no prior work in it. Each writer gets the load above plus the filled sequence block pasted into its prompt.

Each writer returns:

```md
1. The filled sequence (updated if writing sharpened it).
2. 5 hook options, 10 words max each.
3. Full carousel copy, each slide tagged with its sequence step.
4. Caption and CTA line.
5. Source lines used, with the brief section each came from.
```

## Step 4: Deliver two complete options

Both versions land on the Content Studio board per /content-run Stage 6 (julia-child format). No option may say "teaches the method," "walks through the framework," or "shows them how" without naming the actual parts. No option may drift to a second villain.

## The rule

The framework card tells the writer how Alyssa performs each step: what to write toward, what not to write, and which real deck proves the move. The writer goes deep into one card, not wide across the house.

---
title: Socials Inspo Flow — Honest Verdict
author: Suki (content strategist)
date: 2026-07-20
task: "Fix the socials inspo flow" (Agent Tasks, assignee Suki)
verdict: COLLAPSE
---

# Socials Inspo Flow — the honest verdict

**Verdict: collapse it.** The middle layer earns a thin place, not the thick one it has now, because it manufactures a finished-looking option (five hooks, a value paragraph, a framework pick) that content-run rebuilds from scratch and never reads. Keep the one thing it does that nothing else does (turn a raw save into a named mechanic paired to one of your offers), and delete everything downstream of that, because that downstream work is the "more work not less" you flagged twice.

## Where you already said this

You have raised this twice, in your own words, and both are still sitting open:

- `Notebook/Inbox/alyssa's thgouths on the content issue.md`, point 3: "the middle layer between inspo > idea > content studio ... is it really helping or just making things more confusing. lets be vicious here make it cool and abundant not more work."
- `Notebook/Drafts/Before Monday.md`, to-do: "better socials inspo flow."

And the desk's own file already named the symptom before I got here. From `Studio/Content/liked-hooks-and-concepts.md`: "the gap is between a liked hook and a shipped post — nothing on this list has gone past 'approved' to an actual published carousel yet." That is the whole case in one line. The middle layer is very good at producing hooks you will approve. None of those approved hooks has ever become a post.

## The flow, end to end, with what each step costs

1. **You save a post** (burner IG, syncs to the Instagram Saves database in Notion, Status "New").
   Cost: near zero. This is you doing what you already do. This is the purest signal in the system and it is free.

2. **The middle layer runs** (`/saves-sweep`, daily). It boots the full taste ledger, the hook forensics file, and BUSINESS.md, then for each save it: extracts the mechanic (one sentence, what stopped your scroll), pairs it to a live offer, and writes a six-part option: Spark, Concept, The value, Offer relation, **five hooks**, **Framework pick**. Three to five of these land on the Content Studio board as Status "Option."
   Cost: this is the expensive step. Full ledger load every run, plus up to five hooks each for three to five options, so fifteen to twenty-five crafted hooks per morning, plus a value paragraph and a framework guess per option. Tokens are real; more to the point, it dresses each option to look like a near-finished post.

3. **You tap** (Status to Picked or Killed, notes in Her notes).
   Cost: your attention, the scarce resource. The tap is the only output of step 2 that carries forward.

4. **Production runs** (`/content-run`). It harvests your reactions, then for each pick it writes a **fresh brief** (Stage 2), a **fresh sequence fill** (Stage 2.5), pulls your verbatim copy fresh from the Library (Stage 3), and hands a clean writer **the writer-kit, her-carousel-voice, the offer brief, and one framework card** (Stage 4). That writer generates **its own five hooks and its own slide bodies**. A checker verifies, then it delivers in the julia-child format.
   Cost: heavy, and correctly so. This is where the real post gets made.

5. **The finished post** lands "Ready for Alyssa," you pick, it ships.

## Why the middle layer does not earn its current place

Look at what actually survives from step 2 into step 4. I checked the two files that define the writer's load, `Studio/Content/carousel-dispatch.md` (Steps 1 and 3) and `content-run` Stage 4. The production writer loads the writer-kit, her-carousel-voice, the offer brief, and one framework card. It does **not** load the option's five hooks. It does **not** load the option's concept line, its value paragraph, or its framework pick. content-run Stage 2 re-derives the framework from the card's own "when to choose" test and can override the option's pick outright, and content-run's variety guard will flip it anyway if the last runs leaned one way.

So of everything the middle layer builds, exactly two things reach the post: **which mechanic you liked** and **which offer it feeds**. The five hooks, the value paragraph, the framework guess, and the polished concept wording are all regenerated downstream by a writer who never sees them. That is not a hand-off. That is the same craft done twice, and the first pass is the one that gets thrown away.

This is also why your approved hooks never ship. You approve a hook in the middle layer. Production then writes five brand-new hooks on the real post. The hook you liked is gone by the time anything is publishable. You are reacting to work that is designed to be discarded, which is exactly the "going round and round" and "is it really helping or just making things more confusing" you keep naming.

One more piece, because it is the literal "middle" in your "inspo > idea > content studio." The "idea" node, the old Content Ideas ideation tray, was retired on 2026-07-17 and its volume folded into the saves-sweep Wildcard rule. But the cut is half-done: the unattended ideation cron is still listed as an open task for Mack (`saves-sweep.md` Cache), and `SOP-041-content-production.md` still tells any non-Claude host to "pull from BOTH upstream trays" including "Content Ideas (raw machine ideation, auto-written)." So a machine may still be writing ideas nobody reads, and the written contract still says to read them. A layer that is half-retired in one file and alive in another is, precisely, the confusion.

## The call: collapse, do not cut

Not a full cut. A raw save is an external creator's post; on its own it is not tappable and content-run cannot use it, because production needs to know which mechanic you want pulled out and which of YOUR offers it should carry. That judgment (extract plus pair) is real, it benefits from the ledger context, and it is what lets you tap a batch in ten minutes instead of opening every save. That thin layer earns its place.

What does not earn its place is dressing the option up as a finished post. So collapse the option down to the tappable minimum and move all craft into the one place that ships it.

### Remove from `/saves-sweep`

- The **five hooks per option**. Delete the Hooks requirement from the option format (step 4) and the "volume lives in hooks-per-option" line. Hooks are content-run's job and content-run already writes five fresh ones per version.
- The **Framework field**. Delete the "pre-seeds the /content-run brief" framework pick. content-run chooses framework from the card test plus the variety guard and overrides this anyway.
- The **value paragraph** as a written-out block. The value test still runs, once, in content-run's checker (METHOD gate). It does not need to be drafted at the option stage.

### Keep in `/saves-sweep`, this is the whole layer now

A three-line card, nothing more:

- **Spark**: the mechanic in one plain sentence. This is the taste signal and the only tag that matters.
- **Concept**: one line, the version only you could make. Not five, not dressed, one.
- **Offer**: the relation to the live Products DB row.

You tap the cards that are worth a post. That tap is the signal. Everything else waits for content-run, which builds the hooks, the framework, the value, and the slides once, on the post that actually goes out.

### Finish the cut you already started

- Close out the ideation cron (the open Mack task) so no machine writes ideas into a retired tray.
- Rewrite `SOP-041` Flow A to match `saves-sweep`: one upstream tray (Instagram Saves), ideation lives only as the Wildcard rule, no second "Content Ideas" tray. Right now the LLM-agnostic contract contradicts the live command, and any host that follows the SOP will resurrect the dead layer.

## The single highest-leverage change

Strip the saves-sweep option to **mechanic plus offer plus one-line concept, and delete the five-hooks, value-paragraph, and framework-pick manufacturing from it.** Craft then happens exactly once, inside content-run, on the post that ships. That single move ends the approve-a-hook-that-never-ships loop, cuts the daily sweep's token load hard, and turns the middle layer from "more work" into a ten-second tap, which is the "cool and abundant, not more work" you asked for.

## What I did not touch

I did not run git or change anything in Notion, per the task. This is a read-and-recommend verdict. Turning the three deletions above into edits to `saves-sweep.md` and `SOP-041` is a separate, small job whenever you give the go.

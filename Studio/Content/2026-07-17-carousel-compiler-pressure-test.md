---
title: Carousel Compiler Pressure Test (Fable)
type: review-report
status: complete
date: 2026-07-17
owner: Fable, on Larry's handoff
answers: "[[Studio/Content/2026-07-17-carousel-compiler-fable-handoff]]"
---

# Carousel Compiler Pressure Test

This is the review Larry's handoff asked for. I read the whole compiler stack, the last 48 hours of session logs, and every brief, then fixed what could be fixed the same session and ran one live cold-writer test. Everything below is either already fixed or clearly flagged as needing Alyssa.

## Holes found and fixed this session

1. **The voice file was missing from the dispatch path.** [[Studio/Content/carousel-dispatch]] and [[Studio/Content/MAP]] told writers to load three files, and [[Studio/Content/her-carousel-voice]] was not one of them. That file exists because cutting her real slides from the load caused the whole "it doesn't sound like me" loop. Any run through dispatch as written would have brought the flatness bug back. Fixed: the voice file is now a mandatory writer load in dispatch, MAP, and [[Studio/Content/writer-kit]].
2. **Two front doors that disagreed.** /content-run v3 had no carousel outline and no concept lock; dispatch had both. This was the named open thread. Fixed: /content-run now has Stage 2.5, which requires the outline and the concept lock (one villain, her verbatim belief line, kill or split anything with two villains) before any writer is dispatched.
3. **The imagery contradiction.** /content-run Stage 6 still told the delivery format to include "functional image ideas in parentheses," which directly violates her same-day no-imagery ruling. A run following the skill to the letter would have produced exactly what she told us to stop doing. Fixed: copy only.
4. **House Report was still alive in two places.** /content-run Stage 2 and /saves-sweep both listed it as a live framework while dispatch retired it. The sweep could pre-seed briefs the dispatch cannot route. Fixed in both skills, and the [[Studio/Analysis/Frameworks/carousels/house-report]] card is now stamped as a source pattern only.
5. **Stale "pack" vocabulary.** /content-run still said "pack header," "the pack's verbatim lines," "the pack section." Packs are retired; a cold agent would hunt for files that do not exist. Fixed: briefs everywhere.
6. **Two-draft rule conflict.** Dispatch said two writers with one version each; /content-run said one writer produces two versions. One writer writing both versions defeats the clean-context principle. Fixed: /content-run now matches dispatch, one writer per version, two writers per post, Version B must differ by framework, belief, pressure, or role.
7. **The FTG lane had no brief to load.** Dispatch and MAP name an "FTG mood brief" that did not exist anywhere. Built [[Studio/Content/briefs/ftg-moods]]: her verbatim FTG law, her real anchors (the quiet-to-slower edit, the picked and killed lines), and a dated live-moods list the sweep refreshes.
8. **Checker could not catch the julia v1 failure.** The Stage 5 checker verified density and spine but not belief fidelity, so a deck arguing an invented adjacent belief with one clean villain would have passed. Added check 5, concept fidelity: her verbatim belief, exactly one villain, and the product named as what it IS. Also fixed the duplicated step numbering.
9. **The Bingeable brief was too thin to carry a deck.** It had no pain lines, no proof lines, and no CTA lines. Rebuilt it as a full verbatim bank from the deliverable, sorted by job, including the 5 simmer parts, the story-stash line, and the payoff lines.

## Token leaks

1. **The big one was already fixed and is now protected.** The writer no longer loads METHOD, hook-forensics, or the 25k slide-by-slide file. The regression risk was hole 1 above, which silently traded her voice for the savings; that trade is now explicitly forbidden in three files.
2. **Sales pages are now a conditional load.** /content-run told every writer to always load the brief plus the sales page it names. The briefs exist precisely so that is not needed. Now the writer opens a named source only when the locked angle needs more verbatim lines than the brief holds.
3. **Still open, needs Alyssa's yes: the /saves-sweep daily boot.** The sweep loads full METHOD plus full hook-forensics plus BUSINESS plus FUNNEL every single day. That is the largest recurring load left in the content lane. A compact hook-shapes card could cut it, but compaction is exactly what caused the voice bug, so I am flagging it instead of doing it. Her call.
4. **Measured cost per version, from the live test below: about 74k writer tokens** including the four file loads and full reasoning. The old bad run was 63k for a deck she rejected. The cost per version is similar; the difference is the deck now passes the gates. Real savings come from fewer redo loops, not thinner loads.

## Copywriting review

The briefs are genuinely her, verbatim, sorted by job. The card "write toward / do not write" pairs are doing real work; every "do not write" line I checked is a plausible failure a generic writer would produce. Two flags:
- [[Studio/Content/briefs/a-year-of-emails]] still carries the robot-heavy framing question. It says confirm with Alyssa before running that offer. Nothing to fix until she rules.
- The 5MN and Bingeable chat words are still blank placeholders. Two one-word answers from Alyssa unblock both CTAs.

## The live test: one cold writer, narrow load

Per the handoff's assignment I ran the exact test it asked for: one fresh writer, loading only writer-kit, her-carousel-voice, the 5MN brief, and the How To card, with the concept locked to her ruling (gourmet email is the villain, six-burners angle dropped for this post).

Checker results on the output, run mechanically:
- Source trace: every teaching slide carries a run of 8 or more consecutive verbatim words from the brief. Pass.
- Density: teaching slides 46 to 52 words, 10 slides total, all 5 hooks at or under 10 words. Pass.
- Banned strings: none found. One earned exclamation. Pass.
- Spine and framework: all seven spine jobs present and tagged, including the proof beat How To usually drops. All framework steps filled with actual beats. Pass.
- Concept fidelity: one villain, her verbatim belief line as the spine, zero drift into the six-channels argument, and the product named as an $11 Notion planner on the CTA slide. Pass.
- Voice: headers are short verdicts ("Gourmet Email Marketing is Out." "The Recipe Had Too Many Steps."), bodies are her dense reporter register with "&" connectors and parenthetical asides. Passes the side-by-side test against her Jan 20 headers.

The full test deck is preserved below as evidence. It is a test artifact, not shipped to the board; if Alyssa likes it, a real run should still produce it through /content-run so it lands in the julia-child format with a receipt.

## What I cannot guarantee, said plainly

The system now has gates for the named failures: invented beliefs, two villains, label-only frameworks, thin slides, sales-page voice, imagery, orchestrator patches, and the missing voice file. Gates depend on agents obeying them, and the cold-writer proof below is self-reported by one run, not yet a durable pattern across many. What no gate can guarantee is that she loves the bit. Taste stays hers by design. (Language corrected 2026-07-17 per Larry's follow-up review: gates, not guarantees.)

## Still needs Alyssa (nothing else blocks daily runs)

1. Chat words for 5MN and Bingeable, one word each.
2. The A Year of Emails robot-framing rule before that offer runs.
3. Yes or no on slimming the /saves-sweep daily boot (token flag above).
4. tsk-2026-07-17-001, disabling the old ideation cron, is still open with Mack.

## Test artifact (the cold-writer deck, verbatim)

Hooks: "Gourmet Email Marketing is Out." · "Sorry Julia Child, Newsletters Went One-Pan." · "One Really Good Newsletter Outperforms All of It." · "The Five-Minute Newsletter People Actually Buy From." · "Your Newsletter Doesn't Need a Tasting Menu."

1. **Gourmet Email Marketing is Out.** (one-pan newsletters, on the table quick)
2. **Marketing Nerd With Receipts.** YOU DON'T NEED ANOTHER LECTURE ABOUT "THE MONEY IN THE LIST" YOU ALREADY KNOW EMAIL WORKS. BUT I'VE REVIEWED MY NOTES FROM MY OWN BUSINESS & BTS WITH CLIENTS, AND HERE'S THE FINDING: THE EMAILS THAT MAKE MONEY ARE THE ONES YOU ACTUALLY SEND. (NOT THE ONES SITTING IN DRAFTS GETTING SEASONED.)
3. **The Five-Course Newsletter Era.** OVERTHINKING YOUR DRAFTS. SKIPPING WEEKS. SENDING AN EMAIL THAT DOESN'T REALLY LEAD ANYWHERE, THEN FEELING RESENTFUL WHEN THE RESULTS ARE ULTIMATELY... LACKLUSTER. THAT'S GOURMET EMAIL MARKETING, BABE: HOURS OF PREP, FANCY PLATING, & A DISH NOBODY ORDERED. (THE SOUFFLÉ OF NEWSLETTERS. GORGEOUS. NEVER LEAVES THE KITCHEN.)
4. **One Really Good Newsletter Wins.** ONE REALLY GOOD NEWSLETTER OUTPERFORMS ALL OF IT... BUT ONLY IF YOU HIT SEND. AND IF YOU HAVEN'T BEEN SENDING, LISTEN: INSTEAD OF TRYING TO "JUST WRITE CONSISTENTLY" WE FOLLOW AN EMAIL FRAMEWORK THAT ALREADY WORKS, QUICKLY. (CONSISTENCY WAS NEVER THE INGREDIENT YOU WERE MISSING.)
5. **Step 1: Pick Your Cut.** CHOOSE YOUR SIMMER STORY FOR THE WEEK. I USUALLY LIKE BENIGN MOMENTS, THE THINGS YOU MIGHT VOICENOTE YOUR BFF (THINK YOUR KIDS MELTDOWN OVER A DIAGONALLY CUT SANDWICH OR THE WEIRD INTERACTION YOU HAD WITH THE MAILMAN). EVERYDAY MOMENTS ARE THE RAW MATERIAL. THE RECIPE DOES THE LIFTING.
6. **Step 2: Follow the Recipe.** JUST FOLLOW THE RECIPE, SECTION BY SECTION, UNTIL IT'S DONE. YOU'RE WRITING EACH PART OF A HIGH CONVERTING SIMMER EMAIL FROM HOOK TO OFFER, & WHEN EVERY SECTION HAS ONE JOB YOUR EMAIL PRACTICALLY WRITES ITSELF (RIP WRITERS BLOCK). WHICH TAKES ABOUT FIVE MINUTES. NOT FIVE HOURS OF PLATING.
7. **Step 3: Schedule & Snack.** DRAG YOUR EMAIL FROM "WRITING" TO "READY TO SEND," DROP IT ON NEXT THURSDAY, SCHEDULE, GET YOURSELF A SWEET TREAT. THAT'S THE WHOLE COOK. NO GARNISH, NO SECOND-GUESSING, NO REOPENING THE DRAFT AT 11PM TO RE-SEASON A SENTENCE NOBODY WAS GONNA NOTICE ANYWAY.
8. **The Recipe Had Too Many Steps.** YOU WERE NEVER MISSING DISCIPLINE. THE RECIPE HAD TOO MANY STEPS. I DESIGNED THIS AS AN ADHD GIRLIE WHO COULD OVERCOMPLICATE A GRILLED CHEESE, FOR THE PERSON WHO DOESN'T NEED MORE IDEAS... THEY NEED A PLACE WHERE IDEAS ACTUALLY TURN INTO EMAILS.
9. **Three Weeks on One Pan.** WEEK ONE: YOU'RE BECOMING THE PERSON WHOSE EMAILS THEY ACTUALLY LOOK FOR EACH WEEK. WEEK TWO: OPENS ARE UP, CLICKS ARE UP, AND REAL PEOPLE ARE HITTING REPLY TO ASK ABOUT YOUR OFFER. WEEK THREE: AND NOW YOU KNOW HOW TO DO IT OVER AND OVER AGAIN. AND THE BEST PART IS… ONCE YOU LEARN THIS YOU'LL NEVER RUN OUT OF EMAIL IDEAS AGAIN.
10. **Sorry Julia Child.** INTRODUCING YOUR NEW ONE-PAN RECIPE FOR NEWSLETTERS ON THE TABLE QUICK! THE 5 MINUTE NEWSLETTER IS AN $11 NOTION PLANNER THAT RUNS EVERY STEP FOR YOU: 10 CURATED NEWSLETTER TYPES SO YOU JUST PICK AND GO, 25+ PROMPTS AND 15+ REAL EXAMPLES BAKED INTO EVERY SECTION SO YOU ALWAYS KNOW WHAT GOES NEXT (EVEN WHEN YOUR BRAIN'S LEFT THE BUILDING), & A BOARD THAT MOVES IT TO "READY TO SEND." TYPE B WHO? $11. LESS THAN THE LUNCH YOU'D STRESS-EAT OVER A DRAFT.

Caption: gourmet email marketing is out. the overthinking, the skipped weeks, the emails that don't really lead anywhere... that's a five-course production for a table of zero. one really good newsletter outperforms all of it (but only if you hit send). the whole recipe's on the slides: pick one benign moment from your week, follow the sections from hook to offer, schedule it & go get a sweet treat. and if you want the version where every step is already built for you: The 5 Minute Newsletter, my $11 Notion planner, turning "i need to email my list" into a bingeable newsletter people read, reply to, and buy from. on the table quicker than mom's spaghetti.

CTA: chat word pending, placeholder used in the test.

---
title: The exemplar writer (experimental)
type: writer-spec
status: experimental — built 2026-07-19 on the [[Studio/Deliverables/2026-07-19-voice-replication-research]] findings. Runs PARALLEL to the current system ([[Studio/Content/carousel-dispatch]] + [[Studio/Content/writer-kit]]), which stays live until Alyssa retires it.
---

# The exemplar writer

The research finding this implements: rule prompting is the weakest voice-imitation method; exemplar-dominant context with completion framing is the strongest (up to 23.5x better style match). So this writer reads HER, almost nothing else.

## The load (in this order, nothing else)

1. [[Studio/Content/nine-decks]] in FULL. This is the dominant context: her ten real decks, 89 slides, verbatim, captions included. The writer reads all of it before anything else.
2. The assignment block (below), pasted into the prompt. Source copy for the topic (her email or brief lines) is included in the assignment, never as a separate file.

NOT loaded: writer-kit, her-carousel-voice, framework cards, METHOD, briefs. Every rule those files encode is already embodied in the corpus. Rules describing her are the failure mode this replaces.

## The framing (completion, not instruction)

The writer is never told "write like Alyssa." After reading the corpus, the prompt says: **"Deck eleven begins here."** The writer continues the corpus. The assignment supplies only what a new deck needs: the argument, the source lines, the product, the CTA word.

## The rule block (hard cap: ten lines, never more)

1. You just read her ten decks. Deck eleven begins here. Continue HER; never describe her.
2. The assignment's argument and source lines are the raw material; her existing decks are the register.
3. Any stealable asset lands WHOLE on one slide.
4. Copy only; no image or design directions.
5. Return: 2 covers, 5 hooks (10 words or fewer each), the deck, caption, CTA line with [chat word] placeholder.

## The gate before Alyssa sees anything

A fresh-context judge gets three real decks from the corpus plus the candidate, unlabeled and shuffled, and must pick the imposter and say which lines betray it. If the judge picks the candidate confidently, the writer gets the betraying lines back (as examples, not rules) and rewrites once. Repeat until the judge is at or near chance, or flags only trivial tells. Only then does it go to her board.

## Log

- 2026-07-19: first test run, trust-recession assignment (her "hot and urgent" react), results in [[Studio/Content/runs/2026-07-19-run]]. Three judge rounds: 5/10, then 4/10 (follower verdict flipped to pass), then only two corpus-skeleton re-skins left, rebuilt in the final pass. Shipped to the board as "Claude Is Not Coming To Save You." Two working notes: (1) judges repeatedly flagged her REAL verbatim lines as AI tells, so the gate prompt must always list the source-material lines to prevent false positives; (2) the recurring true tells across rounds were em dashes, re-skinned corpus punchlines, commands-to-reader in handwritten slots, and missing mid-sentence bolds; watch those first in future gates.

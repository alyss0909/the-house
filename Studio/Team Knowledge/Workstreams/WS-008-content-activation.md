# WS-008 — Content Activation

- **Status:** Active (new 2026-06-27)
- **Type:** Workstream — Larry orchestration, Hermes + specialists execution
- **Owner:** Larry (routing), Hermes (copy), Charta (design if needed), Pax (research if needed)
- **Triggered by:** "activate this" / "turn this into content" / "what can we do with this?" / Larry's content activation flag from SOP-013 / open content tasks in `Studio/Team Knowledge/tasks/open/` that are ready to dispatch

## What this is

Content Activation closes the loop between the idea garden and production. It's the answer to the gap that's been running for 3+ weeks: Alyssa approves things in WS-004, the team says "this could be a Hermes task," and then nothing happens.

Content Activation isn't a new review. It's a standing pattern: when something is flagged as content-ready in SOP-013, it automatically routes here. When a content task in `Studio/Team Knowledge/tasks/open/` is ready to dispatch, this workstream moves it. (The Ready Queue file was dissolved 2026-07-10 per Alyssa — the queue sources are now `Studio/Team Knowledge/tasks/open/` and [[Studio/Content/idea-bank.md]]; history at [[Archive/ready-queue-retired-2026-07-10]].)

---

## Trigger Conditions

Any of the following kicks off WS-008:

1. **Semantic sweep flag** (SOP-013 Step 4): an entry is flagged as content-ready
2. **Open content tasks ready to dispatch**: at the start of any session, Larry checks `Studio/Team Knowledge/tasks/open/` and reports any dispatch-ready content tasks
3. **WS-006 Phase 3** surfaces a new queue item
4. **Alyssa says**: "do something with this" / "send this to Hermes" / "make something from this"
5. **WS-004 approval** triggers a brief: an inbox item gets approved and a content type is identified

---

## Step 0 — Check the source material

Before any dispatch:
1. Does the brief have a clearly identified content type? (email / carousel / Soft Sunday / Simmer / Pinterest pin / sales page / BOH module)
2. Does the brief have a clearly identified assignee? (Hermes for copy, Charta for design, Pax for research, Silas for vault structure)
3. Does the source material exist and is it linked? (Journal entry, developing idea note, voice memo, Second Brain file)
4. Does the brief pass the taste check? (Cross-reference [[Studio/Content/taste-ledger]] — is this the kind of thing Alyssa acts on?)

If any of 1-3 is missing: fill it in before dispatching. Don't send a partial brief.
If the taste check raises a flag: note it in the brief, but still dispatch unless the pattern is a clear NO.
Before dispatch, run [[Studio/Hermes/MEAN-ALYSSA]] and [[GL-009-source-boundaries-and-promotion]]. If the gate fails, fix source access, use an existing map/task, or route to Pax/Mack before dispatch. If the remaining decision is taste/strategy and cannot be proven from source, dispatch with two versions: A safer/source-close and B more nuanced/higher-upside/needs Alyssa taste.

---

## Step 1 — Write the brief

The brief lives in the task file (`Studio/Team Knowledge/tasks/open/`, per [[SOP-004-create-task]]) OR in a dedicated Deliverables file for complex assignments. For Hermes: the brief only needs source links - his mandatory brain + vault loads come from Studio/Hermes/README.md.

**Brief minimum viable content:**
- Content type
- Source material links
- Tone / voice notes specific to this piece (beyond what's in memory.md)
- Deliverable format (file path + format)
- Any specific constraints (length, CTA, launch timing if applicable)
- What to do if Hermes isn't sure: flag it in the deliverable file, don't guess

---

## Step 2 — Dispatch

Larry routes to the specialist. For Hermes tasks specifically:
1. Confirm the brief links the source developing idea note and journal entries (Hermes' brain loads are automatic per Studio/Hermes/README.md)
2. Hermes runs his README load protocol (judgment files + full source originals) → reads source material → writes draft
3. Hermes saves draft to `Deliverables/YYYY-MM-DD-[slug]-draft.md`

---

## Step 3 — Report to Alyssa

After the specialist produces a deliverable: Larry surfaces it at the next session open or weekly review. One sentence: what was made, where it is, and what it needs from Alyssa (review? approve? edit? send?).

---

## Step 4 — Log the approval

When Alyssa reacts to the deliverable:
- Approved as-is → log in [[Studio/Content/taste-ledger]] (YES pattern)
- Edited and approved → log specific changes verbatim in Studio/Hermes/learning/inbox.md (calibration entry)
- Passed / redirected → log in [[Studio/Content/taste-ledger]] (NO or REDIRECT pattern)
- Close the task file per [[SOP-006-close-task]] (or note the idea-bank entry as used)

---

## Standing Instructions

The following are standing content activation briefs that don't require a trigger — they run automatically:

**Standing Brief 1: Email → Carousel**
After every email that's filed to the Second Brain or drafted by Hermes, Hermes proposes 2 carousel angles in the same session (or the next WS-004 run). Format: carousel type (from framework) + opening hook + 3-line outline.

**Standing Brief 2: Sweep → Queue**
Every time SOP-013 runs and flags content-ready entries, those entries automatically route: social content onto the Content Studio board in Notion as an idea row (the production path is [[Studio/Content/carousel-dispatch]], run by `/content-run` per [[Studio/Content/METHOD]]; the weekly pitch loop WS-011 was retired 2026-07-16), everything else as a task file in `Studio/Team Knowledge/tasks/open/` per [[SOP-004-create-task]]. Larry writes it. Dispatch-ready items either dispatch, become blocked with one precise blocker, or get demoted. They do not sit as vague "good idea" entries.

---

## Weekly batch mode (two touchpoints)

When a full theme week (or month) runs end-to-end through the pipeline in one batch, Alyssa gets exactly two touchpoints — never more, never a silent skip:

- **Touchpoint 1 — concept react.** After Test Kitchen + Mean Alyssa gate produce survivors, present ONLY the top 2-3 per slot: concept + hook + comment word. One message, no walls of text. She picks/edits/kills. No copy is written before her pick.
- **Touchpoint 2 — final review.** After Hermes writes and self-runs the ANTI-AI + lineup pass, she reviews finals in one sitting. Corrections log verbatim to [[Studio/Hermes/learning/inbox]]; recurring corrections get a graduation proposal into ANTI-AI/TASTE (proposal only, she approves).

## Hard halts (never soft-fail)

- **Unverified chat word → HALT, ship concept-only.** If a slot's chat word is "manual selection needed" (per [[Studio/Hermes/MAP]] §3 / [[Studio/Hermes/BUSINESS]]) or the product has a flagged conflict, that slot ships as concept-only and the gap goes in a "For Alyssa" block. Never invent, never delay the rest of the batch.
- **GAP is never filled by inference.** A documented gap in MAP/BUSINESS routes to Alyssa; guessing a plausible fill is the trust-killer this whole system exists to prevent.
- **Any need to edit `Studio/Analysis/`** — stop; that never happens.
- **Mechanical lint at The Pass — writer kill-log claims are never evidence.** (Tournament finding 2026-07-05: all three writer architectures shipped em-dashes and the banned word "quietly" in final copy while their own ANTI-AI logs claimed zero — models cannot reliably self-grep.) Before any final reaches Touchpoint 2, The Pass runs an ACTUAL tool check on the copy file: em-dash character count in prose (must be 0), banned-vocab grep (quiet/quietly, leverage, effortless, game-changer, seamless, streamline, unlock — 0 hits), period-density + staccato-run counts per STYLE §1. Any hit → fix and re-lint before it ships; the hit and fix are logged.

## Cross-references

- `Studio/Team Knowledge/tasks/open/` + [[Studio/Content/idea-bank.md]] — the queue sources this workstream manages (Ready Queue dissolved 2026-07-10 → [[Archive/ready-queue-retired-2026-07-10]])
- [[Studio/Content/taste-ledger]] — approval pattern validation (the retired taste-log it replaced was drained 2026-07-17)
- [[Studio/Hermes/learning/inbox.md]] — voice calibration for all Hermes tasks
- [[Studio/Hermes/MEAN-ALYSSA.md]] — rejection-trained trust gate before asking, creating, promoting, or dispatching
- [[Studio/Team Knowledge/Guidelines/GL-009-source-boundaries-and-promotion.md]] — source boundaries and artifact fates
- [[Studio/Team Knowledge/SOPs/SOP-013-semantic-sweep.md]] — the primary feeder
- [[Studio/Team Knowledge/Workstreams/WS-004-inbox-processing.md]] — secondary feeder
- [[Studio/Team Knowledge/Workstreams/WS-006-weekly-review.md]] — Phase 3 surfaces queue items

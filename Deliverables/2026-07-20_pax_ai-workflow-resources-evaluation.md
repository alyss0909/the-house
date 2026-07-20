---
title: AI Workflow Resources — Evaluation
author: Pax (Senior Researcher)
date: 2026-07-20
status: draft — for Alyssa's reaction
task: Agent Tasks board — "Evaluate the eleven collected AI workflow resources" (assignee Larry)
sources:
  - Studio/Signals/Developing Ideas/ai-workflow-collecting.md
  - Studio/Signals/Developing Ideas/system-already-beats-external-tools.md
---

# AI Workflow Resources — Evaluation

Thirteen journal captures between 2026-07-08 and 2026-07-11, collapsing to **eleven distinct resources** (the Claude Code agents guide and the One-Command Funnel Blueprint were each saved twice). Every one is the same move: saving an external Claude/AI workflow resource for later. This is the intake pile behind [[Studio/Signals/Developing Ideas/ai-workflow-collecting]].

Each resource is judged against one question, per the house's own standing heuristic in [[Studio/Signals/Developing Ideas/system-already-beats-external-tools]]: **does it add a capability the vault lacks?** Not "is it good" — "is it something myPKA can't already do, better-fitted to Alyssa."

## Verdict summary

**Tally: 1 keep · 10 drop (4 of them steal-one-idea) · 0 wholesale adoptions.** The team note called it: most should be dropped. The honest finding is stronger than that — ten of eleven lose to something already built and better-fitted. That is not dismissiveness; each verdict below names the concrete house capability that already covers it.

| # | Resource | Verdict | One-line reason |
|---|---|---|---|
| 1 | Claude Code agents guide / agent dashboard (saved 2x) | **Drop** | The house already runs a full specialist roster with routing (`.claude/agents/`, [[Studio/Team/agent-index]]); a generic setup guide adds nothing. Duplicate capture. |
| 2 | AI Design Team — Notion template | **Drop** | This template *is* "a team of AI agents in Notion." The house already is that, better-fitted, and already surfaced in Notion (House Control Room + Agent Tasks board). Textbook system-already-beats-external. |
| 3 | Claude x Notion Mid-Year Review | **Steal-one-idea** | Drop the walkthrough — the house has weekly/monthly/quarterly reviews + semantic sweep (SOP-013). Lift only the *twice-yearly reflection checkpoint* cadence, which the review ladder doesn't name. |
| 4 | GPT Image Prompt Improver (doc) | **Drop** | Pixel already constructs image prompts from GL-003 imagery direction (SOP-017). A GPT-image-specific prompt improver is the wrong tool and a thinner method. |
| 5 | One-Command Funnel Blueprint / Lead Magnet Pipeline (saved 2x) | **Drop** | The house already ships this end-to-end: `/lead-magnet`, `/landing-page`, `/execute-lead-magnets`, the Lead Magnet Pipeline DB, and real Kit delivery. More integrated than the blueprint. Duplicate. |
| 6 | Notion Saves Engine | **Steal-one-idea** | Drop the engine — `/saves-sweep` already pulls saves into Notion. Lift the one mechanic: a *link/article* saves lane with an auto-triage verdict — which is exactly what the ai-workflow-collecting signal is asking to build. |
| 7 | Claude Notion Workflows (Flodesk bundle) | **Drop** | A generic Claude+Notion opt-in bundle. The house operates Claude+Notion far deeper already (boards, mailroom, tasks two-way sync). Nothing specific to evaluate. |
| 8 | Content Skills Resource | **Drop** | `/content-run`, `/saves-sweep`, METHOD.md, the Voice layer, and Hermes are a bespoke content OS built on her real writing. A generic content-skills pack loses to it. |
| 9 | Knowledge Base Prompt (doc) | **Drop** | The vault *is* a knowledge base with WS-002 import, SSOT, and frontmatter discipline. A generic "build a KB" prompt sits beneath the system. |
| 10 | Onlook — the Cursor for Designers | **Keep (reframe)** | The one genuinely new capability: open-source visual React editing. But her own notes ("make mine have supporter-only features," "edit the notekeeper app to look cuter, add tags") make this a *personal build project*, not a house workflow gap — route to Felix/Iris, out of the signal. |
| 11 | Prompts to Run When Fable Comes Back | **Steal-one-idea** | Drop the generic prompt list. Lift the shape: a house-specific *model-upgrade checklist* — a saved set of regression prompts to run when a new model lands. |

## Why the pile lost, in one paragraph

Nine of these eleven are generic-user products: a Claude+Notion agent team, a lead-magnet funnel, a content-skills pack, a KB prompt, a saves engine, an agents guide. Every one of them describes a capability the house already built for one specific person's actual workflow, voice, and funnel — and the bespoke version wins on fit every time. This collection is not a backlog to process; it is **evidence for the thesis the garden is already tracking**. Ten drops in a row is the data point [[Studio/Signals/Developing Ideas/system-already-beats-external-tools]] was waiting for (its recurrence count was 3, below the thesis-ready threshold of 6). Feeding these verdicts in pushes it well past that line.

## Steal list (the only things worth lifting)

Four small mechanics survive, none worth a build sprint on its own:

1. **A link/article saves-triage lane** (from #6) — the missing sibling to `/saves-sweep`. Each saved AI/link resource gets a fast two-line verdict against the system on capture, so a pile never accumulates again. This is the exact proposal already drafted in the ai-workflow-collecting signal; this evaluation is proof it works.
2. **A twice-yearly reflection checkpoint** (from #3) — a mid-year review cadence the current weekly/monthly/quarterly ladder doesn't name.
3. **A model-upgrade regression checklist** (from #11) — house-specific prompts to run when a new model ships, so upgrades are verified not vibed.
4. (Marginal) a prompt-improver pass could feed Pixel's prompt construction (from #4) — low value, noted for completeness, not recommended.

## Recommendation

Do **not** process this backlog one resource at a time — that is the trap the signal already diagnosed. Instead:

- **Close the pile.** Mark all eleven evaluated; drop ten, keep one (Onlook, reframed as a build lead).
- **Feed the thesis.** Log these ten "skip, already built" verdicts into [[Studio/Signals/Developing Ideas/system-already-beats-external-tools]] — the recurrence now clears the thesis-ready threshold, and the two signals can merge as the note anticipates.
- **Build the one mechanic worth building:** the saves-triage lane (steal #1), so the collecting-faster-than-evaluating pattern stops recreating this pile.

## What deserves Alyssa's attention (top 2)

1. **The meta-finding beats any single resource.** Ten of eleven lost to what's already built. This is the strongest evidence yet for the standing fast-verdict lane the ai-workflow-collecting signal proposes — and there is a teaching angle in it (her students feel this same AI-tool firehose; "how to check a shiny tool against the back of house you already have" is a BOH lesson).
2. **Onlook is the only real keep — but as her own product idea, not a house tool.** She already flagged the build in her own notes (a cuter notekeeper app with tags + supporter-only features). If she wants it, it routes to Felix/Iris as a project, not into the signal lane.

## Connections

- Feeds: [[Studio/Signals/Developing Ideas/ai-workflow-collecting]] (this is the evaluation it was waiting on)
- Feeds: [[Studio/Signals/Developing Ideas/system-already-beats-external-tools]] (ten new "already built" verdicts)
- Existing capabilities cited: [[Studio/Team/agent-index]], `/content-run`, `/saves-sweep`, `/lead-magnet`, `/landing-page`, `/execute-lead-magnets`, SOP-013 semantic sweep, SOP-017, WS-002

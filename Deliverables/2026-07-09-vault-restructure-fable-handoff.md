---
title: Vault Restructure Handoff for Fable 5
date: 2026-07-09
owner: Larry
status: handoff-for-research
do_not_execute: true
---

# Vault Restructure Handoff for Fable 5

## Purpose

This handoff gives Fable 5 the actual goal of the vault restructure, the guardrails, the success signals, the red flags, and the areas that need deeper research before anyone moves files.

No files should be moved from this handoff alone.

The immediate job is deep research, architecture stress-testing, and failure-mode discovery.

## Ultimate Goal

Alyssa wants the vault reorganized so it works better for both:

- Alyssa as the human using the vault
- the AI/team system operating inside the vault

The current vault has intelligent methodology underneath it, but the visible folder structure is creating friction. The main issue is that raw Alyssa thoughts, AI interpretation, team outputs, maps, dashboards, workflows, finished source material, and temporary deliverables are too blended together.

The restructure should make provenance obvious at a glance.

The proposed top-level meaning is:

```text
Thinking = Alyssa/raw/unprocessed
Building = AI/team/workshop/maps/analysis/active work
Finished = trusted reusable source shelves
```

This is not a cosmetic folder cleanup. It is a trust architecture.

## The Real Problem

The conversation started because Alyssa noticed that her Journal holds raw personal notes but also AI-processed notes and interpretations. That makes the vault feel untrustworthy.

When an agent searches for what Alyssa thinks, it may currently find:

- Alyssa's actual thought
- an AI take on Alyssa's thought
- an unreviewed analysis
- a task artifact
- a map
- a deliverable

Those cannot be treated the same.

The restructure must make this distinction hard to miss.

## Proposed North-Star Structure

This is the conceptual target, not an approved migration plan:

```text
ROOT
|__ AGENTS.md
|__ VAULT-MAP.md
|
|__ Thinking
|   |__ MAP.md
|   |__ Inbox
|   |__ Journal
|   |__ Todos
|
|__ Building
|   |__ MAP.md
|   |__ Team
|   |__ Workflows
|   |__ Work
|   |__ Analysis
|   |__ Signals
|   |__ Automations
|   |__ Archive
|
|__ Finished
    |__ MAP.md
    |__ Offers
    |__ Second Brain
```

## Folder Meaning

### Thinking

Thinking is Alyssa's raw input layer.

It should hold:

- raw journal entries
- raw inbox drops
- raw personal todos
- possibly minimal raw personal context

It should not hold:

- AI interpretation
- team analysis
- semantic sweeps
- generated thesis drafts
- "what we think Alyssa means"
- workflow outputs

### Building

Building is the team workshop.

It should hold:

- team infrastructure
- SOPs, guidelines, workstreams, templates
- maps
- active work
- dashboards
- Content OS
- Hermes as a team brain
- analysis
- signals
- automations
- session logs
- tasks
- archives of team outputs

Building is allowed to be operationally busy, but it cannot become a junk drawer. It needs the strongest map layer in the vault.

### Finished

Finished is the trusted reusable shelf.

It should hold:

- offer and program source
- real examples
- reviewed frameworks
- reviewed templates
- durable source material the team can cite and reuse

Finished should not hold unreviewed AI analysis unless it has been explicitly promoted.

## Non-Negotiable Source Boundary

Use this as law:

```text
Source is what Alyssa made.
Everything else is a map, a lens, an output, a task, or derived interpretation until promoted on purpose.
```

This comes from `GL-009-source-boundaries-and-promotion` and must survive the restructure.

The folder structure should embody this rule so agents do not need to remember it perfectly.

## Map Layer Requirement

Alyssa is worried agents will get lost. That worry is correct.

The restructure cannot rely on folder names alone. It needs simpler folders plus stronger maps.

Required maps to design:

```text
ROOT/VAULT-MAP.md
Thinking/MAP.md
Building/MAP.md
Finished/MAP.md
Building/Team/MAP.md
Building/Work/Content OS/MAP.md
Finished/Offers/MAP.md
Finished/Second Brain/MAP.md
```

Maps should answer jobs, not merely describe folders.

Example job routing:

```text
If you are writing carousel copy:
1. Read Building/Work/Content OS/MAP.md
2. Read Building/Team/Hermes/MAP.md
3. Load the approved pitch/arc
4. Read Finished/Offers/[Offer]/MAP.md
5. Read Finished/Second Brain/Examples/Carousels
6. Do not read Thinking unless explicitly searching for raw Alyssa seed material
```

Core principle:

```text
Folders are for Alyssa.
MAP.md files are for agents.
```

## Current Areas That Need Conceptual Rehoming

### Journal

```text
PKM/Journal
-> Thinking/Journal
```

This is raw Alyssa source. It must remain untouched by AI analysis.

### Team Inbox

```text
Team Inbox
-> split
```

Raw drops go to `Thinking/Inbox`.

Operational pitch/dashboard material goes to `Building/Work/Content OS`.

Major red flag: `Team Inbox/pitches` is currently not an inbox. It is an active Content OS workspace.

### Signals and Developing Ideas

```text
PKM/Signals
PKM/Developing Ideas
-> Building/Signals or Building/Analysis
```

Reason: much of this is AI/team interpretation, not raw Alyssa thought.

Rule:

```text
If Alyssa wrote it raw -> Thinking.
If AI/team inferred or developed it -> Building.
```

### Second Brain Analysis

```text
PKM/Second Brain/analysis
-> Building/Analysis/Second Brain
```

Reason: analysis is derived unless explicitly reviewed/promoted.

### Second Brain Examples

```text
PKM/Second Brain/examples
-> Finished/Second Brain/Examples
```

These are real source examples.

### Offers and Programs

Current confusion:

```text
PKM/My Life/Offers
PKM/Second Brain/programs
```

The working hypothesis is that these should merge conceptually.

Reason: "Offers" and "Programs" are functionally confusing when separated. Back of House is both an offer and a program. Agents should not have to wonder whether to look in Offers, Programs, Second Brain, or Hermes.

Possible target:

```text
Finished/Offers
|__ Back of House
|   |__ MAP.md
|   |__ Offer
|   |__ Program
|   |__ Sales Pages
|   |__ Emails
|   |__ Examples
```

This needs deep research before execution.

### Team and Team Knowledge

```text
Team
Team Knowledge
-> Building/Team
```

Conceptually, team contracts, SOPs, workstreams, guidelines, tasks, templates, session logs, and automations are operational machinery. They are not Alyssa source.

This is high-risk to move physically because many paths and wikilinks depend on these locations.

### Hermes

```text
Hermes
-> Building/Team/Hermes
```

Conceptually, Hermes is a team brain, judgment layer, and source-routing layer over Alyssa's source. It should not feel like a separate top-level world.

However, this is a high-risk physical move because many files point to:

- [[Hermes/MAP]]
- [[Hermes/SOURCES]]
- [[Hermes/FABLE]]
- [[Hermes/BUSINESS]]
- [[Hermes/README]]

Fable should consider whether Hermes should stay physically at root during the first phase with a map explaining its conceptual home.

## What Must Not Break

Do not break Larry.

Larry currently depends on:

- [[AGENTS]]
- [[Studio/Team/agent-index]]
- `Team Knowledge/SOPs`
- `Team Knowledge/Workstreams`
- `Team Knowledge/Guidelines`
- `Team Knowledge/session-logs`
- `Team Knowledge/tasks`
- `GL-009-source-boundaries-and-promotion`
- `SOP-011-write-session-log`
- `SOP-013-semantic-sweep`
- `WS-006-weekly-review`
- `WS-007-monthly-review`
- `WS-011-weekly-carousel-pitch`

The restructure must preserve:

- Larry's routing ability
- specialist contracts
- SOP and workstream lookup
- session-log behavior
- task index behavior
- source-boundary enforcement
- close-session metabolism
- weekly and monthly review logic
- Content OS routing
- Hermes source-loading protocol

If any move breaks those, the restructure fails.

## Real Workflows To Stress-Test

Fable should test the proposed model against these real workflows:

1. Daily raw capture
   - Alyssa drops a thought, screenshot, voice memo, or note.
   - Does it land in Thinking without AI interpretation polluting it?

2. Telegram capture
   - Telegram bot currently writes into Team Inbox.
   - Where should raw messages land?
   - What happens to command-routed content?

3. Meetily meeting capture
   - Meeting pointers and transcript flows must still route properly.

4. Content Command Center
   - Dashboard currently reads `Team Inbox/pitches`.
   - This must be moved or mapped carefully.

5. WS-011 weekly carousel pitch
   - Depends on pitch sheets, taste ledger, swipe files, Hermes, Suki, Cassius, GL-010, and GL-012.

6. Hermes writing
   - Hermes must still find source examples, offer facts, program teaching, maps, and anti-AI rules.

7. Suki strategy
   - Suki must know where Content OS strategy lives and where maker-source wiring is defined.

8. Cassius substance arc
   - Cassius must find approved concept, source files, real numbers, offer meaning, and arc contract.

9. Semantic sweep
   - Signals must become Building/Signals, not Thinking.

10. Session close
   - Session logs and artifact fates must still work.

11. Task rebuild
   - Task locations and status folders cannot silently break.

12. Offers/program lookup
   - Agent must find Back of House truth in one place.

13. Second Brain lookup
   - Agent must not confuse examples/source with AI analysis.

14. Automations/scripts
   - Hardcoded paths may break, especially Telegram, Meetily, dashboard, and import scripts.

## Big Red Flags

### RED FLAG 1 - Big-bang migration

Do not move the whole vault at once. There are too many hardcoded paths, wikilinks, dashboards, and SOP references.

### RED FLAG 2 - Building becomes the new junk drawer

Building needs the strongest maps in the vault or agents will get lost.

### RED FLAG 3 - AI analysis accidentally becomes source

Any analysis moved into Finished must be explicitly reviewed/promoted.

### RED FLAG 4 - Team Inbox naming collision

Current Team Inbox contains both raw inbox material and live Content OS infrastructure. It must be split.

### RED FLAG 5 - Hermes path dependency

Hermes has many live references. Moving Hermes physically could break writing protocols unless redirect maps are installed and path references are swept.

### RED FLAG 6 - Offers and Programs merge complexity

Merging these is probably correct, but must preserve BOH curriculum, sales pages, offer facts, source examples, and Notion product truth.

### RED FLAG 7 - ICOR guilt

Do not preserve visible ICOR folders just because the methodology says so. Preserve useful logic in maps/guidelines if the visible folders are not serving Alyssa.

### RED FLAG 8 - Obsidian dashboard hardcoded paths

Dashboard files use DataviewJS and specific folder paths. These need path-by-path audit.

### RED FLAG 9 - Multiple brains

Second Brain, Hermes, Content OS, Deliverables, and Team Knowledge all contain maps. The restructure must clarify which map wins for which job.

### RED FLAG 10 - Agent entry confusion

Every major workflow needs one obvious entry file. No agent should have to infer from folder names.

## Areas To Explore Deeper

Fable should explore these before recommending execution:

1. Should `Personal` exist visibly at all?
   - Current instinct: no.
   - Personal may be a file or hidden/context map, not seven visible folders.

2. Should `Ideas` be in Thinking or Building?
   - If written by Alyssa raw, Thinking.
   - If AI-developed thesis/signal, Building.

3. Should Hermes physically move?
   - Maybe not initially.
   - Could leave Hermes at root with a redirect/map while conceptually treating it as Building/Team/Hermes.

4. Should Team Knowledge physically move?
   - Maybe later.
   - This is high-risk because SOPs and AGENTS expect it.

5. Should the first pilot be Content OS?
   - Likely yes.
   - It is the most active messy workflow and will expose map gaps quickly.

6. What should `Finished/Second Brain` contain after Offers/Programs merge?
   - Probably examples, frameworks, templates, and non-offer reusable source/reference.

7. What is the cleanest offer/program internal structure?
   - Needs to handle BOH, Soft Sundays, templates, sales pages, emails, CTAs, chat words, and program curriculum.

8. What path compatibility layer is needed?
   - Redirect notes, old-path maps, wikilink sweeps, dashboard path updates, script updates.

9. What does promotion look like?
   - Need a clear process for moving something from Building/Analysis into Finished.

10. What should the agent read order be?
   - Proposed: root map -> folder map -> workflow map -> specialist map -> source map.

## Success Signals

The restructure is successful if:

- Alyssa can open the vault and understand it in 10 seconds.
- An agent can answer "Am I looking for raw Alyssa, team work, or trusted source?" without guessing.
- Journal contains only Alyssa-original thought.
- AI analysis never sits beside raw notes pretending to be source.
- Content OS has one clear operating home.
- Back of House has one clear home.
- Hermes can still write without losing source depth.
- Larry can still route every request.
- SOPs, Workstreams, Guidelines, Tasks, and Session Logs still function.
- Automations still know where to write and read.
- Every old major path either resolves, redirects, or is intentionally retired.
- Agents stop creating duplicate maps/digests because the map layer tells them where to point.

## No-Gos

- No mixing Alyssa raw thought with AI interpretation.
- No moving files before a complete path audit.
- No deleting old structure without redirects.
- No treating AI analysis as source.
- No making Alyssa browse ICOR taxonomy folders she does not use.
- No burying team routing where Larry cannot find it.
- No breaking dashboards or automations quietly.
- No creating new duplicate brains.
- No letting Deliverables remain a forever shelf for important knowledge.
- No moving Hermes or Team Knowledge casually.
- No letting folder names do the work maps should do.

## Desired Fable 5 Output

Fable should return:

1. Recommended target architecture
2. Map hierarchy design
3. Physical migration risk assessment
4. Which folders should move vs stay with redirects
5. Workflow stress-test results
6. Red flags and unresolved decisions
7. Pilot plan recommendation
8. Required path audit checklist
9. Agent read-order protocol
10. Guardrails to prevent AI/source contamination

Fable should not execute the migration. The job is to pressure-test the architecture and produce the safest possible restructure plan.

## Final Framing

This is the purpose of the restructure:

```text
Make the vault simpler for Alyssa to live in
and more explicit for agents to operate inside.
```

The target is not fewer files. The target is lower cognitive load and higher trust.

```text
Thinking = my mind
Building = the workshop
Finished = the shelf
Maps = the rails
```

That is the goal.

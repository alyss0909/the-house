---
title: The Unified Theory — Why Every Vault Symptom Is One Bug
date: 2026-07-09
owner: Larry (Fable synthesis)
status: for-alyssa
supersedes-in-part: GL-013 draft (which becomes a corollary, not a patch)
responds_to: "[[2026-07-09-vault-restructure-stress-test]]"
---

# The Unified Theory

## Every symptom is the same bug

Line up everything that has broken trust in this vault:

| Symptom | What actually happened |
|---|---|
| Content calendar built 5 times in one week | Each build sprint derived its own copy because no neutral home existed for "the current truth" |
| `Hermes/BUSINESS.md` owns business facts | Facts were consolidated *during the Hermes build*, so they stayed where they were born — inside the builder's workspace — and got declared canonical by momentum |
| `Team Inbox/pitches` is a live workspace inside an inbox | The pitch project was born in the inbox and never moved out when it became permanent infrastructure |
| Deliverables is a forever shelf | Outputs are born in Deliverables and there is no *next place* — so nothing ever leaves |
| AI analysis sits beside Alyssa's verbatim source | Analysis was born during the Second Brain import and filed next to its subject, not by its trust level |
| Ghost files (`Hermes/CALENDAR.md`, `PITCH.md`) and empty program folders | Plans were written in the geography of finished things, so they read as records |
| Wren's memory file still live after retirement | A retired resident's house was never demolished; its belongings kept getting loaded |
| Indexes lying (Journal INDEX, programs INDEX, agent-index missing Hermes) | Hand-maintained truth claims with no owner and no lifecycle rot in place |

**One bug: the vault stores knowledge by WHERE IT WAS BORN — which sprint, which agent, which project — instead of by WHAT STATE OF TRUST IT IS IN.**

Location currently answers "who made this, during what?" That's why every new build sprint spawns a new local truth: pulling from the *last* sprint's folder feels wrong, because that folder is named after a different project. Knowledge gets stranded at its birthplace forever. Nothing migrates, because there is nowhere to migrate *to* — the geography has no lifecycle axis at all.

GL-009 tried to fix this with rules (source classes, promotion, reconciliation fates). The rules are right and everyone ignores them under load, because the geography fights them: "promoted" and "archived" are fates with no physical address. A rule that geography contradicts loses every time.

## The fix: organize by trust-state, not birthplace

Thinking / Building / Finished is not a folder simplification. It is changing the vault's organizing principle from **provenance-of-creation** to **provenance-of-trust**. Three states, three addresses:

```text
Thinking  = captured, untransformed, yours     (trust: absolute — it IS you)
Building  = in-flight, AI/team, has a status   (trust: working material, never source)
Finished  = promoted on purpose, stamped        (trust: citable — the shelf)
```

Every file in the vault is in exactly one state, and its address SAYS its state. An agent can no longer be confused about whether it's reading your mind, the team's work, or the shelf — the path is the provenance.

## The vault is an engine (and one part already works)

You already run one perfectly-designed lifecycle machine: **the weekly pitch sheet**. One live file per week, every item carries a status, everyone edits the same file, reacts append to a ledger, finished work exits to the dashboard, killed work goes to the footer. Nobody has ever built five competing pitch sheets — because the pattern makes a second copy unthinkable.

The five calendars, BUSINESS.md, and the Deliverables pile all happened in territories where that pattern was ABSENT. So the unified design is: **generalize the pitch-sheet pattern to the whole vault.**

1. **Thinking is intake.** You (and Penn transcribing you) write here; nothing else does; nothing here is ever edited by an agent. Append-only from the system's point of view. Your ideas stay yours, byte for byte.
2. **Building is the machine — organized by WORKFLOW, never by agent, never by sprint.** Content OS, Signals, Analysis, Automations, Team OS. Each workflow has ONE map (its job card) and ONE live working surface (its "pitch sheet"). New sprints work inside the workflow's station — they do not get their own birthplace folder. This single rule prevents every "five calendars" recurrence: there is exactly one place the current truth-in-flight can be, so re-deriving it means colliding with it, and collision is visible.
3. **Building drains.** At session close, every artifact takes a GL-009 fate — and every fate now has a physical address: promoted → Finished (stamped), still working → stays at its station, dead/superseded → Building/Archive. Deliverables stops existing as a destination; it was only ever the symptom of "output with nowhere to go."
4. **Finished is the shelf.** Entry through one door: your verbatim material, or an explicit promotion you approved (stamp: promoted_by, date). Agents read it, cite it, and cannot write it. This IS your second brain — nothing new gets built; the copies get stripped away until only what you made (plus deliberate promotions) remains.
5. **Agents are staff, not residents.** No agent owns a house that accumulates belongings — that's how Hermes ended up owning your prices and Wren's ghost kept haunting the routing table. Hermes becomes the *voice-and-judgment station* in the workshop: SOUL/STYLE/TASTE/ANTI-AI (judgment YOU approved — those are promotable artifacts), craft, and maps that point. Zero facts. Team/<name> folders shrink to contracts + ops journals. When an agent retires, its station is dismantled the same day (a lifecycle event, not a hope).

## What this makes of the rules

- **GL-009** stops being a memory test and becomes a description of the geography. Class = address.
- **GL-013 (one home per fact)** stops being a patch and becomes a corollary: a fact's home is wherever its trust-state lives — offer facts on the shelf with the offer, working state on the workflow's live surface, your words in Thinking or on the shelf. The canonical registry still exists, but it's one screen in VAULT-MAP.md, not a law fighting the terrain.
- **Maps** become the rails: one VAULT-MAP, one map per shelf, one job card per workflow. Indexes with truth claims are abolished — a map may point, never promise.

## What it feels like for you

Open the vault: three things. Your mind, the workshop, the shelf. You never wonder what state something is in — you can see it. You drop thoughts in the top, react to what the workshop surfaces, and shop your own shelf. The AI gets smarter inside Building (ledgers, judgment files, learning loops — all workshop material you can promote when it earns it) without ever touching your real work, because your real work lives in territories it physically cannot write to.

The migration mechanics, risk rankings, and pilot order from the stress-test report all still hold — this document changes WHY, not HOW. One sequencing change falls out of it: GL-013 approval and the birthplace-rule ("new work happens at the workflow's station, never in a new sprint folder") go live BEFORE any folder moves, because they stop the disease from re-infecting the new geography on day one.

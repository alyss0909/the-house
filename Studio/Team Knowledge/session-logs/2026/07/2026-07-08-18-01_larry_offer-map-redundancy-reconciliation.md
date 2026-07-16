---
agent_id: larry
session_id: 2026-07-08-larry-offer-map-redundancy-reconciliation
timestamp: 2026-07-08T18:01:36Z
type: end-of-session
linked_sops: [SOP-006-close-task, SOP-011-write-session-log]
linked_workstreams: [WS-011-weekly-carousel-pitch]
linked_guidelines: [GL-007-token-discipline, GL-009-source-boundaries-and-promotion, GL-010-content-pitch-operating-brain, GL-012-content-os-strategy-lead-charter]
linked_tasks: [tsk-2026-07-08-001-reconcile-content-selling-logic-into-existing-maps]
linked_journal_entries: []
mined: true
---

# Offer map redundancy reconciled

## Context
Alyssa opened the Suki handoff for mapping the offer suite and content calendar. The original handoff said to create a new `Hermes/OFFER-ATLAS.md`, but during guided discovery Alyssa questioned whether that would duplicate the existing funnel doc.

That was the correct challenge. The redundancy sweep showed the structure already exists: [[Hermes/BUSINESS]] owns product facts and funnel chains, [[Hermes/FUNNEL]] owns offer essence, and [[Hermes/MAP]] owns the calendar and source atlas.

## What I shipped
- Updated [[Hermes/MAP]] section 3 with the missing rules:
  - Monday is always high-value freebie-led.
  - Freebies point to tripwires, tripwires can carry bumps or upsells, and the whole path ladders toward Back of House.
  - Week 4 Productivity anchors to the last Tuesday monthly planning session.
  - Week 1 Email is usually the first full week after that.
  - Five-week months are flex weeks.
  - Friday For The Girls stays soft, with a freebie mention only when natural.
  - Standalone Slowly Viral CTAs wait until the Products DB says it is live.
- Corrected [[Studio/Team/Suki - Social Media Strategist/handoffs/HANDOFF-2-offer-suite-and-calendar]] so it now says not to create `Hermes/OFFER-ATLAS.md`.
- Re-scoped and closed [[tsk-2026-07-08-001-reconcile-content-selling-logic-into-existing-maps]].
- Updated the task index and the prior Suki activation session log so no open loop still points at the duplicate atlas plan.

## Tasks touched
- Closed: [[tsk-2026-07-08-001-reconcile-content-selling-logic-into-existing-maps]]

## Root cause / decisions worth recording
The initial plan violated map-not-digest. It was not wrong to want a content selling layer, but the layer belonged inside the existing atlas, not in a new sibling file.

Decision: do not create `Hermes/OFFER-ATLAS.md`. Use [[Hermes/MAP]] section 3 for calendar and posting-slot logic, [[Hermes/BUSINESS]] for volatile facts, and [[Hermes/FUNNEL]] for offer meaning.

Alyssa also corrected the team behavior: product status and stale-product filtering should come from the Notion Products DB and offer shelf, not from asking her to manually sort the suite.

## Daily knowledge metabolism
**Today's larger objective:** Keep the Content OS source wiring clean while Suki maps what content sells when.

**What connected:** Suki's handoff, the open offer-map task, [[Hermes/MAP]], [[Hermes/BUSINESS]], [[Hermes/FUNNEL]], the offer shelf, and the previous Suki activation log.

**What changed in source maps / tasks / Hermes / Ready Queue:** [[Hermes/MAP]] section 3 now carries the missing calendar and funnel rules. The offer-map task is closed. The handoff now warns against creating `OFFER-ATLAS.md`.

**What was superseded, demoted, archived, or deleted:** The proposed `Hermes/OFFER-ATLAS.md` artifact was superseded before creation. The old handoff instruction to create it is marked as corrected. No file was deleted.

**What still needs Alyssa, Pax, Mack, or source access:** Notion Products DB should still be re-verified before live CTAs, prices, statuses, chat words, or standalone Slowly Viral claims are used in production.

**Tomorrow starts with:** Continue Content OS work from the existing maps. If a maker needs offer logic, start with [[Hermes/MAP]] section 3, then check [[Hermes/BUSINESS]] and [[Hermes/FUNNEL]].

## What I did NOT touch
- I did not edit [[Hermes/BUSINESS]] or [[Hermes/FUNNEL]].
- I did not create `Hermes/OFFER-ATLAS.md`.
- I did not query or refresh the live Notion Products DB.
- I did not change the wider WS-011 dashboard task.

## What's queued for next
- W29 live week still needs Alyssa's hook picks and Friday redo under the For The Girls rule.
- Hiring plan review remains separate from this offer-map reconciliation.
- Weekly review is pending for W28.

## Voice notes for the next agent on this thread
If a handoff asks for a new Hermes map, check [[Hermes/MAP]], [[Hermes/BUSINESS]], and [[Hermes/FUNNEL]] first. Alyssa is actively watching for redundant source-adjacent files. Map, do not digest.

## Cross-links
- [[2026-07-08_larry_suki-activation-playbook-and-hiring-plan]]
- [[2026-07-08-12-59_larry_suki-social-grid-and-strategy-alignment]]

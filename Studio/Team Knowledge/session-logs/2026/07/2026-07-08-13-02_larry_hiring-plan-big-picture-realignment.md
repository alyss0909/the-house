---
agent_id: larry
session_id: hiring-plan-big-picture-realignment
timestamp: 2026-07-08T13:02:00-04:00
type: realignment
linked_sops: ["SOP-001-how-to-add-a-new-specialist"]
linked_workstreams: []
linked_guidelines: []
---

# Hiring Plan Big-Picture Realignment

## Context

Alyssa opened the content-team hiring plan review from [[Team/Suki - Social Media Strategist/handoffs/HANDOFF-1-hiring-plan-review]]. Larry initially narrowed too fast into role-by-role approval.

## What we did

- Larry loaded [[Team/Suki - Social Media Strategist/HIRING-PLAN]] and [[Team/Suki - Social Media Strategist/PLAYBOOK]].
- Suki was brought in for the hiring-plan review, but the first response asked for approval on the hook role too soon.

## Decisions made

- _(none yet - Alyssa has not approved any hires or execution steps.)_

## Insights

- Before asking Alyssa to approve individual hires, the team needs to show the full plain-English pitch: who does what, when they enter, what success looks like, and exactly what approval would unlock.
- The hiring plan must show the full assembly line at the level of inputs, actions, gate criteria, and outputs. Alyssa specifically needs to see how Trend Specialist, Concept Specialist, Substance Specialist, Hook Specialist, and Writing Specialist interact before approving hires.
- Trend Scout cannot be a vague "researcher" function. The plan must say exactly what gets scraped, how often, for what purpose, what report is delivered, and how Suki turns that into instructions for the next maker.
- Mean Alyssa is not a final-stage judge. She attacks every rung using specific ammo: trend/performance evidence, Alyssa's taste ledger, her real source material, carousel best practices, buyer psychology, and anti-AI/anti-generic rules.
- The current Cassius/Substance definition is still too weak if it produces "the argument" without metabolizing Alyssa's teaching, buyer psychology, carousel best practices, direct response, and the strongest trend examples. Substance must make the post worth something, not merely outline slides.
- Alyssa clarified the deeper distinction between Substance and Writer: Substance should find and metabolize Alyssa's real teachings, modules, examples, templates, facts, philosophy, buyer desires, and offer tease for the topic. Writer should then make that already-substantive teaching work as social-ready carousel copy in Alyssa's voice. Substance is not "does this feel like something Alyssa would teach"; it is "this is what Alyssa actually teaches, and here is how it can make a post worth paying for."
- The Content OS should use a "$5 test" and offer-desire test for substance: would someone pay $5 for this post as a useful solution? Would this make someone want Back of House or the relevant offer because it teases genuinely valuable parts of it? If not, the substance fails.
- Current trend wiring reality check: the vault contains a monthly scrape routine in [[Studio/Content/trusted-sources]] and a weekly LOOK step in [[WS-011-weekly-carousel-pitch]], but Larry did not find an actual trend cron job equivalent to `Team Knowledge/Automations/meetily-weekly-launcher.ps1`. Trend automation still needs Mack wiring if the team wants it to run without manual initiation.
- Correction: Alyssa can see the trend automation as a Claude Routine in the app. It is not visible in Codex's local automation folder, so it should be treated as an external/host routine that Mack documents and connects rather than rebuilding from scratch.
- Blotato and social-skill repo materials currently live as a reference pack in `Deliverables/2026-07-05-social-skills-repo-intake/` plus the distilled audit [[Deliverables/2026-07-05-social-skills-repo-intake/extracted/2026-07-06-repo-alignment-audit]]. They are not yet promoted into internal myPKA skills. Alyssa correctly identified that internal skills are SOPs; the useful Blotato/social mechanics should graduate into SOPs and WS-011 should reference them.
- Hiring readiness now depends on resource readiness: each planned content maker should have a clear SOP or source bundle before Nolan hires or re-tests them. The hire plan should shift from "hire hook then idea" to "install the operating skills, then hire/retest onto those skills."

## Realignments

- Alyssa corrected the process: "show me the hiring plan i wanna see the big thing before approving anything im not confident yet show me in plain english who is doing what and when what is a success etc i asked for big picture babe i wanna see your pitch and i'll approve it them right?"
- Operating correction: start with the whole plan and the pitch, then ask for approval.
- Alyssa further clarified the required flow: "content os should have specialists" across Trend Specialist, Concept Specialist, Substance Specialist, Hook Specialist, and Writing Specialist. She wants the ladder to show maker produces options -> Mean Alyssa tries to destroy them -> survivors -> Alyssa picks one -> only then does the next rung get built.
- Alyssa's critique of Cassius to preserve: "the example you gave from cassius is shit. its not persuasive its not based on anything i teach it does nothing its not persuasive its not following a buyer psychology its not following carousel best preactices its not following direct response copywriting its not interesting its not useful for someone its not like my carousels? its not like the top performing carousel from trend scout? so?"
- Alyssa identified the likely root issue: "where cassius already goes wrong is that he didnt metabolise alyssas thoughts on this and that's obvious hes just trying to get the job done."
- Alyssa corrected the Substance role: "substances job is would someone pay $5 for this post if we sold it as a solution? no? no go then... would this make someone want to join back of house bc we teased really cool partrs of it (or other offers) no? you fail"
- Alyssa also corrected the source expectation: Substance should be able to say, for a concept, what Alyssa teaches on the topic, what her philosophy is and is not, what people want, what module/file supports the point, and which templates/takes/facts can be used. The Writer should not have to find the real teaching.
- Alyssa reframed the internal-skills question: "our internal skills are called SOPs... many of these blotato things i just spoke about should probs be SOPs right guys? and or workstream things." Operating decision pending but directionally accepted by Larry/Mack/Nolan: single-agent repeatable jobs become SOPs; the weekly multi-agent pipeline becomes/revises a Workstream.

## Open threads

- [ ] Larry/Suki need to present the full content-team hiring plan in plain English before asking for approval.
- [ ] Rewrite or supersede the hiring plan with an assembly-line version that names each rung's inputs, maker output, Mean Alyssa kill criteria, survivor count, and Alyssa approval point.
- [ ] Research what a strong social concept pitch includes, then use that research to rewrite the Concept Specialist's deliverable.
- [ ] Rewrite Cassius/Substance from "arc/argument" toward a real teaching/substance dossier role before deciding whether to re-test or rebuild him.
- [ ] Ask Mack to wire an actual weekly trend brief cron only after Alyssa approves the corrected Content OS.
- [ ] Mack should document the existing Claude monthly Trend Scout routine and propose a weekly Trend Scout brief routine that reads the monthly swipe plus macro/current signals.
- [ ] Larry/Suki should draft SOP candidates for Trend Scout brief, Concept Pitch Brief, Hook Bench, Substance Dossier, and Mean Alyssa Gate, then update WS-011 to call them in order.
- [ ] Nolan should treat SOP/resource readiness as a pre-hire gate: no new maker is hired until their load files, SOP, pass/fail criteria, and handoff shape exist.
- [ ] Alyssa still needs to decide whether to approve the two hires, staged order, substance-person re-test, and non-hire fixes.

## Next steps

- Present the big-picture hiring plan clearly.
- Capture Alyssa's approval, objections, or changes before research or hiring starts.

## Cross-links

- [[Team/Suki - Social Media Strategist/HIRING-PLAN]]
- [[Team/Suki - Social Media Strategist/PLAYBOOK]]

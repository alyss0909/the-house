---
agent_id: larry
session_id: 2026-07-17-larry-carousel-dispatch-and-compiled-cards
timestamp: 2026-07-17T21:15:00Z
type: close-session
linked_sops: ["SOP-011-write-session-log", "SOP-040-the-compounding-loop"]
linked_workstreams: []
linked_guidelines: ["GL-013-the-house-rules"]
linked_tasks: []
linked_journal_entries: []
mined: true
---

# Carousel dispatch and compiled framework cards shipped

## Context

Alyssa pushed past the previous solution because it was still too easy for agents to load labels instead of doing the real copywriting work. The concrete failure was a writer saying "How To (Metaphor Plan)" and then skipping the actual framework outline, carousel outline, source proof, and Alyssa move patterns.

She clarified the actual goal: preserve the winning flow report and the real carousel intelligence, but make production token-aware. Agents should go deeper into one or two chosen lanes, not wider across the whole house. She also wanted two full drafts on her desk, not one agent trying to guess the perfect route.

## What I shipped

- Created [[Studio/Content/carousel-dispatch]] as the production front door for carousel work.
- Updated [[Studio/Content/MAP]] so carousel production starts at dispatch, not broad-loading METHOD, hook-forensics, slide-by-slide, and the winning flow report.
- Rebuilt the three normal production framework cards as compiled writing packets:
  - [[Studio/Analysis/Frameworks/carousels/how-to]]
  - [[Studio/Analysis/Frameworks/carousels/old-way-new-way]]
  - [[Studio/Analysis/Frameworks/carousels/hot-take]]
- Each card now contains framework outline, carousel outline, pressure/proof guidance, hook options, content-role cautions, fail modes, and an Alyssa Move Library that metabolizes the real slide-by-slide examples into "how Alyssa does this move."
- Updated [[Studio/Content/writer-kit]] so each writer produces one draft from narrow context: writer-kit, one offer brief, and one framework card.
- Updated [[Studio/Analysis/carousel-winning-flow-report]] to position it as source manual, not default writing load.
- Updated [[Studio/Analysis/carousel-framework-source-loading-plan]], [[Studio/Analysis/INDEX]], and [[Studio/Analysis/Frameworks/INDEX]] so future agents land on the dispatch/card system.
- Updated [[Studio/Team/TEAM-BRAIN]], [[Studio/Team/Larry - Orchestrator/PLAYBOOK]], and [[Studio/Team Knowledge/PRECEDENT-INDEX]] with the durable production rule.
- Spawned two read-only subagents to stress-test the architecture and extract must-preserve copywriting moves. Their findings were integrated into the cards and routing surfaces.

## Decisions made

- **Question:** Should a normal offer/education carousel use five frameworks?
  **Decision:** No. Production uses only How To, Old Way / New Way, and Hot Take. For The Girls is separate. House Report stays as source/manual pattern and market-pressure mode. Durable home: [[Studio/Content/carousel-dispatch]].
- **Question:** Should agents load the whole winning flow report and slide-by-slide breakdown to draft?
  **Decision:** No. The winning flow report is preserved as source manual. The cards now carry the compressed flow/report/slide-by-slide logic a writer needs at draft time. Durable home: [[Studio/Analysis/Frameworks/carousels/how-to]].
- **Question:** Should subagents write only outlines or full drafts?
  **Decision:** Full drafts, but from narrow context. Each writer gets the same concept lock, the offer brief, writer-kit, and one assigned framework card. Durable home: [[Studio/Content/carousel-dispatch]].
- **Question:** What stops two versions from being two covers on the same deck?
  **Decision:** Version B must differ by framework, buying belief, pressure, or content role, and both must include source receipts. Durable home: [[Studio/Content/carousel-dispatch]].

## Insights

- The missing layer was not "more examples" or "less context"; it was compiled examples at the exact move level. A card cannot only say "show what staying costs." It has to say how Alyssa does it, which source proves it, what to write toward, and what not to write. Durable home: [[Studio/Analysis/Frameworks/carousels/old-way-new-way]].
- The content system should not trust an agent to declare itself stuck and open the full report. The production path must force the correct decision before drafting: concept lock, framework outline, carousel outline, source receipt, then copy. Durable home: [[Studio/Content/carousel-dispatch]].
- Token-aware does not mean small and thin. It means narrow and high-context. The cards can be richer if they prevent broad-loading five larger docs. Durable home: [[Studio/Analysis/carousel-framework-source-loading-plan]].

## Realignments

- Alyssa rejected "beat map" as the term. The live language is now framework outline and carousel outline. Durable home: [[Studio/Content/carousel-dispatch]].
- Alyssa clarified she wants two full things on her desk so she can choose, not one chosen direction or two vague outlines. Durable home: [[Studio/Content/carousel-dispatch]].
- Alyssa reaffirmed that the real slide-by-slide breakdown matters because it teaches how she performs each move; generic instructions produce AI slop. Durable home: [[Studio/Analysis/Frameworks/carousels/old-way-new-way]].

## Daily knowledge metabolism

**Today's larger objective:** Stop carousel agents from degenerating by giving them a token-aware, high-context production path that preserves Alyssa's real copywriting logic.

**What connected:** [[Studio/Analysis/carousel-winning-flow-report]], [[Studio/Analysis/carousel-slide-by-slide]], [[Studio/Content/writer-kit]], [[Studio/Content/carousel-dispatch]], the three compiled framework cards, [[Studio/Content/briefs/INDEX]], and [[Studio/Content/MAP]].

**What changed in source maps / tasks / Hermes / Ready Queue:** Content MAP and Analysis indexes now point agents to dispatch and compiled cards. TEAM-BRAIN, Larry PLAYBOOK, and PRECEDENT-INDEX now carry the rule that production starts with concept lock and two full narrow-context drafts.

**What was superseded, demoted, archived, or deleted:** No files archived or deleted. The old broad-load behavior is superseded by [[Studio/Content/carousel-dispatch]]. The winning flow report was not lost; it is now source manual.

**What still needs Alyssa, Pax, Mack, or source access:** Optional future improvement: create small verbatim source packets for real carousel slide copy if agents still lean too much on analysis. This needs a source-boundary decision because Library is earned.

**Tomorrow starts with:** Run one live carousel production through [[Studio/Content/carousel-dispatch]] using two writer subagents. Use The 5 Minute Newsletter only if Alyssa wants to test the system immediately.

**Journal duty receipt:** Read state carried from NOW. No new journal backlink added; the mandatory candidates did not genuinely feed this carousel production architecture session.

## What I did NOT touch

- I did not edit [[Studio/Analysis/carousel-slide-by-slide]].
- I did not create verbatim source packets inside Library.
- I did not run a new carousel draft through the system yet.
- I did not change the offer briefs themselves.

## Open threads

- [ ] Test [[Studio/Content/carousel-dispatch]] on one real carousel request with two full writer outputs.
- [ ] If the test still sounds like analysis instead of Alyssa, build source packets from real slide copy as Studio-derived packets or ask Alyssa whether verbatim transcriptions belong in Library.
- [ ] Review old broad-load instructions in [[Studio/Hermes/craft/captions-carousels]], [[Studio/Analysis/COMPASS]], and [[Library/Examples/Carousels/INDEX]] for drift risk.
- [ ] Existing prior NOW threads remain untouched: two Inbox content-strategy files, stale Mailroom "Bundles That Benefit" card, KeepSidian reauth, PRECEDENT-INDEX briefing habit, Related Product batch approval, older-tab review, and Soft Sunday trim decision.

## Next steps

- Start the next carousel work by loading [[Studio/Content/carousel-dispatch]], not the winning flow report.
- Do not reopen the architecture debate unless the first live test fails.
- If testing with 5MN, lock the concept first so "gourmet email is out / one-pan simmer is in" does not get mashed with "six content burners when one will do."

## Cross-links

- [[2026-07-17-18-00_larry_carousel-framework-report-rebuild]]
- [[2026-07-17-13-00_larry_bingeable-5m-digest-and-carousel-riff-miss]]
- [[2026-07-16-21-30_larry_content-desk-rebuild]]

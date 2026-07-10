---
type: close-session
agent: Larry
topic: audience-survey-and-second-brain-placement
created: 2026-06-02 15:42
tags: [session-log, close-session, audience-survey, second-brain, back-of-house]
---

# Close Session - Audience Survey And Second Brain Placement

## What We Did

- Processed Alyssa's 2025 audience survey CSV from `Team Inbox/2025 Audience Survey_ (Responses) - Responses (1).csv`.
- Created an analysis package in `Deliverables/2026-06-02-2025-audience-survey-analysis/`.
- Built a readable insight brief: [[Deliverables/2026-06-02-2025-audience-survey-analysis/2025-audience-survey-insight-brief]].
- Built an analysis workbook: `2025-audience-survey-analysis.xlsx`.
- Built an anonymized processed-response file for audit use: `anonymized-processed-responses.csv`.
- Interpreted the strongest audience pattern: the BOH audience wants calmer client generation, especially through email, Pinterest, slow marketing, and implementation support.
- Realigned after Larry misunderstood Alyssa's request: Alyssa clarified that the survey insight should be filed inside the Second Brain, specifically as Back of House client/audience intelligence, not turned into a new product-strategy direction.
- Created the Second Brain audience-analysis home:
  - [[PKM/Second Brain/analysis/audience/INDEX]]
  - [[PKM/Second Brain/analysis/audience/back-of-house-2025-survey-client-profile]]
- Linked the BOH client profile from [[PKM/Second Brain/programs/back-of-house/INDEX]].

## Decisions

- The 2025 survey is canonical audience/client intelligence for [[PKM/Second Brain/programs/back-of-house/INDEX|Back of House]].
- The right home is `PKM/Second Brain/analysis/audience/`, not the course-content `programs/` folder.
- The analysis folder can contain both voice/style analysis and audience/client analysis.

## Key Insight

The BOH audience is capable but tired. They are not primarily asking for generic productivity, generic second-brain organization, or more content pressure. They want a reliable client-generation system that lets them rely less on daily social media output.

Working phrase:

> Cozy is the atmosphere. Client flow is the promise.

## Open Threads

- Add an index link from `PKM/Second Brain/analysis/INDEX.md` if the encoding issue is resolved in a future maintenance pass.
- Decide whether future audience/client research should also be filed under `PKM/Second Brain/analysis/audience/` by offer or by segment.
- The shell sandbox blocked cleanup of a helper `node_modules` junction inside the survey deliverable folder; it is non-content scaffolding and can be ignored or removed later.

## Librarian Notes

- New files were added with wikilinks back to the Second Brain analysis index and BOH program index.
- The BOH program index now points directly to the survey-backed client profile.
- No raw survey PII was copied into the Second Brain client-profile note.
- A full shell-based link scan could not run because the shell sandbox failed late in the session.

## Next Steps

- When writing BOH emails, sales copy, or Pinterest/blog content, read [[PKM/Second Brain/analysis/audience/back-of-house-2025-survey-client-profile]] before drafting.
- Later, run a small librarian pass to verify the new `analysis/audience/` folder appears correctly in any generated link maps or index maintenance workflows.

# Guidelines - Index

**Guidelines are general rules every agent reads on every relevant action.** Where SOPs are skills (procedures the agent runs) and Workstreams are compositions (multi-agent choreography), Guidelines are the static rules and constraints that hold the whole system together. Naming, frontmatter, design system. SOPs and Workstreams `[[wikilink]]` to Guidelines rather than duplicating the rules.

Filename pattern: `GL-NNN-<title>.md`.

## Active Guidelines

| GL | Title | Description |
|---|---|---|
| GL-001 | [[GL-001-file-naming-conventions]] | Kebab-case rules, ISO date prefix on date-driven files, slug rules, image filename pattern. |
| GL-002 | [[GL-002-frontmatter-conventions]] | YAML frontmatter field schemas for all 8 entity types, typing rules, foreign-key convention. Aligns with [[SOP-002-convert-mypka-to-sqlite]]. |
| GL-004 | [[GL-004-tag-taxonomy]] | Tag vocabulary governance — approved tags, anchoring rules, no-abbreviation policy, Librarian audit duty. |
| GL-005 | [[GL-005-team-inbox-protocol]] | Notebook/Inbox structure (frozen subfolder list), processing rules, routing assignments, lifecycle. |
| GL-006 | [[GL-006-deliverables-scope]] | Deliverables/ is the one and only artifact location — what goes there, naming, archive lifecycle. |
| GL-007 | [[GL-007-token-discipline]] | Token discipline — file size limits, session hygiene, Second Brain navigation rules, Larry startup cost, MCP overhead. Every agent follows these rules. |
| GL-008 | [[GL-008-ponytail-lazy-senior-dev-philosophy]] | Lazy senior dev philosophy — the decision ladder for minimal code. Skip what doesn't need to exist, reuse before rebuilding, stdlib before custom. ~54% less code, 100% safe. Every agent applies this to code review, planning, and implementation. |
| GL-009 | [[GL-009-source-boundaries-and-promotion]] | Source-boundary and promotion rules: source vs map vs derived vs output vs task, Mean Alyssa trust checks, artifact fates, and the Versions Rule. |
| GL-010 | [[GL-010-content-pitch-operating-brain]] | WS-011 execution judgment — the pitch failure taxonomy, non-negotiable operating rules (LOOK before writing, taste via the ledger, two-job split), and ready-to-use worker prompts. Load in full before any carousel/pitch/hook work. |
| GL-011 | [[GL-011-substance-arc-contract]] | The Rung-3 carousel arc format law — per-slide `X → so that Y` lines, arc carries real persuasion, real numbers only, attribution header, dashboard-parseable contract. Cassius owns it; loaded before building or reviewing any arc (WS-011 Step 3). |
| GL-012 | [[GL-012-content-os-strategy-lead-charter]] | Content OS strategy lead charter — Suki's operating doctrine. The DIRECTS-not-DOES anti-bottleneck law, the sends-over-saves signal, three-layer source wiring, no-hook-library-as-strategy, she-specs-Nolan-hires split, and the boundary routing table. Load before any Content OS strategy call, maker-source-wiring change, or content-hire spec. |
| GL-013 | [[GL-013-the-house-rules]] | **The constitution.** The house rule (Map first / Notebook is mine / Studio is opinion / Library is earned / Link everything), the five rules (Notebook read-only with the requested-connective-edit exception, Studio-is-opinion, one-home-per-fact, cite-only-what-exists, link-everything), and the durable-vs-method test. Sits above GL-009. Every agent loads [[HOUSE-MAP]] and this before acting. |

| GL-003 | [[GL-003-design-system]] | Brand SSOT for all creative agents — color palette, typography, spacing scale, imagery style, voice samples. Iris is the sole editor; Charta and Pixel read from it on every task. Ships empty; populated via [[SOP-014-author-a-design-system]]. Installed with Designer Expansion Pack v1.1.1. |

## When to write a new Guideline

- The rule is static and applies across many files or procedures.
- More than one SOP or Workstream needs to know about it.
- Without it, you would copy-paste the same rule into multiple files.

If you find yourself restating the same rule in two files, stop and write a Guideline. Then `[[wikilink]]` to it from both files.

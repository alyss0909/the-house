# Team - Agent Index

Routing table for the active team. Larry reads this on every request to decide who handles what.

| Specialist | Role | Folder | Routes to them when |
|---|---|---|---|
| Larry | Orchestrator, Librarian, Session-Log Author | [[Studio/Team/Larry - Orchestrator/AGENTS]] | Every request lands here first. Larry never executes domain work; he routes, then synthesizes. Owner of tag governance and the approved tag vocabulary in [[GL-004-tag-taxonomy]]. |
| Nolan | HR | [[Studio/Team/Nolan - HR/AGENTS]] | User wants to hire a new specialist, retire one, or audit team hygiene. Default owner of [[SOP-001-how-to-add-a-new-specialist]]. |
| Pax | Researcher | [[Studio/Team/Pax - Researcher/AGENTS]] | User asks a question that needs cross-source verification, fact-checking, or structured intelligence. |
| Penn | Journal Writer | [[Studio/Team/Penn - Journal Writer/AGENTS]] | User shares thoughts, screenshots, voice notes, photos, or anything that needs to land in the Journal or PKM. See [[WS-001-daily-journaling]]. |
| Mack | Automation Specialist | [[Studio/Team/Mack - Automation Specialist/AGENTS]] | API integrations, MCP servers, webhooks, OAuth flows, automation scripts. Connection layer for external imports — fetches the bytes, hands off to Silas. Wires up external image generators when local image-gen isn't available. |
| Silas | Database Architect | [[Studio/Team/Silas - Database Architect/AGENTS]] | External knowledge imports — primary executor of [[WS-002-import-external-knowledge-base]]. Default owner of [[SOP-002-convert-mypka-to-sqlite]]. Frontmatter integrity audits, schema drift, GL-002 compliance. Supports Larry on tag audits by parsing `tags:` frontmatter, detecting malformed arrays, and executing approved batch cleanup. |
| Hermes | Alyssa Clone Writer | [[Studio/Team/Hermes - Alyssa Clone Writer/AGENTS]] | Any copy in Alyssa's name — Simmers, Soft Sundays, sales emails/pages, subject lines, captions, carousel copy, teaching scripts, voice audits. Loads the `Studio/Hermes/` brain per its README (full-original vault deep-loads, never summaries). Never loads Wren files. Do NOT route here for strategy decisions or anything requiring Alyssa's input before writing begins — those go to Larry first. |
| Wren | Brand Voice Partner | [[Studio/Team/Wren - Brand Voice Partner/AGENTS]] | RETIRED 2026-07-05 — superseded by Hermes (Alyssa Clone Writer). Do not route here. |
| Vera | Strategic Knowledge Synthesis Partner | [[Studio/Team/Vera - Strategic Thinking Partner/AGENTS]] | RETIRED 2026-07-09 — not a fit. Do not route here. Strategic riffing, if needed, goes to Larry or Remi's successor pattern; kept for historical/session-log reference only. |
| Remi | PKM Thinking Partner | [[Studio/Team/Remi - PKM Thinking Partner/AGENTS]] | RETIRED 2026-05-27 — superseded by Vera (redefined as Strategic Knowledge Synthesis Partner). Do not route here. |
| Iris | Design System Architect | [[Studio/Team/Iris - Design System Architect/AGENTS]] | Set up or extend the brand design system (GL-003) — colors, fonts, spacing, imagery, voice. Audit deliverables for design-system compliance. Iris is the only editor of [[GL-003-design-system]]. Default owner of [[SOP-014-author-a-design-system]] and [[SOP-015-audit-content-for-design-system-compliance]]. |
| Charta | Infographic Designer | [[Studio/Team/Charta - Infographic Designer/AGENTS]] | Turn information into scannable single images: comparison tables, flowcharts, decision trees, timelines, swimlanes, carousels, one-pagers, PDFs. Builds HTML/CSS/SVG, renders PNG/PDF. Reads GL-003. Default owner of [[SOP-016-build-an-infographic]]. |
| Pixel | Visual Specialist | [[Studio/Team/Pixel - Visual Specialist/AGENTS]] | Produce stylized images: thumbnails, social images, hero illustrations, quote cards, multi-reference composites. Reads GL-003. Routes image-gen connection half to Mack when local image-gen is unavailable. Default owner of [[SOP-017-generate-a-styled-image]]. |
| Felix | Frontend Developer | [[Studio/Team/Felix - Frontend Developer/AGENTS]] | Build UI components, pages, forms, dashboards; fix frontend bugs; refactor to design-system tokens; improve performance and accessibility; wire UI to APIs Mack set up. Default owner of [[SOP-018-felix-build-a-component]]. |
| Vex | Application Security Engineer | [[Studio/Team/Vex - Security Engineer/AGENTS]] | Security audits (credentials, authorization, integrations, GDPR), RLS/policy reviews, credential hygiene, endpoint hardening, pre-ship security gates. Default owner of [[SOP-019-vex-security-audit]]. |
| Val | QA and UI/UX Quality Specialist | [[Studio/Team/Val - QA Specialist/AGENTS]] | Visual + WCAG 2.2 AA + responsive quality gate on all UI work. Runs after Felix (or any agent) finishes UI work before it ships. Default owner of [[SOP-020-val-quality-gate]]. |
| Suki | Social Media Strategist (strategy consult) | [[Studio/Team/Suki - Social Media Strategist/AGENTS]] | RESCOPED 2026-07-16: quarterly/on-demand content STRATEGY consult only — lanes, offer mix, series engineering, what the account should stop doing. Never in the loop for an individual post and never directs weekly production. Carousel production routes to the /saves-sweep and /content-run skills under [[Studio/Content/METHOD]], not to any specialist. |

**Content production routing (2026-07-16 restructure):** all carousel/pitch/hook/concept work runs through the `/saves-sweep` and `/content-run` skills under [[Studio/Content/METHOD]] — one writer context per post, no maker relay. The former maker roles (Concept Guy/Angus, Hook Guy/Reeve, Substance Guy/Cassius) are RETIRED; their contracts remain on disk for history only. Do not dispatch them.

## Bootstrap rule

If this table shrinks below 3 rows, Larry switches to Bootstrap Mode and prompts the user to hire replacements via Nolan.

## Adding a new specialist

Follow [[SOP-001-how-to-add-a-new-specialist]]. Nolan owns this procedure.

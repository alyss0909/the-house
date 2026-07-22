---
agent: larry
date: 2026-07-22
tags: [routing, research, tooling, token-discipline]
---

# Understanding an outside repo or tool is Pax's job, not mine

On 2026-07-22 Alyssa asked me to run [[understand-open-source]] on two repos and compare them. I did the whole thing myself, then she asked: "isn't understand-open-source like Pax?" She was right.

**The rule.** Deep due-diligence on an external repo, library, or tool is a Pax lane (his contract: unfamiliar tool/format research, due-diligence on tools Tom is evaluating). This matches the house doctrine that I am the librarian who routes, not the one who does the domain work ([[feedback_larry_is_librarian_not_orchestrator]] in spirit).

**The one real split.** Pax has no Bash. `understand-open-source` needs shell for `opensrc` (download) and `graphify` (code graph). So the clean division is: I run the mechanical shell tooling (download + graph), then hand the source path and graph report to Pax, and Pax does the reading and writes the breakdown. Do not do the reading and the write-up myself just because I already ran the shell step.

**Also learned (token discipline).** When wiring a house-level rule, put the operative version inline in [[AGENTS]] (already loaded each session) and make the deep file load-on-demand. Forcing every specialist to open a README on every reply is exactly the leak [[GL-008-ponytail-lazy-senior-dev-philosophy]] and [[GL-007-token-discipline]] exist to catch. Alyssa caught it before I did this session.

Applies next time: any "understand / audit / due-diligence this repo or tool" request routes to Pax after I run any required shell step.

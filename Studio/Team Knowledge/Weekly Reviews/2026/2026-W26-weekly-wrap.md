---
week: 2026-W26
date_range: 2026-06-22 to 2026-06-28
session_count: 1
open_threads: 4
---

# Week 26 Wrap-Up (Mon Jun 22 - Sun Jun 28, 2026) — LIGHT

*Written 2026-07-16 as part of the review-ladder repair authorized by Alyssa. This is a real wrap, not a skip stub: unlike W24 and W25, W26 has one substantial session log and one dated deliverable to draw from. It is marked LIGHT because a single session cannot carry the same weight as a normal 5-10-session week — see the 2026-07-11 memory autopsy for why W24-W26 have thin coverage at all.*

## Week at a glance

The team went quiet for most of this week (no logs June 22-25, continuing the dark gap that started June 6) and then came back hard on June 26 with a single large session: all 4 pending myICOR expansion packs were installed in one pass, growing the active team from 8 to 14 specialists. The next day, June 27, Larry (via a Cowork session) wrote a full design plan for what became the "Intelligent System" — the five-layer capture-to-learning architecture that the team has been building toward since. This week is the hinge between the dark gap and the intense build-up that shows in July's session logs.

## What shipped

- **All 4 myICOR expansion packs installed** — Designer Pack (Iris, Charta, Pixel), App Developer Pack (Felix, Vex, Val — renamed from the incoming pack's "Vera" to avoid collision with the existing Vera), Converter Pack, and Slack Pack. 17 SOPs copied and renumbered (SOP-014 through SOP-030). 6 new `.claude/agents/` shims created. Team roster went from 8 to 14 active specialists. — [[Studio/Team Knowledge/session-logs/2026/06/2026-06-26-16-00_larry_expansion-pack-full-install]]
- **The Intelligent System: Full Design Plan** written — a five-layer architecture (Capture, Pattern Recognition, Voice Intelligence, Production, Learning) proposing to close the feedback loops the system was missing at the time (Wren had zero real tasks completed, no memory.md, no calibration loop). — [[Archive/Deliverables-history/2026-06-27-intelligent-system-full-plan]]

## Key decisions

| Question | Decision | Source |
|---|---|---|
| Incoming App Pack QA agent name collided with existing Vera (Strategic Thinking Partner) — which one gets renamed? | The incoming QA agent renamed to Val; the existing Vera untouched | [[2026-06-26-16-00_larry_expansion-pack-full-install]] |
| How should the 4 packs' SOPs be numbered? | Designer = 014-017, App Developer = 018-020, Converter = 021-027, Slack = 028-030; next available SOP-031 | [[2026-06-26-16-00_larry_expansion-pack-full-install]] |
| Should the two connector packs (Converter, Slack) fully activate now? | No — SOPs indexed and routable, but runtime prerequisites (install.ps1, tokens) tasked for later, with explicit never-auto-launch rules | [[2026-06-26-16-00_larry_expansion-pack-full-install]] |

## Insights not yet graduated

- **The PowerShell Copy-Item + targeted regex-replace pattern is the right approach for expansion pack installs** — avoids rewriting 200-line files verbatim, handles encoding cleanly. A Sub-File helper function pattern is worth promoting if more installs happen. — source: [[2026-06-26-16-00_larry_expansion-pack-full-install]]
- **Name collisions during expansion installs are caught at manifest preflight, not during copy** — preflight is where collision checking belongs, going forward. — source: [[2026-06-26-16-00_larry_expansion-pack-full-install]]
- **The five-layer system (Capture -> Pattern Recognition -> Voice Intelligence -> Production -> Learning) names Layer 5 (Learning) as the one almost entirely missing** — this diagnosis, written June 27, is the direct ancestor of the compounding-loop work (GL-014, SOP-040) that shipped in W28. — source: [[Archive/Deliverables-history/2026-06-27-intelligent-system-full-plan]]

## Open threads — by area

### Automations
- [ ] tsk-2026-06-26-001 — Converter Pack runtime install (install.ps1, Whisper model pick, doctor.ps1) — trigger: when Alyssa has a voice memo to transcribe
- [ ] tsk-2026-06-26-002 — Slack token wiring — Alyssa provides tokens, Mack writes .env, tests listener; never auto-launch start.bat

### Design System
- [ ] GL-003 is still an empty template as of this session — first creative request should pause and route to Iris for the 15-minute brand session

### Vault Governance
- [ ] The Intelligent System plan (June 27) was written but not yet confirmed as approved-and-executing at the time — later July session logs show pieces of it (Layer 5 / compounding loop) did get built, but this week's own record doesn't confirm the handoff

## Next week setup

- W26 has no journal-quality record of June 22-25 — treat any references to "what happened that week" with the same caution as W24/W25.
- The Intelligent System plan from June 27 should be read before assuming the compounding-loop work that shipped in W28 came from nowhere — it is the direct design ancestor.
- Context to load: [[Archive/Deliverables-history/2026-06-27-intelligent-system-full-plan]] for anyone tracing the origin of the Layer 5 / learning-loop work.

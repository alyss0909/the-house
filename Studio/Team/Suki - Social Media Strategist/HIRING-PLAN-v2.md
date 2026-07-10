# HIRING PLAN v2 — Resource-First

*Status: PLANNING ONLY. This does not open SOP-001. Drafted by Nolan, 2026-07-08, per HANDOFF-3 and Alyssa's correction to the original HIRING-PLAN.md (kept in place, not overwritten).*

---

## 1. The Resource-First Principle

**No role gets hired or re-tested until its job, sources, SOP, gate, and handoff exist.**

Alyssa's correction: the original plan asked her to approve hires before the team had shown who does what, what each person reads, what "good" means, how Mean Alyssa kills bad work, and where the mechanics (Blotato/social-repo material) actually live. That is hiring on vibes.

The fix: build the resource stack first. A hire is just a person (or subagent) who gets dropped onto an already-working process. If the process doesn't exist yet, there is nothing to onboard them to, and no way to judge whether they did the job.

This applies equally to **new hires** and **re-tests** of existing specialists (Cassius). A re-test under an old, vague standard is not a real evaluation.

---

## 2. Pre-Hire Checklist (reusable per role)

Before Nolan runs SOP-001 for ANY role, OR before Suki authorizes a re-test of an existing specialist, all five must exist and be Alyssa-approved:

| # | Artifact | What it proves | Owner |
|---|---|---|---|
| 1 | **Job scope** | One sentence: what this role owns that nobody else does, plus explicit boundaries (what it does NOT do) | Suki |
| 2 | **Source list** | Exact files/inputs this role reads — no "figures it out," no raw Blotato/repo material as source | Suki (with Pax validation) |
| 3 | **SOP** | Numbered SOP with inputs, output path, pass criteria, fail criteria | Suki drafts, Mack wires automation where relevant |
| 4 | **Mean Alyssa gate** | What this rung's gate checks for, using SOP-037 ammo specific to this role | Suki + Alyssa |
| 5 | **Handoff/contract** | What this role hands to the next rung, in what shape, and who receives it | Suki |

If any of the five is missing, the role is **not ready** — regardless of how obvious or "already basically working" it seems.

---

## 3. Gate-3 Decision Matrix (for Alyssa)

This is a decision matrix, not a pre-empted answer. The **function-need call** (does this need to be a person at all, or automation+Suki) belongs to Suki. Nolan's recommendation below is scoped strictly to **hiring readiness** — artifact completeness, cost, and risk of hiring too early.

| Role | Resource status (Section 2) | Nolan's recommendation | Reasoning |
|---|---|---|---|
| **Hook Specialist** | SOP-035 drafted (HANDOFF-3), not yet Alyssa-approved; gate ammo partial | **Run internally first, under Suki, before hiring** | SOP-035 exists in draft but hasn't cleared Gate 2. Hiring onto an unapproved SOP repeats the exact mistake Alyssa corrected. Once SOP-035 is approved, **Hermes executes the rung under Suki's direction** (Suki directs and gates, she does not draft — per her charter) for 1-2 weeks, which also produces the taste-ledger data a real hire would be trained against. |
| **Concept Specialist** | SOP-034 drafted, not yet Alyssa-approved; two-layer (backend fields / plain-language) design not yet tested against a real week | **Run internally first, under Suki, before hiring** | Same logic as Hook — plus this role is furthest upstream, so an untested SOP here corrupts everything downstream. Lowest-risk path: **Hermes executes under Suki's direction** against one real week's offers before anyone is hired onto it (Suki gates, does not draft). |
| **Trend Scout** | Partially exists (monthly Claude Routine scrape already live); weekly brief SOP-033 drafted but not confirmed as separate from the monthly routine; not yet wired to WS-011 | **Automation + Suki, not a hire, for now** | There is already a working monthly mechanism — hiring a person here risks rebuilding what exists. The real gap is documentation and wiring (Mack's job), not headcount. Revisit hiring only if, after SOP-033 is running for a few cycles, Suki finds the interpretation layer needs a dedicated specialist. |
| **Substance (Cassius)** | Already hired; SOP-036 (new Substance Dossier standard) drafted, not yet Alyssa-approved; old standard explicitly disqualified by Alyssa | **Re-test under SOP-036 once approved — do not rebuild from scratch** | Cassius exists and Alyssa's critique was about the standard he was tested against ("did not metabolize her thoughts," "trying to get the job done"), not proof the role/person is unfixable. Rebuilding discards a specialist who may pass cleanly against a real Substance Dossier standard. **Blocking precondition: the re-test cannot run until SOP-036 is (a) reconciled with the GL-011 arc contract AND (b) Gate-2 approved** — re-testing him against an internally-inconsistent standard would just re-bake the failure. Gate on that, not a new hire cycle. |

---

## 4. When SOP-001 Begins

**Exact trigger:** Alyssa gives a Gate-3 yes on a *specific* role — i.e., she picks one row in Section 3 and says "hire now" (or, for Cassius, "re-test now").

SOP-001 does not open on:
- Gate-1 or Gate-2 approval alone (those approve process/SOPs, not people)
- Suki's spec alone (spec is an input to SOP-001, not a substitute for it)
- "the plan looks good" — Alyssa must name the role

**First step once triggered:** Nolan reads the approved job scope + source list + SOP + gate + handoff for that specific role (all five, per Section 2), briefs Pax for the research pass (SOP-001 Step 2), and proceeds through SOP-001 as written. For Cassius specifically, "hire" is replaced by "re-test" — Nolan and Suki jointly define the re-test conditions against SOP-036, not a fresh SOP-001 pass, since Cassius already has a wiki contract and shim.

---

## 5. The Four Approval Gates as a Hiring-Readiness Checklist

Use this to confirm where the process actually stands before any hiring conversation resumes.

- [ ] **Gate 1 — Process Scope approved.** Alyssa has signed off on the assembly line, which SOPs are needed, where Trend Scout lives, the Substance-vs-Writer split, and which roles are hires vs internal functions. *(No hiring before this.)*
- [ ] **Gate 2 — SOP/WS Drafts approved.** Alyssa has reviewed SOP-033 through SOP-037 and the revised WS-011. *(No hire contracts before this.)*
- [ ] **Gate 3 — Hire/Re-Test Authorization given, per role.** Alyssa has used the Section 3 matrix to decide, role by role: hire now, run internally first, automation+Suki, or re-test under SOP-036. *(Only after this does Nolan run SOP-001 — and only for the specific role(s) she named.)*
- [ ] **Gate 4 — Deploy confirmed.** After hire/retrain, one controlled week has run, internal gates killed weak work before Alyssa saw it, she reacted to a small number of survivors, and SOPs were adjusted. *(Only after this does the role go live/ongoing.)*

None of these four boxes are currently checked. This plan sits before Gate 1.

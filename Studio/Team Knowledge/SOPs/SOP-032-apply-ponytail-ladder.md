# SOP-apply-ponytail-ladder — Apply the lazy senior dev decision ladder

- **Default owner:** Larry (enforces during code review and diff inspection). Reusable by any agent — Felix, Mack, Silas, or anyone touching code, prompts, features, or bug triage.
- **Status:** Installed by the Ponytail Expansion. Auto-numbered into `SOP-NNN-apply-ponytail-ladder.md` at install.
- **Triggered by:** "use the ponytail skill", "ponytail this", "apply the ladder", "lazy senior dev [review/check/pass]", "climb the ladder on this", or any code/prompt/feature review, planning, or implementation task — the ladder is the default lens, not an opt-in.
- **References:** [[GL-008-ponytail-lazy-senior-dev-philosophy]] (the canonical doctrine — the seven-rung ladder, hard rules, and "NOT lazy about" guardrails live there in full, sourced verbatim from [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail)).

## Purpose

Give every agent a single, discoverable entry point for "use the ponytail skill" so the request resolves the same way regardless of which specialist or host answers it — instead of relying on an agent already knowing to check the Guidelines index.

## Procedure

1. **Read [[GL-008-ponytail-lazy-senior-dev-philosophy]] in full** before acting — it holds the actual ladder and rules; this SOP is a pointer, not a duplicate (SSOT).
2. **Climb the seven-rung ladder** for the change at hand: stop at the first rung that holds, understand the problem before writing, prefer deletion/reuse/stdlib over new code or dependencies.
3. **Check the "NOT lazy about" guardrails** in GL-008 before finishing — validation, error handling, security, and accessibility are never the thing being cut. Lazy code without its check is unfinished.
4. **Report which rung the change landed on** and why, so the user/reviewer can see the reasoning, not just the diff.

## Hard rules

- Never paraphrase or re-derive the ladder from memory — GL-008 is the SSOT; read it fresh each time in case it's been updated.
- This SOP does not replace SOP-018 (Felix's component build) or SOP-019 (Vex's security audit) — it's the lens those procedures apply through, not a substitute for them.

## Failure modes

| Symptom | Cause | Resolution |
|---|---|---|
| "I don't know what ponytail means" | Fresh agent instance never read this SOP or GL-008 | Check [[Studio/Team Knowledge/SOPs/INDEX]] per the Internal Skills rule in root [[AGENTS]] before assuming a capability doesn't exist. |
| Ladder applied but validation/security got cut too | Guardrail section skipped | Re-read GL-008 §"NOT lazy about" — lazy applies to complexity, never to correctness or safety. |

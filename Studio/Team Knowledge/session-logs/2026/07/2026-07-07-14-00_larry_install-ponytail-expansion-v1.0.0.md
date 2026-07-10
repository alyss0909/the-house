---
agent_id: larry
session_id: install-ponytail-expansion
timestamp: 2026-07-07T14:00:00Z
type: realignment
linked_sops: ["SOP-032-apply-ponytail-ladder"]
linked_workstreams: ["WS-003-install-an-expansion"]
linked_guidelines: ["GL-008-ponytail-lazy-senior-dev-philosophy"]
---

# Wrapped Ponytail as an Internal Skill (Expansion v1.0.0)

## Context

Alyssa asked "when I say use the ponytail skill would everyone know what to do?" — the honest answer was no: GL-008 (the lazy senior dev doctrine, integrated 2026-07-05) is a static Guideline with no trigger contract, so a fresh agent instance had no reason to connect the word "ponytail" to it. Alyssa's response: "why don't we just make it an internal skill like all others" — correct call, and the simpler fix than inventing a Guideline-specific trigger mechanism.

## What we did

- Larry wrapped the already-integrated GL-008 doctrine as `Expansions/ponytail/` (expansion_type `agent_pack`, zero code footprint — it's a knowledge pack, not a connector/runtime).
- Auto-numbered the discoverability SOP into [[Studio/Team Knowledge/SOPs/SOP-032-apply-ponytail-ladder]], default-owned by Larry, reusable by any agent. The SOP is a thin pointer to GL-008 (SSOT preserved — doctrine text lives in exactly one place).
- Updated `Team Knowledge/SOPs/INDEX.md` (SOP-032 row, next-number bumped to SOP-033) and [[Expansions/INDEX]] (new row, 6 expansions).
- Archived the manifest to `Expansions/_installed/ponytail-1.0.0/.manifest.yaml`.
- Did NOT re-copy GL-008 or duplicate its content — the Expansion's `adds_guidelines` is empty on purpose, with a comment explaining why (the guideline already existed pre-Expansion; only the missing SOP/trigger layer was added).

## Decisions made

- **Question:** Does every future "make this a discoverable capability" request need its own bespoke trigger-wiring conversation (like the GL-008 discussion), or should it always go through the same Expansions + SOP pipeline as claude-video?
  **Decision:** Always the same pipeline. Internal Skills (per the AGENTS.md section added earlier this session) is now the single on-ramp for "would every agent/host know what to do with this" — regardless of whether the underlying thing is a script (claude-video), a doctrine (ponytail), or a connector (Slack). No more one-off Guideline-trigger patches.

## Insights

- A Guideline with no SOP pointing to it is invisible to trigger-based discovery, even though its content is technically "in the vault." Static reference docs need a callable wrapper (an SOP) to become part of the Internal Skills system — this generalizes to any future GL-NNN that the team wants callable by name, not just read incidentally during review.

## Realignments

- User corrected the approach: instead of a bespoke "wire ponytail as a trigger phrase" patch, fold it into the existing Internal Skills/Expansion pipeline used for every other capability. Applies going forward — default to the Expansion+SOP pattern before proposing anything bespoke.

## Open threads

- [ ] Blotato social-skills set (brand-brief, content-coach, post-writer, post-grader, post-scheduler, viral-hooks, repurpose) — user said "coming back to that in 1 sec," still needs the Content OS/Hermes adaptation pass per the intake manifest's own rule (no raw installs).

## Next steps

- Any future "make X callable/discoverable" request defaults to Expansions/ + SOP, no separate discussion needed.

## Cross-links

- `[[2026-07-05-1400_Larry_ponytail-integration]]` — original GL-008 integration this Expansion wraps.
- `[[2026-07-07-13-00_larry_install-claude-video-v0.2.0]]` — the pattern this install follows.

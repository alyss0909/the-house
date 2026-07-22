---
agent_id: larry
session_id: 2026-07-22-10-45_larry_adhd-reply-style-layer
timestamp: 2026-07-22T10:45:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: ["GL-007-token-discipline", "GL-008-ponytail-lazy-senior-dev-philosophy"]
---

# ADHD reply-style becomes a house layer; two ADHD repos studied and shelved

## Context

Alyssa handed two GitHub repos both named for ADHD and asked which skill fit her better, then whether to install it or bring it in house. She wanted a proper deep read of each (the /understand-open-source treatment with a report per repo), the winning style made her permanent baseline so she never has to ask for it, and the wiring checked against the house's token-discipline bar.

## What we did

- Larry ran [[understand-open-source]] on both repos: `opensrc` pulled the real source, `graphify` built the code graph for each.
- Larry read the real source of both. Finding: despite the shared name they are unrelated. `ayghri/i-have-adhd` is an output-style skill (how an assistant talks to an ADHD reader). `uditakhourii/adhd` is a divergent-ideation reasoning method (parallel isolated frames, critic pass, non-obvious pick) where "ADHD" is only branding.
- Pax read the real code for both and wrote a self-contained HTML breakdown of each (the deliverable stage of the skill).
- Larry pulled the canonical 15 cognitive frames from `src/frames.ts` and added the full list to Pax's `uditakhourii/adhd` report (it had only named three).
- Larry filed both breakdowns to a new referenceable shelf, [[Studio/Reference/tools/README]], with an index. Moved them out of the legacy `Deliverables` pile per [[HOUSE-MAP]].
- Larry built the new house layer [[Studio/Reply-Style/README]] from the `i-have-adhd` rules (MIT, credited), adapted for a non-coder and scoped to every decision, not just content.
- Larry wired it into [[AGENTS]] as a MANDATORY house layer mirroring the Voice layer, and registered both new zones in [[HOUSE-MAP]] and the AGENTS geography.
- Larry re-checked the wiring against Ponytail ([[GL-008-ponytail-lazy-senior-dev-philosophy]]) after Alyssa flagged token cost, and removed a per-reply full-file load of the README. Committed and pushed to the GitHub backup.

## Decisions made

- **Question:** Install `i-have-adhd` as a plugin, or integrate it natively?
  **Decision:** Integrate natively as a house layer. A house-level output style already exists (Voice); a bolt-on plugin would collide with it and break the portability rule. Harvest the fitting rules into doctrine instead.
- **Question:** Scope the reply-style to content, or everything?
  **Decision:** Everything Alyssa reads in chat, every specialist. She makes many non-content decisions daily and the ADHD friction is general. Baseline, no toggle, she never asks for it.
- **Question:** Strip all warmth like the skill says?
  **Decision:** No. Keep warmth, cut fluff. Alyssa's ruling. Emoji and casual tone stay; preamble, recaps, and empty closers go.
- **Question:** Give time estimates like the skill says?
  **Decision:** Only when there is real work coming and she would act on it. Skip for quick answers.
- **Question:** Where do the breakdowns live?
  **Decision:** A new shelf, [[Studio/Reference/tools/README]], not `Deliverables`. It grows as the house studies more tools.

## Insights

- Deep understanding of an outside repo or tool is a Pax due-diligence job, not a Larry job. Alyssa flagged this mid-session. Larry ran the shell tooling (Pax has no Bash) but the reading and write-up are Pax's lane. Recorded in Larry's journal: [[2026-07-22-external-tool-understanding-routes-to-pax]].
- House-level rules cost the least when the operative version lives inline in [[AGENTS]] (already in context each session) and the deep file is load-on-demand for edge cases only. Forcing a per-reply file read is the token leak Ponytail exists to catch.
- The two repos are a clean example of name-collision hiding two different tools. Reading the real source, not the READMEs, is what separated them.

## Realignments

- _"i'm not just running a content business i make multiple choices and brainstorm solutions every day that have nothing to do with content."_ Scope for the reply-style layer widened from content to every decision because of this.
- _"i dont want everyone reading a bunch a shit babe and burning up my tokens."_ Drove the Ponytail re-check that removed the per-reply README load.

## Open threads

This session left nothing open. Two threads carried in from the night-shift log ([[2026-07-22-08-15_larry_night-shift-journal-and-playbook]]) are re-anchored here so they stop vanishing:

- [ ] Content lane stays parked by Alyssa's 2026-07-20 instruction. Not dead, deliberately parked. The "stop summoning" deck react is still hers to give. No action until she reopens the lane.
- [ ] Prior hand-off items still waiting on Alyssa: Ghostwriter blind-test ranking and the Mailroom decision. Not dead, waiting on her input. No agent action available until she rules.
- [ ] Parked idea (optional, not a leak): rebuild `uditakhourii/adhd`'s 15 cognitive frames as a plain-language brainstorm play Alyssa can fire at any stuck decision. Held until she asks. See [[Studio/Reference/tools/README]].

## Next steps

- Nothing required. The reply-style baseline is live for every specialist. If Alyssa wants the divergent-thinking engine built, that is the next concrete piece.

## Cross-links

- [[2026-07-17-understand-open-source-install-and-keep-capture-project]] — where the understand-open-source skill was installed the house way.
- [[2026-07-22-08-15_larry_night-shift-journal-and-playbook]] — prior session; source of the two carried threads.
- [[Studio/Reply-Style/README]] · [[Studio/Reference/tools/README]] · [[Studio/Voice/README]]

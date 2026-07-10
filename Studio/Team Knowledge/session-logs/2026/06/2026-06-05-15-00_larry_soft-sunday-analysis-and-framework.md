---
agent_id: larry
session_id: soft-sunday-analysis-and-framework
timestamp: 2026-06-05T15:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-001-file-naming-conventions, GL-002-frontmatter-conventions]
---

# Soft Sunday deep analysis — voice patterns, structure framework, and routing map

## Context

Alyssa's Second Brain now had 6 real Soft Sunday examples filed (plus 1 voice-flagged), but no analysis layer to support writing them. She came in to unlock that — wanting Wren to be able to write a Soft Sunday *exactly* like her from evidence-based docs. The ask was thorough, nuanced, and serious: not a quick pass, but a complete analysis of voice, formatting rules, structural anatomy, dos/don'ts, and how this all maps to the routing system.

Larry ran the pre-read pass (all 6 emails + existing writing-style.md + me.md) before briefing, then spawned three subagents in parallel.

---

## What we did

**Wren** wrote `PKM/Second Brain/analysis/soft-sunday.md` — 10-section voice and pattern analysis:
- Section 1: What Soft Sundays reveal about her general voice that sales copy doesn't
- Section 2: What's unique to Soft Sundays vs. her other copy formats (personal life details, self-deprecating oversharing, anchor word ritual, the pep talk framing)
- Section 3: Emoji use — surgical rules (the bracket pattern, the 🤎 as SS signature, density by section, wrong-use flags)
- Section 4: Bolding patterns — skim path function, what earns bold vs. what doesn't, failure mode evidence from voice-flagged email
- Section 5: CAPS / lowercase / punctuation — newsletter-specific rules, ellipsis patterns, exclamation point frequency, full internet vernacular table (tbh / lol / bc / rn / wtf / imo / icymi / iykyk)
- Section 6: How she frames herself — Big Sister vs. Mama Bear vs. Peer voice, when each appears and what earns it
- Section 7: Topics — categories, how she enters them (always through personal story), depth framework (concept + structure, not implementation), ratio of personal/business by email type
- Section 8: 20+ specific, evidence-backed DOs
- Section 9: 20+ DO NOT EVERs — ruthless, specific, each tied to a real email
- Section 10: CTA architecture — how sales appear without feeling commercial, reply CTA mechanic, sales email vs. SS CTA table
- Quick calibration checklist: 10 yes/no questions before sending any draft

**Pax** wrote `PKM/Second Brain/frameworks/soft-sunday-framework.md` — structural decision map:
- Full section anatomy table (10 named sections, verbatim taglines, frequency, position, mandatory/optional)
- Story-to-content bridge: 4-move structure mapped across all 6 emails, signal phrases documented
- The Check In ritual documented verbatim — exact wording, exact emoji, unchanging
- Short vs. long decision logic (what occasions each, what gets cut first, minimum structure)
- CTA architecture: where in the email structure CTAs appear, soft mention vs. dedicated section vs. P.S.
- Complete build template — a decision map for assembling any Soft Sunday from scratch
- The hard line between Soft Sunday and Simmer: "If you removed every link and every offer and you could still send it — it's a Soft Sunday."

**Silas** updated three routing/index files:
- `analysis/INDEX.md` — new row for `soft-sunday.md` added
- `analysis/copy-task-routing.md` — full 5-step routing path for Soft Sunday emails added, voice-flag warning included, Simmer vs. SS distinction noted
- `PKM/Second Brain/INDEX.md` — email row split into separate Simmer / Soft Sunday / Other rows, Soft Sunday marked complete

**Larry** (Librarian, this session):
- `PKM/Second Brain/frameworks/INDEX.md` — missing row for `soft-sunday-framework.md` added (Silas did not update this; caught in Librarian pass)
- All other files verified as properly linked

---

## Decisions made

- **Soft Sunday analysis gets its own file, separate from writing-style.md.** The newsletter voice is distinct enough from sales/web copy that mixing them into writing-style.md would dilute both. `soft-sunday.md` is the dedicated calibration layer for this format.
- **The `me-i-need-ideas` voice flag is now documented in the analysis.** The specific failure mode is named: `[Label] + [short generic description]` with no texture = AI-adjacent flatness. This is now in Section 9 (DO NOT EVERs) with the citation.
- **"this is your sign" flag.** The phrase appears in `your-list-called-theyre-hungry` (a real Soft Sunday) but is also on the established Don'ts list from voice notes. The analysis notes both. Alyssa to decide: hard rule or evolved-past preference? If hard, may want to note the exception in the archived email.
- **`frameworks/INDEX.md` was missed by Silas and caught by Larry during Librarian pass.** Added the row. Structural miss is now corrected.

---

## Insights

- **The Check In is more rigidly templated than any other section in the Soft Sunday.** The sign-off line "Wishing you a cozy, soft Sunday 🤎" and the "my week would be a success if the only thing I did was ________________." fill-in appear verbatim in every email with no variation. This level of structural consistency is a brand asset, not a coincidence — it functions like a liturgy.

- **The story-to-content bridge mechanic is the single most important thing an LLM needs to understand about Soft Sundays.** It is what separates a newsletter that sounds like Alyssa from one that sounds like content. The key finding: she *names the pivot out loud* — "I couldn't help but see the parallels" — rather than smoothly transitioning. The transparency is what makes the metaphor feel discovered rather than engineered.

- **The "I failed" email opens the personal story inside the House Report with no standalone Pep Talk section header.** This means: the Pep Talk's *function* (emotional entry, personal grounding) is mandatory; the section *header* is not. An LLM that treats section headers as the definition of the format will miss this.

- **For Alyssa: when close-session wraps are short, it's because the natural-language trigger ("wrap up") is sometimes being handled with a quick paragraph summary rather than the full /close-session protocol.** The fix is: `/close-session` as a slash command, or phrasing like "full close session" or "do the close-session protocol" to signal the full process is expected. The natural-language trigger is pattern-matched on intent, and brief acknowledgments can slip through. Worth noting in AGENTS.md or a memory if this keeps happening.

---

## Realignments

- Alyssa flagged that recent session wraps have been short — not the full close-session protocol. Larry noted this (see Insights above). The issue: "wrap up" as a casual phrase sometimes resolves to a brief summary rather than the canonical 7-step protocol. Alyssa's expectation is the full protocol.

---

## Open threads

- [ ] **"this is your sign" rule clarification** — appears in a real Soft Sunday (`your-list-called-theyre-hungry`) but is on the voice Don'ts list. Alyssa to clarify: hard rule or style note she's evolved past? If hard, note the archived email as a one-off exception.
- [ ] **Simmer analysis still needed.** `examples/simmers/` now has 3 examples — enough to begin the Simmer analysis pass (`analysis/simmer.md`) and `frameworks/simmer-framework.md`. This was listed as the remaining email gap in the Second Brain.
- [ ] **Soft Sunday template** (`templates/soft-sunday-template.md`) — the framework and analysis are complete; the fill-in-the-blanks skeleton hasn't been built yet. Natural next step after the framework.
- [ ] **Notion vaults** (hook vault, RTO vault, P.S. vault, segmentation vault, sequence prompts) — all still flagged `❌ needs Notion import` in `frameworks/INDEX.md`. Mack is the path here.
- [ ] **`Email to Carousel Repurposing.md`** in Team Inbox — still sitting there from prior session. Alyssa to handle.
- [ ] **`subjects-and-previews.md`** in `examples/` — still `❌ not started` — preview text is now captured in many filed emails' frontmatter, so this file can be quickly populated.

---

## Next steps

1. Run the Simmer analysis pass — `analysis/simmer.md` + `frameworks/simmer-framework.md` — same process we just ran for Soft Sundays, 3 examples ready
2. Build `templates/soft-sunday-template.md` using the framework as the structural base
3. Clarify the "this is your sign" rule question when it comes up naturally

---

## Cross-links

- [[2026-06-05-larry-email-examples-second-brain-complete]] — immediately prior session; Silas filed the Soft Sunday examples that made today's analysis possible
- [[2026-06-03-17-00_larry_second-brain-depth-analysis-and-wren-hire]] — the session that hired Wren and first established the Second Brain analysis layer
- [[2026-06-03_larry_second-brain-web-copy-and-analysis]] — the session that built writing-style.md, sales-page.md, about-page.md, home-page.md
- [[2026-06-04_larry_second-brain-carousel-analysis-and-vault-cleanup]] — same analysis pattern applied to carousels

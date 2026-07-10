---
agent_id: iris
session_id: 517625f0-5bbc-4592-a9e2-84111b1b03d6
timestamp: 2026-07-07T14:30:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
---

# Graduated the WS-011 dashboard calendar chip pattern into GL-003

## What I did

Alyssa spent ~8 rounds today iterating the dashboard calendar chips (`dashboard/05 Approved.md` and neighboring tabs) with Larry until she approved a final pattern. That pattern was live in `.obsidian/snippets/dashboard.css` but not yet written into [[GL-003-design-system]] — I read the CSS directly as source of truth (not the brief's paraphrase) and added four new subsections under §5 Component conventions:

1. **Two-tier chip hierarchy** — identity chips (dark `#1a1a1a` text, primary category markers, e.g. folder/pastel chips) vs. info/meta chips (unbolded, 10.5px, `--db-terracotta` text, quieter contextual metadata — `.db-cal-type` and `.db-cal-week-pill` are the canonical live examples). Same shape/fill grammar for both; only text treatment differs.
2. **Contrast exception** — lavender fill (`#a186bc`) gets white text instead of terracotta/dark, because neither reads well on it. Documented as case-by-case, not a blanket rule — check contrast per fill.
3. **Uniform sizing rule** — same-type chips in a repeating row/column all size to match the largest; chips riding on a structural element (day-type label on a calendar column) match that element's own dimension (`width: 100%`) rather than floating independently.
4. **"Ship it" button convention** — solid pink `#f39ec2` fill is now the reference pattern for any primary commit action (ship/submit/finalize), distinct from the quieter react-mark buttons. Noted the one convention break: ship buttons use AT KING serif labels, not Roboto Mono, deliberately — reads as a confident human "yes."
5. **Approval-state rule** — one signal only. `.db-card-locked` full-card sage recolor IS the approval signal; a prior "APPROVED" corner badge (`.db-locked-tag`) was built and then explicitly removed per Alyssa's correction (documented in the CSS comment). This was corrected twice today (concepts, arcs) so it's now a standing rule, not a one-off fix.

## What changed in GL-003

Sections updated: §5 Component conventions (dashboard) — four new subsections added, existing content untouched. §"Still open / parked" — noted these threads are now closed. §References — added a line pointing to the live CSS selectors as the evidentiary source.

No tokens changed in §2–§4. No contradictions introduced — the new subsections consume existing tokens (`--db-terracotta`, `--db-pink`, `--db-sage`, `--db-lavender`, `--db-border`) rather than defining new ones.

## Downstream impact

- No in-flight Charta or Pixel deliverables reference the dashboard calendar chip section — this is vault-chrome UI (per the 2026-06-13 journal entry's scope boundary: GL-003's dashboard §5 governs Obsidian app-chrome, not outward-facing brand content Charta/Pixel produce). Low blast radius.
- Any future dashboard/WS-011 UI work (new tab, new chip type, new commit button) should now read GL-003 §5 first instead of relitigating chip hierarchy or approval-signal questions with Alyssa.

## What the next agent should know

If someone builds a new chip type in the dashboard, the identity-vs-meta tier question and the "don't stack an approval badge on a recolored card" rule are now answered in GL-003 §5 — check there before asking Alyssa again.

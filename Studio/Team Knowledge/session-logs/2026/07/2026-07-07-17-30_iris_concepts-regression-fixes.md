---
agent_id: iris
session_id: 0a773a96-55ac-4f99-a186-44842d7eac8e
timestamp: 2026-07-07T17:30:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
---

# Fixed three Alyssa-flagged regressions on 01 Concepts (day-name caps, oval sizing, header spacing)

## What I did

Alyssa reviewed the rendered `01 Concepts` dashboard and flagged three real regressions/misses, not new decisions. Fixed all three directly, root-caused each one, and locked the corrected rules into [[GL-003-design-system]] §5.

**1. Day name rendering as "MONDAY" in small all-caps.** Root cause: `.db-day-name` (added in the prior pass, [[2026-07-07-16-00_iris_concepts-card-tweaks-locked]]) still carried `text-transform: uppercase`, copy-pasted from the retired `.db-day-chip` pill rule it replaced, plus a leftover caption-scale `font-size: 15px`. The dataviewjs source string was already correct sentence case ("Monday") — the CSS was the only thing forcing caps. Fix: removed `text-transform` entirely, raised `font-size` to `20px` (matches `.db-section-title`'s heading scale, not the ~12px mono caption scale).

**2. Post-type ovals (EDUCATION/OFFER/FOR THE GIRLS) rendering at different widths.** GL-003 §5 already documents the uniform-sizing rule as locked, correctly implemented on `05 Approved`'s calendar via `.db-cal-type { width: 100% }` (fills its parent grid column, uniform because every column in the grid is the same width). Root cause of the Concepts bug: a page-scoped override, `.db-day-head .db-cal-type { width: auto; ... }`, was added when Concepts adopted the same class — this let each oval self-size to its own label's text width, silently defeating the locked rule on that one surface while the calendar's usage of the identical class stayed correct. Two sizing mechanisms were live under one shared class name. Fixed by introducing a single shared token, `--db-cal-type-w: 112px` (sized off the longest label, "FOR THE GIRLS"), which the calendar still consumes via grid-parent-fill (`width: 100%`, unchanged) and which Concepts now explicitly consumes (`width: var(--db-cal-type-w)`) instead of self-sizing. One governing value, two valid delegation mechanisms, no more per-page ad hoc override.

**3. "01 Concepts" header/subtitle spacing feels "weird," not "dashboard-like."** Root cause: `01 Concepts.md` (and, I found on inspection, `02 Arc.md`/`03 Hook.md`/`04 Draft.md`/`05 Approved.md` — all five sub-pages) used bare markdown `# Title` + a plain paragraph sentence directly under the nav bar, with zero dashboard-specific wrapper. That only ever inherited the generic `.dashboard h1, h2, h3` rule (font/color/weight, no spacing contract) and fell back to Obsidian's default `<h1>`/`<p>` browser margins — an unstyled accident. `00 Content Command Center` reads as more "dashboard" because its title+subtitle sit in `.db-header-card` with `.db-header-sub` explicitly styled as a muted caption line. Fix: added `.db-page-title`/`.db-page-sub` classes (title matches `.db-header-card h1`'s scale; subtitle matches `.db-header-sub`'s muted-caption treatment, tight margin above, `22px` deliberate gap below before the first day-group row) and converted `01 Concepts.md`'s bare `# 01 Concepts` + paragraph into `<h1 class="db-page-title">` + `<p class="db-page-sub">`. Scoped to Concepts only this pass (the page Alyssa reacted to) — the other four sub-pages share the identical bare pattern and are flagged in GL-003 as an explicit open thread, not silently left broken.

## What changed in GL-003

Section 5 (Component conventions): "Day name" subsection updated with the regression note and the corrected locked spec (20px, sentence case, no text-transform). "Uniform sizing rule" subsection rewritten to state the rule attaches to the shared CLASS not a per-page usage, with the `--db-cal-type-w` token mechanism documented as the fix and the rule for any future third surface reusing `.db-cal-type`. New subsection added: "Sub-page title + caption convention" documenting `.db-page-title`/`.db-page-sub`. "Still open / parked" section: added the four-remaining-sub-pages thread.

## Files touched

- `C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\.obsidian\snippets\dashboard.css`
- `C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\dashboard\01 Concepts.md`
- `C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\Team Knowledge\Guidelines\GL-003-design-system.md`

## Downstream impact

No in-flight Charta or Pixel deliverables reference these dashboard-specific tokens (vault-chrome, not brand-content, per the 2026-06-13 scope note). `02 Arc.md`, `03 Hook.md`, `04 Draft.md`, `05 Approved.md` now formally flagged in GL-003 as sharing Concepts' pre-fix header pattern — convert next time any is touched, or proactively if Alyssa asks for the same pass elsewhere.

## What the next agent should know

If a future chip class gets reused on a third dashboard surface, read GL-003 §5's uniform-sizing rule first — it now explicitly says don't add a new per-page `width` override; either delegate to a uniform grid parent or consume the shared `--db-cal-type-w`-style token. This is the mechanism that should prevent this exact class of regression a third time.

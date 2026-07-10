---
agent_id: iris
session_id: 0a773a96-55ac-4f99-a186-44842d7eac8e
timestamp: 2026-07-07T16:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
---

# Implemented Alyssa's three 01 Concepts card decisions (day-name treatment, button colors, shadow enforcement)

## What I did

Alyssa had decided (not a pitch anymore) on three tweaks to the `01 Concepts` dashboard card. I implemented all three directly in code and locked the final state into [[GL-003-design-system]] §5.

**1. Day chip → bare AT KING serif, stacked above the type oval (Option A).** Retired `.db-day-chip` for Concepts (left the class defined-but-dead in `dashboard.css` rather than deleted, in case a future surface wants the pill treatment). Added `.db-day-name` (bare serif, no pill/fill/border) and changed `.db-day-head` from a horizontal flex row to a vertical stack. Updated `01 Concepts.md`'s dataviewjs to emit `<span class="db-day-name">` instead of `<span class="db-day-chip ${cls}">`.

Flagged as a real schema change: this is a **third text treatment** outside the two locked chip tiers (identity-chip / info-meta-chip). Documented explicitly in GL-003 §5 rather than folding it into either tier.

**Calendar divergence — flagged, not fixed.** `05 Approved.md`'s calendar still shows day-of-week via the older `.db-cal-type`/`.db-cal-dow` chip-style header. I judged bringing the calendar in line as higher-risk right now (the calendar's day-of-week + week-rotation grid is far more structurally interlocked — 7-day grid headers, week-pill gutter, per-day-type coloring all depend on the current chip) than the simpler Concepts day-block header, and Alyssa didn't ask for the calendar to change. Logged the divergence in GL-003 §5 as an explicit follow-up thread so it isn't lost, not actioned unilaterally.

**2. Button color reassignment.** `.db-react-btn.week` (Choose) → `--db-pink`, `.reject` → `--db-peach` (closest existing token to orange; flagged a possible future dedicated-orange token, not blocking), `.idea` (Save) → `--db-sage` (green). This also resolved the pre-existing GL-003-vs-code drift on Save's color — GL-003 said "lavender," the code had already been sage/pink/peach from an earlier untracked edit. GL-003 §5 and the §2 pastel table now state the sage/pink/peach assignment directly; the stale lavender reference is gone.

**3. Shadow — root cause found, not just guessed.** Grepped AnuPpuccin's `theme.css` for `box-shadow`. Found the real source: a multi-layer `--input-shadow` custom property (theme.css ~L3278) that Obsidian core applies to every `<button>` element — our `.db-react-btn`/`.db-pick-btn`/`.db-ship-btn`/`.db-strip-btn` are literal `<button>` tags emitted by the dataviewjs blocks, so they inherited it even though `dashboard.css` never declared a shadow. I also checked the other candidate — AnuPpuccin's per-leaf card shadow at theme.css ~L4367, gated behind `body.anp-card-shadows` — and confirmed via `.obsidian/plugins/obsidian-style-settings/data.json` that this toggle is `false` in this vault, ruling it out as the card-shadow source. Added `box-shadow: none !important;` scoped under `.dashboard` on the four button classes, a `.dashboard button` catch-all, and the card-level selectors (`.db-card`, `.db-arc`, `.db-header-card`, `.db-links-card` — defensive, since no card-level shadow was actually confirmed active).

## What changed in GL-003

Section 5 (Component conventions): button color table entries, new "Day name — bare serif text, a third treatment" subsection, new "Shadow-none enforcement" subsection. Section 2 (pastel palette table): sage/peach/pink rows updated to reflect Concepts button usage, lavender row's stale "Save idea" reference removed. "Still open / parked" section: added the Concepts/Calendar divergence and the future-orange-token note as explicit open threads.

## Files touched

- `C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\.obsidian\snippets\dashboard.css`
- `C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\dashboard\01 Concepts.md`
- `C:\Users\accol\OneDrive\Desktop\mypka-scaffold-latest (2)\Team Knowledge\Guidelines\GL-003-design-system.md`

## Downstream impact

No in-flight Charta or Pixel deliverables reference these dashboard-specific tokens (dashboard.css/`01 Concepts.md` are vault-chrome, not brand-content deliverables per my own journal's scope note — [[Team/Iris - Design System Architect/journal/2026-06-13-obsidian-vault-design-system.md]]). `05 Approved.md` is now formally flagged in GL-003 as visually divergent from Concepts on the day-of-week treatment; no code change made there this pass.

## What the next agent should know

If Alyssa later asks for Concepts/Calendar parity on the day-of-week treatment, that's a scoped follow-up: convert `05 Approved.md`'s `.db-cal-dow` header to also use bare-serif day names, matching `.db-day-name`. Don't do it unilaterally — it's logged as an open thread, not a decision.

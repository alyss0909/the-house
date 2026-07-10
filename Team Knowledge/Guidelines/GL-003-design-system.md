# GL-003 - Design System

> **This Guideline is the single source of truth for the vault's visual system.** Every creative agent (Charta, Pixel, Felix, and any future visual specialist) reads it at the start of every relevant task. Iris is the default author; the values are Alyssa's. Populated 2026-07-07 from the confirmed oat/linen Card Layout system (full origin: `Team/Iris - Design System Architect/journal/2026-06-13-obsidian-vault-design-system.md`).

> **Edits are Iris-only.** Alyssa proposes; Iris authors. Charta and Pixel only ever read this file. The live implementation of these tokens is `.obsidian/snippets/dashboard.css` (as `--db-*` custom properties) — this Guideline is the human-readable SSOT; the CSS must not drift from it.

---

## 1. Identity

- **System name:** myPKA vault — oat/linen Card Layout
- **Tone descriptors:** warm, calm, editorial, tactile/analog (not clinical, not techy, not high-contrast)
- **Audience:** Alyssa — a personal-but-published workspace; every surface should feel like a warm paper desk, not a SaaS dashboard.

---

## 2. Color palette

| Role | Token (CSS) | Value | Intent |
|---|---|---|---|
| Frame / canvas (darkest neutral bg) | `--db-linen` | `#eee6de` | The linen frame behind everything; visible in the gaps between cards |
| Card surface (elevated) | `--db-oat` | `#fcfaf5` | Every pane — sidebar, note area, calendar, properties — the warm off-white cards float on the frame |
| Heading text | `--db-heading` | `#1a1a1a` | Near-black; H1–H6, high-contrast labels |
| Body text | `--db-body` | `#2d1a1b` | Dark warm brown; paragraph copy |
| Muted text | `--db-muted` | `#7a5c5e` | Captions, sub-labels, descriptions |
| Accent / links | `--db-terracotta` | `#8b4a2f` | Warm terracotta — the punctuation color, links, active accents |
| Card border | `--db-border` | `1.5px solid rgba(0,0,0,0.35)` | Dark hairline; matches the tab-pill border for consistency |

### Pastel accent family (tags, chips, folders, button states)

| Name | Token | Value | Where it's used |
|---|---|---|---|
| Sage | `--db-sage` | `#c1d17c` | Affirmative/approved chips; PKM folder; done-stage pill; **Concepts "☆ Save" button** (locked 2026-07-07) |
| Peach | `--db-peach` | `#fecc86` | Team Knowledge folder; warm accent tag; **Concepts "✕ Reject" button** (locked 2026-07-07 — closest existing token to "orange"; a truer dedicated orange token is a flagged future option, not yet added) |
| Pink | `--db-pink` | `#f39ec2` | Active tab / active nav pill (forced black text); Team Inbox folder; current-stage pill; **Concepts "✓ Choose" button** (locked 2026-07-07) |
| Lavender | `--db-lavender` | `#a186bc` | Deliverables folder; lavender chip (text `#1a1a1a`) — no longer used on the Concepts action buttons as of 2026-07-07 |
| Ivory | `--db-ivory` | `#ffeec6` | Team folder; parked/neutral pill |

*Accessibility note (Val, 2026-07-07): all label text on these pastels clears WCAG 2.2 AA 4.5:1. Terracotta-on-oat (reject button) = 6.46:1; muted-on-oat body = 5.72:1; muted on the sage-tinted locked card = 5.06:1.*

---

## 3. Typography

| Role | Family | Setting | Usage |
|---|---|---|---|
| Heading | **AT KING** (fallback Georgia, serif) | letter-spacing `0` (not negative — cramped it) | H1–H6, card titles, hero display |
| Body | **Karla** (Google Fonts) | 14px / line-height 1.5 for descriptions | Paragraph copy, labels, concept descriptions |
| Mono | **Roboto Mono** | `12px` fixed, uppercase, `0.04em` letter-spacing | Sidebar + tabs + all pill/chip micro-labels (sidebar and tabs matched exactly) |

---

## 4. Structure — Card Layout (the core mechanism)

AnuPpuccin's **Card Layout** variant. A linen **frame** (`--db-linen`) sits behind everything; every pane (sidebar, note, calendar, properties) floats as an **oat card** (`--db-oat`) with a visible dark border (`--db-border`), rounded corners (~10px), and a gap between cards. This is the native toggle kristenbouchard's inspo vault uses — do NOT fake it with one-off per-element borders.

- **Card radius:** ~10px (panes/cards) · **999px** for pills, chips, buttons.
- **Tabs:** pill-shaped, oat background + dark border; active tab = solid pink `#f39ec2` with forced black text. Sidebar icons = plain borderless (no pills).
- **Properties panel:** docked right sidebar, invisible until hover (opacity 0 → 0.85), no ghost border box.

---

## 5. Component conventions (dashboard)

All dashboard UI lives under the `.dashboard` scope in `dashboard.css`.

**Full-width panes rule (locked 2026-07-07):** every dashboard note (`dashboard/00`–`05` + `Parked`) carries `cssclasses: [dashboard]` in frontmatter — this is a dual-purpose class, both the dashboard's entire visual scope AND the full-width trigger. `dashboard.css` overrides Obsidian's readable-line-length sizers (`.markdown-preview-sizer`, `.cm-sizer`) with `max-width: none !important; width: 100% !important`, plus zeroing the `--file-line-width` variable those sizers can derive from. `!important` is required — Obsidian's own JS sets high-specificity/inline widths on those elements. Scoped entirely to `.dashboard`; no other note in the vault is affected, so readable line length stays on everywhere else. Live rule: top of `.obsidian/snippets/dashboard.css`.

- **Nav / chips / pills:** Roboto Mono 12px uppercase, 0.04em, 999px radius, `--db-border`. Siblings: `.db-pill`, `.db-chip`, `.db-day-chip`, `.db-stage`, `.db-pick-btn`.
- **Concept card body copy** (`.db-concept-desc`): Karla 14px / 1.5, `--db-muted`, ~12px above the chip row — a quieter sibling of the AT KING title.
- **Concept action buttons** (three, per card): pill-shaped, 999px, min-height 27px, Roboto Mono uppercase labels, uniform fixed width `--db-react-btn-w` (86px, sized off "✕ Reject" — see uniform-sizing note below).
  - `.week` "✓ Choose" → **pink** (`--db-pink`) — Alyssa's final pick, locked 2026-07-07 (supersedes the earlier sage assignment)
  - `.reject` "✕ Reject" → **peach** (`--db-peach`) — Alyssa's final pick, locked 2026-07-07. Peach is the closest existing token to "orange" in the family; flagged to Alyssa that a truer dedicated orange token could be added later, not blocking, shipped as peach for now.
  - `.idea` "☆ Save" → **sage/green** (`--db-sage`) — Alyssa's final pick, locked 2026-07-07. This resolves the earlier GL-003-vs-code Save-color drift: GL-003 previously said "lavender" for Save while the code had already moved; sage is now the single correct answer in both places.
  - Each carries a compound override (`.week.yes`, `.reject.no`, `.idea.redo`) that out-specifies the legacy icon-circle rules.
  - Live implementation: `.dashboard .db-react-btn.week/.reject/.idea` in `dashboard.css`.

**Regression found and fixed 2026-07-07 (third instance of the uniform-sizing bug class):** the three Concepts action buttons (`.week`/`.reject`/`.idea`) shared a base rule with `padding: 5px 8px` and `min-height: 27px` but no `min-width`/fixed-width lock — same gap as the `.db-cal-type` bug two sections above. "✓ Choose", "✕ Reject", and "☆ Save" each self-sized to their own label's text width and rendered visibly mismatched (Alyssa flagged this by eye). These three sit in a free-floating flex row (`.db-btn-row`), not a uniform grid parent, so per the locked uniform-sizing rule they resolve via a **shared fixed-width token sized off the longest label** — the same delegation mechanism as `.db-cal-type`'s free-floating (Concepts) branch. Fixed by adding `--db-react-btn-w: 86px` (measured off "✕ Reject" at this font/padding) and applying `width: var(--db-react-btn-w)` plus `justify-content: center` to the shared `.week/.reject/.idea` base rule. **Any future fourth button added to this row must reuse `--db-react-btn-w`, not introduce its own width.**

### Day name — bare serif text, a third treatment (locked 2026-07-07, Concepts only; corrected 2026-07-07 regression pass)

Alyssa's Option A: in **01 Concepts**, the day-of-week (Monday / Wednesday / Friday) renders as **bare AT KING serif text, sentence case** — no pill, no fill, no border — stacked directly above the post-type oval (`.db-cal-type`). This is a deliberate **third text treatment**, outside the two-tier chip hierarchy below (identity-chip / info-meta-chip). It does not belong to either tier because it isn't a chip at all — no shape grammar, no fill. Scope it narrowly (`.db-day-name`); do not generalize it into a catch-all "plain label" class.

- Live implementation: `.dashboard .db-day-name` + `.dashboard .db-day-head` (a vertical stack, `flex-direction: column`) in `dashboard.css`. `01 Concepts.md`'s dataviewjs emits `<span class="db-day-name">` in place of the old `.db-day-chip`, and the underlying string is already sentence case ("Monday", not "MONDAY") — the day name must never have `text-transform: uppercase` applied to it, directly or inherited.
- `.db-day-chip` (the old pill treatment) is left defined in `dashboard.css` but unused/dead for Concepts — not deleted, in case a future non-Concepts surface wants the pill version. Do not re-wire it into Concepts.
- **Corrected 2026-07-07 (regression):** the first implementation pass accidentally left `text-transform: uppercase` on `.db-day-name` (copy-pasted from the retired `.db-day-chip` it replaced) and sized it at a caption-scale 15px. Both defeated the "bare serif heading" intent — it rendered as "MONDAY" in small caps, reading as a label, not a heading. Fixed: `text-transform` removed entirely; `font-size` raised to **20px**, matching `.db-section-title`'s heading scale rather than caption/mono scale (~12px). Locked size: **20px, sentence case, no text-transform, AT KING, font-weight 600.**

**Known divergence, flagged not fixed (2026-07-07):** the **05 Approved** calendar view still shows day-of-week as a chip-style label (`.db-cal-dow` header row, using `.db-cal-type` info-chip styling for the day archetype directly under plain-text Mon/Tue/Wed... headers — see `dashboard.css` ~L465-489 and `05 Approved.md`). This was assessed as lower-risk to leave as-is rather than convert now: the calendar's day-of-week + week-rotation grid is far more structurally load-bearing (7-day grid headers, week-pill gutter, per-day-type coloring all interlock) than the Concepts view's simpler day-block header, and Alyssa did not ask for the calendar to change. **Follow-up, not yet actioned:** if Alyssa later wants visual parity between Concepts and Calendar, the calendar's plain-text `Mon/Tue/Wed...` DOW header could adopt the same bare-serif convention for consistency — this is an open thread, not a decision, and should not be done unilaterally.

**02 Arc / 03 Hook / 04 Draft day-label audit (2026-07-07, ORIGINAL RULING — SUPERSEDED same day, see below):** these three pages use `.db-day-chip` (the retired-for-Concepts pill treatment) as a section-identity label riding inline beside a title/heading — not the bare-serif `.db-day-name` stack. ~~Assessed as correct-as-is, not a violation~~ — **superseded: see "Day-name convergence" in §5 above.** Alyssa reviewed the live pages, did not accept the structural-difference reasoning, and directly instructed 02 Arc and 04 Draft to match Concepts' bare-serif treatment. 03 Hook has not yet been converted (out of scope for that pass) and still carries this original `.db-day-chip` usage — do not cite this paragraph's original reasoning to justify leaving Hook unconverted going forward; it's simply not yet been done, not a standing design decision.

### Two-tier chip hierarchy (locked 2026-07-07, ~8 rounds of iteration on the calendar chips)

Every solid-fill chip in the dashboard belongs to one of two tiers. Both share the same shape grammar (solid pastel fill, `--db-border`, Roboto Mono, uppercase) — the tier is set by text weight/size/color, not by shape.

| Tier | Purpose | Text color | Weight | Size | Example |
|---|---|---|---|---|---|
| **Identity chip** | Primary category/identity marker — this thing *is* an X | `#1a1a1a` (near-black) | bold/normal per existing pill rules | 12px (standard pill size) | Folder chips (`.db-pill`/`.db-chip` family, §2 pastel table); `.db-react-btn.yes` |
| **Info/meta chip** | Quiet contextual metadata riding on top of or near a primary element — not the primary identity signal | `var(--db-terracotta)` `#8b4a2f` | 400 (unbolded) | 10.5px (smaller, quieter) | `.db-cal-type` (day-type label: Education/Offer/For The Girls) · `.db-cal-week-pill` (week-theme label) |

Both tiers use the same solid pastel fills from §2 (sage/peach/pink/lavender/ivory) and the same border/radius conventions. The tier only changes the text treatment. Live implementation: `.dashboard .db-cal-type` and `.dashboard .db-cal-week-pill` in `dashboard.css` are the canonical info/meta-tier examples — read those rules directly before building a new meta chip.

**Contrast exception (case-by-case, not a blanket rule):** on lavender fill (`--db-lavender` `#a186bc`), both terracotta and dark text read poorly — use white text instead (`.db-cal-week-pill.lavender { color: #ffffff; }`). Before shipping any new chip on a new or existing fill, check contrast against that specific fill; don't assume dark/terracotta text always works.

**Uniform sizing rule:** chips of the same type repeating in a row/column (e.g. the four week chips, the three day-type chips) are ALL sized to match the largest one in the set — never floating at individual content-based widths. A chip sizing itself is not enough; if the whole row reads uneven, fix the row, not the chip. **This rule attaches to the shared CLASS, not to a per-page usage of that class** — if a chip class gets reused on a second surface with a different parent (grid column vs. free-floating header), the second surface must consume the SAME sizing mechanism, not introduce its own override that lets the chip self-size again.
- Chips riding on a structural element that already gives every instance matching width (e.g. a day-type label sitting inside a calendar day column, where every column in the grid is the same width) may resolve their uniform width via `width: 100%` against that parent — this is still "uniform," just delegated to the parent's own uniformity.
- Chips that do NOT sit inside a uniform structural parent (e.g. a free-floating page header, not a grid cell) must resolve to a **shared fixed-width token sized off the longest label in the set**, so every instance — regardless of which page renders it — is identical by construction.
- Live example: `.db-cal-week-pill` uses a fixed `100px × 44px` footprint, identical across all four week chips. `.db-cal-type` uses `width: 100%; min-height: 24px` to exactly match its parent `.db-cal-day` column ON THE CALENDAR, and a shared `--db-cal-type-w` token (currently `112px`, sized off "FOR THE GIRLS") when the same class renders inside a non-grid parent like Concepts' `.db-day-head`.

**Regression found and fixed 2026-07-07:** `.db-cal-type` (EDUCATION/OFFER/FOR THE GIRLS ovals) rendered at visibly different widths on **01 Concepts** — each oval self-sized to its own label's text width. Root cause: a page-scoped override, `.db-day-head .db-cal-type { width: auto; ... }`, was added when Concepts adopted this class, silently defeating the uniform-sizing rule for that one surface while the calendar's own usage of the identical class stayed correct. Two different sizing mechanisms were live under one shared class name, so the locked rule stopped applying the moment a second page reused the class. **Fixed by introducing `--db-cal-type-w` as a single shared width token** that both the calendar (via its grid-column `width: 100%`) and Concepts (via `.db-day-head .db-cal-type { width: var(--db-cal-type-w); }`) now consume — one governing value, two valid delegation mechanisms (parent-fill vs. explicit token), no page gets to invent its own width. **Any future third surface that reuses `.db-cal-type` must do the same** — read this rule and reuse `--db-cal-type-w` (or extend the grid-parent-fill pattern if it sits in a uniform grid), never add a new per-page `width` override.

### "Ship it" button convention (locked 2026-07-07)

For any primary COMMIT action (ship / submit / finalize a piece of work) — as opposed to a react/opinion mark (see `.db-react-btn` above, which is quieter and non-committal) — use the solid pink commit-button pattern:

- Solid `--db-pink` `#f39ec2` fill, `--db-border`, ~10px radius.
- Label set in AT KING serif (not Roboto Mono — this is the one button role that breaks from the mono-label convention, because it reads as a confident, human "yes" rather than a system label).
- Simple, single word or short phrase. No icon required.
- Live implementation: `.dashboard .db-ship-btn` in `dashboard.css` (DRAFT tab commit action). Alyssa's read: "very cute" — this is the reference for any future ship/submit/finalize action, not just the Draft tab's.

### Shadow-none enforcement (locked 2026-07-07 — root cause found)

Every button and card surface in `.dashboard` is flat — no drop shadow. Previously suspected but unconfirmed as coming from the AnuPpuccin theme's own defaults; root cause is now confirmed: AnuPpuccin's base `theme.css` defines a real multi-layer `--input-shadow` custom property that Obsidian's core button styling applies via `box-shadow` to every `<button>` element. The dashboard's react/pick/ship/strip buttons are literal `<button>` tags (emitted by the dataviewjs blocks), so they inherited that shadow even though `dashboard.css` itself never declared one. (The other candidate — AnuPpuccin's per-leaf card shadow, gated behind `body.anp-card-shadows` — was checked and confirmed OFF in this vault's live style-settings data, so it was ruled out as the source.)

- Fix: `dashboard.css` now carries an explicit `box-shadow: none !important;` override on `.db-react-btn`, `.db-pick-btn`, `.db-ship-btn`, `.db-strip-btn`, `.dashboard button` (catch-all for any future raw button), and the card-level selectors (`.db-card`, `.db-arc`, `.db-header-card`, `.db-links-card`) — the latter defensively, since no card-level shadow was confirmed active, but the override costs nothing.
- Status: resolved for buttons (root cause identified and patched). Cards were already shadow-free in practice (the gate was off) — their override is preventive, not a fix for an observed bug.
- Live implementation: top of `dashboard.css`, immediately after the `.markdown-preview-view` background rule.

### Cover / callout box convention (locked 2026-07-07 — replaces the solid-fill cover box, Alyssa's direct call, no options)

**Alyssa's exact words:** "i dont like the yellow box" (02 Arc's cover card) and "the big yellow boxes are a hard no draft is ugo [ugly]" (04 Draft's cover card). Both were the same underlying pattern: a large **solid `--db-ivory` (peach/yellow) fill** callout box, which broke the flat, bordered-oat-card grammar every other dashboard surface uses — every other card, chip, and pill in the system is oat/linen + hairline border, with solid pastel fill reserved for small chip/pill elements only (§5 two-tier chip hierarchy), never a large content-area box. The Arc version additionally repeated the concept title a second time, in large serif type, inside the box — duplicating the `<h2>` already rendered in the section head.

- **Root cause:** the storyboard cover card (`.db-storyboard-cover`, built for 02 Arc) used `--db-ivory` as its background from the start, and defaulted to the concept `title` string whenever no explicit `**Cover:**` line was present in the source — guaranteeing the title rendered twice on cards without dedicated cover copy. 04 Draft's `.db-draft-cover` was a second, separately-styled instance of the identical visual mistake (also `--db-ivory` fill, also repeating the title), built without reference to Arc's box — two one-off fixes would have been needed for one visual sin if not unified.
- **Fix — one shared, locked pattern, reused across both pages, not two separate fixes:**
  - Background: `--db-oat` (matches every other card surface). No solid pastel fill.
  - Border: standard `--db-border` hairline, 10px radius — identical to `.db-card`.
  - Label: small, muted "Cover" label (`.db-sb-cover-label` — Roboto Mono 10px, uppercase, `--db-terracotta`, NOT a filled chip) — quiet metadata, not a headline.
  - Content: cover/slide-art description only. **Never** the concept title — the title has exactly one render location, the section head's `<h2>` next to the day name (one-signal rule, same principle as the approval-state rule above). If a card has no distinct cover-art description in source, the box is omitted entirely rather than falling back to repeating the title.
  - Live implementation: `.dashboard .db-storyboard-cover` in `dashboard.css`, consumed by both `02 Arc.md` (multi-slide storyboard — the box sits above the slide-card grid) and `04 Draft.md` (single cover preview — the box sits above the draft-slides list, adapted since Draft has no slide-card grid, just a sequential slide-text list below it).
  - `.db-draft-cover` (Draft's old dedicated class) is retired — left defined-but-dead in `dashboard.css` with its fill also corrected to oat as a defensive measure, not reused. Draft's markup now emits `.db-storyboard-cover` directly.
- **This is now the canonical pattern for any future callout/preview box.** Any new callout must start from `.db-storyboard-cover`, not invent a new solid-fill class. A third occurrence of "large solid pastel fill as a content-box background" is a direct violation of this rule.

**SUPERSEDED same day (2026-07-07, second pass) — box shape redesigned; the "never the concept title" render-location rule is REVISED, not the color/border grammar.** Alyssa reviewed a live screenshot of 02 Arc and called the box itself (not the color) "ugly," "huge," "long": a full-width, centered, tall-padded card holding only a small "Cover" label and one short serif line, reading as an empty placeholder. This same review round also removed the post title from the day-heading row entirely (see "Day-heading row: day name only" below) — which meant the title needed a new single home, since the section head's `<h2>` that this rule originally pointed to no longer exists on Arc.

- **Box shape fix (compact hero row, not a stretchy centered box):**
  - Padding cut from `18px 20px` to `10px 16px`. Text-align changed from centered to **left-aligned**. Layout changed from a tall centered column to a tight single inline row (`.db-sb-cover-row`: label + title on one line, `align-items: baseline`, `gap: 10px`).
  - Title font-size trimmed from 20px to 18px to sit comfortably inline beside the label rather than towering over it.
  - A genuine `**Cover:**` description (when the source has one — rare) now renders as an optional quieter second line (`.db-sb-cover-desc`, Karla 13px, muted) directly under the hero row, same card — still compact, no separate box.
  - Oat surface, hairline border, no solid fill: **unchanged, still locked** — this redesign only touches shape/padding/alignment/content-placement, not the color grammar from the first pass.
- **Render-location rule REVISED:** the concept title now renders **inside this cover row** (`<span class="db-serif">${title}</span>` beside the "Cover" label), not in the section head. This directly reverses the original rule's "never the concept title... the title has exactly one render location, the section head's `<h2>`" — that render location was deleted in the same pass (Alyssa: day-heading row shows day name only, title lives "on the cover spot"). The one-render-location principle itself is NOT reversed — the title still renders in exactly one place, that place has just moved from the section head to the cover box.
- Live implementation: `.dashboard .db-storyboard-cover` / `.db-sb-cover-row` / `.db-sb-cover-desc` in `dashboard.css`; markup in `02 Arc.md`'s `renderArcCard()`. `04 Draft.md`'s usage (label only, no title span, no desc) is unaffected by the shape change — same tight padding, no empty-box impression since there's no forced vertical column height to leave dead air in.

**CORRECTED same day (2026-07-07, third pass) — `.db-sb-cover-desc` second line removed outright; no lingering "distinct description" fallback stays live.** Alyssa flagged a live screenshot of `02 Arc.md`: the compact cover row ("COVER | The Email That Wakes Up A Dead List") had a second line directly beneath it, in smaller muted gray text, repeating the exact same title again.

- **Root cause:** the second-pass rule above (line 148) assumed a genuine `**Cover:**` description was "rare" and would read as distinct copy when present — but in every real pitch sheet, the `**Cover:**` line under an arc heading is just the title repeated verbatim (e.g. `Team Inbox/pitches/2026-W29-pitch.md`: `### MON — The Email That Wakes Up A Dead List` followed by `**Cover:** The Email That Wakes Up A Dead List`). The render logic (`coverText` in `02 Arc.md`) had no comparison against `title` at all — it rendered `.db-sb-cover-desc` whenever *any* `**Cover:**` line existed in source, guaranteeing the title showed twice, stacked, on every card.
- **Fix:** `coverText` now only renders when the `**Cover:**` line's content is *actually different* from the title (case/whitespace-insensitive compare). If they match — the normal case — no second line renders at all; the cover row shows the label + title, once. There is no scenario where the same title should render twice on one card, so this is a hard behavior change, not a toggle.
- **This does not touch the color/border/shape grammar** from the first two passes (oat surface, hairline border, compact left-aligned hero row) — only the second-line duplication condition changes.
- Live implementation: `02 Arc.md`'s `renderArcCard()` — `coverTextRaw`/`normFold`/`coverText` comparison logic, immediately above the `.db-storyboard-cover` markup. `.db-sb-cover-desc` CSS in `dashboard.css` is unchanged (still valid for the rare case where source copy genuinely differs from the title); only the JS gate controlling whether it ever renders changed. Applies uniformly to every arc card (Monday/Wednesday/Friday, both WED-A/WED-B option cards) since all render through this one shared function.

### Arc react-row spacing convention (fixed 2026-07-07 — button row to note-input gap)

Alyssa circled a screenshot: on `02 Arc.md`'s arc cards, the gap between the Approve/Redo button row and the "add arc notes (Enter to save)" text input directly below it read as too loose/large next to the rest of the card's rhythm.

- **Root cause:** the generic `.db-react-row` class already had the correct tightened treatment (`border-top` hairline, `margin-top: 10px; padding-top: 10px`, flex-column `gap: 8px`) — but Arc's own react-row markup (`dbArcReactRow()` in `02 Arc.md`) uses a *different* class, `.db-arc-react-row`, which had no spacing rule of its own in `dashboard.css` at all. With no declared gap, the space between `.db-btn-row` (Approve/Redo) and `.db-note-wrap` (the note input) fell back to plain stacked-`<div>` default spacing — visibly looser than the card's established 6-10px rhythm (compare `.db-sources-strip`'s `padding-top: 8px`, `.db-arc-note`'s `margin: 6px 0 4px`).
- **Fix:** `.db-arc-react-row` now carries the identical rule set as `.db-react-row` — `border-top` hairline, `margin-top: 10px; padding-top: 10px`, `display: flex; flex-direction: column; gap: 8px`. Same 8px rhythm as the rest of the card family, no new token introduced.
- **Scope:** applies to every arc card rendered via `dbArcReactRow()` — Monday, Wednesday (both A/B option cards), and Friday — since all four call the same shared function. No per-day variance.
- Live implementation: `.dashboard .db-arc-react-row` in `dashboard.css`, immediately following `.db-react-row`.

### Sources footer convention (locked 2026-07-07 — readability fix, flagged by Alyssa as a real, possibly bigger issue)

02 Arc's per-card "Sources:" line rendered several long raw file paths (e.g. `PKM/My_Life/Offers/email-list-revival-plan.md`) as inline link text, wrapping awkwardly across multiple lines and reading as a wall of technical text rather than a footer.

- **Root cause:** the link's display text and its navigation target were the same raw path string — there was no way to shorten what's shown without also touching what's linked, so the full path always rendered verbatim.
- **Fix:**
  - **Display label ≠ link target.** The visible label is now a humanized basename computed at render time: strip the directory path and file extension, replace dashes/underscores with spaces, capitalize each word (e.g. `email-list-revival-plan.md` → "Email List Revival Plan"). The underlying `data-source` attribute the click handler resolves through `app.workspace.openLinkText` still carries the **full original path, untouched** — navigation is not broken, only what's displayed. A native `title` tooltip surfaces the full path on hover for anyone who wants to verify the target.
  - **Capped visible count + overflow tag.** Maximum 4 sources render inline; anything beyond that collapses into a trailing `+N more` tag rather than growing the footer indefinitely.
  - **Quieter footer register, not body-copy weight.** Dropped to the same muted-Mono-footer register as `.db-who` / `.db-note-hint` elsewhere on the dashboard: smaller size (10.5px vs. the previous 11px body-adjacent styling), muted color throughout (link color is muted by default, only brightens to terracotta on hover — not bright/underlined-always), and a hairline `border-top` separating the strip from the card content above it like a genuine footer, not another content line.
- Live implementation: `dbShortSourceLabel()` in `02 Arc.md`'s dataviewjs (label derivation) + `.dashboard .db-sources-strip` / `.db-sources-label` / `.db-sources-links` / `.db-source-link` / `.db-sources-more` in `dashboard.css`.
- **This pattern is the template for any future footer that must display a shortened form of a long identifier while preserving the real link target** — same "label ≠ target, real value lives in a data attribute" mechanism as the source links here.

### Day-name convergence: 02 Arc / 04 Draft now match 01 Concepts (corrected 2026-07-07 — supersedes the prior "legitimate structural difference" ruling)

The prior pass (see the "02 Arc / 03 Hook / 04 Draft day-label audit" note above) assessed Arc/Hook/Draft's continued use of `.db-day-chip` (the retired-for-Concepts solid pill) as correct-as-is, reasoning that these pages' day label rides inline beside a title/heading rather than stacking above a post-type oval like Concepts does, and that this was a legitimate structural difference justifying a different treatment.

**Alyssa overruled this directly: she wants it to visually match, full stop.** Per her instruction, this is not re-litigated — the reasoning is retired, not defended.

- **Fix applied to 02 Arc and 04 Draft:** the day label (Monday/Wednesday/Friday) now renders as `.db-day-name` — the same bare AT KING serif text, sentence case, no pill/fill/border — that `01 Concepts` uses. Layout is adapted, not identical: Concepts stacks the day name above `.db-cal-type` in a vertical column (`.db-day-head`); Arc and Draft's card shape puts the day name inline, beside the `<h2>` title, inside `.db-section-head`'s existing flex row. `.db-day-name`'s own `display: block` still resolves correctly as a flex child, so no new CSS was required for the inline placement — the class is reused as-is, only the parent layout differs, which is the same "shared class, page supplies its own valid layout context" mechanism already established for `.db-cal-type` above.
- **03 Hook converted (2026-07-07, this pass) — thread closed.** Hook's day label (`dayFullLabel[dayKey]`, e.g. "Monday" not "MON") now renders via the identical `.db-day-name` span, wrapped in `.db-section-head` beside the arc title — same inline layout Arc and Draft use, same source-of-truth day-name map (`{MON: "Monday", "WED-A": "Wednesday", "WED-B": "Wednesday", FRI: "Friday"}`) copied verbatim from `02 Arc.md`'s dataviewjs. The retired `dayChipClass`/`.db-day-chip ${cls}` markup is removed from `03 Hook.md` entirely — no per-day mon/wed/fri fill classes remain in Hook's render path. All four dashboard pages with a day label (`01 Concepts`, `02 Arc`, `03 Hook`, `04 Draft`) now share one bare-serif day-name convention; only `05 Approved`'s calendar DOW header remains on the older chip-style treatment (separately flagged, parked, not part of this thread — see the "Concepts/Calendar day-of-week divergence" open item below).
- `.db-day-chip` remains defined in `dashboard.css` — now unused by every dashboard page (Concepts, Arc, Hook, Draft all converted). Left defined-but-dead per the standing note above, in case a future surface wants the pill treatment; not deleted.

### Sub-page title + caption convention (locked 2026-07-07)

Every dashboard sub-page (`01 Concepts`, `02 Arc`, `03 Hook`, `04 Draft`, `05 Approved`) opens with a page title + one-line intro sentence directly under the nav pill bar. This must use the `.db-page-title` / `.db-page-sub` pair, not bare markdown `# Heading` + a plain paragraph.

- **Root cause of "doesn't feel like a dashboard" (Alyssa, 01 Concepts, 2026-07-07):** these sub-pages were written as bare `# 01 Concepts` + an unstyled paragraph sentence. They only inherited the generic `.dashboard h1, h2, h3` rule (font/color/weight, no spacing contract), then fell back to Obsidian's default browser `<h1>`/`<p>` margins — an unstyled accident, not a deliberate spacing choice. `00 Content Command Center` reads as "more of a dashboard" because its title+subtitle sit inside `.db-header-card` with `.db-header-sub` explicitly styled as a muted caption (`color: var(--db-muted)`, tight margin above, deliberate gap below).
- **Fix:** `.db-page-title` matches `.db-header-card h1`'s scale (`clamp(24px, 3vw, 34px)`, AT KING, weight 600). `.db-page-sub` matches `.db-header-sub`'s caption treatment (`--db-muted` color, 14px, tight `margin: 6px 0 0` above, `22px` below before the first content row). This is NOT the bordered/padded card treatment (`.db-header-card`) — that stays reserved for the home page's pipeline header. It's the same *caption contract* applied to a page title that doesn't need a full card wrapper.
- **Scope, updated 2026-07-07 (parity pass):** now applied to all five dashboard sub-pages — `01 Concepts.md`, `02 Arc.md`, `03 Hook.md`, `04 Draft.md`, and `05 Approved.md`. Note: the prior version of this entry said `05 Approved` was already converted; a code-parity audit found it was NOT — it still carried bare `# 05 Approved` + plain paragraph. Corrected this pass alongside Arc/Hook/Draft. All five sub-pages now share the identical `.db-page-title`/`.db-page-sub` contract.
- Live implementation: `.dashboard .db-page-title` / `.dashboard .db-page-sub` in `dashboard.css`; markup in each sub-page (`<h1 class="db-page-title">NN Title</h1>` + `<p class="db-page-sub">...</p>` in place of bare `# Title` + plain paragraph).

### Saved / Rejected persisted state (locked 2026-07-07 — closes the Save/Reject persistence gap)

Choose already persists to disk (a `✓` prefix on the concept's own numbered line in the pitch sheet) and renders as a full green card recolor (`.db-card-locked`) — that state survives a reload. Save and Reject did not: clicking either only fired a transient `showSaved()` confirmation that faded, with no lasting mark on the card or button. Alyssa's ask: "can the button just change to Saved, or is that hard?" — she needs to look at a reloaded dashboard and tell, per card, whether she already reacted.

- **Persistence mechanism:** a trailing `[saved]` / `[rejected]` tag on the concept's own numbered line in the pitch sheet — e.g. `3. How I'd Get Sales This Week Without A Single New Follower [saved]`. Parallel convention to the `✓` prefix Choose already uses: same file, same line, no new database, no plugin `data.json`. Mutually exclusive with `✓` chosen (choosing a concept clears any `[saved]`/`[rejected]` tag; setting one tag clears the other). Written by `dbSetConceptStateTag()`, read back by `dbSplitStateTag()` in `01 Concepts.md`'s dataviewjs.
- **Button state at render time (all three read the SAME persisted state, no separate lookup):**
  - Chosen → unchanged, full green card recolor (`.db-card-locked`), per the one-signal rule below.
  - Saved → button reads **"Saved"** (past tense), solid **lavender** fill, white text, disabled/no-hover — a static "confirmed" look, not the live clickable "☆ Save" sage button. Lavender was picked specifically because it isn't used anywhere else on these three buttons, so "Saved" reads as its own distinct third state rather than a dimmed Choose or Reject.
  - Rejected → button reads **"Rejected"**, hollow/outline peach treatment (oat fill, peach border, terracotta text) — deliberately NOT a solid fill, so a rejected concept reads "quietly closed" rather than "still an active reject button sitting there."
  - None of the above → default: all three buttons active, original labels ("✓ Choose" / "✕ Reject" / "☆ Save").
- **Why not the green recolor for Saved/Rejected:** green card recolor is reserved for chosen/approved only (see the one-signal rule immediately below) — Save and Reject needed their own distinct-but-quiet treatment that doesn't compete with or get confused for "this is this week's pick."
- Live implementation: `.dashboard .db-state-locked` (+ `.idea.db-state-locked` / `.reject.db-state-locked`) in `dashboard.css`; write/read logic (`dbSetConceptStateTag`, `dbSplitStateTag`, `dbApplyRowState`) in `01 Concepts.md`.
- **This also closes the previously-open "Save-button click feedback" thread** (§ below, now resolved): the button itself flipping to a persisted "Saved" state is a stronger, longer-lived signal than any of the three transient-feedback options that were pitched (pulse / inline text / card tint) — Alyssa's actual complaint was persistence across reloads, not the momentary click feedback, which `showSaved()` already handled.

### Day-heading row: day name only, no title (locked 2026-07-07 — closes the duplication Alyssa flagged twice)

02 Arc's day-heading row rendered `<span class="db-day-name">Monday</span><h2>${title}</h2>` side by side — day name and post title on the same line. Alyssa's exact words, reviewing a live screenshot: "leave it to just say monday wednesday NOT the actual post title since that's on the cover spot." The title was already rendering a second time inside the cover box below — this was the same duplication class Alyssa flagged earlier in the sources-footer and approval-badge passes (§5 "one signal" principle), just recurring on a different element pair.

- **Fix:** the `<h2>${title}</h2>` is removed outright from the day-heading row (`.db-section-head`) — not hidden via CSS, deleted from the markup. The row now emits only `<span class="db-day-name">${dayFullLabel[dayKey] || dayKey}</span>`.
- **Consequence:** the title needed a new single render location, since the section head's `<h2>` was its only home before this pass. It now renders inside the redesigned cover box (see "Cover / callout box convention" above, second-pass revision) — one render location, just relocated, not eliminated.
- **Scope:** this fix is 02 Arc-specific in this pass (the day-heading row with an inline `<h2>` is Arc's own single-arc-day markup — the WED-A/WED-B pick-banner path has its own separate title display and was not touched). `03 Hook` and `04 Draft` render their day name inline beside a title too (per the earlier "Day-name convergence" note) — if Alyssa flags the same duplication there, apply the identical fix (delete the `<h2>`, relocate the title into whatever cover/preview element that page has), don't re-litigate.
- Live implementation: `renderArcCard()`'s day-heading line in `02 Arc.md`'s dataviewjs block.

### Day-heading stacking rule: day name and title never share one row (locked 2026-07-07 — closes the thread flagged as open in the entry above)

The prior entry ("Day-heading row: day name only, no title") fixed `02 Arc.md`'s single-arc day-heading row by deleting the inline `<h2>${title}</h2>` outright — Arc no longer renders a title in that row at all. It flagged `03 Hook.md` and `04 Draft.md` as still rendering day name + title inline in `.db-section-head` and said to "apply the identical fix... if Alyssa flags the same duplication there." Alyssa's next screenshot showed exactly that: on `03 Hook.md`, "Monday" and the post title ("The Email That Wakes Up A Dead List") crowded onto one line with bad spacing.

Hook and Draft's case is different in one respect from Arc's original bug: their title isn't a duplicate render (no separate cover/preview element holds it elsewhere on those pages) — it's the ONLY place the title renders on those two pages, so the fix here is layout, not deletion. Deleting the title would remove information Hook and Draft don't show anywhere else.

- **Fix:** `.dashboard .db-section-head` changes from a single-row flex (`display: flex; align-items: center; gap: 12px`) to a column stack (`display: flex; flex-direction: column; align-items: flex-start; gap: 4px`). Day name (`.db-day-name`) now always renders on its own line; whatever follows it (a title span/`<h2>` on Hook/Draft, nothing extra on Arc) flows on the line below, never forced side-by-side regardless of how many children the row has.
- **Scope:** `.db-section-head` is shared across all three pages (`02 Arc.md`, `03 Hook.md`, `04 Draft.md`), so the CSS fix is one rule, not three. Arc's day-heading row only ever contained the day name (no title, per the entry above), so the stacking change is visually inert there — a single child stacks the same as it would in a row. `03 Hook.md`'s `<span class="db-day-name">…</span> <span class="db-who">${title}</span>` and `04 Draft.md`'s `<span class="db-day-name">Monday</span><h2>${title}</h2>` both now stack correctly with no markup change required — the fix is CSS-only.
- **Not touched:** `01 Concepts.md`'s day-heading uses a different class (`.db-day-head`) and a different pattern entirely — bare day name stacked above the post-type oval (`.db-cal-type`), not beside a title. It was already column-stacked before this pass and needed no change. Confirmed by reading the page before editing anything, per Iris's audit discipline — don't touch pages that don't have the flagged issue.
- Live implementation: `.dashboard .db-section-head` in `dashboard.css` (changed rule); markup in `03 Hook.md` and `04 Draft.md` unchanged (CSS-only fix, per the general principle that layout problems get layout fixes, not markup rewrites, when the existing markup is otherwise correct).

### Action-button icon-prefix convention: every verdict button carries its glyph (locked 2026-07-07 — closes the Arc/Concepts/Hook icon-parity gap)

`01 Concepts.md` and `03 Hook.md`'s three-state action rows (`✓ Choose` / `✕ Reject` / `☆ Save`) have always carried an icon prefix on the button label itself, not just in the reacts-log verdict string. `02 Arc.md`'s two-state Approve/Redo row did not — the buttons read bare "Approve"/"Approved"/"Redo" with no glyph, even though the reacts-log verdict for the same actions already used `✓ approved` / `↻ redo` (see `dbWireArcReacts`'s `doApprove`/`doRedo` in `02 Arc.md`). Alyssa flagged the visual inconsistency directly from a live screenshot: Concepts/Hook's buttons "already show an icon prefix," Arc's don't.

- **Fix:** Arc's button labels now match the glyphs already used for the same verdicts elsewhere in Arc's own code (not new glyphs invented for this fix) — `✓ Approve` / `✓ Approved` (disabled state) and `↻ Redo`. `↻` was chosen specifically because it's the exact glyph Arc's own `dbAppendReact(..., "↻ redo", ...)` call already writes to the pitch sheet's reacts log for a redo verdict — reusing the established glyph, not introducing a new redo icon.
- **Case convention:** title case ("Approve"/"Redo"), matching Arc's own pre-existing button text casing — this differs from Concepts/Hook's all-caps-via-`text-transform: uppercase` CSS treatment (the CSS `.db-react-btn.week/.reject/.idea` rule visually renders `text-transform: uppercase` regardless of source casing), but Arc's Approve/Redo buttons render through the plain `.db-react-btn` base class without that transform, so the literal string case is what displays — sentence/title case was Arc's existing convention before this fix and is preserved.
- **Scope:** three call sites updated for consistency — `dbArcReactRow()`'s button markup (the initial render), `applyApprovedUi()`'s live state-flip on click, and the "Pick this one" (A/B) button's live state-flip on the paired Approve button. All three now agree on `✓ Approve` / `✓ Approved` / `↻ Redo`.
- Live implementation: `02 Arc.md`'s dataviewjs — `dbArcReactRow()`, `applyApprovedUi()`, and the `.db-pick-btn` click handler.

### WED day-key fallback gap (fixed 2026-07-07 — defensive, not yet triggered)

`dayFullLabel` mapped `WED-A` and `WED-B` to "Wednesday" but had no bare `WED` key. A lone Wednesday arc (no A/B split) using a plain `WED` day-key in the pitch sheet would fall through the `dayFullLabel[dayKey] || dayKey` lookup to the raw, unabbreviated-nowhere fallback — rendering "WED" instead of "Wednesday." Flagged as a known nice-to-have gap in an earlier pass; closed now rather than left open.

- **Fix:** `dayFullLabel` now includes `WED: "Wednesday"` alongside the existing `WED-A`/`WED-B`/`MON`/`FRI` keys. Full day names only, never an abbreviation, regardless of which day-key spelling the pitch sheet uses upstream.
- Live implementation: `dayFullLabel` map in `02 Arc.md`'s dataviewjs block. **`03 Hook.md` carried the identical gap (checked and fixed in this same pass)** — its own copy of the map now also includes `WED: "Wednesday"`. Any future page that copies this map should carry the `WED` key from the start.

### Nav-to-page-title spacing (locked 2026-07-07 — tightened to match the system's rhythm)

Alyssa flagged a live screenshot of 02 Arc: a "large, ugly gap" between the nav pill row and the `02 Arc` page title below it. Root cause (found via DOM inspection, not guess-and-reload): the Minimal theme's base vertical rhythm (`--p-spacing: 1.75rem` between top-level preview blocks, plus its own generic heading margin-top) applied between the nav dataviewjs block's rendered output and the following `.db-page-title` h1 — on top of `.db-nav`'s own `margin: 0 0 18px 0`. The two margins stacked, and `.db-page-title`'s existing `margin-top: 4px` intent was silently losing to the theme's rule (no `!important`, lower effective specificity in the live cascade).

- **Fix:** `.db-page-title`'s top margin now carries `!important` so it can't be overridden by the theme; the top-level block wrapping the rendered `.db-nav` gets its default bottom spacing collapsed to `0 !important`. Net result: `.db-nav`'s own 18px bottom margin (unchanged) is now the only gap between the nav row and the page title, matching the tighter rhythm used elsewhere (`.db-header-card` on Home, `.db-section-head` on Arc's own day blocks).
- **Scope:** this fix is global to `.dashboard` (the markup pattern — nav dataviewjs block immediately followed by `.db-page-title` — is identical on every sub-page: `01`–`05`), not Arc-specific. Arc was simply the page under direct review when Alyssa caught it; all five sub-pages benefit from the same fix.
- Live implementation: `.dashboard .db-page-title` (added `!important`) + new `.dashboard .markdown-preview-sizer > div:has(> .db-nav)` rule in `dashboard.css`.

### Approval-state rule: one signal only (locked 2026-07-07, corrected twice today)

When something becomes approved / locked / chosen, the element itself changes state — do not also add a badge or corner label saying the same thing. One clear signal, never stacked.

- Live pattern: `.db-card.db-card-locked` / `.db-arc.db-card-locked` recolor the full card background to a sage tint (`color-mix(in srgb, var(--db-sage) 28%, var(--db-oat))`) plus a slightly heavier border. That recolor IS the approval signal.
- A prior `.db-locked-tag` ("APPROVED" corner label) was built and then intentionally removed per Alyssa's direct correction — the code comment in `dashboard.css` documents this removal. Do not reintroduce a corner badge, ribbon, or checkmark chip alongside a state-recolored card; pick one.
- This generalizes past the calendar/concepts context: any future "this is the chosen/approved/final one" UI gets exactly one signal (state recolor, OR a badge — not both).

---

## 6. Imagery style

- **Photography:** editorial / candid / lifestyle — warm, film-grain, analog-feeling (the swipe-file aesthetic: soft light, real hands, paper, plants).
- **Illustration:** minimal, warm; avoid flat corporate vector.
- **Icon style:** simple line/unicode symbols. Folder symbols in use: PKM ✦︎ · Team Knowledge ⸬ · Team Inbox ☾ · Deliverables ⊙ · Team (none).

---

## 7. Voice samples

1. "Goodbye girlboss. Hello soft CEO."
2. "You're allowed to build a slower business."
3. "The easiest email you'll ever send makes the most money."

*(Voice authority for copy = Hermes JUDGMENT layer; these are visual-tone anchors only.)*

---

## Still open / parked

- Calendar sizing (larger than the inspo vault — low priority).
- Tiny corner-gap on card borders (cosmetic, mostly resolved).
- Dedicated vault-design specialist: **covered by Iris** (Design System Architect) — no new hire needed.
- **Concepts/Calendar day-of-week divergence** — Concepts now uses bare-serif day names (Option A); 05 Approved's calendar still uses the older chip-style DOW header. Flagged, not fixed — see §5 "Day name" subsection for the full note. Revisit only if Alyssa asks for parity.
- **Truer "orange" token for Reject** — currently ships as `--db-peach`. If Alyssa wants a dedicated orange distinct from peach later, that's a new token to add, not a reassignment.
- **`.db-page-title`/`.db-page-sub` — RESOLVED 2026-07-07 (fifth pass, parity audit):** now applied to all five dashboard sub-pages (`01 Concepts`, `02 Arc`, `03 Hook`, `04 Draft`, `05 Approved`). Code-parity audit also caught that `05 Approved` had been marked "already converted" in an earlier note when it in fact had not — corrected in the same pass. Closes this thread.
- **Legacy pick/kill/redo icon-circle buttons on 02 Arc / 03 Hook — RESOLVED 2026-07-07 (sixth pass, Alyssa's direct call: "ugly," convert outright, no options):** Arc and Hook's `.db-react-btn.yes/.no/.redo` icon-only circles are converted to the same labeled-pill treatment as `01 Concepts`. Markup now emits `class="db-react-btn week yes"` / `class="db-react-btn reject no"` / `class="db-react-btn idea redo"` with visible text labels **"Pick" / "Kill" / "Redo"** (terse, matches the mono-caps dashboard label convention; distinct from Concepts' "Choose"/"Reject"/"Save" because Arc/Hook's verdict set is semantically pick/kill/redo, not choose/reject/save-idea). The original `.yes/.no/.redo` classes are kept alongside the new `.week/.reject/.idea` classes purely so the existing `dbWireReacts` click-handler class-detection (unchanged) keeps working — click logic and verdict strings (`✓ picked` / `✕ killed` / `↻ redo`) were not touched, only the visual/markup layer.
  - **Color mapping reused, not reinvented:** Pick = pink (`--db-pink`), Kill = peach (`--db-peach`), Redo = sage (`--db-sage`) — the exact same token assignment Concepts locked for Choose/Reject/Save. No new colors introduced.
  - **Uniform width reused:** both pages now resolve through the same shared `--db-react-btn-w` token (`86px`, sized off "Reject" as the longest label across both button sets) — Pick/Kill/Redo are shorter labels so they sit comfortably inside the existing token; no new width value was needed.
  - **No CSS changes required.** The `.dashboard .db-react-btn.week/.reject/.idea` rules in `dashboard.css` were already written generically (not scoped to `01 Concepts`), so Arc and Hook pick up the locked pill shape, colors, uniform width, hover states, and `box-shadow: none` flat treatment automatically by adopting the same classes. One shared rule, three consuming pages, zero one-off CSS.
  - Live implementation: markup changes in `02 Arc.md` and `03 Hook.md` (`dbReactRow()` function in each file's dataviewjs block); CSS unchanged, `.dashboard .db-react-btn.week/.reject/.idea` + `--db-react-btn-w` in `dashboard.css` (already existed, now has three consumers instead of one).
  - **Thread closed.** All three dashboard pages with action-button rows (`01 Concepts`, `02 Arc`, `03 Hook`) now share one pill system — one class set, one color mapping, one width token, governed here in §5.

*(Calendar chip hierarchy, ship-button convention, and the approval-state rule — all previously open threads from the 2026-07-07 dashboard calendar iteration — are now locked in §5. Concepts day-name treatment, button color reassignment, and shadow-none enforcement — all locked 2026-07-07, this pass. Day-name uppercase/size regression, `.db-cal-type` uniform-sizing regression, and the sub-page title/caption convention — all fixed and locked 2026-07-07, this second pass. Concepts action-button (`.week`/`.reject`/`.idea`) uniform-sizing regression — fixed 2026-07-07, third pass, same bug class as `.db-cal-type`. Arc/Hook button-color thread — resolved 2026-07-07, sixth pass: converted to the shared labeled-pill system, closing the thread flagged in the fifth pass.)*

- **Save-button click feedback — RESOLVED 2026-07-07 (fourth pass):** superseded by the Saved/Rejected persisted-state convention in §5. The button now flips to a persisted "Saved" (lavender) / "Rejected" (peach outline) state that survives reload, closing both the original "no visible confirmation" flag and Alyssa's later "can the button just change to Saved" ask in one mechanism.

- **02 Arc live-screenshot review — RESOLVED 2026-07-07 (seventh pass, direct execution, no options presented):** Alyssa reviewed a live screenshot of `02 Arc.md` and gave three direct fixes, all shipped in this pass:
  1. **Nav-to-title spacing** — tightened; see §5 "Nav-to-page-title spacing." Global fix (`.dashboard` scope), not Arc-only, since the underlying markup pattern is shared by all five sub-pages.
  2. **Day-heading row duplication** — the post title is removed from the day-heading row entirely; only the day name (Monday/Wednesday/Friday) remains. See §5 "Day-heading row: day name only." The title's one render location moved to the redesigned cover box (fix 3, same pass). Also closed in this same pass: the `WED` day-key fallback gap (`dayFullLabel` lacked a bare `WED` key, only `WED-A`/`WED-B`) — fixed in both `02 Arc.md` and `03 Hook.md` (checked for parity, same gap existed there too).
  3. **Cover box redesign** — the full-width, centered, heavy-padding placeholder-feeling box is replaced with a compact left-aligned hero row (label + title inline, optional description line below). See §5 "Cover / callout box convention," second-pass revision. Oat/hairline-border/no-solid-fill grammar from the original redesign is unchanged; only shape/padding/alignment/content-placement changed.
  - **Downstream impact:** `04 Draft.md` shares `.db-storyboard-cover` and is visually affected by the shape change (tighter padding) but not functionally broken — its usage (label only, no title, no description) still renders correctly at the new compact size. `03 Hook.md` picked up the `WED`-key parity fix but was NOT touched for the day-heading-duplication fix (Alyssa's instruction named Arc specifically); Hook still shows day name + title inline via its own `.db-who` span — a known open thread if Alyssa later wants the same duplication fix applied there.

## References

- Live implementation: `.obsidian/snippets/dashboard.css` (`--db-*` tokens) — must stay in sync with §2–§5.
- Origin doc: `Team/Iris - Design System Architect/journal/2026-06-13-obsidian-vault-design-system.md`
- Chip hierarchy / ship-button / approval-state rules (§5, added 2026-07-07): source is the live `.db-cal-type`, `.db-cal-week-pill`, `.db-ship-btn`, and `.db-card-locked` rules in `dashboard.css`, confirmed through ~8 rounds of direct Alyssa feedback on the dashboard calendar.
- [[SOP-author-a-design-system]] · [[SOP-audit-content-for-design-system-compliance]]
- [[Team/Iris - Design System Architect/AGENTS]] — Iris's contract; author of this Guideline.

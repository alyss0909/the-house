---
agent_id: iris
session_id: lead-magnet-landing-reference
timestamp: 2026-07-09T14:00:00Z
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
mined: true
---

# Built the reference landing page for the new lead-magnet-system funnel automation

## What I did

Authored `lead-magnet-system/reference/conversion-landing-sample.html` — a single
self-contained HTML file that the future `/landing-page` slash command will read as
its visual pattern-match target every time it generates a new lead-magnet landing
page. Six sections per Larry's brief: fixed blurred nav w/ theme toggle, hero (trust
bar + eyebrow + H1 + subhead + value pills + benefits), form card (name/email/optional
dropdown/submit/micro-trust row), FAQ (4 `<details>` items), inverted final-CTA card,
footer.

Placeholder copy is a generic "Second Brain BOH" (back-of-house ops) lead magnet —
Alyssa's real niche, written in the "soft CEO / calm-direct" voice register GL-003 §7
anchors, but explicitly flagged in-file as placeholder to swap per real campaign.

## What changed in GL-003

Nothing. No new tokens, no section edits. This was a **read-only extension** of the
existing token set to a new surface — I did not populate anything unilaterally.

## The one judgment call worth logging

GL-003 is populated from the oat/linen Card Layout system, and Iris's own 2026-06-13
journal entry explicitly scopes that system to **Obsidian app-chrome** (the vault's
own interface), distinct from "the content-design-system GL-003 governs... for
Charta/Pixel deliverables." Larry's brief pointed me at GL-003 as the grounding source
for an outward-facing marketing artifact (a public landing page) — a third surface,
neither vault-chrome nor a Charta/Pixel content deliverable.

I proceeded on the read that GL-003 already functions as Alyssa's one locked brand SSOT
regardless of surface — it's the only populated design system in the vault, and its own
§1 Identity section ("every surface should feel like a warm paper desk") reads as a
general brand-feel mandate, not an Obsidian-only constraint. I extended the same tokens
(oat/linen palette, AT KING/Karla/Roboto Mono, flat bordered-card grammar, pill/chip
shapes, shadow-none rule, one-signal-per-state rule) to the landing page rather than
inventing a parallel "web brand" system or blocking on a new guided session.

**Flag for Alyssa, not yet resolved:** if she wants the public-facing lead-magnet
funnel to look meaningfully different from the private vault's interior (a common real
distinction — "my tool" vs. "my storefront") that's a legitimate reason to fork a
GL-003-adjacent "outward marketing" sub-system later. I did not fork one preemptively;
flagging the option rather than deciding it. If she confirms she wants one visual
language across vault + funnel, this thread closes with no further action.

## Technical notes for the automation layer

- Pure CSS custom properties, no Tailwind/build step. Fonts: Google Fonts CDN link
  (Karla, Roboto Mono). AT KING is not Google-Fonts-hosted — GL-003's own documented
  fallback (Georgia/serif) ships as the working `--font-heading` stack; swap in AT KING
  first if/when Alyssa supplies a licensed webfont file.
- Full light/dark theme, `data-theme` attribute switch, `localStorage` persistence
  (`lead-magnet-theme` key), respects `prefers-color-scheme` on first visit.
- Accessibility: semantic landmarks (`nav`, `header`, `section[aria-labelledby]`,
  `footer`), alt/aria-label on the decorative hero mockup, native `<details>` for FAQ
  (keyboard-operable with no JS), visible `:focus-visible` ring using a color distinct
  from the brand pink so focus is never confused with a hover/brand-accent state.
- Dark mode: pastel family (sage/peach/pink/lavender/ivory) and neutrals get dark-mode
  variants; final-CTA card flips from solid near-black to oat-surface in dark mode so
  it doesn't invert to a jarring near-white block.

## Downstream impact

None yet — first artifact in this new pipeline, nothing else references it. Once the
`/landing-page` command exists and generates its first real page against this
reference, any later GL-003 token change (color/type/spacing) makes both this
reference file and every generated page stale under the boy-scout re-render rule.

## Next design-system action

None required to ship this. Open thread for Alyssa: confirm whether the lead-magnet
funnel should share GL-003's exact token set 1:1, or fork a distinct "outward
marketing" visual variant — see judgment-call note above.

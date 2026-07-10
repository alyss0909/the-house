# Content OS — SOP Draft Pack (SOP-033 → SOP-038) + WS-011 Patch

*DRAFT — not canonical. Prepared by Larry for Alyssa's Gate-2 review, 2026-07-08. Nothing here becomes a live SOP until Alyssa approves. Synthesizes Suki (strategy), Pax (standards research), Mack (trend wiring), Nolan (hiring gate).*

**Read order for reviewers:** this pack is the process. [[Deliverables/2026-07-08-content-os-reset/APPROVAL-MEMO]] is the plain-English "what am I approving." Read the memo first.

---

## The corrected assembly line (Suki-confirmed, 2 sharpenings)

```text
Monthly Apify scrape (existing — do NOT rebuild)
  -> Monthly Swipe File
  -> Weekly Trend Scout Brief            [SOP-033]
  -> Suki Weekly Strategy Brief          [SOP-038]  ← the market→bet translation layer
  -> [SLOT-OFFER LOCK: M=free / W=product / F fixed vs offer atlas]
  -> Concept pitches                     [SOP-034] -> Mean Alyssa concept gate [SOP-037] -> ALYSSA picks
  -> Hook bench                          [SOP-035] -> Mean Alyssa hook gate    [SOP-037] -> ALYSSA picks
  -> Substance Dossier                   [SOP-036] -> Mean Alyssa substance gate[SOP-037] -> ALYSSA approves
  -> Writer (Hermes) turns dossier into carousel copy
  -> Mean Alyssa voice/social gate       [SOP-037] -> ALYSSA final approval
```

**Two sharpenings vs HANDOFF-3:**
1. **Suki Weekly Strategy Brief now has a defined output** (SOP-038) — it was a step with no artifact. It's where trend evidence becomes *this week's bet*.
2. **Slot-offer lock** added before Concept — Concept cannot pitch until each slot's offer is fixed, or it generates great posts that tease nothing sellable. One checkpoint, not a new SOP.

**Cadence — work-ahead buffered (Alyssa, 2026-07-08):** Trend + Suki insights run **Sunday**; **Monday** Alyssa reviews concepts for a **future publish week (W+1 or further)** — the pipeline is forward-buffered, never scrambling for the week it's in, and the team may run several weeks ahead. The monthly scrape (next run **Aug 1**) feeds the monthly swipe; weekly briefs re-slice it. **Trend/routine status must keep pace with the buffer:** any brief built for a publish week beyond the current swipe's freshness window carries a `[working ahead of last scrape — verify at ship]` banner, so working ahead never silently ships stale trend reads.

**North-star rule (threaded through every rung):** the machine exists for **comment → ManyChat → list/sale**, not applause. Every gate asks *"does this earn the keyword comment?"* — not just "is it good."

**Substance vs Writer boundary (the load-bearing split — reconciled with GL-011 §2):** *Substance owns what's true, in what order, AND the persuasion strategy made legible — it drafts the real agitating copy per GL-011 §2 as a **persuasion spec, not publishable voice.** Writer owns final voice: turning that spec into copy that sounds like Alyssa. If the Writer is deciding what Alyssa teaches, changing the belief order, or inventing a number, the split has broken; if Substance's copy ships unrewritten as final voice, it has also broken.*

**Repo-boundary test (Pax, externally checked):** *If it changes what a post SAYS → source risk, reject. If it changes how a post is CHECKED → safe process, adapt.* Blotato/social repos are mechanics and QA, never Alyssa's voice or source.

---

## SOP-033 — Run Trend Scout Brief

- **Owner:** Mack (wiring) / Suki (interpretation). *Automation function, not a hire — see hiring plan.*
- **Trigger:** **Sunday**, before SOP-038 — feeds Monday's review of a future publish week.
- **Inputs:** latest monthly Apify swipe file (`Team Inbox/pitches/swipe/YYYY-MM-swipe.md` + `covers-YYYY-MM/`); [[Studio/Content/trusted-sources]] Layer 3 macro sources; [[Studio/Content/taste-ledger]]; recent Alyssa grid if relevant.
- **Output:** `Team Inbox/pitches/trend-briefs/YYYY-Www-trend-brief.md` (new folder, no setup blocker).
- **Must include (8):** what's working now (each claim = a named real trusted-account example, never a vibe) · **what's STALE** (explicit — so we stop reusing dead mechanics) · top cover mechanics · top slide-structure patterns · examples from trusted accounts · opportunity notes for Alyssa's offers · **Mean Alyssa ammo per rung** · scrape gaps.
- **Health checks (Mack, ceilings named):** no-run detection = swipe-file mtime only (can't see inside the Claude app); gap reporting echoes what the swipe file logged; staleness/overlap = naive text match, not semantic. WS-011 step 1 halts on a stale-scrape banner before Suki's brief runs.
- **PASS:** every claim carries a real example; stale mechanics named; Mean Alyssa gets concrete ammo; **brief header states the scrape date + which checks are mechanical-only, and any claim the wiring can't verify is flagged `[unverified]`, never passed silently** (the health checks are proxies — see ceilings above).
- **DEADLIEST FAIL:** external copy captured as *voice-usable phrasing* — the brief is mechanics-only. The second it reads like lines to paste, it's a boundary breach that poisons everything downstream.

## SOP-038 — Suki Weekly Strategy Brief  *(closes Suki's hole #1)*

- **Owner:** Suki (strategic; not a maker rung).
- **Trigger:** **Sunday**, right after SOP-033, before Concept.
- **Inputs:** the week's Trend Scout Brief; offer atlas / [[Hermes/MAP]] §3 + [[Hermes/FUNNEL]]; taste ledger.
- **Format (Alyssa, 2026-07-08 — resolved):** a **team-usable one-pager** (theme · per-slot offer lock M=free/W=product/F · what we're deliberately STOPPING · the ONE belief we're moving · comment-CTA keyword per slot) that the makers work off directly. **Alyssa's surface is a 2-line skim only:** *"Here's our ultimate goal this week — and here's your first approval."* She does not read the full brief unless she wants to.
- **PASS:** Concept can pitch straight off the one-pager with no re-guessing; the bet is explicit; Alyssa's 2-line skim names the goal + the one thing she's approving first.
- **FAIL:** raw trend data forwarded with no bet attached; no stop-list; north star left implicit; Alyssa handed the full brief instead of the 2-line skim.

## SOP-034 — Write Concept Pitch Brief

- **Owner:** Concept Specialist / Suki-directed. *(Run internally first, per hiring plan.)*
- **Inputs:** Trend Brief; Suki Weekly Brief; slot/offer lock; [[Hermes/FUNNEL]], `MAP.md` §3, offer files; taste ledger; Alyssa source files for the topic.
- **Output:** 10+ concept candidates internally → survivors shown to Alyssa as **plain-language concepts**. Goal: 3 Mean-Alyssa-surviving concepts per M/W/F slot before Alyssa chooses.
- **Backend fields (Pax: match professional creative-brief norm — Asana/adlibrary verbatim):** audience moment · objective · key insight · single message · desired behavior · **angle (the belief-breaking meaning — named separately from words: Concept owns the angle, Hook owns the words)** · offer/freebie tie · **comment-CTA keyword** · trend signal · Alyssa teaching/source clue · belief it breaks · approval path.
- **Alyssa-facing shape:** "A post about [reader problem] and [specific solution/angle], funny/sharp because [belief it breaks], gives them [do-right-now payoff], CTA [freebie/offer]."
- **PASS:** a specific idea a stranger stops for (not a topic); real offer-fit on *meaning*; a real source path exists; earns the comment; angle present but NOT already a hook line.
- **DEADLIEST FAIL:** topic-shaped top-9 regurgitation ("email marketing mistakes") — the mediocre-role tell (Pax: externally, this IS the bottom-two-thirds content failure mode); OR an "angle" that is really a finished hook — kick back, that's Hook's rung.

## SOP-035 — Run Hook Bench

- **Owner:** Hook Specialist / Suki-directed. *(Run internally first.)*
- **Inputs:** Alyssa-approved concept (+ its named angle); Trend Brief; current swipe covers; [[Studio/Analysis/carousel-hook-forensics]]; repo mechanics **as adapted process only**.
- **Use:** first-3-words test · hook = 50% of the score · batch variety · payoff required · no self-resolving reframe · one reach word + one emotional/coined word · "so what?" test · **comment/send-driving check** (the north star — save is a *secondary* lever, never the target).
- **Output:** many internally → **3 Mean-Alyssa-surviving hooks per concept** for Alyssa to choose.
- **PASS:** real reason to swipe AND matches the concept's actual teaching (no bait-and-switch); has a payoff; engineered toward the comment/send. **"Save-worthy but not comment-driving" is a FAIL, not a pass.**
- **DEADLIEST FAIL:** reads like a hook library — re-inventing her own formulas as generic guru phrasing. More templates is the anti-pattern; sequencing + testing is the value.

## SOP-036 — Build Substance Dossier

- **Owner:** Substance Specialist (Cassius, re-tested under THIS standard — not the old "make an arc" one).
- **Inputs:** approved concept + hook; Suki brief; **exact Alyssa source files**; BOH/module/transcript/template/offer files; [[Hermes/FUNNEL]]; Alyssa carousel forensics; real data sources for any number.
- **Output — TWO parts:** (1) **the GL-011 arc, in its exact §5 contract** (`### DAYKEY — Title` / `**Cover:**` / numbered `N. Role: X → so that Y — copy` / `Sources:` / `Hooks:`) — this is the *deliverable*, dashboard-parseable, per the law Cassius is bound to; (2) a **provenance sheet** — the worksheet fields behind it: what Alyssa actually teaches · where (file/line) · her philosophy AND anti-philosophy · reader desire + objection · source quotes · un-inventable proof · what the post gives away vs teases · $5 + offer-desire checks. *The dossier fields are the maker's worksheet; the GL-011 arc is what ships downstream.* Numbers per GL-011 §3 (see PASS).
- **PASS (evidence-bound, not vibes):** **$5 test** passes ONLY if the post carries ≥1 un-inventable, *cited* (file/line) detail a reader couldn't get free from a top-9 post. **Offer-desire test** passes ONLY if the tease maps to a specific named [[Hermes/FUNNEL]] belief-gap. Every number real and inside GL-011 §3 bands (engaged ~40–57%; single-digit/low-teens OK for cold/ghost lists; **never an invented 3%**).
- **DEADLIEST FAIL:** "feels like Alyssa would teach this" with no cited source — the exact Cassius failure, and the exact industry mediocrity pattern (Pax, externally verified). Substance without provenance is confident generic advice.

## SOP-037 — Run Mean Alyssa Content Gate  *(reusable at every rung)*

- **Owner:** Suki / Larry; every content rung runs it.
- **Must use:** taste ledger · trend brief (incl. **stale-mechanic kill authority** — Suki hole #3: a mechanic named stale in SOP-033 is an automatic strike) · Alyssa real-source proof · repo review mechanics · line-by-line kill format · subtract-points scoring · **both-directions control calibration against a FIXED control set** — the gate re-scores 2 real-*approved* pieces + 1 real-but-flagged-too-AI piece (e.g. the Soft Sundays miss / [[Library/Examples/soft-sundays/me-i-need-ideas-i-already-had]]) each run; if it misclassifies a control, the gate is benched before it judges new work (a judge that flags her REAL copy as fake is as broken as one that praises slop; note: *published ≠ approved*, so provenance alone isn't the control) · "what would Alyssa immediately call bullshit on?"
- **Kill questions per gate:**
  - **Concept:** idea or topic? · stranger stops or module-summary-in-a-trenchcoat? · name the belief it breaks or it's dead · what does it sell, does the tease earn the freebie?
  - **Hook:** first 3 words — swipe or yawn? · does it resolve itself? · my hook or a library reheat? · where's the payoff? · does anyone SEND this?
  - **Substance:** where does she actually teach this — file/line or it's made up · every number real and inside GL-011 §3 bands (engaged ~40–57%, single-digit OK for cold — never an invented 3%)? · would I pay $5? · what am I NOT saying that I'd never say? · does it make them want the offer?
  - **Voice/Social:** sounds like me or a pastiche? (control-calibrated) · where's the AI tell — reframe headline, assembled enumeration, metaphor-as-wallpaper? · is the last slide send-worthy or does it just end? · would I actually post this?
- **Output:** killed list + reasons · survivors · exact fix instructions where repair is allowed · "send to Alyssa" only after the gate passes.
- **PASS:** nothing reaches Alyssa the team could have killed or answered internally.
- **DEADLIEST FAIL:** Alyssa has to correct role confusion, a source gap, generic content, or fake confidence — if she's doing the gate's job, the gate didn't run.

---

## WS-011 patch plan

WS-011 becomes the choreography that CALLS these SOPs. Proposed step sequence (replaces current Steps 0–4):

1. SOP-033 Trend Scout Brief  *(halt on stale-scrape banner)*
2. SOP-038 Suki Weekly Strategy Brief  → **slot-offer lock**
3. SOP-034 Concept Pitch → SOP-037 concept gate → **Alyssa picks**
4. SOP-035 Hook Bench → SOP-037 hook gate → **Alyssa picks**
5. SOP-036 Substance Dossier → SOP-037 substance gate → **Alyssa approves**
6. Hermes write → SOP-037 voice/social gate → **Alyssa final approval**

Nothing downstream is produced until upstream is approved. This is a *patch plan*, not an applied edit — WS-011 stays as-is until Alyssa approves at Gate 2.

---

## Still open before these go canonical

- ~~Suki's format call~~ — **resolved** (team one-pager + Alyssa 2-line skim).
- ~~Cadence~~ — **resolved** (Sunday insights → Monday review of a future week; work-ahead buffered).
- **Mack's trend unknowns** — mostly resolved: scrape is **scheduled monthly, next run Aug 1** (Alyssa). Remaining: Alyssa to paste the routine internals so Mack can confirm whether the Claude Routine *is* the Apify run or a wrapper, and where its definition lives (to replace the mtime-proxy no-run check).
- **Gate-3 role decisions** (see HIRING-PLAN-v2 matrix) — Gate 3, *after* this process is approved.

---
title: Outcome writeback — what I built, what I'm proposing
author: Mack (automation)
date: 2026-07-20
task: Agent Tasks — "Wire outcome writeback so content learns from real performance"
status: BUILD done (email outcomes live + mechanical). LEARNING LOGIC awaits Alyssa's decision.
---

# Outcome writeback

**The problem (team note):** "Right now the loop learns only from her vetoes. It never sees open rates, saves, or sales." The content taste-ledger records only Alyssa's picks and vetoes — opinion. It is blind to how the shipped thing actually performed — outcome.

**The split I was asked for:** build the unambiguous mechanism that attaches real outcomes to shipped items; *propose* (not blind-build) the logic that turns an outcome into changed behavior. This doc is the proposal half; the build half is already live.

---

## Part 1 — What I BUILT (unambiguous, live now)

A measured-signal surface that sits beside the taste ledger. The taste ledger keeps recording opinion; this records outcome. Nothing here changes behavior on its own — surfacing is mechanical, learning is a decision, and I kept that wall deliberately.

**Files:**
- `Studio/Content/outcomes-ledger.md` — the canonical outcomes surface. Email table is LIVE with real Kit numbers (30 completed broadcasts pulled 2026-07-20). Carousel and sales sections are honest stubs (see Part 3).
- `scripts/content-outcomes.py` — the deterministic engine. Pure stdlib, house style (marker-rewrite pattern from `regenerate-now.py`). Reads a Kit pull + an offer map, buckets sends by audience size, computes a **segment-aware baseline** (median open/click per bucket), tags every send OVER / under / on-par vs its OWN bucket, and rewrites the ledger table between `<!-- OUTCOMES -->` markers. Idempotent.
- `scripts/data/kit-broadcasts-sample.json` — the real Kit pull, seeded (also the refresh drop-point).
- `scripts/data/outcome-map.json` — broadcast_id -> offer / lane / mechanic. This is the LEARNING key; sourced from the Notion Products DB "Related Emails" relation.

**Wired into the loop (record-only, no behavior change):**
- `/content-run` Stage 0 now refreshes the outcomes ledger as part of harvest.
- `/content-run` Stage 7 receipt now records each shipped item's **outcome handle** (Kit id / subject for email; permalink / board page for carousel) so the next refresh knows what to look up.
- The taste ledger's "Shipped results" now points at the outcomes ledger.

**It is a mechanical refresh, not a one-time job.** Kit is MCP-only in this house (no API key is wired for a cron), so the *pull* is agent-driven (one MCP call) and the *math* is scripted. Re-pull whenever she sends, save the JSON, run the script. Kit open/click settle ~48h post-send. Same refresh shape and the same Related-Emails dependency as the sibling task tsk-2026-07-17-002 (which wired email *bodies* into briefs; this wires email *performance* into the loop — the two halves of the same Kit pull).

**What the real data already shows (a finding that shapes the proposal):**
- Her full-list open rate is remarkably flat: **39-43%** across 19 broadcasts, median 41.65%. Open rate barely discriminates between sends. As a learning signal on the big list, opens are nearly a constant.
- Click rate on the full list is tiny and noisy (0.09%-1.08%). Directional at best.
- The strong, discriminating numbers live on **small segments** (waitlists, class buyers: 44-82% open, up to 55% click) and on **saves/sales** — and saves/sales are exactly what is NOT reachable yet.
- **Implication:** the reachable email signal is real but low-resolution. It can catch a genuine dud (the 33% "mermaid money" send, an under) and confirm the Simmer nurture holds its clicks, but it cannot finely rank two good posts. The high-resolution signal needs Instagram saves and sales. Design the learning logic to weight signals by how much they actually discriminate — do not let a 1-point open wobble move anything.

---

## Part 2 — What I'm PROPOSING (the learning logic — your call, Alyssa)

How should an outcome change future behavior? I did not build this, because every version of it bakes in a judgement about what "good" means and what should change. Here are the decisions, each as options with a recommendation.

### Decision 1 — What is the unit of learning?
An outcome attaches to a shipped item, but the loop should learn about something *reusable*. Candidates:
- **(a) Mechanic / argument-lane** — e.g. "the Simmer", "six-burners lane", "the Two Camps". Rolls up across many sends. *Recommended.* This is already how the briefs and METHOD are organized, and the `outcome-map.json` mechanic column is built for it.
- **(b) Hook shape** — Reporter's Finding vs Permission Slip vs Coined Phenomenon. High-value but only measurable once we can read per-post saves (Instagram), since the subject-line/hook is what opens drive.
- **(c) Offer** — too coarse; an offer isn't a behavior the writer chooses.

Recommendation: learn at the **mechanic/lane** level (a), add **hook shape** (b) the moment Instagram saves are reachable.

### Decision 2 — What counts as "underperformed"? (the band)
The script tags OVER/under/on-par vs the bucket median within a band (default: open +/-3 points, click +/-40%). This threshold is a judgement, not a fact.
- **(a) Absolute floor** — "under her list's normal is below X% open." Simple, but her opens are so flat it rarely fires.
- **(b) Relative to bucket median** *(what the script does now)* — fair across audience sizes. *Recommended*, but the band width is yours to set.
- **(c) Relative to the same mechanic's own history** — "this Simmer opened below the last five Simmers." Best signal, needs a few sends of history per mechanic first.

Recommendation: keep **(b)** now, graduate to **(c)** per-mechanic once each mechanic has ~5 sends banked. And decide: should a single "under" mean anything, or only a **run** of them? (See Decision 3.)

### Decision 3 — How much evidence before behavior changes? (the core decision)
This is the real fork. Three postures, least to most aggressive:

- **Option A — Dashboard only (surface, never auto-act).** Outcomes are shown in the ledger and in the `/content-run` Stage 0 harvest; the writers never see them; nothing is down-weighted automatically. You look, you decide. *Lowest risk, lowest leverage.* This is exactly what is live today.
- **Option B — Advisory flag (surface to the writer as context, still her call).** When a mechanic has **underperformed 3+ times in a row** (never on one data point), the next brief that would use it carries a neutral note: "the Simmer has opened under baseline 3 sends running — consider a different lane, or a fresh angle." The writer/orchestrator sees it; you still approve every post. No automatic suppression. *Recommended.* It makes the loop *see* outcomes without letting a noisy 1-point wobble silently kill a mechanic you love.
- **Option C — Weighted selection (auto-down-weight).** A consistently-underperforming mechanic is automatically deprioritized in framework/lane selection (e.g. the Stage 2 variety guard also avoids the bottom-quartile mechanic). *Highest leverage, but it can entrench a bad month or a seasonal dip as a permanent bias, and it moves a taste decision out of your hands.* I'd only reach for this after B has run for a quarter and you trust the signal.

Recommendation: **Option B**, with a hard rule that **no mechanic is ever auto-suppressed on fewer than 3 consecutive unders**, and an even harder rule that **an outcome flag never overrides one of your rulings** — your verbatim taste ledger always wins over a number. Outcomes inform; they never veto you.

### Decision 4 — Do outcomes ever touch the taste ledger's rulings?
Recommendation: **No.** The taste ledger is your voice, verbatim. Outcomes live in their own file and can *cite* a ruling ("her 43% Simmer open backs the value law") but must never edit or contradict one. Kept structurally separate on purpose.

### Decision 5 — Cadence
- Refresh outcomes at every `/content-run` Stage 0 (built), and/or a standing weekly pull (could ride the existing weekly review). Recommendation: **both** — Stage 0 for freshness on run day, weekly so a quiet content week still updates the picture.

**The one thing I need from you:** pick a posture in **Decision 3** (A / B / C). Everything else has a safe default already running. My recommendation is **B**.

---

## Part 3 — What is NOT reachable yet (and where it would come from)

| Signal | Status | Blocker | Where it would come from |
|---|---|---|---|
| Email open / click | **LIVE** | none | Kit MCP (`get_stats_for_a_list_of_broadcasts`) — source of truth, wired |
| Instagram saves / reach / shares | **not reachable** | no Instagram/Composio connection bound this session | Composio Instagram (used once for the 2026-05-11 manual pull), the IG Graph API, or a manual paste. This is the highest-value carousel signal and the biggest gap — the loop ships carousels but is blind to how they land. |
| Sales / revenue per campaign | **not reachable** | (1) Kit `list_purchases` is permission-gated in automation (denied 2026-07-20); (2) attribution: Kit does not tie a sale to a specific post/email without a per-campaign UTM / coupon / chat-word convention | Kit purchases API once permitted, or ThriveCart, joined to a campaign via a tracking convention that would have to be introduced at ship time |

**Recommended next builds (in order), once you approve a posture:**
1. **Instagram read path** — the carousel outcome table is stubbed and ready; it just needs a bytes source. Biggest resolution gain for the actual thing `/content-run` produces. (Natural Mack follow-up: wire Composio Instagram or the Graph API.)
2. **A ship-time attribution convention** — a coupon/UTM/chat-word per campaign so a sale can point back to the post that drove it. Cheap to start, unlocks the sales column.
3. **Per-mechanic history** (Decision 2c) — accrues automatically as the email table grows; no new integration.

---

## One-line summary for Alyssa
Email performance is now wired into the loop and refreshes mechanically — the loop can finally *see* open/click, not just your vetoes. It only shows the numbers so far; it does not act on them. **Your one decision:** how hard should an under-performing mechanic push on the next post — just show it (A), flag it after 3 bad sends but you still decide (B, my rec), or auto-down-weight it (C)? And the two signals that matter most for carousels — Instagram saves and sales — aren't reachable yet; say the word and I'll wire Instagram next.

---
name: Knowledge Duplication Register — Hermes/Content OS build, 2026-07-04/05
type: audit
date: 2026-07-05
owner: duplication-auditor (worker, not orchestrator)
status: for-alyssa
scope: LIVE files only (Hermes/, Team Knowledge/, Team/, PKM/). Deliverables/ dated artifacts are treated as history and excluded unless a LIVE file points at them as if they were a current source.
---

# Duplication Register

Architecture rule this audit is checked against: **SOURCE** (`PKM/Second Brain/`, read-only) + **Hermes/** 4 parts (SOUL/STYLE/TASTE/ANTI-AI = judgment, BUSINESS = facts, MAP = atlas, FABLE = operating) + **Deliverables/** = dated build history, allowed to duplicate.

The actual state on disk does not match that rule yet. The clearest proof: `Hermes/SOURCES.md` line 32 says *"`Deliverables/` except the fable-5-ingestion-pack"* is quarantined — but `Hermes/MAP.md` (written the same day, later) directly cites `Deliverables/2026-07-05-vault-learn/learn-relations-map.md` and `learn-programs.md` as live lookup tables (§3, §4). The brain contradicts its own quarantine list.

---

## 1. Duplication Register

### 1.1 The Monthly/Weekly Content Calendar (highest-severity duplication — 4 independent builds)

**The fact:** Alyssa's repeatable weekly content rhythm — W1 Email / W2 Pinterest / W3 BOH Systems / W4 Productivity × Mon Education / Wed Offer / Fri For The Girls — plus which freebie/product/chat word/BOH module fills each of the 12 slots.

**Every file holding a full or partial copy:**
1. `Deliverables/2026-07-04-fable-5-ingestion-pack/03-monthly-repeating-planning-grid.md` — the original grid, sourced from `PKM/Second Brain/examples/Carousels/INDEX.md`. Dated, fine as history.
2. `Hermes/MAP.md` §3 "The calendar → slot map" — a full 12-slot table with chat words, exemplar posts, BOH sources. This is supposed to be THE atlas.
3. `Deliverables/2026-07-05-vault-learn/learn-relations-map.md` — an entire second 12-slot grid ("Intentional Relations Map — Content OS Learn Graph"), independently re-derived, with its own conflict ledger and a machine-readable relation syntax at the bottom. Its own frontmatter lists `Hermes/CALENDAR.md` as a source — **a file that does not exist** (see §2 of this register).
4. `Team Knowledge/content-os/evidence-table.md` + `content-evidence-system.md` — a third framing of the same 12 slots as an "evidence table," built the same day specifically to correct the first two ("do not treat a missing exact carousel example as a blocked slot").
5. `Deliverables/2026-07-05-content-os-master-plan.md` — references "the calendar spec" and a "learn-calendar-spec.md" as if it's a settled fourth input (`Deliverables/2026-07-05-content-os-brain/` has no such file on disk under that exact name — check `Deliverables/2026-07-05-vault-learn/learn-calendar-spec.md`, which does exist and is a **fifth** version).
6. `Deliverables/2026-07-05-vault-learn/learn-calendar-spec.md` — not read in full for this audit (time-boxed) but is cited by both the master plan and the relations map as the "post-mined" calendar evidence, distinct from the "Alyssa-confirmed" planning grid. The relations map explicitly documents disagreements between it and the planning grid (Monday/Wednesday anchoring, FTG week-tagging) without resolving them.

**Canonical version:** `Hermes/MAP.md` §3 should be the only one, per the architecture rule (MAP = atlas). Right now it is the *thinnest* of the five — the relations map has more detail (conflict ledger, funnel chains, teachable snippets) that never made it back into MAP.md.

**What the others should become:**
- `03-monthly-repeating-planning-grid.md` — leave as-is (dated ingestion artifact, historically accurate, already superseded by MAP.md for live use).
- `learn-relations-map.md` — this is the richest version. Its unique content (conflict ledger, funnel chains, teachable-snippet lists) should be merged UP into `Hermes/MAP.md` §3, then this file should become a pointer/history-only artifact. As it stands today it is being treated as a live secondary source (MAP.md cites it directly), which is exactly the "map that eats a second map" failure FABLE.md itself warns against (FABLE.md Prime Rule 2: "if you are writing a file that paraphrases source content, you are building drift").
- `Team Knowledge/content-os/evidence-table.md` + `content-evidence-system.md` — this pair encodes a *process rule* (evidence-first, not grid-first) that MAP.md does not currently have. That rule should be folded into `Hermes/MAP.md` or `Hermes/FABLE.md` as a permanent instruction, and the `Team Knowledge/content-os/` folder should either be deleted or reduced to a single pointer note ("see Hermes/MAP.md and FABLE.md — this folder's content was merged 2026-07-05").
- `learn-calendar-spec.md` — mine for its unique GAP/conflict findings, then fold into MAP.md §3's existing gap list (which already exists but is thinner), then treat as history.

### 1.2 Product / Price / Chat-Word Facts

**The fact:** offer names, prices, themes, and Notion chat words for ~25 products.

**Every file holding a full or partial copy:**
1. `Hermes/BUSINESS.md` — declared the single canonical home ("FACTS — the only home for prices, statuses, chat words").
2. `Deliverables/2026-07-04-fable-5-ingestion-pack/04-product-cta-bridge.md` — a dated snapshot table of the same products/chat words. Fine as history (frontmatter says "bridge, not canonical").
3. `PKM/My Life/Offers/INDEX.md` + 25 individual offer files — this is correctly scoped to *positioning*, not price/chat-word, per BUSINESS.md rule #3. Not a duplication as long as offer files don't also carry price/chat-word tables.
4. `Deliverables/2026-07-05-vault-learn/learn-relations-map.md` — re-types every chat word and price again into its relation-syntax block, sourced "verbatim from Hermes/BUSINESS.md" per its own footer. This is a copy of a copy, already flagged as a bug by the vault-learn team itself: `SYNTHESIS.md` §3 bug #2 says outright: **"PITCH.md re-types every price/chat word BUSINESS.md owns. One Notion change = silent desync. Fix: strip PITCH.md to wikilinks."** The same bug applies to `learn-relations-map.md`, which does the identical re-typing, and the fix was never applied to it either.
5. `Deliverables/2026-07-05-content-os-master-plan.md` — restates the "13 manual chat words," "2 price conflicts," "cold-list ladder overlap" facts inline in prose, a third re-typing of the same underlying gaps already tracked in `Hermes/MEMORY.md`'s gaps ledger.
6. **`Hermes/PITCH.md` is referenced repeatedly** (by `MAP.md`, `SYNTHESIS.md`, `learn-relations-map.md` frontmatter) as a 23-product pitch+teach index that duplicates BUSINESS.md's facts — **but the file does not exist on disk** (see §2, ghost-file finding). Whatever content it held (if it was ever written and then lost, or only ever planned) needs to be reconciled: either it never got created and every reference to it is a dangling pointer, or it existed transiently in a scratchpad/session and was never committed to `Hermes/`.

**Canonical version:** `Hermes/BUSINESS.md`.

**What the others should become:**
- `04-product-cta-bridge.md` — leave as dated history (already labeled "bridge, not canonical").
- `learn-relations-map.md`'s embedded price/chat-word values — strip to wikilinks pointing at `Hermes/BUSINESS.md`, per the fix the team already prescribed for PITCH.md in `SYNTHESIS.md` but never executed on this file too.
- Master-plan's restated facts — fine as a dated status snapshot, but any *future* planning doc should link to `Hermes/MEMORY.md`'s gaps ledger instead of re-listing the same 13 manual words/2 conflicts a third time.
- `Hermes/PITCH.md` — resolve the ghost reference. Either recreate it as a thin wikilink index (matching the "map, don't digest" rule) or delete every reference to it (`Hermes/MAP.md` doesn't currently reference it, but `Hermes/FABLE.md`/`README.md`/master-plan/vault-learn frontmatter do).

### 1.3 Framework/Named-Concept Registry (BOH terminology → source file)

**The fact:** the ~35 named BOH frameworks (Signature Dish, The Simmer, Double Yes Method, 7×10×4×5, etc.) and which module/transcript defines each.

**Every file holding a full or partial copy:**
1. `Hermes/MAP.md` §4 "Named-framework registry" — compact one-line-per-framework table, the intended canonical version.
2. `Deliverables/2026-07-05-vault-learn/learn-programs.md` §2 "The Named-Framework Registry" — a much larger, fuller version of the *same table* (one-line definition + source file per framework), independently built the same day by a different worker pass.
3. `Deliverables/2026-07-05-content-os-master-plan.md` — references "boh-teaching-index" and "product index" as if these are settled singular files; in practice the "teaching index" content is split across `PKM/Second Brain/analysis/boh-teaching-index-phases-0-2.md`, `boh-teaching-index-phases-3-5.md` (tier-2, fine, these are SOURCE's own analysis layer), AND re-derived a third time in `learn-programs.md`.

**Canonical version:** `Hermes/MAP.md` §4, which explicitly says "Full registry with one-line definitions: `Deliverables/2026-07-05-vault-learn/learn-programs.md` §2" — i.e., MAP.md already acknowledges the fuller duplicate exists and points to it instead of absorbing it. This is backwards for a "map, don't digest" architecture: the atlas should hold the full registry, and the Deliverables file should be the one marked historical.

**What the others should become:**
- Merge `learn-programs.md` §2's fuller one-line definitions into `Hermes/MAP.md` §4 (MAP.md's ceiling is 3500 tokens — check if it fits; if not, this is a legitimate case for MAP.md to point at `PKM/Second Brain/analysis/` directly rather than at a Deliverables research file).
- `learn-programs.md` itself is a genuinely valuable one-time full-corpus read (every BOH phase, verbatim quotes, coverage report) — keep it as history, but stop treating it as a live reference from `MAP.md`.

### 1.4 Voice/Style Rules (the ANTI-AI / STYLE corpus)

**The fact:** banned constructions, punctuation corrections, subject-line rules, "quiet" ban, etc.

**Every file holding a full or partial copy:**
1. `Hermes/ANTI-AI.md` + `Hermes/STYLE.md` + `Hermes/TASTE.md` — canonical, correctly positioned as JUDGMENT.
2. `Hermes/learning/deep-reads/*.md` (multiple files, one per scheduled deep-read run) — each contains a full re-derivation of style rules from a single source document, some of which get folded into STYLE.md/ANTI-AI.md and some of which stay as open flags. This is the intended design (LEARNING.md capture→distill→clear loop) and is **not** a duplication problem as long as `learning/log.md` clears the inbox after each distillation — worth spot-checking that the loop is actually running, not just designed.
3. `Team/Wren - Brand Voice Partner/memory.md` — a large pre-Hermes voice-rule document (20 numbered "what this taught us" entries) covering much of the same ground as `Hermes/SOUL.md`/`STYLE.md` (sensory-universal metaphors, "history girl not futurist," never "X not Y" constructions, audience-of-obsessives, wise-old-men register). This is a genuine duplication, not a dated artifact — it is a live, currently-loaded file (agent-index.md still routes copy work to Wren) that pre-dates and now overlaps ~80% with Hermes's SOUL.md content, written independently and already showing drift (e.g., Wren's memory calls the voice fingerprint "Conspiratorial. Grounded. Dry-funny. Permissive. Precise." as settled fact; `Hermes/MEMORY.md` correctly downgrades the identical fingerprint to "[AI-mined, unconfirmed by her]"). See §2 for the full Wren-remnant treatment.

**Canonical version:** `Hermes/SOUL.md` + `STYLE.md` + `TASTE.md` + `ANTI-AI.md`.

**What the others should become:**
- `Team/Wren - Brand Voice Partner/memory.md` — superseded content; see Wren Remnants Register below for disposition (this file should not be quietly left live while Hermes is the declared successor).

---

## 2. Ghost-File Finding (files referenced as if canonical, absent on disk)

Direct `ls Hermes/` shows only: `ANTI-AI.md, BUSINESS.md, FABLE.md, LEARNING.md, MAP.md, MEMORY.md, README.md, SOUL.md, SOURCES.md, STYLE.md, TASTE.md, craft/, examples/, learning/, tests/`.

The following files are cited by name, in LIVE documents, as if they exist in `Hermes/` — **none of them are present**:

| Referenced as | Cited by | Status |
|---|---|---|
| `Hermes/CALENDAR.md` | `learn-relations-map.md` frontmatter `sources:`, `content-os-master-plan.md` ("full grid" link) | Does not exist. Closest real content: `Hermes/MAP.md` §3 (thinner) + `Deliverables/2026-07-05-vault-learn/learn-calendar-spec.md` (fuller, but Deliverables-scoped). |
| `Hermes/PITCH.md` | `content-os-master-plan.md` ("23-product pitch+teach index"), `learn-relations-map.md` frontmatter `sources:`, `SYNTHESIS.md` bug #2 | Does not exist. `SYNTHESIS.md` itself flags this file as having a desync bug — meaning it existed in someone's working context long enough to be critiqued, then never got committed to `Hermes/`, or was deleted after critique and never rebuilt. |
| `Hermes/RELATIONS.md` | `content-os-master-plan.md` ("Foundation research is done and saved in Hermes/... RELATIONS.md") | Does not exist. Closest real content: `Deliverables/2026-07-05-vault-learn/learn-relations-map.md`. |
| `Hermes/CODEX.md` | `content-os-master-plan.md` | Does not exist. Closest real content: `Deliverables/2026-07-05-vault-learn/learn-programs.md` (the framework registry) or possibly the never-created carousel codex noted in `Deliverables/2026-07-05-content-os-brain/` (only `station-*` drafts and `web-research-steal-list.md` exist there, no `learn-carousel-codex.md` was in that folder's listing — a `learn-carousel-codex.md` DOES exist under `Deliverables/2026-07-05-vault-learn/`, unread by this audit but likely the true source). |
| `Hermes/TEACHING.md` | `content-os-master-plan.md` | Does not exist. Closest real content: `PKM/Second Brain/analysis/boh-teaching-index-phases-*.md` (tier-2 SOURCE) or `learn-programs.md`. |
| `Hermes/examples/good/`, `Hermes/examples/bad/` | `TASTE.md`, `README.md`, `SOUL.md` (all cite these as the lineup-test folders) | `Hermes/examples/` exists as a directory but `SYNTHESIS.md` bug #1 already caught this: **the good/bad subfolders don't exist.** `MAP.md` §7 "Known broken" independently re-confirms the same gap. This is correctly flagged in two places already — not a new finding, but it means the TASTE.md/README.md/SOUL.md citations are currently non-functional pointers, i.e. three files assert a fact that two other files have already disproven. |

**Read this as:** the master-plan and the vault-learn relations-map were written assuming a tidier `Hermes/` than what was actually committed — likely because they were drafted in the same working session as a plan for what Hermes/ *would* contain (CALENDAR/PITCH/RELATIONS/CODEX/TEACHING as the "four parts" got renamed to MAP/FABLE/SOUL-STYLE-TASTE-ANTI-AI/BUSINESS at some point during the day), and the plan documents were never updated after the renaming. This is a naming-drift duplication, not a content duplication — but it means anyone reading `content-os-master-plan.md` today will go looking for five files in `Hermes/` that aren't there.

---

## 3. Wren Remnants Register

Hermes is declared Wren's full successor in three separate live files:

- `Hermes/SOURCES.md`: "All Wren operating files (`.claude/agents/wren.md`, `Team/Wren - Brand Voice Partner/`) — the analysis-first protocol this brain replaces." (quarantine list)
- `Hermes/MAP.md` §1: same files listed under "quarantine (never load as voice)."
- `Deliverables/2026-07-04-fable-content-relay-continuation-handoff.md`: lists `[[Team/Wren - Brand Voice Partner/memory]]` as "interpretation, not raw voice" (an earlier, softer downgrade, before the full quarantine).
- The `hermes` subagent definition itself: "Fully separate from Wren; never load Wren files."

But the following LIVE files still actively route work to Wren or treat her as operational, with no corresponding update:

| File | What it still says | Contradiction |
|---|---|---|
| `Team/agent-index.md` (the routing table Larry reads on every request) | Wren's row is unchanged: "Any copy task requiring output read in Alyssa's name — Simmer emails, subject lines... Do NOT route here for strategy decisions." Full active routing description, no deprecation note, no pointer to Hermes. | This is the single most important fix. Larry (and any orchestrator reading this table) will still route live copy work to Wren by default, since nothing here says she's superseded. Compare to Remi's row, which correctly reads "RETIRED 2026-05-27 — superseded by Vera. Do not route here." Wren's row needs the identical treatment: superseded-by-Hermes note, do-not-route flag. |
| `PKM/Second Brain/ready-queue.md` | At least 3 live queue items assign work directly to Wren: "BOH Summer Launch Email Sequence" (READY, highest priority), "Standing Wren Instruction: Email → Carousel" (a standing/automatic brief, not one-off), and the "you get what you get" hook development item — all still say `**Assignee:** Wren`. | These are exactly the deliverables Hermes was built to write. `Deliverables/2026-07-05-vault-learn/SYNTHESIS.md` §3 bug #3 already caught the BOH Summer Launch instance ("assigned to a deprecated agent (Wren). Reassign to Hermes") — but the fix was only proposed, never executed, and the *other two* Wren assignments (the standing Email→Carousel instruction, the hook-development item) weren't even flagged by that pass. |
| `Team/Wren - Brand Voice Partner/memory.md` | Live, uncleared voice-rule file with 18 pre-seed entries + a "Live Calibration Entries" section still marked "First live entry pending." | Should either be marked explicitly retired (matching Remi's pattern in agent-index.md) or have a header added: "SUPERSEDED by Hermes/ 2026-07-05 — kept for historical reference only, not loaded for any live task." Right now it reads as a currently-active, just-not-yet-used onboarding file for an agent who is supposed to be quarantined. |
| `Deliverables/2026-07-05-vault-learn/learn-goals-life.md` (not fully read this pass, cited in SYNTHESIS.md) | Not directly checked, but SYNTHESIS.md's own gap list implies Key Elements / Offer files still structurally point at Wren-adjacent workflows in places. | Lower confidence — flagged for spot-check, not asserted as confirmed. |

**Recommended fix (content only, not wiring — per the instruction to keep this audit read-only and only write the register):**
1. `Team/agent-index.md` Wren row → rewrite to "RETIRED 2026-07-05 — superseded by Hermes (`.claude/agents/hermes.md`). Do not route here." matching Remi's precedent exactly.
2. `PKM/Second Brain/ready-queue.md` → reassign all `**Assignee:** Wren` items to Hermes (3 confirmed instances: BOH Summer Launch sequence, standing Email→Carousel instruction, "you get what you get" hook development).
3. `Team/Wren - Brand Voice Partner/memory.md` → add a superseded/retired banner at the top; leave the content in place as historical voice research (much of it fed into Hermes/SOUL.md already and doesn't need to be deleted, just marked non-authoritative and non-routable).
4. `.claude/agents/wren.md` (not read this pass, but implied to still exist since agent-index.md still links to `[[Team/Wren - Brand Voice Partner/AGENTS]]`) — should get the same retirement note Remi's agent file presumably has.

---

## 4. Timeline Reconstruction

Reconstructed from session logs in `Team Knowledge/session-logs/2026/07/` plus the Deliverables trail.

**2026-07-04 — Fable 5 Ingestion Pack (the source-trust project)**
- Multiple session logs (17:01 through 20:09) did carousel source cleanup, taxonomy fixes, and sales-page recovery — largely PKM/Second Brain hygiene work, not duplication-generating.
- `18:24_larry_fable-content-relay-source-truth` produced the actual source-trust decisions later written into the ingestion pack (which files are tier-1/interpretation/excluded).
- Created: the 7-file `Deliverables/2026-07-04-fable-5-ingestion-pack/` + the continuation handoff. This is the FIRST version of the Monthly Repeating Planning Grid (file 03) and the FIRST product/CTA bridge (file 04) — both legitimate, dated, clearly-labeled "bridge not canonical" artifacts. No duplication problem yet; this pack is well-scoped and self-aware about its own provisionality.
- **This is the point Fable 5 was meant to read the vault once, externally, and hand back an assessment** — not build Hermes. The pack's own README says "Do not build the full relay yet."

**2026-07-05, early — Hermes v1 build and Gate 3 failure cycle**
- Hermes v1 built from "tier-1 extraction" (per `2026-07-05-hermes-v2-handoff.md`), passed its own Gate 2 rubric, failed Gate 3 outright ("id NEVER publish anything... literally none you failed").
- Root-cause diagnosis (in the v2 handoff) correctly identified: writer worked from brain excerpts instead of full originals; no anti-AI-slop pass; specific judgment misses (weekend-work offers, Norah in subject lines); carousel layer built from summaries not real slide-by-slide analysis.
- This is itself a duplication near-miss that was caught: the fix was explicitly "map, don't digest" — but as this register shows, that principle didn't fully hold for the *content-os planning layer* that came right after.

**2026-07-05, mid-day — Hermes v2 through Gate 3 v3/v4/v5, then Content OS genesis**
(per `23-30_larry_hermes-rebuild-and-content-os-genesis.md`, the fullest single session log)
- Rebuilt `Hermes/` as SOUL/STYLE/TASTE/ANTI-AI/BUSINESS/MAP/FABLE/SOURCES/MEMORY/LEARNING/README + craft/ + examples/ + learning/ + tests/ — the structure read in this audit.
- Ran Gate 3 v1 (fail) → v2 (fail, but specific notes) → v3 (partial) → v4 (partial) → v5 (**first approval**, "wowww babe rlly good!"). Four dated review packages exist in `Deliverables/` (`hermes-gate3-review.md` = v2, `-v3.md`, `-v4.md`, `-v5.md`) — this is legitimate, expected duplication (iterative drafts of the same 4 content pieces), correctly scoped to Deliverables, not a problem.
- **Then**, on Alyssa's go-ahead, three parallel research agents were spawned: a calendar-spec miner, a 23-product pitch+teach indexer, and Pax researching the swarm/critic ecosystem. Their outputs became `Deliverables/2026-07-05-content-os-brain/` (station drafts, web research) — separate from `Deliverables/2026-07-05-vault-learn/` (the five-worker full-vault read that produced SYNTHESIS.md, learn-programs.md, learn-relations-map.md, etc.).
- **This is the fork point where duplication actually starts:** two research passes (content-os-brain's "23-product pitch+teach index" → became the ghost `Hermes/PITCH.md` and the calendar-spec miner → became the ghost `Hermes/CALENDAR.md`) ran in parallel with, and independently of, the vault-learn team's `learn-relations-map.md` and `learn-programs.md`, which re-derived much of the same calendar/product/framework content from scratch rather than reading the first team's output. Neither research pass's raw output was fully absorbed into `Hermes/MAP.md`; instead `MAP.md` was written thin and points outward at both Deliverables folders for "the full version."

**2026-07-05, midday — Content OS realignment**
(per `12-51_larry_content-os-realignment.md`)
- Alyssa corrected the team for over-indexing on "does every grid cell have an exact example" instead of solving the actual problem. This produced `Team Knowledge/content-os/content-evidence-system.md` + `evidence-table.md` — a **third**, independently-scoped answer to "how do we know what content to make," alongside MAP.md and learn-relations-map.md, none of which reference each other's conflict ledgers or gap lists.

**2026-07-05, later — Ponytail Guideline integration** (`1400_Larry_ponytail-integration`)
- Unrelated to Hermes/Content OS; added GL-008. No duplication relevant to this audit.

**2026-07-05, night — Hermes deep-read scheduling** (`23-45_larry_hermes-deep-read-scheduling`)
- Scheduled 9 unattended deep-read runs (Jul 5-7, 4am/5am/6:45am) writing to `Hermes/learning/deep-reads/`, folding findings into STYLE/ANTI-AI/craft files, logging contradictions to `learning/inbox.md`. This is the LEARNING.md loop operating as designed and is not itself a duplication risk — but it is a live automation that will keep writing into `Hermes/` while the calendar/product/framework duplication above remains unresolved, so any deep-read finding about calendar slots or product facts risks landing in yet a fourth location if it isn't routed through MAP.md/BUSINESS.md specifically.
- Also produced `Deliverables/2026-07-05-0655-vault-automation-analysis.md`, which independently re-surfaced several of the same bugs `SYNTHESIS.md` already found (stale content-os links, Wren-assigned Ready Queue items, Hermes missing from agent-index) — a case of two separate analysis passes converging on the same debt without citing each other, itself a small instance of the duplication pattern this whole register is about.

**Where the same knowledge got re-created instead of referenced (summary):**
1. The weekly/monthly content calendar — re-derived independently at least 4 times (planning grid → MAP.md → learn-relations-map.md → evidence-table.md), across two different research sessions that didn't cross-reference each other.
2. Product/price/chat-word facts — typed out fresh in BUSINESS.md, then re-typed in learn-relations-map.md and referenced (but not found) in a ghost PITCH.md, then restated again in prose in the master plan.
3. The BOH framework registry — built compactly in MAP.md §4, then built again in full in learn-programs.md §2, with MAP.md conceding the Deliverables copy is the "full" one instead of absorbing it.
4. Wren's voice-rule corpus — built once as Wren's memory.md, declared quarantined in three Hermes files, but never actually retired in the routing table or the queue that assigns her work.

---

## Bottom line

The 07-04 ingestion pack is clean: one clearly-dated, self-aware, non-canonical bridge document. The problem starts 07-05 when the Content OS planning work forked into at least three uncoordinated research passes (content-os-brain, vault-learn, content-os realignment) that each independently re-derived the calendar/product/framework maps that `Hermes/MAP.md` was supposed to own outright, and none of the resulting plan documents (`content-os-master-plan.md` especially) were updated to match what actually got committed to `Hermes/` — leaving five dangling references to files that don't exist. Separately, and on its own track, Wren's supersession by Hermes was declared inside Hermes's own files but never executed in the two places that actually dispatch work (the agent routing table and the Ready Queue).

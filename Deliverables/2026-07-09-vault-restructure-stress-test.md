---
title: Vault Restructure — Deep Architecture Stress Test
date: 2026-07-09
owner: Larry (Fable 5 synthesis, 4-agent audit swarm)
status: research-complete, no files moved
responds_to: "[[2026-07-09-vault-restructure-fable-handoff]]"
do_not_execute: true
---

# Vault Restructure — Deep Architecture Stress Test

Research basis: four parallel vault audits (executable/automation path audit, AGENTS/SOP/WS/GL dependency map, Hermes + Content OS wiring map, PKM provenance survey). No files were moved. Every path claim below was verified against the live vault on 2026-07-09.

**Headline verdict:** Thinking / Building / Finished is the right model, and the vault's existing GL-009 taxonomy already agrees with it almost perfectly — `source / map / derived / output / task` maps cleanly onto the three shelves. The restructure is therefore mostly *making an existing invisible law visible*, not inventing a new one. The danger is not the concept; it is that four systems resolve paths in **code, not prose** (dashboard DataviewJS, `advance-watch.mjs`, the Telegram capture bot, `validation-script.sh`), and two of them **fail silently** when paths break. The plan below sequences around exactly that.

---

## 1. Recommended Target Architecture

```text
ROOT
├── AGENTS.md                     (stays — Larry's constitution)
├── VAULT-MAP.md                  (NEW — the one map every agent reads first)
│
├── Thinking/                     ← Alyssa's mind. Raw only. Agents READ, never write analysis here.
│   ├── MAP.md
│   ├── Inbox/                    (raw drops: Telegram, screenshots, memos — the true inbox half of Team Inbox)
│   ├── Journal/                  (PKM/Journal, unchanged internally: YYYY/MM/)
│   ├── Todos/                    (raw personal todos)
│   └── Life/                     (PKM/My Life Goals·Habits·Key Elements·Projects·Topics + CRM — personal facts, Penn-curated but Alyssa-owned)
│
├── Building/                     ← The workshop. Everything AI/team-made that is not yet trusted source.
│   ├── MAP.md                    (the strongest map in the vault — see §2)
│   ├── Team/                     (Team/ + Team Knowledge/ conceptually; physical move deferred — see §4)
│   ├── Work/
│   │   └── Content OS/           (pitch sheets, taste ledger, swipe, trend/strategy briefs, dashboard — the current Team Inbox/pitches + dashboard/)
│   ├── Analysis/                 (Second Brain/analysis + frameworks + templates; Deliverables analysis-type outputs)
│   ├── Signals/                  (PKM/Signals + Developing Ideas — AI-detected patterns awaiting Alyssa)
│   ├── Automations/              (Team Knowledge/Automations + scripts, conceptually)
│   └── Archive/                  (retired team outputs; Deliverables/_archive)
│
├── Finished/                     ← The shelf. Alyssa-made or explicitly promoted. Read-only to agents by default.
│   ├── MAP.md
│   ├── Offers/                   (one home per offer — see below)
│   │   └── Back of House/
│   │       ├── MAP.md            (replaces My Life/Offers/back-of-house.md as the hub)
│   │       ├── Offer/            (facts: price, status, funnel position, CTA words, chat keywords)
│   │       ├── Program/          (curriculum + transcripts — current Second Brain/programs/back-of-house)
│   │       ├── Sales Pages/      (current examples/sales-pages BOH files)
│   │       ├── Emails/           (BOH launch/sales emails from examples/sales-emails)
│   │       └── Examples/         (real posts that pitched it)
│   └── Second Brain/
│       ├── MAP.md
│       ├── Examples/             (verbatim Alyssa copy: carousels, simmers, soft-sundays, non-offer emails/pages)
│       └── Promoted/             (analysis Alyssa has explicitly reviewed and signed — see §10 promotion)
│
└── Hermes/                       (PHYSICALLY stays at root for phases 0–2; conceptually Building/Team/Hermes — see §4)
```

Key architecture decisions and why:

- **GL-009 is already the constitution.** Its class table (`source`→Journal/examples/programs, `derived`→analysis/frameworks/templates, `output`→Deliverables, `map`, `task`) is exactly the Thinking/Building/Finished split. The restructure's real job is to make folder geography match GL-009 so agents don't have to remember the law — the handoff's instinct was correct and the vault confirms it.
- **The provenance audit confirms the sort is clean.** Journal (~543 files) is genuinely raw — Penn appends in her voice, no `processed_by` duplication found. Second Brain `examples/` and `programs/` are verbatim Alyssa. `analysis/`, `frameworks/`, `templates/` are all AI-derived (voice-profile/voice-archive literally carry `status: AI-mined draft — awaiting Alyssa review`). Signals and Developing Ideas are Larry-authored. There is no fuzzy middle big enough to threaten the model.
- **Offers/Programs merge: yes, via hub inversion.** The audit found BOH is *not* duplicated — it's hub-and-spoke: `My Life/Offers/back-of-house.md` is a pointer record indexing into Second Brain source-of-truth. The fix is to make the hub a **MAP.md inside Finished/Offers/Back of House/** and pull the spokes physically under it. The offer *facts* (price, status) are team-maintained metadata — they live in `Offer/` inside the shelf because they are the business truth agents must cite, but the MAP marks them `class: facts (team-maintained)` so they're never mistaken for Alyssa prose. All 23 offers get the same shape; small ones can be a single `MAP.md + Offer/` until they earn subfolders.
- **`Personal` does not exist as a visible tree.** Goals/Habits/Key Elements/Projects/Topics/CRM collapse into `Thinking/Life/` — they are personal facts, low AI authorship, and Alyssa doesn't browse them as ICOR taxonomy. The ICOR entity logic survives in frontmatter schemas (GL-002) and `Thinking/MAP.md`, not in folder ceremony. This answers RED FLAG 7 without losing WS-002 import compatibility (the import mapping table gets a path update, the schemas are untouched).
- **`Ideas` split by author:** raw Alyssa idea drops → `Thinking/Inbox`; AI-developed theses (Developing Ideas) → `Building/Signals`, with individual notes promotable to Finished when `graduated`. The Signals status pipeline already encodes promotion — keep it.
- **Deliverables/ dissolves over time, not day one.** Its 80+ files are `output` class: analysis-type → Building/Analysis, handoffs/reports → Building/Archive after reconciliation, promoted items → Finished. Phase 3 work. Until then it stays and `VAULT-MAP.md` marks it "legacy output shelf — do not treat as source" (which GL-009 and Hermes SOURCES.md already do).
- **No new brain is created.** VAULT-MAP.md and the MAP.md files contain *pointers and read-orders only* — never content, never summaries (per the map-not-digest rule). Hermes stays the only judgment layer; COMPASS files remain the Second Brain's internal router; Content OS keeps PIPELINE-CONTRACT.md as its operating contract.

---

## 2. Map Hierarchy Design

Principle: **folders are for Alyssa; MAP.md files are for agents.** Every MAP answers *jobs* ("you are here to do X → load these, in this order, and do NOT read Y"), never describes folders. Maps contain pointers, read-orders, and write-rules — zero content, zero summaries.

The vault already has 33 INDEX.md files. **Do not add MAPs on top of INDEXes** — that would be RED FLAG 9 (multiple brains). Rule: MAP.md replaces INDEX.md wherever both would exist; INDEX.md survives only as auto-generated file listings deep in leaf folders. The Journal INDEX is already stale (says 2026 = months 03–06; reality is 01–06 with 162 files) — proof that hand-maintained indexes rot. MAPs must be few, high-level, and owned.

| Map | Must answer | Owner |
|---|---|---|
| `VAULT-MAP.md` (root) | The three-shelf model in ten lines. "Am I looking for raw Alyssa, team work, or trusted source?" Read-order protocol (§9). Legacy-path redirect table during migration. Which map wins for which job (kills RED FLAG 9). | Larry |
| `Thinking/MAP.md` | What counts as raw. Write rules: only Alyssa + Penn (capture-transcription) write here; **no agent may create analysis, summaries, or "processed" versions inside Thinking — ever.** Where Inbox items go after processing (they don't move — they get *pointed at* from Building). | Larry |
| `Building/MAP.md` | The workshop directory: where Team OS, Content OS, Analysis, Signals, Automations live. The anti-junk-drawer contract (§10). Where each output type belongs (kills Deliverables-as-forever-shelf). | Larry |
| `Building/Team/MAP.md` | Larry's routing surface: agent-index, SOPs, Workstreams, Guidelines, tasks, session-logs, templates — with their real physical paths (which stay at `Team/` + `Team Knowledge/` during phases 0–2; this map IS the redirect). | Larry |
| `Building/Work/Content OS/MAP.md` | The WS-011 job card: newest pitch sheet = state machine; taste-ledger = sole taste authority; who writes which section (PIPELINE-CONTRACT pointer); where reacts go (pitch sheet, NOT taste ledger); dashboard location. | Suki |
| `Finished/MAP.md` | What "trusted" means (GL-009 pointer). The promotion protocol (§10). Read-only-by-default rule for agents. | Larry |
| `Finished/Offers/MAP.md` | Offer directory: one row per offer → its folder. Funnel pairing (Mon free ↔ Wed paid — the offer-suite atlas gets its home here). The no-CTA list (e.g. Unignorable Subject Lines has no checkout — never CTA to it). | Suki |
| `Finished/Offers/<offer>/MAP.md` | Everything about this offer in one card: facts (price/status/CTA keyword), curriculum entry point, sales copy, real posts that sold it, what NOT to claim. Replaces the My Life/Offers pointer file. | Suki |
| `Finished/Second Brain/MAP.md` | Source shelf card: examples subfolders and what each holds; COMPASS pointer for deep navigation; the analysis-is-not-here rule (analysis lives in Building until promoted). | Larry |
| `Building/Team/Hermes/MAP.md` → *alias note only* | During phases 0–2 this is a one-line redirect: "Hermes physically at root: `Hermes/MAP.md`." Hermes' own MAP.md stays authoritative. | Hermes |

Ten maps total. Anything beyond this list needs a reason written into VAULT-MAP.md, or it's map sprawl.

---

## 3. Physical Migration Risk Assessment

Ranked by blast radius, from the code audit:

| # | Move | Risk | Failure mode | Detectability |
|---|---|---|---|---|
| 1 | `Team Inbox/pitches` → Building/Work/Content OS | **HIGH** | 7 dashboard pages hardcode `"Team Inbox/pitches"` in DataviewJS (~9 occurrences) and **fail silently** — dashboards render empty, no error. `advance-watch.mjs:80` + `parser-check.mjs:10` resolve the dir via `path.join(__dirname, "..", "Team Inbox", "pitches")` — the /loop auto-advance stalls without an error. 4 of 5 maker agent shims (suki, cass, angus, reeve) hardcode `taste-ledger.md` and sibling paths. GL-010/011/012, WS-011, SOP-034/036/038, PIPELINE-CONTRACT all reference the paths in prose. | **Silent** — worst kind |
| 2 | `Hermes/` → Building/Team/Hermes | **HIGH** | ~130 inbound references; live ones: hermes.md's entire self-bootstrap (10 file paths), cass/suki shims, GL-010's embedded "fresh Hermes" prompt template, Suki HANDOFF, `dashboard/05 Approved.md`'s `dv.io.load("Hermes/MAP.md")` (degrades silently via `.catch`). Internal Hermes cross-links are bare-relative and survive an atomic move — the break surface is entirely external (~10–15 live files). | Mixed |
| 3 | `Team Knowledge/` or `Team/` rename | **HIGH** | `validation-script.sh` **hard-fails** on both. The installed Telegram Windows service points at `Team Knowledge/scripts/telegram-capture-mvp.py` — stale service path = capture dies until reinstalled. Meetily launcher self-registers its scheduled-task path under `Team Knowledge/Automations`. Every SOP/WS/GL cross-link. Close-session, weekly/monthly review commands glob `Team Knowledge/session-logs`. | Hard-fail (good) + service rot (bad) |
| 4 | `Team Inbox` (raw half) → Thinking/Inbox | **MEDIUM** | `telegram-capture-mvp.py:26` computes `VAULT_ROOT / "Team Inbox"` and **writes** there — captures break or land wrong. WS-004/GL-005 own the protocol. Split complexity: media/, Meeting Captures/, _Processed/, _archive/ need destinations. | Loud-ish (capture log) |
| 5 | `PKM/Journal` → Thinking/Journal | **MEDIUM** | No live *code* writes here except import scripts (one-shot) and the already-broken `fix_connections.py`. Prose surface is wide: AGENTS.md, SOP-003/009/010/013, WS-001/002/006, GL-009, hermes.md, penn.md. Historic wikilinks in session logs can stay stale (archival). `PKM/.user.yaml` must be relocated deliberately. | Prose-stale, not crashing |
| 6 | Second Brain split (examples/programs → Finished; analysis/frameworks/templates → Building) | **MEDIUM-HIGH** | Hermes SOURCES.md tier-1 loads point at `PKM/Second Brain/examples` + `programs` — Hermes writing quality dies quietly if these dangle. cass.md, suki.md, reeve.md each hardcode specific analysis files. `import-sales-page-copy.ps1` baked `[[PKM/Second Brain/...]]` wikilinks into historical note *content* — permanent dead links unless swept. COMPASS/INDEX internal nav. | Quiet degradation of writing quality — insidious |
| 7 | `My Life` + `CRM` → Thinking/Life | **LOW-MEDIUM** | `migrate-inline-fields-to-frontmatter.py` FOLDER_SCHEMA dict keys silently no-op after rename; WS-002 import table; GL-002 schemas (path refs only); 25 offer files cross-link Hermes (outbound, fine). | Mostly benign |
| 8 | `PKM/Signals` + `Developing Ideas` → Building/Signals | **LOW** | AGENTS.md semantic-sweep section + SOP-013 own the paths; WS-006 garden check. Pure prose, one owner, easy sweep. | Benign — ideal pilot material |
| 9 | Deliverables dissolution | **LOW** | GL-006/GL-009 scope prose; suki.md/cass.md pin one specific deliverable (`2026-07-06-instagram-craft-foundation.md`) as a mandatory load — that file must be promoted, not archived. | Benign if reconciled file-by-file |

Cross-cutting risks:
- **OneDrive**: the vault lives in OneDrive. Bulk moves can trigger sync churn/conflicted copies mid-migration. Do physical moves with Obsidian open (so wikilinks auto-update) and OneDrive paused, then let it sync.
- **Obsidian auto-update only fixes wikilinks.** DataviewJS strings, `.mjs`/`.py`/`.ps1` code, `.claude/` prose, and quoted paths inside markdown do **not** auto-update. This is the single most important mechanical fact of the whole migration.
- **`.claude/settings.local.json`** has dozens of machine-absolute allowlist paths — they degrade to re-prompts, not breakage, but should be pruned post-move.
- **Pre-existing bug found (restructure-independent):** `scripts/fix_connections.py:4` resolves `PKM/Journal` relative to `scripts/`, so it is already a no-op. Fix or retire regardless.

---

## 4. Move Physically vs. Stay-with-Redirect

| Target | Verdict | Timing |
|---|---|---|
| `PKM/Signals`, `PKM/Developing Ideas` → `Building/Signals` | **MOVE** — lowest risk, proves the promotion pipeline | Pilot A (phase 1) |
| `Team Inbox/pitches` + `dashboard/` → `Building/Work/Content OS/` | **MOVE** — highest value; contained code surface (2 scripts + 7 dash pages + 5 shims + 6 docs), one atomic cutover with a verifier | Pilot B (phase 1–2) |
| `Team Inbox` raw remainder → `Thinking/Inbox` | **MOVE**, same window as Pilot B (one-line change in telegram bot + WS-004/GL-005 rewrite) | Pilot B |
| `PKM/Journal`, `My Life`, `CRM`, `Images`, `Documents` → `Thinking/` | **MOVE** in phase 2, after pilots prove the sweep method | Phase 2 |
| Second Brain split → `Finished/Second Brain` + `Finished/Offers` + `Building/Analysis` | **MOVE** in phase 2–3, gated on Hermes SOURCES.md rewrite + full-write test | Phase 2–3 |
| `Hermes/` | **STAY AT ROOT** with a conceptual alias in Building/Team/MAP.md. Revisit only after everything else is stable. Moving it buys zero navigation value for Alyssa (she doesn't browse it) and risks the writing engine. | Phase 4 or never |
| `Team/` + `Team Knowledge/` | **STAY** physically; VAULT-MAP + Building/Team/MAP.md present them as Building/Team conceptually. The Windows service, scheduled task, validator, and the entire SOP cross-link mesh make this the most expensive move for the least Alyssa-visible benefit. Revisit in phase 4. | Phase 4, optional |
| `Deliverables/` | **STAY**, drain gradually via reconciliation (GL-009 fates). Never bulk-move. | Ongoing |
| `AGENTS.md`, `.claude/`, `_system/`, `Expansions/`, `website/`, `lead-magnet-system/` | **STAY** — infrastructure, not vault content | — |

Redirect mechanism: during any transition window, a stub note at each old location — frontmatter `redirect_to:` + one line — plus a redirect table in VAULT-MAP.md. Stubs are removed after two clean weekly reviews confirm nothing reads the old path (grep session logs for old-path hits).

---

## 5. Workflow Stress-Test Results

1. **Daily raw capture** — ✅ PASS with rule added. Penn writes to Thinking/Journal + Thinking/Inbox; Penn's routing of entities goes to Thinking/Life (CRM/My Life successors). Required addition to Thinking/MAP.md: Penn transcribes, never annotates — any Penn commentary belongs in Building. Flag: Journal is really an undifferentiated inbox (research clippings live beside diary entries) — acceptable, but the MAP must say "raw ≠ diary; raw = untransformed."
2. **Telegram capture** — ⚠️ PASS after one code change. `telegram-capture-mvp.py` writes `VAULT_ROOT / "Team Inbox"` — one-line change to `Thinking/Inbox`, plus Windows service reinstall (service pins absolute script path). Command-routed content ("Monday's update me on all inbox actions") still lands as raw in Thinking/Inbox; execution artifacts belong in Building. Test: send a Telegram message post-cutover, confirm file lands.
3. **Meetily** — ⚠️ CONDITIONAL. Launcher itself doesn't write into the vault (all paths are machine-local), but Meeting Captures/ lives in Team Inbox — its destination (Thinking/Inbox/Meetings vs Building) must be decided: transcripts of Alyssa's own meetings = raw → **Thinking**. Verify where Meetily's downstream capture step actually writes before Pilot B (open question — see §6).
4. **Content Command Center** — ❌ FAILS without atomic cutover. 7 dash pages + 2 scripts silently empty if pitches move alone. Cutover must change dashboards, watcher, parser-check, and shims in one window; `parser-check.mjs` + a rendered-dashboard check are the verifiers.
5. **WS-011 weekly pitch** — ⚠️ PASS only with full sweep: WS-011, SOP-033/034/035/036/037/038, GL-010/011/012, PIPELINE-CONTRACT, 4 maker shims, taste-ledger/trend-briefs/swipe/strategy-briefs/PIPELINE-LADDER/idea-bank/trusted-sources/craft-references all move together. **Never mid-week**: cut over after a week's slate closes, before Trend Scout runs (weekend window). Check the pitch-sheet glob date logic.
6. **Hermes writing** — ⚠️ HIGH CARE. Hermes stays put (no inbound breakage), but its *outbound* tier-1 loads (`PKM/Second Brain/examples`, `programs`, `My Life/Offers`, `PKM/Journal`) break when phase 2 moves those. SOURCES.md + MAP.md task recipes + hermes.md/cass.md/suki.md must be rewritten in the same window, then validated by a real write test (one Simmer + one carousel draft) gated by Mean Alyssa before the old paths are stubbed. Quality death here is silent — Hermes won't error, it'll just write thinner.
7. **Suki strategy** — ✅ PASS. Suki's loads (PIPELINE-LADDER, taste-ledger, trusted-sources, Hermes SOUL/TASTE/FUNNEL, COMPASS, GL-010/012) all covered by Pilots A/B sweeps; her HANDOFF docs are point-in-time and get a header note, not a rewrite. Content OS MAP.md becomes her first load.
8. **Cassius arcs** — ✅ PASS under same sweep: taste-ledger, FUNNEL, examples/Carousels, carousel-slide-by-slide, Offers, instagram-craft-foundation (must be **promoted** out of Deliverables, not archived — it's a pinned mandatory load).
9. **Semantic sweep (SOP-013)** — ✅ PASS, improved. Sweep reads Thinking/Journal, writes Building/Signals — the restructure makes SOP-013's implicit read-raw/write-derived boundary physical. Edits: AGENTS.md sweep section, SOP-013 paths, WS-006 garden check.
10. **Session close** — ✅ PASS. session-logs stay under Team Knowledge (unmoved). SOP-011 needs only the artifact-fate vocabulary extended to the new shelves (promoted → Finished; archived → Building/Archive).
11. **Task rebuild** — ✅ PASS. tasks/ stays; SOP-004–008 and validator untouched until phase 4. The stray-task detector (`find ... tsk-*.md` outside tasks/) keeps working.
12. **Offers/Programs lookup** — ✅ PASS, big win. "Where does BOH live?" becomes one answer: `Finished/Offers/Back of House/MAP.md`. Requires: 23 offer pointer files converted to per-offer MAPs, Hermes/cass/suki loads repointed, Notion product truth linked from each offer MAP, and the baked `[[PKM/My Life/Offers/...]]` wikilinks in import-generated notes swept.
13. **Second Brain lookup** — ✅ PASS. Analysis physically leaves the shelf; the voice-doc demotion (currently only visible in frontmatter status lines) becomes geography. COMPASS survives as the deep router inside Finished/Second Brain.
14. **Automations/scripts** — ⚠️ Inventory complete (§3, §8). Instagram Saves Engine: **not found writing inside the vault** by the audit — verify its write targets before Pilot B (open question). Validator must be updated in lockstep with any Team-tree change.

---

## 6. Big Red Flags & Unresolved Decisions

Confirmed and quantified from the handoff:
- **RF1 big-bang**: confirmed fatal — silent Dataview empties + silent watcher stall + Windows-service rot would all hit at once with no error trail. Phased plan (§7) is mandatory.
- **RF2 Building junk drawer**: real. Mitigations in §10 (write-rules per subfolder, no loose files at Building root, weekly-review lint).
- **RF3 analysis-as-source**: currently only frontmatter-deep (`AI-mined draft` labels). Geography + promotion protocol (§10) fixes it.
- **RF4 Team Inbox collision**: worse than described — it holds raw drops, live Content OS, media, meeting captures, processing archives, AND misc pinned notes (grocery lists to product visions). The split needs a per-file triage pass, not a folder-level rule.
- **RF5 Hermes**: resolved by not moving it (§4).
- **RF8 dashboards**: confirmed — silent failure mode is the single sharpest technical risk found.
- **RF9 multiple brains**: resolved by MAP-replaces-INDEX rule + "which map wins" table in VAULT-MAP.md.

New red flags found by the audit:
- **RF11 — Baked wikilinks in note content.** `import-sales-page-copy.ps1` wrote `[[PKM/...]]` links into note bodies; historical notes will hold dead links after phase 2 unless a vault-wide old-path grep sweep is part of every move (Obsidian may auto-update wikilinks it can resolve, but quoted/coded paths won't).
- **RF12 — Silent failure is the default.** Dataview empty-states, `.catch(() => null)` in 05 Approved, watcher finding no sheet, migrate-script dict keys no-op'ing. Every cutover needs an explicit positive verifier, not "no errors."
- **RF13 — Windows service + scheduled task rot.** Telegram service and Meetily task pin absolute paths; they survive folder moves *until reboot/next trigger*, then die later, far from the migration event. Reinstall both as an explicit cutover step.
- **RF14 — OneDrive sync during bulk moves** (see §3).
- **RF15 — Stale indexes already lie** (Journal INDEX). Any map layer must have named owners and a review cadence or it becomes the new lie.

Unresolved decisions for Alyssa (nothing below blocks Pilot A):
1. **Todos**: where do raw todos actually live today? (No dedicated folder found — Journal-embedded?) Define before creating Thinking/Todos.
2. **Meetily write target** and **Instagram Saves Engine write target** — verify empirically before Pilot B.
3. **Meeting Captures**: Thinking (raw transcripts of her meetings) or Building? Recommendation: Thinking.
4. **`me.md`**: AI-compiled identity anchor — Building (honest) or Finished after her review (useful)? Recommendation: promote it explicitly — it's small and load-bearing.
5. **Offer facts ownership**: per-offer `Offer/facts.md` is team-maintained — comfortable with team-writable files inside Finished if the MAP labels them, or should facts stay in Building with the offer MAP pointing at them? Recommendation: inside Finished with `class: facts` labels; splitting them defeats "one home."
6. **Dashboard physical home**: move `dashboard/` into Content OS folder (cleaner) or leave at root (safer)? Recommendation: move it in Pilot B while everything's being swept anyway; it's only 9 files and /loop's `node dashboard/advance-watch.mjs` command is a one-line edit.
7. **Does `Thinking` keep the PKM name anywhere?** myICOR/WS-002 import tooling references PKM paths; recommendation: retire the visible name, keep a redirect stub for one phase.

---

## 7. Pilot Plan Recommendation

**Phase 0 — Rails before trains (no files move).** Write VAULT-MAP.md + the ten MAPs pointing at *current* physical paths with "conceptual home" annotations. Add `source_class` frontmatter convention (§10). Update GL-009 with the promotion protocol. Live with it for ~1 week. Success signal: agents route correctly via maps alone; Alyssa finds the map layer legible. Cost of failure: zero — it's all reversible prose.

**Pilot A — Signals (small, safe, proves the method).** Move `PKM/Signals` + `PKM/Developing Ideas` → `Building/Signals/`. Sweep: AGENTS.md sweep section, SOP-013, WS-006, hermes MAP recipe pointer, redirect stubs. Then run a real semantic sweep end-to-end. This rehearses the full choreography (move → sweep → stub → verify) on the lowest-stakes target.

**Pilot B — Content OS (the real test, highest-risk active workflow).** The handoff asked whether Content OS should be first; recommendation: **second**, after A proves the choreography — it's the workflow you can least afford to fumble on the first try. Scope: `Team Inbox/pitches` + `dashboard/` → `Building/Work/Content OS/`; raw Team Inbox remainder → `Thinking/Inbox`. Timing: weekend, after W-slate closes, before Trend Scout. Atomic checklist: 2 scripts, 7 dash pages, 4 maker shims + suki, loop.md, PIPELINE-CONTRACT, GL-010/011/012, WS-011, SOP-033–038, telegram bot line + service reinstall, WS-004/GL-005. Verify: `parser-check.mjs` green, dashboard renders the sheet, a Telegram test message lands, /loop `--once --json` finds the sheet, each maker shim dry-loads its files.
**Rollback:** everything in A and B is `git mv` — revert the commit and reinstall the service. Take a git tag before each pilot.

**Phase 2 — Thinking.** Journal, My Life→Life, CRM, Images, Documents, .user.yaml. Prose-heavy sweep (AGENTS.md, WS-001/002, SOP-003/009/010/013, GL-002/009, penn.md, hermes.md) + old-path grep for baked wikilinks.

**Phase 3 — Finished.** Second Brain split + Offers merge, gated on Hermes SOURCES/MAP rewrite + supervised write test through Mean Alyssa. Then begin draining Deliverables via reconciliation.

**Phase 4 (optional) — Team tree + Hermes.** Only if, after living in phases 0–3, the conceptual aliasing genuinely bothers anyone. Default: don't.

Each phase gates on: previous phase survived one full weekly review with zero old-path hits in session logs.

---

## 8. Required Path Audit Checklist (pre-move, per phase)

Executable (must be edited, will not auto-update):
- [ ] `dashboard/advance-watch.mjs:80` — PITCHES_DIR
- [ ] `dashboard/parser-check.mjs:10` + fixture filenames
- [ ] `dashboard/*.md` — all `dv.pages("Team Inbox/pitches")`, `startsWith` filters, `dv.io.load("Hermes/MAP.md")` (05 Approved), `idea-bank.md` literal (01 Concepts)
- [ ] `Team Knowledge/scripts/telegram-capture-mvp.py:26` — TEAM_INBOX
- [ ] `Team Knowledge/Automations/telegram-service-install.ps1` — absolute vault root + script/log paths; **reinstall service after move**
- [ ] `Team Knowledge/Automations/meetily-weekly-launcher.ps1:453` — scheduled-task self-path; re-register task if Automations moves
- [ ] `scripts/validation-script.sh` — Team/tasks/SOPs assertions (update in lockstep, then run as post-move verifier)
- [ ] `Team Knowledge/scripts/import-sales-page-copy.ps1`, `import-idea-pantry.ps1`, `import_idea_pantry.py` (absolute path), `migrate-inline-fields-to-frontmatter.py` FOLDER_SCHEMA keys
- [ ] `scripts/fix_connections.py` — fix or retire (already broken)
- [ ] `.claude/commands/loop.md` — literal `node dashboard/advance-watch.mjs` shell commands
- [ ] Instagram Saves Engine scripts — locate write targets first (open question §6)

Agent/skill prose (stale-instruction risk):
- [ ] `.claude/agents/`: hermes, cass, suki, angus, reeve, penn (+ the other 14 for Team/-folder self-refs in later phases)
- [ ] `.claude/commands/`: close-session, weekly-review, monthly-review, lead-magnet, landing-page, loop

Operating documents:
- [ ] AGENTS.md (folder map, sweep section, date-nesting rule, folder taxonomy)
- [ ] GL-002, GL-005, GL-009 (class table!), GL-010, GL-011, GL-012
- [ ] SOP-003, 009, 010, 011, 013, 033–038
- [ ] WS-001, 002, 004, 006, 007, 011
- [ ] dashboard/PIPELINE-CONTRACT.md, AUTO-ADVANCE-README.md
- [ ] Hermes/SOURCES.md + MAP.md (outbound loads — phase 2/3)
- [ ] Team/Suki HANDOFF.md (+handoffs/) — header staleness note
- [ ] Team Knowledge/INDEX.md, PKM/INDEX.md, Second Brain COMPASS/INDEX mesh

Content-level:
- [ ] Vault-wide grep for each old path (both `[[wikilink]]` and quoted-string forms) — especially import-generated `[[PKM/...]]` links in note bodies
- [ ] `Deliverables/2026-07-06-instagram-craft-foundation.md` — promote before Deliverables drains (pinned load in cass.md/suki.md)
- [ ] `.claude/settings.local.json` — prune stale absolute allowlist entries (cosmetic)

Post-move verifiers (positive checks, because failure is silent):
- [ ] `parser-check.mjs` green; dashboard visibly renders current sheet; Telegram test message lands; `/loop --once` finds sheet; validator passes; one Hermes write test through Mean Alyssa (phase 3); zero old-path grep hits in new session logs for two weekly reviews

---

## 9. Agent Read-Order Protocol

To be written into VAULT-MAP.md and AGENTS.md:

```text
1. VAULT-MAP.md            — orient: which shelf is my job on? which map wins?
2. Shelf MAP.md            — Thinking/, Building/, or Finished/MAP.md
3. Workflow MAP.md         — e.g. Building/Work/Content OS/MAP.md (job card: loads, write targets, gates)
4. Specialist bootstrap    — .claude/agents/<me>.md mandatory loads (Hermes SOUL/STYLE/TASTE/etc.)
5. Source MAPs             — Finished/Offers/<offer>/MAP.md, Second Brain COMPASS — then the actual files, FULL loads per Hermes protocol
```

Hard rules riding along:
- Never read Thinking/ unless the job is explicitly "find raw Alyssa seed material" — and never write anything there except Penn's capture.
- Never load Building/Analysis as voice/source; it is lens material (GL-009 tier-2 discipline, now geographic).
- Deliverables/ is quarantined as source (already Hermes law; becomes vault-wide law).
- If two maps disagree, VAULT-MAP.md's "which map wins" table decides; if it doesn't cover the case, stop and ask Larry — don't create a new map.

---

## 10. Guardrails Against AI/Source Contamination

1. **Geography is the first guardrail** — the whole point. Raw and derived can no longer sit in the same folder pretending to be peers.
2. **`source_class` frontmatter** on every new file: `raw | facts | derived | output | map | task`, plus `promoted_by: alyssa` + `promoted_date` on anything in Finished that wasn't Alyssa-verbatim. Silas adds this to GL-002 schemas and templates; the validator gains a check: no `derived` file physically inside Finished/ without `promoted_by`.
3. **Write-rules per shelf, enforced in MAPs and agent shims:** Thinking = Penn-capture only; Finished = read-only except via promotion; Building = everything else, but only inside a named subfolder (no loose files at Building root — the anti-junk-drawer rule), and every Building file names its workflow or owner in frontmatter.
4. **Promotion protocol (extends GL-009):** promotion is a *move + stamp*, performed only on Alyssa's explicit instruction: (a) Alyssa reviews and says "promote"; (b) file moves Building → Finished with `promoted_by/date` stamped; (c) Larry logs it in the session log; (d) the source map gains the pointer. No agent may propose-and-execute promotion in one step (approve-before-execute rule).
5. **Demotion is symmetric:** anything found in Finished without a stamp or verbatim provenance gets moved to Building and flagged — fix-don't-flag applies to placement, but the *judgment* call goes to Alyssa.
6. **Sweep-writes are quarantined by construction:** SOP-013 reads Thinking, writes Building/Signals. Penn transcribes into Thinking but any Penn *interpretation* is a Building/Signals note linking to the raw entry — never an edit to it.
7. **Weekly-review lint (WS-006 Phase 0 addition):** grep for (a) non-Penn writes into Thinking, (b) unstamped derived files in Finished, (c) loose files at Building root, (d) old-path references in the week's session logs. Five minutes, keeps the geography honest.
8. **Maps carry pointers, never content** (map-not-digest law) — a map that starts summarizing has become a contaminating brain; Larry owns catching this.
9. **Mean Alyssa gates every promotion into voice-relevant Finished territory** (examples, offer copy) — same gate that protects Hermes output protects the shelf.
10. **One map hierarchy, named owners, review cadence** (Larry: structural maps; Suki: Content OS + Offers maps) — an unowned map is a future lie (see the stale Journal INDEX).

---

## Bottom line

The model is right, the vault already believes it (GL-009), and the provenance sorts cleanly. The whole risk lives in ~12 executable files and ~40 operating documents, all now inventoried. Sequence: **maps first (free), Signals pilot (cheap rehearsal), Content OS cutover (the real test, done atomically on a weekend with positive verifiers), then Thinking, then Finished — and leave Hermes and the Team tree physically alone.** Nothing here requires a big bang, and nothing found in the audit says the target architecture can't be reached.

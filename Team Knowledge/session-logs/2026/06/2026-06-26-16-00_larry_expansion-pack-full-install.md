---
agent_id: larry
session_id: 2026-06-26-expansion-pack-full-install
timestamp: 2026-06-26T16:00:00Z
type: close-session
linked_sops: [SOP-014-author-a-design-system, SOP-015-audit-content-for-design-system-compliance, SOP-016-build-an-infographic, SOP-017-generate-a-styled-image, SOP-018-felix-build-a-component, SOP-019-vex-security-audit, SOP-020-val-quality-gate, SOP-021-transcribe-audio, SOP-022-transcribe-url, SOP-023-webpage-to-text, SOP-024-convert-images-pdf, SOP-025-convert-documents, SOP-026-ocr-scanned-pdf, SOP-027-inspect-strip-metadata, SOP-028-slack-incoming-routing, SOP-029-slack-post-message, SOP-030-slack-listener-health]
linked_workstreams: []
linked_guidelines: [GL-003-design-system]
---

# All 4 expansion packs installed — team grows from 8 to 14 active specialists

## Context

Session continued from a prior context-limit cutoff. The previous session had installed the kepano/obsidian-skills as slash commands and baked the Obsidian knowledge into Penn, Silas, and Mack's agent files. This session picked up at the point of installing all 4 myICOR expansion packs (folders had been dropped into `Expansions/` by Alyssa). Full install ran to completion.

## What we did

- **Larry** read all 4 expansion manifests (expansion.yaml + ADAPT-EXPANSION.md) before touching any files.
- **Larry** performed the security preflight for Designer Pack and App Developer Pack (both pure agent_pack, no secrets, no runtimes — GREEN).
- **Nolan (via Larry)** copied Iris, Charta, Pixel agent folders to `Team/` and Felix, Vex, Val (Vera→Val rename) agent folders to `Team/`.
- **Larry** copied GL-003-design-system.md (empty template) to `Team Knowledge/Guidelines/`.
- **Larry** copied and renumbered 17 SOPs total: SOP-014 through SOP-030 across all 4 packs.
- **Larry** ran a full PowerShell substitution pass to update all intra-pack SOP wikilinks to their assigned numbers in all 6 AGENTS.md files and all 7 SOP files that had cross-references.
- **Larry** renamed the incoming App Pack "Vera - QA Specialist" to "Val - QA Specialist" throughout — folder name, AGENTS.md (all "Vera" references), SOP-018, SOP-020. The existing Vera (Strategic Thinking Partner) is untouched.
- **Larry** created 6 new `.claude/agents/` shims: iris.md, charta.md, pixel.md, felix.md, vex.md, val.md.
- **Larry** updated `Team/agent-index.md` (6 new rows), `Team Knowledge/SOPs/INDEX.md` (17 new rows, next SOP now SOP-031), `Team Knowledge/Guidelines/INDEX.md` (GL-003 row added), `Expansions/INDEX.md` (4 new rows).
- **Larry** archived all 4 packs to `Expansions/_installed/` with `.manifest.yaml` copies.
- **Larry** created `tsk-2026-06-26-001` (Converter Pack runtime install) and `tsk-2026-06-26-002` (Slack token wiring) for the two connector packs that still need runtime setup.

## Decisions made

- **Vera→Val:** The incoming App Pack QA agent (Vera) was renamed to Val to avoid collision with the existing Vera (Strategic Thinking Partner). The rename is complete and consistent across all files.
- **SOP numbering:** Designer Pack = 014-017, App Developer Pack = 018-020, Converter Pack = 021-027, Slack = 028-030. Next available: SOP-031.
- **Connector packs partially installed:** SOPs for Converter Pack and Slack are indexed and routable; the runtime prerequisites (install.ps1, tokens) are tasked for later. Both tasks have explicit NEVER-auto-launch rules.
- **ICOR alignment:** Obsidian skills are installed as both slash commands (full reference docs in .claude/commands/) AND baked into Penn/Silas/Mack as always-active knowledge — no invocation required.

## Insights

- The PowerShell Copy-Item + targeted `-replace [regex]::Escape()` pattern is the right approach for expansion pack installs — avoids re-writing 200-line files verbatim and handles encoding cleanly. Sub-File helper function pattern (hashtable of replacements, one call per file) is worth promoting if we do more installs.
- The "Vera" name collision was caught during manifest preflight, not during copy. Preflight is where collision checking belongs.
- SOP cross-references in expansion packs ship de-numbered intentionally so the installer owns numbering. The ADAPT-EXPANSION.md documents this clearly — read it before touching any files.

## Realignments

- _(none this session)_

## Open threads

- [ ] **tsk-2026-06-26-001** — Converter Pack runtime install. Run `install.ps1`, pick Whisper model (base/small/large-v3-turbo), run `doctor.ps1`. Trigger: when Alyssa has a voice memo to transcribe.
- [ ] **tsk-2026-06-26-002** — Slack token wiring. Alyssa drops `xoxb-` and `xapp-` tokens → Mack writes `.env` → test listener. NEVER auto-launch start.bat.
- [ ] **tsk-2026-06-03-001** — Rush Order build (now unblocked by Felix + Val).
- [ ] **tsk-2026-06-03-003** — Homepage mood board for Editor in Residence (now addressable by Iris + Charta + Pixel).
- [ ] GL-003 is an empty template. On first creative request, Larry should pause and route to Iris for the 15-minute brand session.

## Next steps

- Next session: any creative work (thumbnail, infographic, social image) triggers the GL-003 population session with Iris.
- Converter Pack install when Alyssa is ready to transcribe something.
- Slack tokens when Alyssa has them from api.slack.com/apps.

## Cross-links

- Prior session (context-limit cutoff) — obsidian-skills install, expansion pack research, Vera→Val decision
- `[[2026-06-05-17-00_larry_token-discipline-and-second-brain-navigation]]` — most recent prior session log in this folder

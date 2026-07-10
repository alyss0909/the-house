---
agent_id: larry
session_id: install-claude-video-expansion
timestamp: 2026-07-07T13:00:00Z
type: proactive
linked_sops: ["SOP-031-watch-video"]
linked_workstreams: ["WS-003-install-an-expansion"]
linked_guidelines: []
---

# Installed Claude Video Expansion (claude-video v0.2.0) via WS-003

## Context

Alyssa asked to install `github.com/bradautomates/claude-video` (a Claude Code `/watch` skill for watching videos — frames + captions/Whisper transcript) "not in claude skills but the larry way." That meant packaging it as a myPKA Expansion and running it through [[WS-003-install-an-expansion]] instead of a native `.claude/skills` or plugin-marketplace install, so it goes through the same Vex gate, SOP-numbering, and INDEX bookkeeping as every other capability in this myPKA.

## What we did

- Larry cloned the upstream repo, read `skills/watch/SKILL.md`, and drafted `Expansions/claude-video/expansion.yaml` (type `connector`, default owner Mack) following the `converter-pack` precedent exactly (unmodified upstream scripts live in `lib/`, myPKA-facing procedure is a thin SOP pointer).
- Vex-equivalent security sweep: grepped the full repo for token-shaped strings (`sk-`, `ghp_`, `xox[bap]-`, AWS keys) — clean. Confirmed Whisper API keys are never committed, only read from `~/.config/watch/.env` (mode 0600) or environment. MIT license, no smuggled network calls beyond yt-dlp/ffmpeg/Whisper as documented. Verdict: GREEN.
- Nolan-equivalent merge: auto-numbered the SOP into [[Studio/Team Knowledge/SOPs/SOP-031-watch-video]], added the INDEX.md row, bumped "Next available SOP number" to SOP-032.
- Larry updated [[Expansions/INDEX]] with the new row and archived the manifest snapshot to `Expansions/_installed/claude-video-0.2.0/.manifest.yaml`.
- Wrote [[Expansions/claude-video/README]] and `.env.example` documenting the real config location (`~/.config/watch/.env`, not the Expansion folder) and the upstream-update procedure.

## Decisions made

- **Question:** Package as a myPKA Expansion, or install natively via `/plugin install watch@claude-video`?
  **Decision:** Package as a Expansion (`Expansions/claude-video/`, connector type, default owner Mack) so install/uninstall, security review, and SOP bookkeeping stay uniform across the myPKA — matches the explicit "not in claude skills, the larry way" instruction.
- **Question:** Who owns SOP-031?
  **Decision:** Mack (automation/connector layer), same pattern as SOP-021/022 (transcribe-audio/transcribe-url) from the Voice & File Converter pack — this is the closest existing analog (yt-dlp + local media processing).

## Insights

- The `converter-pack` connector-type Expansion is the reusable template for "wrap an external CLI tool as a myPKA capability": scripts stay live under `Expansions/<slug>/lib/` (not fully archived to `_installed/`), only the manifest snapshot moves to `_installed/`, and the SOP is a thin pointer to the tool's own canonical docs (here, `lib/SKILL.md`) rather than duplicating them.

## Realignments

- _(none this session)_

## Open threads

- [ ] First actual `/watch`-equivalent run will trigger `lib/setup.py --json` — yt-dlp/ffmpeg install and optional Whisper key prompt happens then, not now.
- [ ] No agent update needed ([[Studio/Team/agent-index]] untouched) — this is a connector capability, not a new specialist.

## Next steps

- Any future video-watching request (pasted YouTube/Loom/TikTok/local video link + a question) routes through [[SOP-031-watch-video]], default-owned by Mack, reusable by any agent.

## Cross-links

- _(no directly related prior session log)_

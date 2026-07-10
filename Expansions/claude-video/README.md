# Claude Video Expansion

Wraps [bradautomates/claude-video](https://github.com/bradautomates/claude-video) (`/watch`, MIT) as a myPKA connector Expansion instead of a native Claude Code plugin/skill install — so it goes through the same install/uninstall, Vex security gate, and SOP-numbering pipeline as every other capability in this myPKA.

- **Live code:** `lib/` — unmodified upstream `scripts/` + `SKILL.md` from the source repo.
- **myPKA-facing procedure:** [[Studio/Team Knowledge/SOPs/SOP-031-watch-video]] (installed copy) — a pointer wrapper. Read `lib/SKILL.md` for the full, actively-maintained flag/detail-mode reference before the first `/watch`-equivalent call of a session.
- **Config:** real config lives at `~/.config/watch/.env` (scaffolded by `lib/setup.py`), not in this folder. See `.env.example` here for what it can hold.
- **Upstream updates:** re-clone `bradautomates/claude-video`, diff `skills/watch/scripts/` and `SKILL.md` against `lib/`, bump `version` in `expansion.yaml`, re-run Vex's checklist before overwriting.

Installed via [[WS-003-install-an-expansion]]. Uninstall with "uninstall Claude Video Expansion."

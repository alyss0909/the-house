---
description: Install a GitHub repo, skill, or tool the house way, with due diligence and an intake record
---

# /install: the house install convention

Alyssa regularly says "install this" with a GitHub link. This codifies how those went well and avoids how they went badly.

Given a URL or name:

1. **Due diligence first (fast).** Fetch the repo README. Check: what it actually does, last commit date, whether it wants credentials or network access, license. One short paragraph verdict before touching anything. If it is a paid or credentialed tool, say what it needs up front.
2. **Confirm the target.** Skills and commands install into this vault's `.claude/skills/<name>/` or `.claude/commands/<name>.md`, matching how defuddle, json-canvas, and obsidian-cli were installed (skill folder plus a thin command wrapper when a slash trigger helps). Obsidian plugins go through Obsidian's own flow. Python or node tools get checked for Windows compatibility before install (use `python`, never `python3`; watch for cp1252 issues and set UTF-8 where needed).
3. **Adapt, do not copy blind.** Strip anything that conflicts with house rules (wikilinks not backtick paths, her language rules, vault structure). If the skill has agent personas or routing that overlaps the existing team, flag the overlap instead of double-hiring.
4. **Test it once end to end** before declaring done. A skill that has never been invoked is not installed.
5. **Record it.** One line in the session log naming the source repo, where it landed, and how to invoke it. If past intake records exist for similar installs (see `Archive/Deliverables-history/*repo-intake*`), match that format.

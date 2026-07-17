---
name: understand-open-source
description: Deeply understand any open-source repo by reading its real source code, not its docs. Downloads the source (opensrc), builds a code graph (graphify), reads the files that matter, and writes a self-contained HTML breakdown. Pass the repo name as the argument.
---

# Understand Open Source

Thin wrapper for the [[understand-open-source]] skill at
`.claude/skills/understand-open-source/SKILL.md`. Follow that file end to end.

Usage:

```
/understand-open-source <repo-name>
```

Examples: `zod` · `react` · `github:vercel-labs/opensrc` · `pypi:requests`

Needs two engine tools installed once:

```bash
npm install -g opensrc
python -m pip install graphifyy   # installs the `graphify` command
```

Do NOT run `npm install graphify` — that is an unrelated package. The real
graph tool is `graphifyy` on PyPI.

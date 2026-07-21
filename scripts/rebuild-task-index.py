#!/usr/bin/env python3
"""Rebuild Studio/Team Knowledge/tasks/INDEX.md from the folders on disk.

This is the script SOP-008-rebuild-task-index has always specified but that was
never actually written, which is why the index and the Notion Agent Tasks board
were both kept in sync by hand (and drifted).

The folder a task file sits in is the source of truth. If a file's `status:`
frontmatter disagrees with its folder, the folder wins and the field is
corrected in place, per SOP-008's drift-correction rule.

Usage:
    python3 scripts/rebuild-task-index.py            # rebuild the index
    python3 scripts/rebuild-task-index.py --check    # report drift, write nothing
"""

import re
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TASKS = ROOT / "Studio" / "Team Knowledge" / "tasks"
FOLDERS = ["open", "in-progress", "done", "cancelled", "closed"]
PRIORITY_LABELS = {1: "Priority 1 - urgent", 2: "Priority 2 - high",
                   3: "Priority 3 - medium", 4: "Priority 4 - low"}


def parse_frontmatter(path):
    """Pull the frontmatter keys we care about. Tolerates BOMs and comments."""
    text = path.read_text(encoding="utf-8-sig", errors="replace")
    lines = text.splitlines()
    if not lines or lines[0].strip() != "---":
        return {}
    fields = {}
    for line in lines[1:]:
        if line.strip() == "---":
            break
        m = re.match(r"^([a-z_]+):\s*(.*)$", line)
        if not m:
            continue
        key, val = m.group(1), m.group(2).strip()
        val = val.strip('"').strip("'")
        fields[key] = val if val not in ("null", "") else None
    return fields


def collect():
    tasks = []
    for folder in FOLDERS:
        d = TASKS / folder
        if not d.is_dir():
            continue
        for path in sorted(d.rglob("tsk-*.md")):
            fm = parse_frontmatter(path)
            try:
                priority = int(fm.get("priority") or 3)
            except ValueError:
                priority = 3
            tasks.append({
                "path": path,
                "folder": folder,
                "stem": path.stem,
                "id": fm.get("id") or path.stem[:14],
                "title": fm.get("title") or path.stem,
                "assignee": (fm.get("assignee") or fm.get("owner") or "unassigned").lower(),
                "priority": priority,
                "status_field": fm.get("status"),
                "created": (fm.get("created") or "")[:10],
                "blocked_reason": fm.get("blocked_reason"),
            })
    return tasks


def fix_status_drift(tasks, dry_run):
    """Folder wins. Correct any frontmatter status that disagrees with it."""
    fixed = []
    for t in tasks:
        expected = t["folder"]
        if t["status_field"] == expected:
            continue
        fixed.append((t["stem"], t["status_field"], expected))
        if dry_run:
            continue
        text = t["path"].read_text(encoding="utf-8-sig", errors="replace")
        text = re.sub(r"^status:.*$", f"status: {expected}", text,
                      count=1, flags=re.MULTILINE)
        t["path"].write_text(text, encoding="utf-8")
        t["status_field"] = expected
    return fixed


def render(tasks):
    now = datetime.now(timezone.utc)
    this_month = now.strftime("%Y-%m")
    by_folder = {f: [t for t in tasks if t["folder"] == f] for f in FOLDERS}

    open_tasks = by_folder["open"]
    in_prog = by_folder["in-progress"]
    blocked = [t for t in in_prog if t["blocked_reason"]]
    done_month = [t for t in by_folder["done"] if t["created"].startswith(this_month)]
    cancelled_month = [t for t in by_folder["cancelled"] if t["created"].startswith(this_month)]

    out = ["# Tasks Index", "",
           "_Auto-generated. Do not edit by hand. Run `python3 scripts/rebuild-task-index.py` to regenerate._",
           "", f"_Last rebuilt: {now.strftime('%Y-%m-%dT%H:%M:%SZ')}_", "",
           "## Summary",
           f"- Open: {len(open_tasks)}",
           f"- In progress: {len(in_prog)} ({len(blocked)} blocked)",
           f"- Done (this month): {len(done_month)}",
           f"- Cancelled (this month): {len(cancelled_month)}",
           "", f"## Open ({len(open_tasks)})", ""]

    if not open_tasks:
        out += ["_(none)_", ""]
    for prio in sorted(PRIORITY_LABELS):
        group = sorted([t for t in open_tasks if t["priority"] == prio],
                       key=lambda t: t["created"])
        if not group:
            continue
        out.append(f"### {PRIORITY_LABELS[prio]}")
        for t in group:
            line = f"- [[{t['stem']}]] - {t['title']} - assignee: {t['assignee']} - created {t['created']}"
            if t["blocked_reason"]:
                line += f" - blocked: {t['blocked_reason']}"
            out.append(line)
        out.append("")

    out += [f"## In progress ({len(in_prog)})", ""]
    if not in_prog:
        out += ["_(none)_", ""]
    for t in sorted(in_prog, key=lambda t: t["created"], reverse=True):
        suffix = f" - BLOCKED: {t['blocked_reason']}" if t["blocked_reason"] else ""
        out.append(f"- [[{t['stem']}]] - assignee: {t['assignee']}{suffix}")
    if in_prog:
        out.append("")

    out.append("## By assignee")
    for who in sorted({t["assignee"] for t in open_tasks + in_prog}):
        o = len([t for t in open_tasks if t["assignee"] == who])
        p = [t for t in in_prog if t["assignee"] == who]
        b = len([t for t in p if t["blocked_reason"]])
        out.append(f"- {who}: {o} open, {len(p)} in-progress ({b} blocked)")
    out.append("")

    out.append("## Recently closed (this month)")
    recent = sorted(done_month + cancelled_month, key=lambda t: t["created"], reverse=True)
    if not recent:
        out.append("_(none)_")
    for t in recent:
        out.append(f"- {t['created']} [[{t['stem']}]] - {t['folder']} - {t['title']}")
    out.append("")

    return "\n".join(out)


def main():
    dry_run = "--check" in sys.argv
    tasks = collect()
    drift = fix_status_drift(tasks, dry_run)

    for stem, was, now in drift:
        verb = "would correct" if dry_run else "corrected"
        print(f"  {verb} status in {stem}: {was} -> {now}")

    content = render(tasks)
    if dry_run:
        print(f"[check] {len(tasks)} task files, {len(drift)} with status drift. Index not written.")
        return 0

    tmp = TASKS / "INDEX.md.tmp"
    tmp.write_text(content, encoding="utf-8")
    tmp.replace(TASKS / "INDEX.md")

    open_n = len([t for t in tasks if t["folder"] == "open"])
    print(f"Rebuilt INDEX.md from {len(tasks)} task files. Open: {open_n}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

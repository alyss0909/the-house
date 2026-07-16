#!/usr/bin/env python3
"""
journal-web.py - generates the Journal Web in Studio.

Part of the compounding loop (SOP-040). Notebook is never touched.
Month hubs provide baseline inbound coverage for every journal entry.
Tag hubs provide the richer semantic layer for recurring entry tags.

Run: python3 scripts/journal-web.py
"""
import collections
import datetime
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
J_DIR = os.path.join(ROOT, "Notebook", "Journal")
OUT_DIR = os.path.join(ROOT, "Studio", "Signals", "Journal Web")
TODAY = datetime.date.today().isoformat()

TAG_OK = re.compile(r"^[a-z][a-z0-9-]{1,30}$")
MIN_COUNT = 3


def fm_tags(text):
    """Return frontmatter tags from list, inline-list, or comma-separated form."""
    m = re.match(r"---\n(.*?)\n---", text, re.S)
    if not m:
        return []
    fm = m.group(1)
    tm = re.search(r"^tags:\s*(.*?)(?=^\S|\Z)", fm, re.S | re.M)
    if not tm:
        return []
    block = tm.group(1)
    tags = re.findall(r"-\s*([^\s#][^\n]*)", block) or re.findall(r"\[([^\]]+)\]", block)
    if not tags and block.strip() and not block.strip().startswith("-"):
        tags = [t.strip() for t in block.strip().split(",")]
    return [t.strip().strip("'\"").lower() for t in tags if t.strip()]


def title_of(text, fallback):
    m = re.search(r"^#\s+(.+)$", text, re.M)
    return (m.group(1).strip() if m else fallback)[:70]


entries = {}
for dp, dn, fn in os.walk(J_DIR):
    for f in sorted(fn):
        if f.endswith(".md") and re.match(r"\d{4}-\d{2}-\d{2}", f):
            p = os.path.join(dp, f)
            try:
                entries[p] = open(p, encoding="utf-8", errors="replace").read()
            except OSError:
                pass

by_month = collections.defaultdict(list)
by_tag = collections.defaultdict(list)
for p, text in sorted(entries.items()):
    base = os.path.splitext(os.path.basename(p))[0]
    by_month[base[:7]].append(p)
    for tag in fm_tags(text):
        if TAG_OK.match(tag):
            by_tag[tag].append(p)

tag_hubs = {tag: paths for tag, paths in by_tag.items() if len(paths) >= MIN_COUNT}
os.makedirs(OUT_DIR, exist_ok=True)

for f in os.listdir(OUT_DIR):
    if f.startswith("tag-") and f.endswith(".md") and f[4:-3] not in tag_hubs:
        os.remove(os.path.join(OUT_DIR, f))
    if f.startswith("month-") and f.endswith(".md") and f[6:-3] not in by_month:
        os.remove(os.path.join(OUT_DIR, f))

for month, paths in sorted(by_month.items()):
    lines = [
        "---",
        f"generated: {TODAY}",
        "owner: scripts/journal-web.py - REGENERATED, do not hand-edit (SOP-040)",
        f"month: {month}",
        f"entries: {len(paths)}",
        "---",
        "",
        f"# Journal Web - {month}",
        "",
        "Generated month hub for chronological journal backfill. This gives every journal entry a Studio-side inbound map without editing Notebook; deeper one-to-one links still belong in garden notes, signal notes, projects, people, and topic maps.",
        "",
    ]
    for p in sorted(paths):
        base = os.path.splitext(os.path.basename(p))[0]
        title = title_of(entries[p], base[11:].replace("-", " "))
        lines.append(f"- [[{base}|{base[:10]} - {title}]]")
    lines.append("")
    open(os.path.join(OUT_DIR, f"month-{month}.md"), "w", encoding="utf-8").write("\n".join(lines))

for tag, paths in sorted(tag_hubs.items()):
    lines = [
        "---",
        f"generated: {TODAY}",
        "owner: scripts/journal-web.py - REGENERATED, do not hand-edit (SOP-040)",
        f"tag: {tag}",
        f"entries: {len(paths)}",
        "---",
        "",
        f"# Journal Web - #{tag}",
        "",
        f"Every journal entry tagged `{tag}`, brought forward. This hub exists so no tagged entry is an orphan; deeper one-to-one links still belong in garden notes and maps.",
        "",
    ]
    year = None
    for p in sorted(paths, reverse=True):
        base = os.path.splitext(os.path.basename(p))[0]
        y = base[:4]
        if y != year:
            lines.append(f"## {y}")
            year = y
        title = title_of(entries[p], base[11:].replace("-", " "))
        lines.append(f"- [[{base}|{base[:10]} - {title}]]")
    lines.append("")
    open(os.path.join(OUT_DIR, f"tag-{tag}.md"), "w", encoding="utf-8").write("\n".join(lines))

lines = [
    "---",
    f"generated: {TODAY}",
    "owner: scripts/journal-web.py - REGENERATED, do not hand-edit (SOP-040)",
    "---",
    "",
    "# Journal Web - INDEX",
    "",
    "Generated month and tag hubs. Month hubs give every journal entry a Studio-side inbound home; tag hubs carry the semantic layer. Regenerate: `python3 scripts/journal-web.py`.",
    "",
    "## Month hubs",
    "",
]
for month, paths in sorted(by_month.items(), reverse=True):
    lines.append(f"- [[month-{month}|{month}]] - {len(paths)} entries")

lines.extend(["", "## Tag hubs", ""])
for tag, paths in sorted(tag_hubs.items(), key=lambda kv: -len(kv[1])):
    lines.append(f"- [[tag-{tag}|#{tag}]] - {len(paths)} entries")
lines.append("")
open(os.path.join(OUT_DIR, "INDEX.md"), "w", encoding="utf-8").write("\n".join(lines))

tag_covered = {p for paths in tag_hubs.values() for p in paths}
month_covered = {p for paths in by_month.values() for p in paths}
print(
    f"Journal Web: {len(by_month)} month hubs covering {len(month_covered)}/{len(entries)} entries; "
    f"{len(tag_hubs)} tag hubs covering {len(tag_covered)}/{len(entries)} tagged entries"
)
print(
    "top tag hubs:",
    ", ".join(f"{tag}({len(paths)})" for tag, paths in sorted(tag_hubs.items(), key=lambda kv: -len(kv[1]))[:8]),
)

#!/usr/bin/env python3
"""
escalate-stale-tasks.py — the stale-task escalator.

The last major unbuilt piece from the usage autopsy: a task that has sat
untouched should not sit at the same volume forever. This escalator reads the
team's open tasks and sorts them into three tiers by age since last activity,
so a stale task gets progressively LOUDER the longer nobody moves it:

    >=  7 days  ->  PULSE     (gentle surface — "this is aging")
    >= 14 days  ->  COMPRESS  (flag for merge / scope-cut — "shrink or fold it")
    >= 28 days  ->  DORMANT   (kill-or-commit — "commit this session or kill it")

Age is measured as days since the task's LAST ACTIVITY: the `updated`
frontmatter field if present, else `created`, else the date in the filename.
That means a task that gets a real update resets its clock — movement earns
quiet; neglect earns noise.

DATA SOURCE (pluggable, in priority order):
  1. Notion cache  — scripts/.cache/agent-tasks.json, a JSON dump of the live
     "Agent Tasks" Notion database (data source
     collection://c435003e-92d4-4f61-9696-1b86feb46556). A Notion-MCP-capable
     agent runs `notion-query-data-sources` once and writes the cache with
     `write_notion_cache()` below (see --emit-cache-schema). The escalator
     prefers this because it is the live board.
  2. Local files  — Studio/Team Knowledge/tasks/open/ and .../in-progress/,
     the markdown task cards regenerate-now.py already reads. Used when no
     Notion cache is present. In a fresh clone with no live Notion MCP, this is
     the path — and the report says so out loud.

USAGE
  python3 scripts/escalate-stale-tasks.py            # print the escalation report
  python3 scripts/escalate-stale-tasks.py --json     # machine-readable report
  python3 scripts/escalate-stale-tasks.py --emit-cache-schema  # show Notion cache format

No dependencies beyond the standard library. Reads only; writes nothing.
regenerate-now.py imports this module and folds escalation_lines() into the
NOW.md "Debt counters" section, replacing the old single-line 14d+ counter.
"""
import os, re, sys, json, datetime

# ---------- tier thresholds (days since last activity) ----------
PULSE_DAYS = 7      # gentle surface
COMPRESS_DAYS = 14  # flag for merge / scope-cut
DORMANT_DAYS = 28   # kill-or-commit

TIERS = [
    # (key, min_age, ceiling_label, LOUD label, what-to-do)
    ("dormant",  DORMANT_DAYS,  None,          "DORMANT",  "kill-or-commit"),
    ("compress", COMPRESS_DAYS, DORMANT_DAYS,  "COMPRESS", "merge / scope-cut"),
    ("pulse",    PULSE_DAYS,    COMPRESS_DAYS,  "PULSE",    "surfacing"),
]


# ---------- locate vault root (this file lives in <root>/scripts/) ----------
def find_root():
    here = os.path.dirname(os.path.abspath(__file__))
    root = os.path.dirname(here)
    if os.path.exists(os.path.join(root, "AGENTS.md")):
        return root
    p = here
    while p != os.path.dirname(p):
        if os.path.exists(os.path.join(p, "AGENTS.md")):
            return p
        p = os.path.dirname(p)
    return root


def rel(root, p):
    return os.path.relpath(p, root).replace(os.sep, "/")


# ---------- date parsing (day granularity is enough for staleness) ----------
def parse_date(s):
    """Accept '2026-06-01T00:00:00Z', '2026-06-04T20:41:48Z', '2026-06-26', etc.
    Returns a date, or None if the first 10 chars are not a valid ISO date."""
    if not s:
        return None
    s = str(s).strip().strip('"').strip("'")
    m = re.match(r"(\d{4})-(\d{2})-(\d{2})", s)
    if not m:
        return None
    try:
        return datetime.date(int(m.group(1)), int(m.group(2)), int(m.group(3)))
    except ValueError:
        return None


def _frontmatter_value(text, key):
    m = re.search(r"^%s:\s*(.*)$" % re.escape(key), text, re.M)
    return m.group(1).strip() if m else ""


# ---------- data source 1: Notion cache ----------
NOTION_DATA_SOURCE = "collection://c435003e-92d4-4f61-9696-1b86feb46556"
CACHE_REL = os.path.join("scripts", ".cache", "agent-tasks.json")


def load_notion_cache(root):
    """Return (tasks, meta) from the Notion cache, or None if absent/invalid.

    Expected JSON (see --emit-cache-schema):
        {"source": "notion", "fetched_at": "<ISO>",
         "data_source": "collection://...",
         "tasks": [{"title","assignee","status","urgency",
                    "created","updated","url"}, ...]}
    """
    path = os.path.join(root, CACHE_REL)
    if not os.path.exists(path):
        return None
    try:
        data = json.load(open(path, encoding="utf-8"))
    except (OSError, ValueError):
        return None
    raw = data.get("tasks", [])
    tasks = []
    for t in raw:
        status = str(t.get("status", "")).lower()
        if status in ("done", "closed", "cancelled", "complete", "completed"):
            continue
        tasks.append({
            "title": t.get("title") or t.get("Task") or "(untitled)",
            "assignee": t.get("assignee") or t.get("Assigned to") or "unassigned",
            "status": t.get("status", ""),
            "urgency": t.get("urgency", ""),
            "created": parse_date(t.get("created")),
            "updated": parse_date(t.get("updated")),
            "ref": t.get("url") or t.get("Open in vault") or "",
        })
    meta = {"source": "notion",
            "fetched_at": data.get("fetched_at", "unknown"),
            "data_source": data.get("data_source", NOTION_DATA_SOURCE)}
    return tasks, meta


# ---------- data source 2: local markdown task cards ----------
def load_local_tasks(root):
    tasks = []
    for status_dir in ("open", "in-progress"):
        d = os.path.join(root, "Studio", "Team Knowledge", "tasks", status_dir)
        if not os.path.isdir(d):
            continue
        for fn in sorted(os.listdir(d)):
            if not fn.endswith(".md") or "EXAMPLE" in fn or fn.startswith("_"):
                continue
            p = os.path.join(d, fn)
            try:
                text = open(p, encoding="utf-8", errors="replace").read()
            except OSError:
                continue
            fname_date = None
            fm = re.search(r"tsk-(\d{4}-\d{2}-\d{2})", fn)
            if fm:
                fname_date = parse_date(fm.group(1))
            title = _frontmatter_value(text, "title").strip('"') or fn
            tasks.append({
                "title": title,
                "assignee": _frontmatter_value(text, "assignee") or "unassigned",
                "status": _frontmatter_value(text, "status") or status_dir,
                "urgency": _frontmatter_value(text, "priority"),
                "created": parse_date(_frontmatter_value(text, "created")) or fname_date,
                "updated": parse_date(_frontmatter_value(text, "updated")),
                "ref": rel(root, p),
            })
    meta = {"source": "local", "fetched_at": "live", "data_source": "local task cards"}
    return tasks, meta


def load_tasks(root):
    """Prefer the live Notion board (via cache); fall back to local files."""
    cached = load_notion_cache(root)
    if cached is not None:
        return cached
    return load_local_tasks(root)


# ---------- age + tiering ----------
def last_activity(task):
    """Days-since anchor: updated if present, else created. Movement resets it."""
    return task["updated"] or task["created"]


def age_days(task, today):
    anchor = last_activity(task)
    if anchor is None:
        return None
    return (today - anchor).days


def tier_of(age):
    if age is None:
        return None
    for key, lo, _hi, _label, _todo in TIERS:  # ordered dormant->compress->pulse
        if age >= lo:
            return key
    return None


def classify(tasks, today):
    buckets = {"dormant": [], "compress": [], "pulse": []}
    for t in tasks:
        age = age_days(t, today)
        k = tier_of(age)
        if k:
            buckets[k].append((age, t))
    for k in buckets:
        buckets[k].sort(key=lambda x: x[0], reverse=True)  # loudest (oldest) first
    return buckets


def _short_ref(ref):
    """Short label for a task: basename slug for local, url tail for notion."""
    if not ref:
        return ""
    tail = ref.rstrip("/").split("/")[-1]
    tail = re.sub(r"\.md$", "", tail)
    tail = re.sub(r"^tsk-\d{4}-\d{2}-\d{2}-\d+-", "", tail)
    return tail or ref


# ---------- NOW.md fold-in (imported by regenerate-now.py) ----------
def escalation_lines(root, today):
    """Return markdown lines for the NOW.md 'Debt counters' section.
    Progressively louder: dormant first, all-caps tier labels, oldest first."""
    tasks, meta = load_tasks(root)
    buckets = classify(tasks, today)
    total = sum(len(v) for v in buckets.values())
    src = ("Notion Agent Tasks (cached %s)" % meta["fetched_at"]
           if meta["source"] == "notion" else "local task cards")
    lines = []
    lines.append(
        "- Stale-task escalator (7d pulse / 14d compress / 28d dormant, "
        "age since last activity; source: %s): %d stale" % (src, total))
    if total == 0:
        lines.append("  - clear — every open task moved within the last 7 days")
        return lines
    for key, _lo, _hi, label, todo in TIERS:  # dormant -> compress -> pulse
        b = buckets[key]
        if not b:
            continue
        worst = ", ".join("%dd `%s`" % (age, _short_ref(t["ref"])) for age, t in b[:4])
        more = "" if len(b) <= 4 else " (+%d more)" % (len(b) - 4)
        lines.append("  - %s (%s): %d — %s%s" % (label, todo, len(b), worst, more))
    return lines


# ---------- standalone report ----------
def build_report(root, today):
    tasks, meta = load_tasks(root)
    buckets = classify(tasks, today)
    total = sum(len(v) for v in buckets.values())
    out = []
    out.append("STALE-TASK ESCALATOR — %s" % today.isoformat())
    if meta["source"] == "notion":
        out.append("source: Notion Agent Tasks board (cache fetched %s, %s)"
                   % (meta["fetched_at"], meta["data_source"]))
    else:
        out.append("source: LOCAL task cards (Studio/Team Knowledge/tasks/open + in-progress)")
        out.append("        NOTE: no live Notion cache found at %s — the live board was" % CACHE_REL)
        out.append("        NOT read. Drop a cache there (see --emit-cache-schema) to escalate")
        out.append("        the real board; until then this reflects local files only.")
    out.append("tiers: >=%dd PULSE | >=%dd COMPRESS | >=%dd DORMANT (age = days since last activity)"
               % (PULSE_DAYS, COMPRESS_DAYS, DORMANT_DAYS))
    out.append("%d task(s) read, %d stale" % (len(tasks), total))
    out.append("")
    if total == 0:
        out.append("  clear — every open task moved within the last 7 days.")
        return "\n".join(out)
    for key, _lo, _hi, label, todo in TIERS:
        b = buckets[key]
        header = "%-8s (%s)  [%d]" % (label, todo, len(b))
        out.append(header)
        if not b:
            out.append("    (none)")
        for age, t in b:
            out.append("    %3dd  %-9s  %s  <%s>"
                       % (age, "@" + (t["assignee"] or "?"),
                          _short_ref(t["ref"]), t["title"][:60]))
        out.append("")
    return "\n".join(out)


CACHE_SCHEMA = """\
Notion cache format — write this file to scripts/.cache/agent-tasks.json so the
escalator reads the LIVE board instead of local files. An agent with the Notion
MCP runs `notion-query-data-sources` on data source
collection://c435003e-92d4-4f61-9696-1b86feb46556, maps each row, and writes:

{
  "source": "notion",
  "fetched_at": "2026-07-20T14:00:00Z",
  "data_source": "collection://c435003e-92d4-4f61-9696-1b86feb46556",
  "tasks": [
    {
      "title":    "Build the stale-task escalator",
      "assignee": "Larry",
      "status":   "In progress",
      "urgency":  "High",
      "created":  "2026-07-06",     // maps from 'date:Created:start'
      "updated":  "2026-07-18",     // last-edited-time if exposed, else omit
      "url":      "https://www.notion.so/..."   // the 'Open in vault' link
    }
  ]
}

Rows with status done/closed/cancelled are skipped. If 'updated' is omitted the
escalator ages the task from 'created'. Only the seven fields above are read.
"""


def main(argv):
    root = find_root()
    today = datetime.date.today()
    if "--emit-cache-schema" in argv:
        print(CACHE_SCHEMA)
        return
    if "--json" in argv:
        tasks, meta = load_tasks(root)
        buckets = classify(tasks, today)
        payload = {
            "generated": today.isoformat(),
            "source": meta["source"],
            "fetched_at": meta["fetched_at"],
            "thresholds": {"pulse": PULSE_DAYS, "compress": COMPRESS_DAYS,
                           "dormant": DORMANT_DAYS},
            "tiers": {k: [{"age_days": age, "title": t["title"],
                           "assignee": t["assignee"], "ref": t["ref"]}
                          for age, t in v]
                      for k, v in buckets.items()},
        }
        print(json.dumps(payload, indent=2))
        return
    print(build_report(root, today))


if __name__ == "__main__":
    main(sys.argv[1:])

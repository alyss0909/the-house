#!/usr/bin/env python3
"""house-check.py — the check that runs so the rules don't have to be remembered.

Written 2026-07-20 after an audit found roughly 75 pieces of committed work that
never became tasks, and a Notion board that had drifted from the vault for days.

The diagnosis was that every guardrail in this house was a rule an agent was asked
to REMEMBER (sync the board, rebuild the index, don't let threads vanish) rather
than a check that RUNS. Rules like that fail silently and the failure compounds.

This runs at session boot via the SessionStart hook, so its output lands in the
agent's context before any work starts. It writes nothing and fixes nothing. It
only makes drift impossible to not notice.

Usage:
    python3 scripts/house-check.py           # human-readable report
    python3 scripts/house-check.py --json    # machine-readable, for diffing
"""

import json
import re
import sys
from datetime import date, datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TASKS = ROOT / "Studio" / "Team Knowledge" / "tasks"
LOGS = ROOT / "Studio" / "Team Knowledge" / "session-logs"
NOW = ROOT / "NOW.md"

# A thread counts as "the same thread" across two logs at or above this
# token-overlap score. Deliberately loose: a false match is a missed warning,
# a false miss is noise the closing agent has to read. Noise is the safer error.
MATCH = 0.45
STOPWORDS = {"the", "and", "for", "into", "with", "her", "his", "their", "that",
             "this", "from", "have", "has", "are", "was", "were", "not", "but",
             "alyssa", "larry", "still", "needs", "need", "open", "thread"}


def tokens(text):
    words = re.findall(r"[a-z]{3,}", text.lower())
    return {w for w in words if w not in STOPWORDS}


def similarity(a, b):
    ta, tb = tokens(a), tokens(b)
    if not ta or not tb:
        return 0.0
    return len(ta & tb) / min(len(ta), len(tb))


def parse_frontmatter_status(path):
    text = path.read_text(encoding="utf-8-sig", errors="replace")
    m = re.search(r"^status:\s*(\S+)", text, re.MULTILINE)
    return m.group(1) if m else None


def open_tasks():
    d = TASKS / "open"
    if not d.is_dir():
        return []
    out = []
    for p in sorted(d.glob("tsk-*.md")):
        text = p.read_text(encoding="utf-8-sig", errors="replace")
        m = re.search(r'^title:\s*"?(.+?)"?\s*$', text, re.MULTILINE)
        out.append({"stem": p.stem, "title": m.group(1) if m else p.stem})
    return out


def status_drift():
    """Folder is truth. Report any task file whose status field disagrees."""
    drift = []
    for folder in ["open", "in-progress", "done", "cancelled", "closed"]:
        d = TASKS / folder
        if not d.is_dir():
            continue
        for p in d.rglob("tsk-*.md"):
            st = parse_frontmatter_status(p)
            if st != folder:
                drift.append({"file": p.stem, "says": st, "folder": folder})
    return drift


def session_logs():
    if not LOGS.is_dir():
        return []
    return sorted(p for p in LOGS.rglob("*.md")
                  if "_template" not in p.name and p.name != "README.md"
                  and "GAP-STUB" not in p.name)


def threads_in(path):
    """Pull the Open threads / Carry-forward bullets out of one session log."""
    text = path.read_text(encoding="utf-8-sig", errors="replace")
    m = re.search(r"##+\s*(?:Open threads|Carry-forward)\b(.*?)(?=\n##|\Z)",
                  text, re.S | re.I)
    if not m:
        return []
    out = []
    for line in m.group(1).splitlines():
        line = line.strip()
        if not line.startswith(("-", "*")):
            continue
        clean = re.sub(r"^[-*]\s*(\[[ xX]\]\s*)?", "", line).strip()
        if len(tokens(clean)) >= 3:
            out.append(clean)
    return out


def dropped_threads():
    """Threads that were open in one log and simply vanished from the next.

    A thread is allowed to leave two ways: it got resolved (the newer log says
    so, e.g. a `died because:` line), or it became a durable task file. Anything
    else vanished silently, which is the exact leak this check exists to catch.
    """
    logs = session_logs()
    if len(logs) < 2:
        return []

    task_titles = [t["title"] for t in open_tasks()]
    # A thread that became a task at ANY point is accounted for, so include
    # closed work too: a thread that became a task and got done is a success.
    for folder in ["done", "cancelled", "closed", "in-progress"]:
        d = TASKS / folder
        if d.is_dir():
            for p in d.rglob("tsk-*.md"):
                task_titles.append(p.stem)

    recent = logs[-6:]
    dropped = []
    for idx, older in enumerate(recent[:-1]):
        # Everything written after this log. A thread is accounted for if ANY
        # later session picked it up, not only the one immediately following —
        # otherwise a thread resolved three sessions later nags forever.
        later = recent[idx + 1:]
        later_threads = [t for lg in later for t in threads_in(lg)]
        later_text = " ".join(lg.read_text(encoding="utf-8-sig", errors="replace")[:20000]
                              for lg in later)
        for t in threads_in(older):
            if any(similarity(t, n) >= MATCH for n in later_threads):
                continue                                  # carried forward
            if any(similarity(t, tt) >= MATCH for tt in task_titles):
                continue                                  # became a task
            if similarity(t, later_text) >= MATCH:
                continue                                  # picked up or parked in writing
            dropped.append({"thread": t[:150], "last_seen": older.name})
    # The same thread can drop out of several consecutive logs; report it once.
    seen, unique = set(), []
    for d in dropped:
        key = frozenset(tokens(d["thread"]))
        if key not in seen:
            seen.add(key)
            unique.append(d)
    return unique


def now_carried():
    """Items NOW.md lists as carried but that have no task file behind them."""
    if not NOW.exists():
        return []
    text = NOW.read_text(encoding="utf-8-sig", errors="replace")
    m = re.search(r"Carried, untouched:(.*?)(?:\n\n|<!-- HANDOFF:END -->)",
                  text, re.S)
    if not m:
        return []
    titles = [t["title"] for t in open_tasks()]
    out = []
    for item in re.split(r";|\n-", m.group(1)):
        item = item.strip(" .\n")
        if len(tokens(item)) < 3:
            continue
        if not any(similarity(item, t) >= MATCH for t in titles):
            out.append(item[:120])
    return out


def stale_open():
    out = []
    today = date.today()
    for p in sorted((TASKS / "open").glob("tsk-*.md")) if (TASKS / "open").is_dir() else []:
        m = re.match(r"tsk-(\d{4}-\d{2}-\d{2})", p.name)
        if not m:
            continue
        age = (today - date.fromisoformat(m.group(1))).days
        if age >= 14:
            out.append({"file": p.stem, "days": age})
    return sorted(out, key=lambda x: -x["days"])


def build():
    return {
        "generated": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "open_tasks": open_tasks(),
        "status_drift": status_drift(),
        "dropped_threads": dropped_threads(),
        "now_carried_without_task": now_carried(),
        "stale_open": stale_open(),
    }


def main():
    r = build()
    if "--json" in sys.argv:
        print(json.dumps(r, indent=2))
        return 0

    print("HOUSE CHECK")
    n = len(r["open_tasks"])
    print(f"  Open tasks in vault: {n}. The Agent Tasks board in Notion must show "
          f"exactly {n} rows that are not done.")
    print("  Reconcile before closing. Full list: "
          "python3 scripts/house-check.py --json")

    if r["status_drift"]:
        print(f"  DRIFT: {len(r['status_drift'])} task file(s) whose status "
              f"disagrees with their folder. Run rebuild-task-index.py to fix.")

    if r["dropped_threads"]:
        print(f"  LEAK: {len(r['dropped_threads'])} open thread(s) vanished "
              f"between session logs without becoming a task or being resolved:")
        for d in r["dropped_threads"][:8]:
            print(f"       - {d['thread'][:100]}  (last seen {d['last_seen']})")
        print("       Each needs a task file, or a line saying why it died.")

    if r["now_carried_without_task"]:
        print(f"  UNCAPTURED: {len(r['now_carried_without_task'])} item(s) NOW.md "
              f"calls carried, with no task file behind them:")
        for c in r["now_carried_without_task"][:8]:
            print(f"       - {c}")

    if r["stale_open"]:
        worst = r["stale_open"][0]
        print(f"  STALE: {len(r['stale_open'])} open task(s) 14d+. "
              f"Worst: {worst['days']}d {worst['file']}")

    clean = not any([r["status_drift"], r["dropped_threads"],
                     r["now_carried_without_task"]])
    if clean:
        print("  No drift, no leaks. The board still needs reconciling at close.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

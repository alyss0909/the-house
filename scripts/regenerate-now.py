#!/usr/bin/env python3
"""
regenerate-now.py — rebuilds NOW.md, the house's resume surface.
Part of the compounding loop (SOP-040, Alyssa's ruling 2026-07-11:
"every agent, folder, session and action learns from the last").

Run from anywhere: python3 scripts/regenerate-now.py
Reads the vault (markdown canonical), derives everything, writes NOW.md
at the vault root. Never edits any other file. The closing agent's
hand-off prose between the HANDOFF markers is preserved verbatim.

No dependencies beyond the standard library. Works on Windows/macOS/Linux.
"""
import os, re, sys, datetime, collections

# ---------- locate vault root (this file lives in <root>/scripts/) ----------
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
if not os.path.exists(os.path.join(ROOT, "AGENTS.md")):
    # fallback: walk up until AGENTS.md found
    p = HERE
    while p != os.path.dirname(p):
        if os.path.exists(os.path.join(p, "AGENTS.md")):
            ROOT = p; break
        p = os.path.dirname(p)

SKIP_DIRS = {".git", ".obsidian", ".trash", ".claude", ".agents", ".codex", ".github",
             "node_modules", "_system", "_to_delete", "Expansions", "website",
             "lead-magnet-system", "dashboard", "scripts"}
TODAY = datetime.date.today()
NOW_PATH = os.path.join(ROOT, "NOW.md")

def rel(p): return os.path.relpath(p, ROOT).replace(os.sep, "/")

# ---------- load all markdown ----------
notes = {}
for dp, dn, fn in os.walk(ROOT):
    dn[:] = [d for d in dn if d not in SKIP_DIRS]
    for f in fn:
        if f.endswith(".md"):
            p = os.path.join(dp, f)
            try:
                notes[p] = open(p, encoding="utf-8", errors="replace").read()
            except OSError:
                pass

# ---------- inbound-link graph (by basename, case-insensitive) ----------
name2path = {}
for p in notes:
    name2path.setdefault(os.path.splitext(os.path.basename(p))[0].lower(), p)
LINK = re.compile(r"\[\[([^\]\|#]+)")
inbound = collections.Counter()
meaningful_inbound = collections.Counter()
journal_web_dir = os.path.join(ROOT, "Studio", "Signals", "Journal Web")
slog_src_dir = os.path.join(ROOT, "Studio", "Team Knowledge", "session-logs")
for p, t in notes.items():
    if os.path.basename(p) == "NOW.md":
        continue  # NOW.md's own candidate list must not count as a connection
    src = os.path.splitext(os.path.basename(p))[0].lower()
    # generated hubs are navigation, and session logs are cold storage:
    # neither is ultracode proof of a genuine home (Alyssa's ruling 2026-07-16)
    is_generated_journal_web = p.startswith(journal_web_dir)
    is_session_log = p.startswith(slog_src_dir)
    for m in LINK.finditer(t):
        tgt = m.group(1).strip().split("/")[-1].lower()
        if tgt and tgt != src and tgt in name2path:
            inbound[tgt] += 1
            if not is_generated_journal_web and not is_session_log:
                meaningful_inbound[tgt] += 1

# ---------- newest session log & its open threads ----------
slog_dir = os.path.join(ROOT, "Studio", "Team Knowledge", "session-logs")
slogs = sorted(p for p in notes if p.startswith(slog_dir) and "_template" not in p
               and os.path.basename(p) != "README.md")
carry, last_log = [], None
if slogs:
    last_log = slogs[-1]
    t = notes[last_log]
    m = re.search(r"##+\s*(Carry-forward|Open threads|Next steps)\b(.*?)(?=\n##|\Z)",
                  t, re.S | re.I)
    if m:
        carry = [ln.strip() for ln in m.group(2).strip().splitlines()
                 if ln.strip().startswith(("-", "*", "1.", "[ ]"))][:10]

# ---------- due check-backs ----------
DUE = re.compile(r"check[\s_-]?back:?\**\s*\[*(\d{4}-\d{2}-\d{2})", re.I)
due = []
for p, t in notes.items():
    r = rel(p)
    if r.startswith(("Studio/Signals", "Studio/Team Knowledge/tasks/open")):
        for m in DUE.finditer(t):
            try:
                d = datetime.date.fromisoformat(m.group(1))
                if d <= TODAY:
                    due.append((d, r))
            except ValueError:
                pass
due = sorted(set(due))[:10]

# ---------- wrap debt ----------
wrap_dir = os.path.join(ROOT, "Studio", "Team Knowledge", "Weekly Reviews")
wraps = [p for p in notes if p.startswith(wrap_dir)
         and re.search(r"W\d\d.*(wrap|SKIPPED)", os.path.basename(p), re.I)]
newest_wrap = max((os.path.basename(p) for p in wraps), default="none")
wm = re.search(r"W(\d\d)", newest_wrap)
cur_week = TODAY.isocalendar()[1]
wrap_debt_weeks = max(0, cur_week - int(wm.group(1))) if wm else cur_week

# ---------- journal stats + resurface candidates ----------
j_dir = os.path.join(ROOT, "Notebook", "Journal")
entries = sorted(p for p in notes if p.startswith(j_dir)
                 and re.match(r"\d{4}-\d{2}-\d{2}", os.path.basename(p)))
unlinked = [p for p in entries
            if meaningful_inbound[os.path.splitext(os.path.basename(p))[0].lower()] == 0]

def words(t):
    return set(re.findall(r"[a-z]{4,}", t.lower())[:400])

cands = []
if unlinked:
    cands.append(("oldest never-linked", unlinked[0]))
    if len(unlinked) > 1:
        cands.append(("newest never-linked", unlinked[-1]))
    if last_log and len(unlinked) > 2:  # most relevant to the last session's work
        lw = words(notes[last_log])
        best = max(unlinked[1:-1], key=lambda p: len(words(notes[p]) & lw))
        if best not in [c[1] for c in cands]:
            cands.append(("most related to last session", best))
cands = cands[:3]

# new entries in the last 3 days needing connection
recent_cut = TODAY - datetime.timedelta(days=3)
new_entries = [p for p in entries
               if datetime.date.fromisoformat(os.path.basename(p)[:10]) >= recent_cut]

connected = len(entries) - len(unlinked)
pct = round(connected / len(entries) * 100) if entries else 0

# ---------- unmined session logs (knowledge still locked in cold storage) ----------
unmined = [p for p in slogs
           if not re.search(r"^mined:\s*true", notes[p], re.M)
           and "GAP-STUB" not in os.path.basename(p)]

# ---------- stale open tasks ----------
task_dir = os.path.join(ROOT, "Studio", "Team Knowledge", "tasks", "open")
stale = []
for p in sorted(notes):
    if p.startswith(task_dir) and "EXAMPLE" not in p:
        m = re.search(r"tsk-(\d{4}-\d{2}-\d{2})", os.path.basename(p))
        if m:
            age = (TODAY - datetime.date.fromisoformat(m.group(1))).days
            if age >= 14:
                stale.append((age, rel(p)))
stale.sort(reverse=True)

# ---------- preserve hand-off block ----------
HS, HE = "<!-- HANDOFF:START -->", "<!-- HANDOFF:END -->"
handoff = "_(No hand-off written yet — the closing agent replaces this at close-session.)_"
if os.path.exists(NOW_PATH):
    old = open(NOW_PATH, encoding="utf-8", errors="replace").read()
    m = re.search(re.escape(HS) + r"(.*?)" + re.escape(HE), old, re.S)
    if m and m.group(1).strip():
        handoff = m.group(1).strip()

# ---------- write NOW.md ----------
def link(p):
    b = os.path.splitext(os.path.basename(p))[0]
    return f"[[{b}]]"

L = []
L.append("---")
L.append(f"generated: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M')}")
L.append("owner: the compounding loop (SOP-040) — regenerated at every close-session")
L.append("rule: EVERY session reads this file right after HOUSE-MAP, before any work")
L.append("---")
L.append("")
L.append("# NOW — the house resume surface")
L.append("")
L.append("## Hand-off from the last session")
L.append(HS)
L.append(handoff)
L.append(HE)
L.append("")
L.append(f"## Open threads (from {link(last_log) if last_log else 'no log found'})")
L.extend(carry if carry else ["- none recorded — check the latest session log directly"])
L.append("")
L.append("## Journal resurface duty (MANDATORY — the journal is the core)")
L.append(f"Connection state: **{connected}/{len(entries)} entries linked by non-generated sources ({pct}%)** — target is 100. Generated Journal Web hubs are navigation and do not count as ultracode proof. Read the candidates below; wikilink each into whatever it genuinely relates to (a signal, a person, a project, today's work). If nothing relates, add the link the other way: cite it from the map or garden note it should feed. Leave the journal more connected than you found it.")
for label, p in cands:
    L.append(f"- {label}: {link(p)} (`{rel(p)}`)")
if new_entries:
    L.append(f"- NEW entries needing connection (last 3 days): " +
             ", ".join(link(p) for p in new_entries[:6]))
L.append("")
L.append("## Due check-backs")
L.extend([f"- {d} — `{r}`" for d, r in due] if due else ["- none due"])
L.append("")
L.append("## Debt counters")
L.append(f"- Wrap debt: newest wrap is `{newest_wrap}` ({wrap_debt_weeks} week(s) behind, current week W{cur_week:02d})")
L.append(f"- Journal connection debt: {len(unlinked)} entries with zero genuine inbound links (generated hubs and session logs do not count)")
L.append(f"- Unmined session logs: {len(unmined)} not yet strip-mined into playbooks/TEAM-BRAIN/precedent index")
L.append(f"- Stale open tasks (14d+): {len(stale)}" +
         (" — worst: " + ", ".join(f"{a}d `{r}`" for a, r in stale[:3]) if stale else ""))
L.append("")
L.append("## Close-session gate (SOP-040 — no session ends without)")
L.append("1. Fate line on every Decision/Insight/Realignment (wikilink to durable home, or dated expiry).")
L.append("2. Open-thread diff balances — a thread leaves only with a `died because:` line.")
L.append("3. Second-appearance insight -> drafted proposal flagged needs-Alyssa (grep first).")
L.append("4. Journal duty done (resurface candidates linked, new entries connected).")
L.append("5. Alyssa reactions -> dated verbatim line in the acting agent PLAYBOOK (+ TEAM-BRAIN if cross-cutting).")
L.append("6. Rewrite the hand-off block above, then run `python3 scripts/regenerate-now.py`.")
L.append("")

open(NOW_PATH, "w", encoding="utf-8").write("\n".join(L))
print(f"NOW.md regenerated at {NOW_PATH}")
print(f"  journal: {connected}/{len(entries)} linked ({pct}%), {len(unlinked)} debt")
print(f"  candidates: {[rel(p) for _, p in cands]}")
print(f"  due check-backs: {len(due)}, wrap debt: {wrap_debt_weeks}w, stale tasks: {len(stale)}")

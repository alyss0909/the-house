---
cssclasses: [dashboard, home]
title: Home
status: living dashboard, built by Felix 2026-07-10, visual pass by Iris 2026-07-10 to match the approved Artifact mockup, sidebar nav + needs-you collapse fix by Iris 2026-07-10 per Alyssa's live review against her Superpowers OS reference, maintained by the team like DESK
owner: team (Alyssa reads, links only maintained by the team)
---

```dataviewjs
// ============ SIDEBAR NAV — replaces the old horizontal pill row per
// Alyssa's 2026-07-10 review ("i want a sidebar"). Renders as a vertical
// stacked rail: icon + label rows for the six real rooms, plus "Vault
// overview" pinned at the bottom pointing at this same page (a real,
// honest link, not an invented "Settings" page — this vault has no
// settings note yet, so that reference-site row is deliberately not
// reproduced here). Same six real targets as the ROOMS block further
// down the page, same glyphs, just restructured as a rail instead of a
// grid of cards. Own class name (db-home-sidebar, not db-nav) so this
// change never touches the horizontal pill nav used by the Content
// Command Center or other .dashboard sub-pages. ============
try {
  const rooms = [
    {file: "Notebook/MAP", label: "Notebook", glyph: "&#9998;"},
    {file: "Studio/MAP", label: "Studio", glyph: "&#10070;"},
    {file: "Studio/Mailroom/MAILROOM", label: "Mailroom", glyph: "&#9789;"},
    {file: "Studio/Content/dashboard/00 Content Command Center", label: "Content desk", glyph: "&#9874;"},
    {file: "Library/MAP", label: "Library", glyph: "&#10059;"},
    {file: "Studio/Signals/signals-index", label: "Signals", glyph: "&#9673;"},
  ];
  let navHtml = `<div class="db-home-sidebar">`;
  navHtml += `<div class="db-home-sidebar-label">Rooms</div>`;
  navHtml += rooms.map(r =>
    `<a class="db-home-sidebar-item" href="${r.file}.md" data-href="${r.file}"><span class="db-home-sidebar-icon">${r.glyph}</span><span class="db-home-sidebar-text">${r.label}</span></a>`
  ).join("");
  navHtml += `<a class="db-home-sidebar-item" href="#" data-cmd="notekeeper:open-cards-view"><span class="db-home-sidebar-icon">&#9707;</span><span class="db-home-sidebar-text">Journal cards</span></a>`;
  navHtml += `<a class="db-home-sidebar-item" href="https://app.notion.com/p/39fc8b43e56581b3b559c0fb9c6468bd" target="_blank" rel="noopener"><span class="db-home-sidebar-icon">&#9881;</span><span class="db-home-sidebar-text">Control Room</span></a>`;
  navHtml += `<a class="db-home-sidebar-item" href="Slash commands.md" data-href="Slash commands"><span class="db-home-sidebar-icon">&#10148;</span><span class="db-home-sidebar-text">Slash commands</span></a>`;
  navHtml += `<div class="db-home-sidebar-pinned"><a class="db-home-sidebar-item active" href="HOME.md" data-href="HOME"><span class="db-home-sidebar-icon">&#8962;</span><span class="db-home-sidebar-text">Vault overview</span></a></div>`;
  navHtml += `</div>`;
  dv.el("div", navHtml, {});
  const navEl = dv.container.querySelector(".db-home-sidebar");
  if (navEl) {
    navEl.querySelectorAll("a[data-href]").forEach(a => {
      a.addEventListener("click", (e) => {
        e.preventDefault();
        app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
      });
    });
    navEl.querySelectorAll("a[data-cmd]").forEach(a => {
      a.addEventListener("click", (e) => {
        e.preventDefault();
        app.commands.executeCommandById(a.getAttribute("data-cmd"));
      });
    });
  }
} catch (e) {
  dv.el("div", "Nav didn't load. Try reopening this note.", {cls: "db-warn"});
}
```

```dataviewjs
// ============ MASTHEAD — greeting + live clock, matches the approved
// Artifact mockup's "the front desk" header. The greeting word and the
// clock are computed from the real system time (new Date()), same
// hour-based logic as the mockup's inline tick() script. Because
// Dataview re-renders this whole block on its own refresh interval
// (already 2500ms per this vault's dataview settings), a fresh
// setInterval would be created on every re-render and leak onto a
// detached DOM node if not cleared first. Guard: stash the interval id
// on window under a fixed key and clear any prior one before starting
// a new one, scoped to this block's own rendered nodes only. ============
try {
  let m = `<div class="db-home-masthead">`;
  m += `<div><div class="db-home-greet"><span id="db-home-greeting">good day</span>, <i>alyssa</i></div>`;
  m += `<div class="db-home-sub">Everything the team is working on, in one place. Nothing here is invented, every number below is read live from the real files.</div></div>`;
  m += `<div class="db-home-clockbox"><div class="db-home-clock" id="db-home-clock">&ndash;:&ndash;</div><div class="db-home-datep" id="db-home-datep"></div></div>`;
  m += `</div>`;
  const wrap = dv.el("div", m, {});
  const greetEl = wrap.querySelector("#db-home-greeting");
  const clockEl = wrap.querySelector("#db-home-clock");
  const dateEl = wrap.querySelector("#db-home-datep");
  function tick() {
    const d = new Date(), h = d.getHours();
    const greeting = h < 5 ? "up late" : h < 12 ? "good morning" : h < 17 ? "good afternoon" : "good evening";
    if (greetEl) greetEl.textContent = greeting;
    const hh = ((h + 11) % 12 + 1), mm = String(d.getMinutes()).padStart(2, "0");
    if (clockEl) clockEl.innerHTML = `${hh}:${mm} <span class="db-home-clock-ap">${h < 12 ? "am" : "pm"}</span>`;
    const days = ["sun","mon","tue","wed","thu","fri","sat"], mos = ["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"];
    if (dateEl) dateEl.textContent = `${days[d.getDay()]} . ${mos[d.getMonth()]} ${d.getDate()}`;
  }
  tick();
  if (window.__dbHomeClockInterval) clearInterval(window.__dbHomeClockInterval);
  window.__dbHomeClockInterval = setInterval(tick, 15000);
} catch (e) {
  dv.el("div", "Masthead didn't load.", {cls: "db-warn"});
}
```

```dataviewjs
// ============ STATS ROW — 4 real counts ============
// 1. Open tasks: count files in Studio/Team Knowledge/tasks/open/
// 2. Needs a ruling: bullets under "## Needs a ruling" in Notebook/DESK.md
// 3. Mailroom queue: <!--state:...:queued--> markers in Studio/Mailroom/MAILROOM.md
// 4. Recent journal activity: files modified in Notebook/Journal/2026/07/ in the last 7 days
function plain(s) {
  // her rule: no em dashes, no arrow characters in anything rendered on screen.
  // Also strips raw [[wikilink|label]] / [[wikilink]] brackets down to plain
  // text for display (verbatim DESK bullets carry live wikilink syntax that
  // would otherwise show as literal double brackets in a plain <p>).
  return String(s == null ? "" : s)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/\[\[([^\]|]+)\|([^\]]+)\]\]/g, "$2")
    .replace(/\[\[([^\]]+)\]\]/g, "$1")
    .replace(/\*\*([^*]+)\*\*/g, "<strong>$1</strong>")
    .replace(/\s*—\s*/g, ", ")
    .replace(/\s*→\s*/g, " to ");
}

// Note: Dataview blocks in one file share the parent document, but not JS
// scope across separate code fences, so the "needs you" block below
// re-derives its own data the same way, same pattern as Mailroom
// re-deriving state on every render.
let openTasks = null, rulingCount = 0, mailroomQueued = 0, recentJournal = 0;

try {
  openTasks = dv.pages('"Studio/Team Knowledge/tasks/open"').length;
} catch (e) { openTasks = null; }

let deskRulings = [];
try {
  const deskAbs = app.vault.getAbstractFileByPath("Notebook/DESK.md");
  const deskText = deskAbs ? await app.vault.read(deskAbs) : "";
  const lines = deskText.split("\n");
  const idx = lines.findIndex(l => l.trim() === "## Needs a ruling");
  if (idx !== -1) {
    for (let i = idx + 1; i < lines.length; i++) {
      const l = lines[i];
      if (l.trim().startsWith("## ")) break;
      if (l.trim().startsWith("- ")) deskRulings.push(l.trim().replace(/^- /, ""));
    }
  }
  rulingCount = deskRulings.length;
} catch (e) { rulingCount = 0; }

let mailQueuedItems = [];
let mailText = "";
try {
  const mailAbs = app.vault.getAbstractFileByPath("Studio/Mailroom/MAILROOM.md");
  mailText = mailAbs ? await app.vault.read(mailAbs) : "";
  // Deliberately NOT the Mailroom's own mrStates() regex
  // (/<!--state:([^-]+(?:-(?!-)[^-]*)*)-->/g): that pattern is unbounded
  // between "state:" and the next "-->", and since MAILROOM.md's own
  // dataviewjs source contains the literal text `<!--state:${key}:` inside
  // template-literal strings with no closing `-->` right there, it can
  // greedily swallow real state comments into one giant spurious match
  // before it finally hits a "-->" deep in the code (confirmed live: 3 real
  // queued entries silently vanished under that pattern during this build).
  // Real keys/status are always plain lowercase+digit+colon tokens, so a
  // tight character class avoids the code entirely and never mismatches.
  const states = {};
  for (const m of mailText.matchAll(/<!--state:([a-z0-9:]+):(\w+)-->/g)) {
    states[m[1]] = m[2];
  }
  const queuedKeys = Object.keys(states).filter(k => states[k] === "queued");
  function labelFor(key) {
    if (key.startsWith("archive:")) {
      const parts = key.split(":");
      const acct = parts[1], id = parts[2];
      const idEsc = id.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
      const re = new RegExp(`<!--away:${acct}:${idEsc}:([^>]+)-->`);
      const m = mailText.match(re);
      if (m) return m[1].split(" — ")[0].split(" - ")[0].trim();
      return key;
    }
    const idEsc = key.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
    const re = new RegExp(`id:"${idEsc}"[\\s\\S]{0,400}?who:"([^"]+)"`);
    const m = mailText.match(re);
    return m ? m[1] : key;
  }
  mailQueuedItems = queuedKeys.map(k => ({key: k, who: labelFor(k)}));
  mailroomQueued = mailQueuedItems.length;
} catch (e) { mailroomQueued = 0; }

try {
  const cutoff = Date.now() - 7 * 24 * 60 * 60 * 1000;
  const journalPages = dv.pages('"Notebook/Journal/2026/07"');
  recentJournal = journalPages.where(p => p.file.mtime.ts >= cutoff).length;
} catch (e) { recentJournal = 0; }

let s = `<div class="db-home-stats">`;
s += `<div class="db-home-stat tasks"><div class="db-home-stat-n">${openTasks === null ? "?" : openTasks}</div><div class="db-home-stat-l">Open tasks</div><div class="db-home-stat-c">waiting in the tasks queue</div></div>`;
s += `<div class="db-home-stat ruling${rulingCount > 0 ? " has-items" : ""}"><div class="db-home-stat-n">${rulingCount}</div><div class="db-home-stat-l">Need your call</div><div class="db-home-stat-c">from the desk</div></div>`;
s += `<div class="db-home-stat mailroom"><div class="db-home-stat-n">${mailroomQueued}</div><div class="db-home-stat-l">Mailroom queue</div><div class="db-home-stat-c">waiting on the team to act</div></div>`;
s += `<div class="db-home-stat journal"><div class="db-home-stat-n">${recentJournal}</div><div class="db-home-stat-l">Journal entries</div><div class="db-home-stat-c">this past 7 days</div></div>`;
s += `</div>`;
dv.el("div", s, {});
```

```dataviewjs
// ============ FRONT OF HOUSE divider — matches the approved mockup's
// tag-pill + dashed-rule divider, using Alyssa's own Notion office
// language (front of house / back of house). Purely a visual section
// break, no data behind it. ============
try {
  dv.el("div", `<div class="db-home-divider"><span class="db-home-divider-tag"><b>FRONT</b> of house</span><span class="db-home-divider-rule"></span></div>`, {});
} catch (e) {
  dv.el("div", "", {});
}
```

```dataviewjs
// ============ ACTIONS — real buttons, same mechanism as the Mailroom and
// Content Command Center dashboards already use in this vault: a click
// writes a real <!--state:action:<slug>:queued--> line into this file's
// own "## Actions state" ledger (not a fake button, not a clipboard
// copy). Saying "/actions" in chat is the trigger that reads the ledger
// and actually runs the real work (.claude/commands/actions.md), same
// two-step shape as approving a concept then saying "/loop" on the
// Content dashboard. The Saves Engine card stays non-interactive: that
// automation already runs on its own schedule. ============
/* The ledger itself lives right here, hidden mailroom-style: inside this
   block comment nothing renders on screen, while every reader of the raw
   file (this block's own regex, the /actions command, and the OS-level
   HomeActionsWatcher task) still finds the exact lines. Do not reformat
   these marker lines; three different readers match them verbatim.

## Actions state
<!--action-ledger-start-->
<!--state:action:mailroom-sweep:handled-->
<!--action-ledger-end-->

## Actions reacts
- [2026-07-11 14:20] ran mailroom-sweep, added 139 new put-away cards across all four inboxes
*/
try {
  const actions = [
    {slug: "mailroom-sweep", icon: "&#9993;", title: "Sweep the mailroom", desc: "checks all four inboxes and drafts real replies"},
    {slug: "weekly-review", icon: "&#128221;", title: "Run the weekly review", desc: "pulls the last 7 days of session logs into one wrap"},
    {slug: "monthly-review", icon: "&#128197;", title: "Run the monthly review", desc: "rolls this month's weekly wraps into one summary"},
    {slug: "trend-scout", icon: "&#127908;", title: "Scout new trends", desc: "reads real posts from your trusted accounts for fresh angles"},
    {slug: null, icon: "&#128200;", title: "Saves engine", desc: "syncs the burner account and checks its own health, already running on its own schedule"},
  ];

  const abs = app.vault.getAbstractFileByPath("HOME.md");
  async function actionState() {
    const text = await app.vault.read(abs);
    const states = {};
    for (const m of text.matchAll(/<!--state:action:([a-z0-9-]+):(\w+)-->/g)) states[m[1]] = m[2];
    return states;
  }
  async function queueAction(slug) {
    const text = await app.vault.read(abs);
    const marker = `<!--state:action:${slug}:`;
    const re = new RegExp(marker.replace(/[.*+?^${}()|[\]\\]/g, "\\$&") + "\\w+-->");
    if (re.test(text)) {
      await app.vault.modify(abs, text.replace(re, `${marker}queued-->`));
      return;
    }
    const lines = text.split("\n");
    const idx = lines.findIndex(l => l.trim() === "<!--action-ledger-start-->");
    if (idx === -1) return;
    lines.splice(idx + 1, 0, `${marker}queued-->`);
    await app.vault.modify(abs, lines.join("\n"));
  }

  const states = await actionState();
  let html = `<div class="db-home-lbl">( THE ) <b>ACTIONS</b></div>`;
  html += `<div class="db-home-section-sub">click a card to queue it, then say "/actions" to run everything queued</div>`;
  html += `<div class="db-home-actions">`;
  for (const a of actions) {
    const auto = a.slug === null;
    const status = auto ? null : states[a.slug];
    let how;
    if (auto) how = "running on its own, nothing to queue";
    else if (status === "queued") how = "queued, say &quot;/actions&quot; to run it";
    else if (status === "handled") how = "done, click to queue it again";
    else how = "click to queue it";
    html += `<div class="db-home-action${auto ? " auto" : ""}${status === "queued" ? " queued" : ""}" ${auto ? "" : `data-slug="${a.slug}" tabindex="0" role="button"`}><span class="db-home-action-icon">${a.icon}</span><div><div class="db-home-action-title">${a.title}</div><div class="db-home-action-desc">${a.desc}</div><div class="db-home-action-how">${how}</div></div></div>`;
  }
  html += `</div>`;
  const wrap = dv.el("div", html, {});
  wrap.querySelectorAll(".db-home-action[data-slug]").forEach(card => {
    const howEl = card.querySelector(".db-home-action-how");
    async function fire() {
      const slug = card.getAttribute("data-slug");
      howEl.textContent = "queuing...";
      try {
        await queueAction(slug);
        howEl.innerHTML = "queued, say &quot;/actions&quot; to run it";
        card.classList.add("queued");
      } catch (e) {
        howEl.textContent = "couldn't queue it, try again";
      }
    }
    card.addEventListener("click", fire);
    card.addEventListener("keydown", (e) => {
      if (e.key === "Enter" || e.key === " ") { e.preventDefault(); fire(); }
    });
  });
} catch (e) {
  dv.el("div", "Actions didn't load.", {cls: "db-warn"});
}
```

```dataviewjs
// ============ LAUNCH COUNTDOWN + SHIPPING STREAK — two real numbers.
// LAUNCH: days until the July 26 launch, computed live from today's
// date against the launch date recorded in
// Library/Offers/back-of-house/launch-emails-july-26.md (promoted
// 2026-07-10, the July launch email sequence). The runway percentage
// is the real fraction of time elapsed between that file's
// promoted_date and the launch date, not an invented number.
// STREAK: a 14-day heatmap built from real file activity, counting
// files dated each day in Notebook/Journal/2026/** and Studio/Team
// Knowledge/session-logs/2026/** (the two places real shipped work
// leaves a dated file behind). Bucketing (0/1-2/3+) is a display
// choice; the underlying counts are read live, nothing is invented. ============
try {
  const launchDate = new Date(2026, 6, 26); // July 26, 2026 — Library/Offers/back-of-house/launch-emails-july-26.md
  const promoDate = new Date(2026, 6, 10); // promoted_date in that same file's frontmatter
  const now = new Date();
  const dayMs = 24 * 60 * 60 * 1000;
  const daysLeft = Math.max(0, Math.ceil((launchDate - now) / dayMs));
  const totalSpan = Math.max(1, Math.round((launchDate - promoDate) / dayMs));
  const elapsed = Math.min(totalSpan, Math.max(0, Math.round((now - promoDate) / dayMs)));
  const runwayPct = Math.round((elapsed / totalSpan) * 100);

  // ---- shipping streak: real dated files, last 14 days ----
  function dateKey(d) {
    return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}-${String(d.getDate()).padStart(2, "0")}`;
  }
  const counts = {};
  const journalPages = dv.pages('"Notebook/Journal"');
  const logPages = dv.pages('"Studio/Team Knowledge/session-logs"');
  for (const p of [...journalPages, ...logPages]) {
    const m = p.file.name.match(/^(\d{4}-\d{2}-\d{2})/);
    if (m) counts[m[1]] = (counts[m[1]] || 0) + 1;
  }
  const days14 = [];
  for (let i = 13; i >= 0; i--) {
    const d = new Date(now.getTime() - i * dayMs);
    days14.push({key: dateKey(d), isToday: i === 0});
  }
  let streak = 0;
  for (let i = days14.length - 1; i >= 0; i--) {
    if ((counts[days14[i].key] || 0) > 0) streak++; else break;
  }
  const heatCells = days14.map(d => {
    const n = counts[d.key] || 0;
    const level = n === 0 ? "" : n <= 2 ? "l1" : n <= 4 ? "l2" : "l3";
    const todayCls = d.isToday ? " today" : "";
    return `<i class="${level}${todayCls}" title="${d.key}: ${n}"></i>`;
  }).join("");

  let r = `<div class="db-home-row">`;
  r += `<div class="db-home-card"><div class="db-home-lbl">( JULY ) <b>LAUNCH</b></div>`;
  r += `<div class="db-home-count">${daysLeft}<span> days</span></div>`;
  r += `<p style="font-size:12.5px;color:var(--db-muted);margin:4px 0 0">until the <a data-href="Library/Offers/back-of-house/launch-emails-july-26" href="#">July 26 launch</a>, the email sequence is written and promoted to the shelf.</p>`;
  r += `<div class="db-home-bar"><i style="width:${runwayPct}%"></i></div>`;
  r += `<div class="db-home-barline"><span>runway</span><span>${runwayPct}%</span></div>`;
  r += `</div>`;
  r += `<div class="db-home-card"><div class="db-home-lbl">( SHIPPING ) <b>STREAK</b></div>`;
  r += `<div class="db-home-heat">${heatCells}</div>`;
  r += `<div class="db-home-streakline"><span style="color:var(--db-muted)">journal entries and session logs, last 14 days</span><span class="db-home-flame">${streak}<span style="font-size:0.8rem;color:var(--db-muted)"> day streak</span></span></div>`;
  r += `</div>`;
  r += `</div>`;

  const wrap = dv.el("div", r, {});
  wrap.querySelectorAll("a[data-href]").forEach(a => {
    a.addEventListener("click", (e) => {
      e.preventDefault();
      app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
    });
  });
} catch (e) {
  dv.el("div", "Couldn't compute the launch countdown or shipping streak right now.", {cls: "db-warn"});
}
```

```dataviewjs
// ============ NEEDS YOU — DESK rulings + mailroom queue, plain words, real links ============
try {
  const deskAbs = app.vault.getAbstractFileByPath("Notebook/DESK.md");
  const deskText = deskAbs ? await app.vault.read(deskAbs) : "";
  const lines = deskText.split("\n");
  const idx = lines.findIndex(l => l.trim() === "## Needs a ruling");
  let rulings = [];
  if (idx !== -1) {
    for (let i = idx + 1; i < lines.length; i++) {
      const l = lines[i];
      if (l.trim().startsWith("## ")) break;
      if (l.trim().startsWith("- ")) rulings.push(l.trim().replace(/^- /, ""));
    }
  }

  const mailAbs = app.vault.getAbstractFileByPath("Studio/Mailroom/MAILROOM.md");
  const mailText = mailAbs ? await app.vault.read(mailAbs) : "";
  // Same hardened parser as the stats block above, not Mailroom's own
  // mrStates() regex (see the comment there for why: it can silently
  // swallow real state comments into a spurious match against the file's
  // own JS source). Tight character class only, no crossing into code.
  const states = {};
  for (const m of mailText.matchAll(/<!--state:([a-z0-9:]+):(\w+)-->/g)) {
    states[m[1]] = m[2];
  }
  const queuedKeys = Object.keys(states).filter(k => states[k] === "queued");

  function plain(s) {
    return String(s == null ? "" : s)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/\[\[([^\]|]+)\|([^\]]+)\]\]/g, "$2")
      .replace(/\[\[([^\]]+)\]\]/g, "$1")
      .replace(/\*\*([^*]+)\*\*/g, "<strong>$1</strong>")
      .replace(/\s*—\s*/g, ", ")
      .replace(/\s*→\s*/g, " to ");
  }

  let html = `<div class="db-home-lbl">( NEEDS ) <b>YOU</b></div>`;
  html += `<div class="db-home-section-sub">from the desk and the mailroom, in plain words</div>`;

  // Desk rulings stay listed individually (each one is a real decision only
  // Alyssa can make, worth seeing on its own line). The mailroom queue
  // collapses to a single summary card instead of one card per message
  // (Alyssa, 2026-07-10: "chaotic mess") — one real live count, linking to
  // the mailroom instead of enumerating every queued item here.
  if (rulings.length === 0 && queuedKeys.length === 0) {
    html += `<div class="db-empty">Nothing needs you right now.</div>`;
  } else {
    html += `<div class="db-home-needs">`;
    for (const r of rulings) {
      html += `<div class="db-home-need-card"><p class="db-home-need-what">${plain(r)}</p><div class="db-home-need-where">On the desk</div></div>`;
    }
    if (queuedKeys.length > 0) {
      const n = queuedKeys.length;
      html += `<div class="db-home-need-card"><p class="db-home-need-what">${n} message${n === 1 ? "" : "s"} waiting in the mailroom</p><div class="db-home-need-where"><a data-href="Studio/Mailroom/MAILROOM" href="#">Open the mailroom</a></div></div>`;
    }
    html += `</div>`;
  }

  const wrap = dv.el("div", html, {});
  wrap.querySelectorAll("a[data-href]").forEach(a => {
    a.addEventListener("click", (e) => {
      e.preventDefault();
      app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
    });
  });
} catch (e) {
  dv.el("div", "Couldn't read the desk or the mailroom right now. Open [[Notebook/DESK]] or [[Studio/Mailroom/MAILROOM]] directly.", {cls: "db-warn"});
}
```

```dataviewjs
// ============ THIS WEEK IN CONTENT — same stage heuristic as
// Studio/Content/dashboard/00 Content Command Center.md, relabeled into
// plain words (idea / outline / hook / draft / posted, no "arc", no arrows). ============
try {
  const pitchFiles = dv.pages('"Studio/Content"')
    .where(p => p.file.name.match(/^\d{4}-W\d{2}-pitch$/))
    .sort(p => p.file.name, 'desc');

  const stages = ["Idea", "Outline", "Hook", "Draft", "Posted"];
  let html = `<div class="db-home-lbl">( THIS WEEK IN ) <b>CONTENT</b></div>`;

  if (pitchFiles.length === 0) {
    html += `<div class="db-home-section-sub">no pitch sheet found yet for this week</div>`;
    html += `<div class="db-empty">Nothing started yet. Open <a data-href="Studio/Content/dashboard/00 Content Command Center" href="#">the content desk</a> to start the week.</div>`;
  } else {
    const latest = pitchFiles[0];
    const content = await dv.io.load(latest.file.path);
    const wkMatch = content.match(/^#\s*Weekly Pitch Sheet\s*—\s*(W\d{2})/m);
    const hasArc = content.includes("## Approved — slide skeletons");
    const current = hasArc ? 1 : 0;
    const weekLabel = wkMatch ? `Week ${wkMatch[1].replace("W", "")}` : latest.file.name;
    html += `<div class="db-home-section-sub">${weekLabel}, read from the current pitch sheet</div>`;
    html += `<div class="db-home-stage-row">`;
    html += stages.map((label, i) => {
      const state = i < current ? " done" : (i === current ? " current" : "");
      return `<span class="db-stage${state}">${label}</span>`;
    }).join("");
    html += `</div>`;
  }

  const wrap = dv.el("div", html, {});
  wrap.querySelectorAll("a[data-href]").forEach(a => {
    a.addEventListener("click", (e) => {
      e.preventDefault();
      app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
    });
  });
} catch (e) {
  dv.el("div", "Couldn't read this week's content pipeline. Open [[Studio/Content/dashboard/00 Content Command Center]] directly.", {cls: "db-warn"});
}
```

```dataviewjs
// ============ BACK OF HOUSE divider — same pattern as the front-of-
// house divider above, marking the line between "what needs Alyssa
// today" and "how the team's own projects are running underneath." ============
try {
  dv.el("div", `<div class="db-home-divider"><span class="db-home-divider-tag"><b>BACK</b> of house</span><span class="db-home-divider-rule"></span></div>`, {});
} catch (e) {
  dv.el("div", "", {});
}
```

```dataviewjs
// ============ THE ENGINES — real project status, read live from the
// `status` frontmatter field on every note in Notebook/Life/Projects/.
// State pill wording is a plain-language mapping of that real field
// (active -> "in motion", planning -> "on the bench"; any other status
// value found later renders under its own literal word rather than
// silently vanishing). Deliberately NO per-project progress bar here:
// there is no real source in the vault yet for how complete each
// project is, and inventing a percentage would fabricate a number.
// If a real completion fraction becomes available (e.g. a task
// checklist per project), wire the minibar in then. ============
try {
  const projPages = dv.pages('"Notebook/Life/Projects"').where(p => p.status);
  let html = `<div class="db-home-lbl">( THE ) <b>ENGINES</b></div>`;
  html += `<div class="db-home-section-sub">real project status, read from Notebook/Life/Projects</div>`;

  if (projPages.length === 0) {
    html += `<div class="db-empty">No tracked projects found.</div>`;
  } else {
    const stateMap = {active: {cls: "s-motion", label: "in motion"}, planning: {cls: "s-bench", label: "on the bench"}};
    html += `<div>`;
    for (const p of projPages.array()) {
      const st = stateMap[p.status] || {cls: "s-bench", label: String(p.status)};
      const name = p.name || p.file.name;
      html += `<div class="db-home-eng"><div class="db-home-engtop"><span class="db-home-state ${st.cls}">${st.label}</span><span class="db-home-eng-name">${name}</span><span class="db-home-eng-next"><a data-href="${p.file.path.replace(/\.md$/, "")}" href="#">open</a></span></div></div>`;
    }
    html += `</div>`;
  }

  const wrap = dv.el("div", html, {});
  wrap.querySelectorAll("a[data-href]").forEach(a => {
    a.addEventListener("click", (e) => {
      e.preventDefault();
      app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
    });
  });
} catch (e) {
  dv.el("div", "Couldn't read the projects list right now. Open [[Notebook/Life/Projects/INDEX]] directly.", {cls: "db-warn"});
}
```

```dataviewjs
// ============ SIGNALS — real recurrence counts from Studio/Signals/signals-index.md,
// as a plain horizontal bar list. No invented numbers: if a signal has no
// garden note yet, it still shows with its real count and no link. ============
try {
  const idxAbs = app.vault.getAbstractFileByPath("Studio/Signals/signals-index.md");
  const idxText = idxAbs ? await app.vault.read(idxAbs) : "";
  const blocks = idxText.split(/\n### /).slice(1); // first chunk before any "### " is the intro
  const signals = [];
  for (const b of blocks) {
    const title = b.split("\n")[0].trim();
    if (!title || title.toLowerCase().includes("template")) continue;
    const countMatch = b.match(/\*\*Recurrence count\*\*:\s*(\d+|ongoing)/);
    if (!countMatch) continue;
    const count = countMatch[1] === "ongoing" ? null : parseInt(countMatch[1], 10);
    const gardenMatch = b.match(/\*\*Garden note\*\*:\s*\[\[([^\]|]+)/);
    signals.push({title, count, garden: gardenMatch ? gardenMatch[1] : null});
  }
  // stop before "## Graduated Signals" content leaking in (split already
  // scoped to "### " blocks, but the Graduated table has no "### " heading
  // so it never enters `blocks` at all, nothing to filter there).
  const numeric = signals.filter(s => s.count !== null).sort((a, b) => b.count - a.count);
  const max = numeric.length ? numeric[0].count : 1;

  let html = `<div class="db-home-lbl">( WHAT KEEPS ) <b>COMING UP</b></div>`;
  html += `<div class="db-home-section-sub">how many times each theme has shown up in the journal, read from the signals index</div>`;

  if (numeric.length === 0) {
    html += `<div class="db-empty">No signals tracked yet. Open [[Studio/Signals/signals-index]] directly.</div>`;
  } else {
    html += `<div class="db-home-bars">`;
    for (const sgn of numeric.slice(0, 8)) {
      const pct = Math.max(6, Math.round((sgn.count / max) * 100));
      const labelHtml = sgn.garden
        ? `<a class="db-home-bar-label" data-href="${sgn.garden}" href="#">${sgn.title}</a>`
        : `<span class="db-home-bar-label">${sgn.title}</span>`;
      html += `<div class="db-home-bar-row">${labelHtml}<div class="db-home-bar-track"><div class="db-home-bar-fill" style="width:${pct}%"></div></div><div class="db-home-bar-n">${sgn.count}</div></div>`;
    }
    html += `</div>`;
  }

  const wrap = dv.el("div", html, {});
  wrap.querySelectorAll("a[data-href]").forEach(a => {
    a.addEventListener("click", (e) => {
      e.preventDefault();
      app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
    });
  });
} catch (e) {
  dv.el("div", "Couldn't read the signals index right now. Open [[Studio/Signals/signals-index]] directly.", {cls: "db-warn"});
}
```

```dataviewjs
// ============ ROOMS — six real links, static targets, no invented pages ============
try {
  const rooms = [
    {cls: "notebook", glyph: "&#9998;", label: "Notebook", desc: "her journal, her drafts, her life", href: "Notebook/MAP"},
    {cls: "studio", glyph: "&#10070;", label: "Studio", desc: "where the team works", href: "Studio/MAP"},
    {cls: "library", glyph: "&#10059;", label: "Library", desc: "the trusted shelf", href: "Library/MAP"},
    {cls: "mailroom", glyph: "&#9789;", label: "Mailroom", desc: "the four inboxes, sorted", href: "Studio/Mailroom/MAILROOM"},
    {cls: "content", glyph: "&#9874;", label: "Content desk", desc: "this week's posts", href: "Studio/Content/dashboard/00 Content Command Center"},
    {cls: "signals", glyph: "&#9673;", label: "Signals", desc: "what keeps coming up", href: "Studio/Signals/signals-index"},
  ];
  let html = `<div class="db-home-lbl">( THE ) <b>ROOMS</b></div>`;
  html += `<div class="db-home-rooms">`;
  for (const r of rooms) {
    html += `<a class="db-home-room ${r.cls}" data-href="${r.href}" href="#" aria-label="${r.label}, ${r.desc}"><span class="db-home-room-glyph" aria-hidden="true">${r.glyph}</span><span><span class="db-home-room-label">${r.label}</span><br><span class="db-home-room-desc">${r.desc}</span></span></a>`;
  }
  html += `</div>`;
  const wrap = dv.el("div", html, {});
  wrap.querySelectorAll("a[data-href]").forEach(a => {
    a.addEventListener("click", (e) => {
      e.preventDefault();
      app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
    });
  });
} catch (e) {
  dv.el("div", "Rooms didn't load. Try reopening this note.", {cls: "db-warn"});
}
```

## Cross-references
- [[Notebook/DESK]], the passing-notes surface this page reads its "needs your call" count from.
- [[Studio/Mailroom/MAILROOM]], the mailroom queue this page counts and lists.
- [[Studio/Content/dashboard/00 Content Command Center]], the content pipeline this page mirrors.
- [[Studio/Signals/signals-index]], the signals this page charts.
- [[Library/Offers/back-of-house/launch-emails-july-26]], the source of the launch countdown's target date.
- [[Notebook/Life/Projects/INDEX]], the source of the engines section's real project status.
- [[HOUSE-MAP]], the whole vault's rules. This dashboard is wired into its geography table.
- [[Journal cards.base|Journal cards]], her journal as a card wall, standalone for now.
- [[Open tasks.base|Open tasks]], every open task as a sortable table, standalone for now.
- [[House.canvas|House canvas]], the visual map of how the whole house connects, standalone for now.

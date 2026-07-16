---
cssclasses: [dashboard]
---

```dataviewjs
const nav = [
  {file: "01 Concepts", num: "01", label: "CONCEPTS"},
  {file: "02 Arc", num: "02", label: "ARC"},
  {file: "03 Hook", num: "03", label: "HOOK"},
  {file: "04 Draft", num: "04", label: "DRAFT"},
  {file: "05 Approved", num: "05", label: "APPROVED"},
  {file: "Parked", num: null, label: "PARKED"},
];
const here = dv.current().file.name;
const navHtml = nav.map(n => {
  const active = n.file === here ? " db-active" : "";
  const parked = n.num === null ? " db-parked" : "";
  const numHtml = n.num ? `<span class="db-pill-num">${n.num}</span>` : "";
  return `<a class="db-pill${active}${parked}" href="${n.file}.md" data-href="${n.file}">${numHtml}${n.label}</a>`;
}).join("");
dv.el("div", navHtml, {cls: "db-nav"});

// Wire pills to Obsidian's own navigation (raw hrefs from dv.el aren't linked).
const navEl = dv.container.querySelector(".db-nav");
if (navEl) {
  navEl.querySelectorAll("a[data-href]").forEach(a => {
    a.addEventListener("click", (e) => {
      e.preventDefault();
      app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
    });
  });
}
```

```dataviewjs
// ---- Header card + live pipeline status, read from the newest pitch sheet ----
const pitchFiles = dv.pages('"Studio/Content"')
  .where(p => p.file.name.match(/^\d{4}-W\d{2}-pitch$/))
  .sort(p => p.file.name, 'desc');

// Prefer the sheet whose Mon-Fri ISO week window contains today over the newest
// by filename — two weeks are live at once (current + next, prepped ahead), so
// "newest" silently points at next week's sheet as soon as it's created.
function dbIsoWeekMonday(year, week) {
  const simple = new Date(Date.UTC(year, 0, 1 + (week - 1) * 7));
  const dow = simple.getUTCDay() || 7;
  const monday = new Date(simple);
  monday.setUTCDate(simple.getUTCDate() + (dow <= 4 ? 1 - dow : 8 - dow));
  return monday;
}
function dbPickCurrentPitch(pages) {
  const now = new Date();
  const todayUTC = Date.UTC(now.getFullYear(), now.getMonth(), now.getDate());
  const current = pages.find(p => {
    const m = p.file.name.match(/^(\d{4})-W(\d{2})-pitch$/);
    if (!m) return false;
    const mon = dbIsoWeekMonday(+m[1], +m[2]);
    const mondayUTC = Date.UTC(mon.getUTCFullYear(), mon.getUTCMonth(), mon.getUTCDate());
    return todayUTC >= mondayUTC && todayUTC <= mondayUTC + 4 * 86400000;
  });
  return current || pages[0] || null;
}

const stages = [
  {num:"01", label:"CONCEPTS", file:"01 Concepts"},
  {num:"02", label:"ARC", file:"02 Arc"},
  {num:"03", label:"HOOK", file:"03 Hook"},
  {num:"04", label:"DRAFT", file:"04 Draft"},
  {num:"05", label:"APPROVED", file:"05 Approved"},
];

let weekChip = "";
let current = 0;         // index of the CURRENT (in-progress) stage
let latest = null;

if (pitchFiles.length > 0) {
  latest = dbPickCurrentPitch(pitchFiles);
  // Normalize CRLF -> LF (Windows-edited files break any $-anchored line regex).
  const content = (await dv.io.load(latest.file.path)).replace(/\r\n/g, "\n");

  // Week + theme from the sheet's top lines, e.g.
  //   # Weekly Pitch Sheet — W28
  //   **Theme:** W2 Pinterest · **Week:** Mon Jul 6 – Fri Jul 10, 2026
  const wkMatch = content.match(/^#\s*Weekly Pitch Sheet\s*—\s*(W\d{2})/m);
  const themeMatch = content.match(/\*\*Theme:\*\*\s*(.+?)(?:\s*·|\n|$)/);
  const dateMatch = content.match(/\*\*Week:\*\*\s*(.+?)\s*$/m);
  const parts = [];
  if (wkMatch) parts.push(`Week ${wkMatch[1].replace("W","")}`);
  if (dateMatch) parts.push(dateMatch[1].trim());
  if (themeMatch) parts.push(`Theme: ${themeMatch[1].trim()}`);
  weekChip = parts.join(" · ");

  // Current-stage heuristic: concepts approved (arc section exists) => at ARC,
  // hooks present but not yet picked keeps us at ARC until she picks Wednesday.
  const hasArc = content.includes("## Approved — slide skeletons");
  current = hasArc ? 1 : 0; // W28 sits at ARC awaiting her picks
}

// ---- render the header card ----
let head = `<div class="db-header-card">`;
head += `<div class="db-header-top"><h1>Content Command Center</h1>`;
if (weekChip) head += `<span class="db-week-chip">${weekChip}</span>`;
head += `</div>`;
head += `<p class="db-header-sub">Weekly carousel pipeline — your marks save to this week's pitch sheet, verbatim.</p>`;

// pipeline strip: done = before current, current = highlighted, upcoming = muted
head += `<div class="db-pipeline">`;
head += stages.map((s, i) => {
  const state = i < current ? " done" : (i === current ? " current" : "");
  const arrow = i < stages.length - 1 ? `<span class="db-stage-arrow">&rarr;</span>` : "";
  return `<span class="db-stage${state}" data-href="${s.file}"><span class="db-stage-num">${s.num}</span>${s.label}</span>${arrow}`;
}).join("");
head += `</div></div>`;
dv.el("div", head, {});

// pipeline stages navigate too
const headEl = dv.container.querySelector(".db-header-card");
if (headEl) {
  headEl.querySelectorAll(".db-stage[data-href]").forEach(s => {
    s.style.cursor = "pointer";
    s.addEventListener("click", () => app.workspace.openLinkText(s.getAttribute("data-href"), dv.current().file.path, false));
  });
}

if (!latest) {
  dv.el("div", "No pitch sheet found yet in Studio/Content/ (expected a file matching YYYY-Www-pitch.md).", {cls: "db-empty"});
}
```

```dataviewjs
// ---- quick-links card ----
const links = [
  {file:"01 Concepts", num:"01", label:"Concepts", desc:"this week's one-line concepts, react + save your marks"},
  {file:"02 Arc", num:"02", label:"Arc", desc:"approved slide skeletons, sources, the Wed A/B pick"},
  {file:"03 Hook", num:"03", label:"Hook", desc:"hook options per approved arc"},
  {file:"04 Draft", num:"04", label:"Draft", desc:"layout previews awaiting persuasion copy"},
  {file:"05 Approved", num:"05", label:"Approved", desc:"bird's-eye calendar of approved work"},
  {file:"Parked", num:null, label:"Parked", desc:"open questions and parked items — answer inline"},
];
let html = `<div class="db-links-card"><h2>Jump in</h2><ul class="db-links">`;
html += links.map(l => {
  const numHtml = l.num ? `<span class="db-link-num">${l.num}</span>` : `<span class="db-link-num db-link-parked">—</span>`;
  return `<li><a data-href="${l.file}" href="#">${numHtml}<span class="db-link-label">${l.label}</span><span class="db-link-desc">${l.desc}</span></a></li>`;
}).join("");
html += `</ul></div>`;
dv.el("div", html, {});

const linksEl = dv.container.querySelectorAll(".db-links-card")[dv.container.querySelectorAll(".db-links-card").length - 1];
if (linksEl) {
  linksEl.querySelectorAll("a[data-href]").forEach(a => {
    a.addEventListener("click", (e) => {
      e.preventDefault();
      app.workspace.openLinkText(a.getAttribute("data-href"), dv.current().file.path, false);
    });
  });
}
```

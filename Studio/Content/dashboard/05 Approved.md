---
cssclasses: [dashboard]
---
```dataviewjs
const nav = [
  {file: "00 Content Command Center", num: null, label: "HOME"},
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
  const parked = (n.num === null) ? " db-parked" : "";
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

<h1 class="db-page-title">05 Approved</h1>
<p class="db-page-sub">The month at a glance — what's scheduled and what each post needs next.</p>

```dataviewjs
const now = new Date();
const year = now.getFullYear();
const month = now.getMonth(); // 0-indexed

const pitchPages = dv.pages('"Studio/Content"')
  .where(p => p.file.name.match(/^\d{4}-W\d{2}-pitch$/))
  .sort(p => p.file.name, 'desc');

if (pitchPages.length === 0) {
  dv.el("h2", `${now.toLocaleString('default', { month: 'long' })} ${year}`, {});
  dv.el("div", "No pitch sheet found in Studio/Content/ yet — calendar has nothing to plot.", {cls: "db-empty"});
} else {
  const latest = pitchPages[0];
  // Kick off both file reads together (pitch sheet + MAP.md) instead of
  // sequentially, so this block resolves in one round trip, not two. Reading
  // view shows the raw dataviewjs source until this async work finishes, so
  // every extra sequential await is extra time the raw block flashes on screen.
  const [raw, mapRawSettled] = await Promise.all([
    dv.io.load(latest.file.path),
    dv.io.load("Hermes/MAP.md").catch(() => null),
  ]);

  // Determine day-of-week -> arc/hook/pick status from the sheet.
  // We infer status per day (Mon/Wed/Fri) from presence of arc skeletons,
  // A/B pick markers, and hook picks. This is a heuristic reading of a
  // free-text sheet, not a structured schema — if the sheet format drifts,
  // this block degrades to "needs pick" defaults rather than erroring.
  const hasArcSection = raw.includes("## Approved — slide skeletons");
  const monApproved = /### MON —/.test(raw);
  const wedHasAB = /### WED-A —/.test(raw) && /### WED-B —/.test(raw);
  const friApproved = /### FRI —/.test(raw);

  function statusFor(dayHasArc, dayIsPick) {
    if (dayIsPick) return {tag: "needs pick", dotClass: "pending", cls: "pending"};
    if (dayHasArc) return {tag: "needs hook", dotClass: "arc", cls: ""};
    return {tag: "needs arc", dotClass: "pending", cls: "pending"};
  }

  const monStatus = statusFor(monApproved, false);
  const wedStatus = statusFor(hasArcSection, wedHasAB);
  const friStatus = statusFor(friApproved, false);

  // Titles (best-effort parse from headers)
  function extractTitle(sheet, headerKey) {
    const re = new RegExp(`### ${headerKey} — (.+?)(?:\\s*\\*\\(|$)`, "m");
    const m = sheet.match(re);
    return m ? m[1].trim() : null;
  }
  const monTitle = extractTitle(raw, "MON") || "Monday post";
  const friTitle = extractTitle(raw, "FRI") || "Friday post";

  // ---- Day-type archetypes (recurring rhythm) ----
  // Parse the type word from the concept day-group labels, e.g.
  //   "## Monday — Education (freebie: Pin Planner)"  -> "Education"
  //   "## Wednesday — Offer (Pin Planner → ...)"      -> "Offer"
  //   "## Friday — For The Girls (no CTA)"            -> "For The Girls"
  // Falls back to the fixed archetype defaults if a label can't be read.
  function extractDayType(sheet, dayName, fallback) {
    const re = new RegExp(`^##\\s*${dayName}\\s*—\\s*([^(\\n]+)`, "m");
    const m = sheet.match(re);
    return m ? m[1].trim() : fallback;
  }
  const dayTypes = {
    mon: extractDayType(raw, "Monday", "Education"),
    wed: extractDayType(raw, "Wednesday", "Offer"),
    fri: extractDayType(raw, "Friday", "For The Girls"),
  };

  // ---- Week rotation (every calendar-week row gets a theme pill) ----
  // Read the rotation LIVE from Hermes/MAP.md: "Rotation (Alyssa-confirmed
  // planning grid): **W1 Email · W2 Pinterest · W3 BoH Systems · W4 Productivity**".
  // Falls back to those four defaults if MAP.md or the line can't be read.
  const ROTATION_DEFAULT = ["Email", "Pinterest", "BoH Systems", "Productivity"];
  let rotation = ROTATION_DEFAULT;
  try {
    const mapRaw = mapRawSettled;
    if (mapRaw) {
      const rotMatch = mapRaw.match(/Rotation \(Alyssa-confirmed planning grid\):\s*\*\*(.+?)\*\*/);
      if (rotMatch) {
        const parts = rotMatch[1].split("·").map(s => s.trim()).filter(Boolean);
        // each part like "W1 Email" -> strip the "W#" prefix, keep theme label, in W1..W4 order.
        const parsed = parts.map(p => p.replace(/^W\d\s*/, "").trim()).filter(Boolean);
        if (parsed.length === 4) rotation = parsed;
      }
    }
  } catch (e) { /* fall back to ROTATION_DEFAULT */ }

  // Parse "**Theme:** W2 Pinterest" -> anchorWeekNum 2 (this pitch sheet's posting week).
  const themeMatch = raw.match(/\*\*Theme:\*\*\s*W(\d)\s+(.+?)(?:\s*·|\n|$)/);
  const anchorWeekNum = themeMatch ? parseInt(themeMatch[1], 10) : 2; // default W2 per Alyssa-confirmed anchor

  // Each week THEME gets its own color (not the row) so the wrap week (2nd W1)
  // reuses W1's color. Cycle: sage / peach / pink / lavender, in rotation order.
  const ROTATION_COLOR_CLASSES = ["sage", "peach", "pink", "lavender"];
  function rotationLabelFor(weekNumOffsetFromAnchor) {
    // weekNumOffsetFromAnchor: 0 = the posting week itself, +/-N = N rows away.
    const idx = (((anchorWeekNum - 1) + weekNumOffsetFromAnchor) % 4 + 4) % 4;
    const wNum = idx + 1;
    return {wTag: `W${wNum}`, theme: rotation[idx], colorCls: ROTATION_COLOR_CLASSES[idx]};
  }

  // Map a post's "needs X" status tag to the dashboard tab where it needs
  // action next, per Alyssa's routing rule.
  function nextActionTab(tag) {
    const t = String(tag || "").toLowerCase();
    if (t.includes("needs pick")) return "02 Arc";
    if (t.includes("needs arc")) return "02 Arc";
    if (t.includes("needs hook")) return "03 Hook";
    if (t.includes("needs draft")) return "04 Draft";
    return "05 Approved";
  }

  // Derive the pitch sheet's actual posting week from its ISO week number in
  // the filename (e.g. 2026-W28-pitch -> ISO week 28 of 2026). Each post lands
  // ONCE, on its real Mon/Wed/Fri date — not on every Mon/Wed/Fri of the month.
  function isoWeekMonday(isoYear, isoWeek) {
    // ISO-8601: week 1 is the week containing Jan 4th; weeks start Monday.
    const jan4 = new Date(isoYear, 0, 4);
    const jan4Dow = (jan4.getDay() + 6) % 7; // Mon=0
    const week1Monday = new Date(jan4);
    week1Monday.setDate(jan4.getDate() - jan4Dow);
    const target = new Date(week1Monday);
    target.setDate(week1Monday.getDate() + (isoWeek - 1) * 7);
    return target;
  }

  const nameMatch = latest.file.name.match(/^(\d{4})-W(\d{2})-pitch$/);
  const isoYear = nameMatch ? parseInt(nameMatch[1], 10) : year;
  const isoWeek = nameMatch ? parseInt(nameMatch[2], 10) : null;

  // Map each post to a real date (Date -> {cls, dot, tag, label}) for this week.
  const postsByDate = {}; // key: "YYYY-M-D"
  function keyFor(d) { return `${d.getFullYear()}-${d.getMonth()}-${d.getDate()}`; }
  if (isoWeek !== null) {
    const monday = isoWeekMonday(isoYear, isoWeek);
    const wednesday = new Date(monday); wednesday.setDate(monday.getDate() + 2);
    const friday = new Date(monday); friday.setDate(monday.getDate() + 4);
    postsByDate[keyFor(monday)] = {cls: "mon", dot: monStatus.dotClass, tag: monStatus.tag, label: monTitle};
    postsByDate[keyFor(wednesday)] = {cls: wedStatus.cls || "wed", dot: wedStatus.dotClass, tag: wedStatus.tag, label: wedHasAB ? "A or B — pick pending" : "Wednesday post"};
    postsByDate[keyFor(friday)] = {cls: "fri", dot: friStatus.dotClass, tag: friStatus.tag, label: friTitle};
  }

  // Build calendar grid for the month that the posting week falls in.
  const anchorDate = isoWeek !== null ? isoWeekMonday(isoYear, isoWeek) : new Date(year, month, 1);
  const calYear = anchorDate.getFullYear();
  const calMonth = anchorDate.getMonth();
  const firstOfMonth = new Date(calYear, calMonth, 1);
  const startWeekday = (firstOfMonth.getDay() + 6) % 7; // Mon=0
  const daysInMonth = new Date(calYear, calMonth + 1, 0).getDate();

  dv.el("h2", `${firstOfMonth.toLocaleString('default', { month: 'long' })} ${calYear}`, {});

  let html = `<div class="db-cal-grid">`;
  // Leading empty gutter cell so the DOW header row lines up with week-label rows below.
  html += `<div class="db-cal-gutter db-cal-gutter-head"></div>`;
  // Day-of-week headers with the recurring day-type archetype under Mon/Wed/Fri.
  const dowTypeClass = {Mon: "mon", Wed: "wed", Fri: "fri"};
  ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"].forEach(d => {
    const typeKey = dowTypeClass[d];
    const typeLabel = typeKey ? `<span class="db-cal-type ${typeKey}">${dayTypes[typeKey]}</span>` : "";
    html += `<div class="db-cal-dow">${d}${typeLabel}</div>`;
  });

  // Precompute the Monday date of the posting week so every row can compute its
  // offset (in weeks) from it, and thus its place in the W1-W4 rotation cycle.
  const postingMonday = isoWeek !== null ? isoWeekMonday(isoYear, isoWeek) : null;

  // Track calendar day index (0 = first cell after leading blanks) so we know
  // which 7-day row we're in, to emit a gutter cell at the start of each row.
  let cellIndex = 0;
  function maybeStartRow() {
    if (cellIndex % 7 === 0) {
      const rowStartOffset = cellIndex; // offset from the first grid cell (which is startWeekday-aligned)
      // This row's Monday-column date (may fall outside the visible month, that's fine —
      // we only need it to compute the week offset from the posting Monday).
      const rowMondayDayNum = rowStartOffset - startWeekday + 1;
      const rowMonday = new Date(calYear, calMonth, rowMondayDayNum);
      let rowLabelHtml = "";
      if (postingMonday) {
        const msPerWeek = 7 * 24 * 60 * 60 * 1000;
        const weekOffset = Math.round((rowMonday.getTime() - postingMonday.getTime()) / msPerWeek);
        const { wTag, theme, colorCls } = rotationLabelFor(weekOffset);
        rowLabelHtml = `<span class="db-cal-week-pill ${colorCls}"><span class="db-cal-week-tag">${wTag}</span><span class="db-cal-week-theme">${theme}</span></span>`;
      }
      html += `<div class="db-cal-gutter">${rowLabelHtml}</div>`;
    }
  }

  for (let i = 0; i < startWeekday; i++) { maybeStartRow(); html += `<div class="db-cal-day out"></div>`; cellIndex++; }

  for (let day = 1; day <= daysInMonth; day++) {
    maybeStartRow();
    const cellDate = new Date(calYear, calMonth, day);
    const post = postsByDate[keyFor(cellDate)];
    let postHtml = "";
    if (post) {
      const targetTab = nextActionTab(post.tag);
      postHtml = `<div class="db-cal-post ${post.cls}" data-target="${targetTab}" role="button" tabindex="0"><span class="db-dot ${post.dot}"></span><span class="db-cal-post-body"><span class="db-cal-title">${post.label}</span><span class="db-status-tag">${post.tag}</span></span></div>`;
    }
    html += `<div class="db-cal-day"><span class="db-cal-num">${day}</span>${postHtml}</div>`;
    cellIndex++;
  }

  const totalCells = startWeekday + daysInMonth;
  const trailing = (7 - (totalCells % 7)) % 7;
  for (let i = 0; i < trailing; i++) { maybeStartRow(); html += `<div class="db-cal-day out"></div>`; cellIndex++; }

  html += `</div>`;
  const calWrap = dv.el("div", html, {});
  dv.el("p", `Source: <a href="${latest.file.path}">${latest.file.name}</a>. Status tags are a best-effort read of the sheet's Mon/Wed/Fri structure — verify against the sheet before shipping.`, {cls: "db-who"});

  // Wire each calendar post chip to navigate to its next-action tab.
  const calContainer = calWrap || dv.container;
  calContainer.querySelectorAll(".db-cal-post[data-target]").forEach(chip => {
    const target = chip.getAttribute("data-target");
    const go = (e) => { e.preventDefault(); app.workspace.openLinkText(target, dv.current().file.path, false); };
    chip.addEventListener("click", go);
    chip.addEventListener("keydown", (e) => { if (e.key === "Enter" || e.key === " ") go(e); });
  });
}
```

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

<h1 class="db-page-title">04 Draft</h1>
<p class="db-page-sub">This week's decks — read the copy, then ship or send back.</p>

```dataviewjs
// ============ shared react-append helper (append-only, pitch sheet only) ============
const REACT_HEADING = "## Dashboard reacts";
function dbNewestPitchFile() {
  const md = app.vault.getMarkdownFiles()
    .filter(f => f.path.startsWith("Team Inbox/pitches/") && /^\d{4}-W\d{2}-pitch$/.test(f.basename))
    .sort((a, b) => a.basename < b.basename ? 1 : -1);
  return md[0] || null;
}
async function dbAppendReact(stage, title, verdict, words) {
  const file = dbNewestPitchFile();
  if (!file) { new Notice("No pitch sheet found to save your react to."); return false; }
  const existing = await app.vault.read(file);
  const now = new Date();
  const pad = (n) => String(n).padStart(2, "0");
  const stamp = `${now.getFullYear()}-${pad(now.getMonth()+1)}-${pad(now.getDate())} ${pad(now.getHours())}:${pad(now.getMinutes())}`;
  const safe = (s) => String(s == null ? "" : s).replace(/\s+/g, " ").trim();
  const line = `- [${stamp}] ${safe(stage)} · ${safe(title)} · ${safe(verdict)} · "${safe(words)}"`;
  const sep = existing.endsWith("\n") ? "" : "\n";
  const toAppend = existing.includes(REACT_HEADING) ? `${sep}${line}\n` : `${sep}\n${REACT_HEADING}\n\n${line}\n`;
  await app.vault.append(file, toAppend);
  return true;
}

// ============ Draft-only 2-state ship/redo persistence ============
// Mirrors 02 Arc.md's [approved] pattern EXACTLY, one stage down the pipeline.
// Per PIPELINE-CONTRACT.md the Draft stage's approval mark is a " [shipped]"
// suffix tag written directly onto the draft's own "### DAYKEY — Title" heading
// line in the pitch sheet's "## Drafts" section. Same file-based, append-safe,
// suffix-tag mechanism as Arc's dbSetArcApproved / dbArcHeadingRegex, just the
// word "shipped" instead of "approved". A shipped draft locks green
// (db-card-locked) — the one-signal rule (GL-003 §5): shipping is the ONLY
// thing that greens the card, no ambient/default green.
function dbDraftHeadingRegex(dayKey, title) {
  const escTitle = String(title).replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const escDay = String(dayKey).replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  return new RegExp("^(### " + escDay + " — )" + escTitle + "(\\s*\\*\\(.+?\\)\\*)?\\s*(\\[shipped\\])?\\s*$");
}
async function dbSetDraftShipped(dayKey, title, shipped) {
  const file = dbNewestPitchFile();
  if (!file) return false;
  const raw = await app.vault.read(file);
  const lines = raw.split("\n");
  const re = dbDraftHeadingRegex(dayKey, title);
  let changed = false;
  for (let i = 0; i < lines.length; i++) {
    const m = lines[i].match(re);
    if (!m) continue;
    const provisional = m[2] || "";
    const next = `${m[1]}${title}${provisional}${shipped ? " [shipped]" : ""}`;
    if (lines[i] !== next) { lines[i] = next; changed = true; }
    break;
  }
  if (changed) await app.vault.modify(file, lines.join("\n"));
  return changed;
}
function dbDraftIsShipped(raw, dayKey, title) {
  const re = dbDraftHeadingRegex(dayKey, title);
  return raw.split("\n").some(l => {
    const m = l.match(re);
    return m && !!m[3];
  });
}

function dbShipReactRow(dayKey, title, shipped, placeholder, hint) {
  const t = String(title).replace(/"/g, "&quot;");
  return `<div class="db-arc-react-row db-ship-react-row" data-day="${dayKey}" data-title="${t}" data-shipped="${shipped ? "1" : "0"}">`
    + `<div class="db-btn-row">`
    +   `<button class="db-react-btn week yes ship${shipped ? " db-state-locked" : ""}" aria-label="${shipped ? "Already shipped" : "Approve and ship this draft"}"${shipped ? " disabled" : ""}>${shipped ? "✓ Shipped" : "✓ Approve / Ship"}</button>`
    +   `<button class="db-react-btn reject redo" aria-label="Send this draft back for a redo">↻ Redo</button>`
    +   `<span class="db-saved" aria-live="polite"></span>`
    + `</div>`
    + `<div class="db-note-wrap"><input type="text" placeholder="${placeholder}"><span class="db-note-hint">${hint}</span></div>`
    + `</div>`;
}
function dbWireShipReacts(container) {
  container.querySelectorAll(".db-ship-react-row").forEach(row => {
    if (row.dataset.wired) return;
    row.dataset.wired = "1";
    const dayKey = row.getAttribute("data-day") || "";
    const title = row.getAttribute("data-title") || "";
    const input = row.querySelector("input");
    const confirm = row.querySelector(".db-saved");
    const shipBtn = row.querySelector(".db-react-btn.ship");
    const redoBtn = row.querySelector(".db-react-btn.redo");
    const showSaved = () => { if (confirm) { confirm.textContent = "saved ✓"; confirm.classList.add("show"); setTimeout(() => confirm.classList.remove("show"), 2500); } };
    const applyShippedUi = (shipped) => {
      const card = row.closest(".db-draft-card");
      if (card) card.classList.toggle("db-card-locked", !!shipped);
      if (shipBtn) {
        shipBtn.textContent = shipped ? "✓ Shipped" : "✓ Approve / Ship";
        shipBtn.classList.toggle("db-state-locked", !!shipped);
        shipBtn.disabled = !!shipped;
        shipBtn.setAttribute("aria-label", shipped ? "Already shipped" : "Approve and ship this draft");
      }
    };
    // Reflect whatever was persisted to disk the moment this row is wired — survives reload.
    applyShippedUi(row.getAttribute("data-shipped") === "1");
    const doShip = async () => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact(`draft ${dayKey}`, title, "✓ shipped", words);
      await dbSetDraftShipped(dayKey, title, true);
      if (ok) { if (input) input.value = ""; showSaved(); }
      applyShippedUi(true);
    };
    const doRedo = async () => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact(`draft ${dayKey}`, title, "↻ redo", words);
      await dbSetDraftShipped(dayKey, title, false);
      if (ok) { if (input) input.value = ""; showSaved(); }
      applyShippedUi(false);
    };
    if (shipBtn) shipBtn.addEventListener("click", doShip);
    if (redoBtn) redoBtn.addEventListener("click", doRedo);
    if (input) input.addEventListener("keydown", (e) => {
      if (e.key === "Enter") {
        e.preventDefault();
        (async () => {
          const words = input.value;
          const ok = await dbAppendReact(`draft ${dayKey}`, title, "✎ redlines", words);
          if (ok) { input.value = ""; showSaved(); }
        })();
      }
    });
  });
}

// ============ draft render ============
const DAY_ORDER = ["MON", "WED", "WED-A", "WED-B", "FRI"];
const dayFullLabel = {MON: "Monday", WED: "Wednesday", "WED-A": "Wednesday", "WED-B": "Wednesday", FRI: "Friday"};
const dayChipClass = {MON: "mon", WED: "wed", "WED-A": "wed", "WED-B": "wed", FRI: "fri"};

function dbRenderDraftCard(dayKey, title, lines, shipped) {
  const coverLine = lines.find(l => l.trim().startsWith("**Cover:**"));
  const captionLine = lines.find(l => l.trim().startsWith("**Caption:**"));
  const slideLines = lines.filter(l => /^\d+\.\s/.test(l.trim())).map(l => l.trim().replace(/^\d+\.\s/, ""));
  const coverText = coverLine ? coverLine.replace(/\*\*Cover:\*\*\s*/, "").trim() : "";
  const captionText = captionLine ? captionLine.replace(/\*\*Caption:\*\*\s*/, "").trim() : "";

  const lockedCls = shipped ? " db-card-locked" : "";
  let html = `<article class="db-card db-draft-card${lockedCls}">`;
  html += `<div class="db-section-head"><span class="db-day-name">${dayFullLabel[dayKey] || dayKey}</span></div>`;
  // ---- cover: reuse the quiet bordered no-fill storyboard cover box (shared w/ Arc) ----
  html += `<div class="db-storyboard-cover"><div class="db-sb-cover-row"><span class="db-sb-cover-label">Cover</span><span class="db-serif">${coverText || title}</span></div></div>`;
  // ---- the real deck: every numbered slide line, verbatim ----
  if (slideLines.length) {
    html += `<div class="db-draft-slides">`;
    slideLines.forEach((slideText, i) => {
      html += `<p><span class="db-slide-n">Slide ${i + 1}</span>${slideText}</p>`;
    });
    html += `</div>`;
  }
  // ---- caption ----
  if (captionText) {
    html += `<p class="db-label" style="color:var(--db-muted);margin-bottom:4px;">Caption</p>`;
    html += `<div class="db-caption-box">${captionText}</div>`;
  }
  html += dbShipReactRow(dayKey, title, shipped, "add redlines (Enter to save)", "✓ saves your mark to this week's pitch sheet · reference slide numbers");
  html += `</article>`;
  return html;
}

function dbEmptyDay(dayKey) {
  return `<div class="db-empty"><span class="db-day-chip ${dayChipClass[dayKey] || ""}">${dayFullLabel[dayKey] || dayKey}</span><br/>No draft on file yet. Full deck copy lands here once the writer finishes it.</div>`;
}

const pitchPages = dv.pages('"Team Inbox/pitches"')
  .where(p => p.file.name.match(/^\d{4}-W\d{2}-pitch$/))
  .sort(p => p.file.name, 'desc');

let html = "";

if (pitchPages.length === 0) {
  dv.el("div", "No pitch sheet found in Team Inbox/pitches/ yet.", {cls: "db-empty"});
} else {
  const latest = pitchPages[0];
  const raw = await dv.io.load(latest.file.path);
  const marker = "## Drafts";
  const idx = raw.indexOf(marker);

  // Isolate the Drafts section from its H2 to the next H2 (or EOF), so a later
  // "## Dashboard reacts" section can never bleed its lines into the last block.
  let section = "";
  if (idx !== -1) {
    const after = raw.slice(idx + marker.length);
    const nextH2 = after.search(/\n## /);
    section = nextH2 === -1 ? after : after.slice(0, nextH2);
  }
  const blocks = section ? section.split(/\n### /).slice(1) : [];

  // Build a title lookup per day key from the Drafts blocks.
  const byDay = {};
  for (const block of blocks) {
    const bl = ("### " + block).split("\n");
    const titleLine = bl[0].replace(/^### /, "");
    const dayKey = titleLine.split(" — ")[0].trim();
    let title = titleLine.split(" — ").slice(1).join(" — ").trim();
    // Tolerate a provisional "*(...)*" marker and strip the [shipped] tag from the title.
    title = title.replace(/\s*\[shipped\]\s*$/, "").replace(/\s*\*\(.+?\)\*/, "").trim();
    byDay[dayKey] = {title, lines: bl};
  }

  // Render in canonical day order. WED collapses A/B down to whichever draft(s) exist.
  const rendered = new Set();
  for (const dayKey of DAY_ORDER) {
    if (rendered.has(dayKey)) continue;
    const entry = byDay[dayKey];
    if (entry) {
      const shipped = dbDraftIsShipped(raw, dayKey, entry.title);
      html += dbRenderDraftCard(dayKey, entry.title, entry.lines, shipped);
      rendered.add(dayKey);
    } else if (dayKey === "WED") {
      // If no plain WED draft, only show a single WED empty-state (skip when A/B drafts exist).
      if (!byDay["WED-A"] && !byDay["WED-B"]) { html += dbEmptyDay("WED"); rendered.add("WED"); }
    } else if (dayKey === "WED-A" || dayKey === "WED-B") {
      // handled above; nothing to render when absent
    } else {
      html += dbEmptyDay(dayKey);
      rendered.add(dayKey);
    }
  }

  dv.el("div", html, {});
  dv.el("p", `Source: <a href="${latest.file.path}">${latest.file.name}</a> — the deck, verbatim from the pitch sheet.`, {cls: "db-who"});
  dbWireShipReacts(dv.container);
}
```

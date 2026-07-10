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

<h1 class="db-page-title">03 Hook</h1>
<p class="db-page-sub">Hook options for each approved arc.</p>

```dataviewjs
// ============ shared react-append helper (append-only, pitch sheet only) ============
const REACT_HEADING = "## Dashboard reacts";
function dbNewestPitchFile() {
  const md = app.vault.getMarkdownFiles()
    .filter(f => f.path.startsWith("Studio/Content/") && /^\d{4}-W\d{2}-pitch$/.test(f.basename))
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

// ============ Hook = clone of Concepts' 3-state choose/reject/save flow ============
// Alyssa's correction: "the buttons on the hook page should match concepts because
// I'm choosing from 3" — Hook presents 3 hook variants per arc, the same semantic
// shape as Concepts' choose/reject/save-idea flow, NOT Arc's approve/redo binary.
// Persistence mirrors 01 Concepts' dbMarkConceptChosen / dbSetConceptStateTag exactly,
// just keyed off a hook's own quoted text inside its arc's "Hooks:" line (hooks have
// no individual numbered list line the way concepts do, so the state tag is written
// as a bracketed suffix immediately after the hook's own closing quote instead):
//   Hooks: "hook one" [chosen] · "hook two" [rejected] · "hook three"
// Same mutual-exclusivity rule as Concepts: chosen clears any [saved]/[rejected] tag,
// and chosen is the highest-priority state (a rejected/saved hook can still be chosen,
// which clears its prior tag; a chosen hook does not get rejected/saved re-applied).
// Parse the Hooks: line's hook tokens, each optionally carrying a trailing state tag.
function dbParseHookTokens(hooksRaw) {
  // split on " · " between quoted hooks, tolerant of an optional trailing [tag] per hook
  const re = /"([^"]*)"(\s*\[(chosen|saved|rejected)\])?/g;
  const out = [];
  let m;
  while ((m = re.exec(hooksRaw)) !== null) {
    out.push({ text: m[1], tag: m[3] || null });
  }
  return out;
}
function dbSerializeHookTokens(tokens) {
  return tokens.map(t => `"${t.text}"${t.tag ? ` [${t.tag}]` : ""}`).join(" · ");
}
async function dbSetHookState(dayKey, hookText, tag) {
  // tag: "chosen" | "saved" | "rejected" | null (null clears)
  const file = dbNewestPitchFile();
  if (!file) return false;
  const raw = await app.vault.read(file);
  const lines = raw.split("\n");
  const escDay = String(dayKey).replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const headingRe = new RegExp("^### " + escDay + " —");
  let inBlock = false;
  let changed = false;
  for (let i = 0; i < lines.length; i++) {
    if (headingRe.test(lines[i])) { inBlock = true; continue; }
    if (inBlock && /^### /.test(lines[i])) break; // next arc block, stop
    if (inBlock && /^\s*Hooks:/.test(lines[i])) {
      const prefixMatch = lines[i].match(/^(\s*Hooks:\s*)/);
      const prefix = prefixMatch[1];
      const body = lines[i].slice(prefix.length);
      const tokens = dbParseHookTokens(body);
      let rowChanged = false;
      for (const t of tokens) {
        if (t.text === hookText) {
          const nextTag = tag === "chosen" ? "chosen" : (tag || null);
          if (t.tag !== nextTag) { t.tag = nextTag; rowChanged = true; }
          break;
        }
      }
      if (rowChanged) {
        lines[i] = prefix + dbSerializeHookTokens(tokens);
        changed = true;
      }
      break;
    }
  }
  if (changed) await app.vault.modify(file, lines.join("\n"));
  return changed;
}

function dbWireHookReacts(container) {
  container.querySelectorAll(".db-react-row").forEach(row => {
    if (row.dataset.wired) return;
    row.dataset.wired = "1";
    const stage = row.getAttribute("data-stage") || "";
    const title = row.getAttribute("data-title") || "";
    const input = row.querySelector("input");
    const confirm = row.querySelector(".db-saved");
    const showSaved = (msg) => { if (confirm) { confirm.textContent = msg || "saved ✓"; confirm.classList.add("show"); setTimeout(() => confirm.classList.remove("show"), 2500); } };
    // Reflect whatever state was persisted to disk at render time — survives reload.
    dbApplyHookRowState(row, row.getAttribute("data-state-tag") || null);
    const dayKey = row.getAttribute("data-day") || "";
    const doChoose = async () => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact(stage, title, "✓ chosen", words);
      await dbSetHookState(dayKey, title, "chosen");
      if (ok) { if (input) input.value = ""; showSaved(); }
      dbApplyHookRowState(row, "chosen");
      const card = row.closest(".db-card");
      if (card) card.classList.add("db-card-locked");
    };
    const doReject = async () => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact(stage, title, "✕ rejected", words);
      await dbSetHookState(dayKey, title, "rejected");
      if (ok) { if (input) input.value = ""; showSaved(); }
      dbApplyHookRowState(row, "rejected");
    };
    const doSave = async () => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact(stage, title, "☆ saved", words);
      await dbSetHookState(dayKey, title, "saved");
      if (ok) { if (input) input.value = ""; showSaved("→ idea bank ✓"); }
      dbApplyHookRowState(row, "saved");
    };
    row.querySelectorAll(".db-react-btn").forEach(btn => {
      if (btn.classList.contains("week")) btn.addEventListener("click", doChoose);
      else if (btn.classList.contains("reject")) btn.addEventListener("click", doReject);
      else if (btn.classList.contains("idea")) btn.addEventListener("click", doSave);
    });
    if (input) {
      input.addEventListener("keydown", (e) => {
        if (e.key === "Enter") {
          e.preventDefault();
          (async () => { const words = input.value; const ok = await dbAppendReact(stage, title, "✎ note", words); if (ok) { input.value = ""; showSaved(); } })();
        }
      });
    }
  });
}
// Reflect a persisted chosen/saved/rejected state tag on the row's buttons at render
// time (and again, live, right after a click). Chosen also drives the card's green
// db-card-locked recolor via the caller (same "one signal" rule as Concepts/Arc).
function dbApplyHookRowState(row, stateTag) {
  const chooseBtn = row.querySelector(".db-react-btn.week");
  const rejectBtn = row.querySelector(".db-react-btn.reject");
  const saveBtn = row.querySelector(".db-react-btn.idea");
  if (chooseBtn) { chooseBtn.textContent = "✓ Choose"; chooseBtn.classList.remove("db-state-locked"); chooseBtn.disabled = false; chooseBtn.setAttribute("aria-label", "Choose this hook"); }
  if (rejectBtn) { rejectBtn.textContent = "✕ Reject"; rejectBtn.classList.remove("db-state-locked"); rejectBtn.disabled = false; rejectBtn.setAttribute("aria-label", "Reject"); }
  if (saveBtn) { saveBtn.textContent = "☆ Save"; saveBtn.classList.remove("db-state-locked"); saveBtn.disabled = false; saveBtn.setAttribute("aria-label", "Save this hook"); }
  if (stateTag === "saved" && saveBtn) {
    saveBtn.textContent = "Saved";
    saveBtn.classList.add("db-state-locked");
    saveBtn.disabled = true;
    saveBtn.setAttribute("aria-label", "Already saved");
  } else if (stateTag === "rejected" && rejectBtn) {
    rejectBtn.textContent = "Rejected";
    rejectBtn.classList.add("db-state-locked");
    rejectBtn.disabled = true;
    rejectBtn.setAttribute("aria-label", "Already rejected");
  } else if (stateTag === "chosen" && chooseBtn) {
    chooseBtn.textContent = "Chosen";
    chooseBtn.classList.add("db-state-locked");
    chooseBtn.disabled = true;
    chooseBtn.setAttribute("aria-label", "Already chosen");
  }
  row.setAttribute("data-state-tag", stateTag || "");
}
function dbReactRow(stage, title, dayKey, stateTag, placeholder, hint) {
  const t = String(title).replace(/"/g, "&quot;");
  const tagAttr = stateTag ? ` data-state-tag="${stateTag}"` : "";
  return `<div class="db-react-row" data-stage="${stage}" data-title="${t}" data-day="${dayKey}"${tagAttr}>`
    + `<div class="db-btn-row">`
    +   `<button class="db-react-btn week yes" aria-label="Choose this hook">✓ Choose</button>`
    +   `<button class="db-react-btn reject no" aria-label="Reject">✕ Reject</button>`
    +   `<button class="db-react-btn idea redo" aria-label="Save this hook">☆ Save</button>`
    +   `<span class="db-saved" aria-live="polite"></span>`
    + `</div>`
    + `<div class="db-note-wrap"><input type="text" placeholder="${placeholder}"><span class="db-note-hint">${hint}</span></div>`
    + `</div>`;
}

// ============ hooks render ============
const pitchPages = dv.pages('"Studio/Content"')
  .where(p => p.file.name.match(/^\d{4}-W\d{2}-pitch$/))
  .sort(p => p.file.name, 'desc');

if (pitchPages.length === 0) {
  dv.el("div", "No pitch sheet found in Studio/Content/ yet.", {cls: "db-empty"});
} else {
  const latest = pitchPages[0];
  const raw = await dv.io.load(latest.file.path);
  const marker = "## Approved — slide skeletons";
  const idx = raw.indexOf(marker);

  if (idx === -1) {
    dv.el("div", "No approved arcs yet, so no hooks to show. Hooks appear here once slide skeletons are approved.", {cls: "db-empty"});
  } else {
    const section = raw.slice(idx);
    const blocks = section.split(/\n### /).slice(1);
    // WED key added defensively (2026-07-07, parity with 02 Arc's identical fix):
    // a lone Wednesday arc (no A/B split) was falling through to the raw "WED"
    // abbreviation via the `|| dayKey` fallback below. Full day names only.
    const dayFullLabel = {MON: "Monday", WED: "Wednesday", "WED-A": "Wednesday", "WED-B": "Wednesday", FRI: "Friday"};

    let html = "";
    for (const block of blocks) {
      const lines = ("### " + block).split("\n");
      const titleLine = lines[0].replace(/^### /, "");
      const dayKey = titleLine.split(" — ")[0].trim();
      const title = titleLine.split(" — ").slice(1).join(" — ");
      const hooksLine = lines.find(l => l.trim().startsWith("Hooks:"));
      if (!hooksLine) continue;

      const hooksRaw = hooksLine.replace(/^\s*Hooks:\s*/, "").trim();
      const hooks = dbParseHookTokens(hooksRaw); // [{text, tag}] — tag-aware, same source of truth dbSetHookState writes to

      html += `<div class="db-section-head"><span class="db-day-name">${dayFullLabel[dayKey] || dayKey}</span> <span class="db-who">${title}</span></div><div class="db-grid">`;
      html += hooks.map(h => {
        const cardCls = h.tag === "chosen" ? "db-card db-card-locked" : "db-card";
        return `<div class="${cardCls}"><h3>${h.text}</h3>`
          + dbReactRow(`hook ${dayKey}`, h.text, dayKey, h.tag, "why (optional, Enter to save)", "✓ saves your mark to this week's pitch sheet")
          + `</div>`;
      }).join("");
      html += `</div>`;
    }
    if (html === "") {
      dv.el("div", "Approved arcs exist but no Hooks: lines were found to parse.", {cls: "db-warn"});
    } else {
      dv.el("div", html, {});
      dv.el("p", `Source: <a href="${latest.file.path}">${latest.file.name}</a>`, {cls: "db-who"});
      dbWireHookReacts(dv.container);
    }
  }
}
```

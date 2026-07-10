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

# Parked

Open questions — answer inline to save.

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
  if (!file) { new Notice("No pitch sheet found to save your answer to."); return false; }
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
function dbWireAnswers(container) {
  container.querySelectorAll(".db-answer-row").forEach(row => {
    if (row.dataset.wired) return;
    row.dataset.wired = "1";
    const title = row.getAttribute("data-title") || "";
    const input = row.querySelector("input");
    const confirm = row.querySelector(".db-saved");
    const showSaved = () => { if (confirm) { confirm.textContent = "saved ✓"; confirm.classList.add("show"); setTimeout(() => confirm.classList.remove("show"), 2500); } };
    if (input) input.addEventListener("keydown", async (e) => {
      if (e.key === "Enter") {
        e.preventDefault();
        const ok = await dbAppendReact("parked", title, "✎ answer", input.value);
        if (ok) { input.value = ""; showSaved(); }
      }
    });
  });
}

const pitchPages = dv.pages('"Team Inbox/pitches"')
  .where(p => p.file.name.match(/^\d{4}-W\d{2}-pitch$/))
  .sort(p => p.file.name, 'desc');

if (pitchPages.length === 0) {
  dv.el("div", "No pitch sheet found in Team Inbox/pitches/ yet.", {cls: "db-empty"});
} else {
  const latest = pitchPages[0];
  const raw = await dv.io.load(latest.file.path);

  function extractSection(sheet, startMarker, endMarker) {
    const start = sheet.indexOf(startMarker);
    if (start === -1) return null;
    const afterStart = sheet.slice(start + startMarker.length);
    const end = endMarker ? afterStart.indexOf(endMarker) : -1;
    return end === -1 ? afterStart : afterStart.slice(0, end);
  }

  const ftg = extractSection(raw, "### FTG interview", "### For Alyssa");
  const forAlyssa = extractSection(raw, "### For Alyssa (parked, not blocking)", "\n---");

  function answerBlock(title, placeholder) {
    const t = String(title).replace(/"/g, "&quot;");
    return `<div class="db-answer-row" data-title="${t}"><div class="db-note-wrap"><input type="text" placeholder="${placeholder}"><span class="db-note-hint">✓ Enter saves your answer to this week's pitch sheet</span></div><span class="db-saved" aria-live="polite"></span></div>`;
  }

  let html = "";
  const strip = [];

  if (ftg) {
    html += `<article class="db-card db-parked-item"><h3>FTG interview &mdash; six quick questions, still unanswered</h3><span class="db-chip">blocks nothing, shapes Friday</span><ol>${ftg.trim().split("\n").filter(l=>l.trim() && /^\d+\./.test(l.trim())).map(l=>`<li>${l.replace(/^\d+\.\s*/, "")}</li>`).join("")}</ol>${answerBlock("FTG interview", "your answer (Enter to save)")}</article>`;
    strip.push("FTG interview (6 questions)");
  }
  if (forAlyssa) {
    // "response = ..." lines are their own bullet in the sheet, immediately
    // following the question bullet they answer. Merge them back onto the
    // preceding bullet before splitting, so each card gets its own answer.
    const merged = forAlyssa.replace(/\n- \s*response\s*=\s*/gi, "\nresponse = ");
    const rawItems = merged.split(/\n- /).map(s => s.replace(/^- /, "").trim()).filter(Boolean);
    for (const raw of rawItems) {
      const parts = raw.split(/\n\s*response\s*=\s*/i);
      const question = parts[0].trim();
      const answer = parts[1] ? parts[1].trim() : null;
      const heading = question.replace(/\*\*/g, "").split(" — ")[0].slice(0, 90);
      html += `<article class="db-card db-parked-item"><p>${question.replace(/\*\*(.+?)\*\*/g, "<strong>$1</strong>")}</p>`;
      if (answer) {
        html += `<div class="db-her-words"><span class="db-label">your answer</span>"${answer}"</div>`;
      } else {
        html += answerBlock(heading, "your answer (Enter to save)");
        strip.push(heading);
      }
      html += `</article>`;
    }
  }

  if (html === "") {
    dv.el("div", "No parked items found in the current pitch sheet.", {cls: "db-empty"});
  } else {
    dv.el("div", html, {});
    if (strip.length) {
      const stripHtml = `<span class="db-label" style="color:var(--db-terracotta);">Parked for you</span>` +
        strip.map(s => `<button class="db-strip-btn">${s}</button>`).join("");
      dv.el("div", stripHtml, {cls: "db-parked-strip"});
    }
    dv.el("p", `Source: <a href="${latest.file.path}">${latest.file.name}</a>`, {cls: "db-who"});
    dbWireAnswers(dv.container);
  }
}
```

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

<h1 class="db-page-title">02 Arc</h1>
<p class="db-page-sub">This week's arcs — skim the slides, then approve or send back.</p>

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
// ============ Arc-only 2-state approve/redo persistence ============
// Arc is a binary decision (the page subtitle says "approve or send back"), not a
// three-way pick/kill/redo, so it no longer shares Hook's react-row helper — Hook
// needs Concepts' 3-state choose/reject/save shape instead (see 03 Hook.md).
// Persisted state lives as a "[approved]" suffix tag directly on the arc's own
// "### DAYKEY — Title" heading line in the pitch sheet — same file-based,
// suffix-tag pattern 01 Concepts uses for [saved]/[rejected] (dbSetConceptStateTag),
// just applied to Arc's heading line since arcs aren't numbered list items.
// Mirrors Concepts' "one signal" rule: approval is the ONLY thing that flips the
// card to db-card-locked (green). No default/ambient green — every arc card
// starts neutral/oat, including single-arc MON/FRI days, until approved here.
function dbArcHeadingRegex(dayKey, title) {
  const escTitle = String(title).replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const escDay = String(dayKey).replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  return new RegExp("^(### " + escDay + " — )" + escTitle + "(\\s*\\*\\(.+?\\)\\*)?\\s*(\\[approved\\])?\\s*$");
}
async function dbSetArcApproved(dayKey, title, approved) {
  const file = dbNewestPitchFile();
  if (!file) return false;
  const raw = await app.vault.read(file);
  const lines = raw.split("\n");
  const re = dbArcHeadingRegex(dayKey, title);
  let changed = false;
  for (let i = 0; i < lines.length; i++) {
    const m = lines[i].match(re);
    if (!m) continue;
    const provisional = m[2] || "";
    const next = `${m[1]}${title}${provisional}${approved ? " [approved]" : ""}`;
    if (lines[i] !== next) { lines[i] = next; changed = true; }
    break;
  }
  if (changed) await app.vault.modify(file, lines.join("\n"));
  return changed;
}
function dbArcIsApproved(raw, dayKey, title) {
  const re = dbArcHeadingRegex(dayKey, title);
  return raw.split("\n").some(l => {
    const m = l.match(re);
    return m && !!m[3];
  });
}

function dbWireArcReacts(container) {
  container.querySelectorAll(".db-arc-react-row").forEach(row => {
    if (row.dataset.wired) return;
    row.dataset.wired = "1";
    const dayKey = row.getAttribute("data-day") || "";
    const title = row.getAttribute("data-title") || "";
    const input = row.querySelector("input");
    const confirm = row.querySelector(".db-saved");
    const approveBtn = row.querySelector(".db-react-btn.approve");
    const redoBtn = row.querySelector(".db-react-btn.redo");
    const showSaved = () => { if (confirm) { confirm.textContent = "saved ✓"; confirm.classList.add("show"); setTimeout(() => confirm.classList.remove("show"), 2500); } };
    const applyApprovedUi = (approved) => {
      const card = row.closest(".db-arc");
      if (card) card.classList.toggle("db-card-locked", !!approved);
      if (approveBtn) {
        approveBtn.textContent = approved ? "✓ Approved" : "✓ Approve";
        approveBtn.classList.toggle("db-state-locked", !!approved);
        approveBtn.disabled = !!approved;
        approveBtn.setAttribute("aria-label", approved ? "Already approved" : "Approve this arc");
      }
    };
    // Reflect whatever was persisted to disk the moment this row is wired — survives reload.
    applyApprovedUi(row.getAttribute("data-approved") === "1");
    const doApprove = async () => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact(`arc ${dayKey}`, title, "✓ approved", words);
      await dbSetArcApproved(dayKey, title, true);
      if (ok) { if (input) input.value = ""; showSaved(); }
      applyApprovedUi(true);
    };
    const doRedo = async () => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact(`arc ${dayKey}`, title, "↻ redo", words);
      await dbSetArcApproved(dayKey, title, false);
      if (ok) { if (input) input.value = ""; showSaved(); }
      applyApprovedUi(false);
    };
    if (approveBtn) approveBtn.addEventListener("click", doApprove);
    if (redoBtn) redoBtn.addEventListener("click", doRedo);
    if (input) input.addEventListener("keydown", (e) => {
      if (e.key === "Enter") {
        e.preventDefault();
        (async () => {
          const words = input.value;
          const ok = await dbAppendReact(`arc ${dayKey}`, title, "✎ note", words);
          if (ok) { input.value = ""; showSaved(); }
        })();
      }
    });
  });
}
// ============ slide card read-more toggle ============
// Root cause of the truncation Alyssa flagged: pure CSS (-webkit-line-clamp: 4
// on .db-slide-text in dashboard.css), not a JS slice — the full text was
// always in the DOM (also carried in the `title` attribute for hover), it was
// just visually clipped with no way to see the rest before Approve/Redo.
// Fix: click (or Enter/Space when focused) toggles .db-slide-expanded on that
// one card, which a CSS override lifts the clamp for. Click again to collapse.
function dbWireSlideExpand(container) {
  const toggle = (card) => {
    const expanded = card.classList.toggle("db-slide-expanded");
    card.setAttribute("aria-expanded", expanded ? "true" : "false");
    const hint = card.querySelector(".db-slide-expand-hint");
    if (hint) hint.textContent = expanded ? "show less" : "read more";
  };
  container.querySelectorAll(".db-slide-card").forEach(card => {
    if (card.dataset.wired) return;
    card.dataset.wired = "1";
    card.addEventListener("click", () => toggle(card));
    card.addEventListener("keydown", (e) => {
      if (e.key === "Enter" || e.key === " ") { e.preventDefault(); toggle(card); }
    });
  });
}
function dbArcReactRow(dayKey, title, approved, placeholder, hint) {
  const t = String(title).replace(/"/g, "&quot;");
  return `<div class="db-arc-react-row" data-day="${dayKey}" data-title="${t}" data-approved="${approved ? "1" : "0"}">`
    + `<div class="db-btn-row">`
    +   `<button class="db-react-btn week yes approve${approved ? " db-state-locked" : ""}" aria-label="${approved ? "Already approved" : "Approve this arc"}"${approved ? " disabled" : ""}>${approved ? "✓ Approved" : "✓ Approve"}</button>`
    +   `<button class="db-react-btn reject redo" aria-label="Send back for a redo">↻ Redo</button>`
    +   `<span class="db-saved" aria-live="polite"></span>`
    + `</div>`
    + `<div class="db-note-wrap"><input type="text" placeholder="${placeholder}"><span class="db-note-hint">${hint}</span></div>`
    + `</div>`;
}

// ============ arc render ============
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
    dv.el("div", "This pitch sheet has no 'Approved — slide skeletons' section yet. Arcs will render here once slides are approved.", {cls: "db-empty"});
  } else {
    // Bound the arc section to the NEXT "## " heading (or EOF), so downstream H2
    // sections — "## Drafts", "## Dashboard reacts" — never leak their own "### "
    // blocks into the arc render. Added 2026-07-09 (Felix): once "## Drafts" was
    // introduced below this section on the W30 sheet, the old raw.slice(idx)-to-EOF
    // read was pulling the Draft's "### FRI …" block in as a phantom third arc.
    const afterMarker = raw.slice(idx + marker.length);
    const nextH2 = afterMarker.search(/\n## /);
    const section = nextH2 === -1 ? raw.slice(idx) : raw.slice(idx, idx + marker.length + nextH2);
    // split into ### blocks
    const blocks = section.split(/\n### /).slice(1); // drop the H2 preamble
    const dayChipClass = {MON: "mon", "WED-A": "wed", "WED-B": "wed", FRI: "fri"};
    // WED key added defensively (2026-07-07): a lone Wednesday arc (no A/B split)
    // was falling through to the raw "WED" abbreviation via the `|| dayKey`
    // fallback below, since only WED-A/WED-B were mapped. Full day names only,
    // never an abbreviation, regardless of how the day key is written upstream.
    const dayFullLabel = {MON: "Monday", WED: "Wednesday", "WED-A": "Wednesday", "WED-B": "Wednesday", FRI: "Friday"};

    // Parse a slide line's leading role label, e.g. "1. Cover: title + hook" -> role "Cover".
    // Falls back to "Slide N" if no colon-delimited label is present.
    function dbSlideRole(slideText, slideNum) {
      const m = slideText.match(/^([A-Za-z][A-Za-z0-9 ]{0,18}?):/);
      if (m) return m[1].trim();
      return `Slide ${slideNum}`;
    }

    function renderArcCard(dayKey, title, lines, opts) {
      opts = opts || {};
      const cls = dayChipClass[dayKey] || "";
      const slideLines = lines.filter(l => /^\d+\.\s/.test(l.trim())).map(l => l.trim().replace(/^\d+\.\s/, ""));
      const sourcesLine = lines.find(l => l.trim().startsWith("Sources:"));
      const coverLine = lines.find(l => l.trim().startsWith("**Cover:**"));
      const noteLine = lines.find(l => l.trim().startsWith("Note:") || l.trim().startsWith("Parked:"));
      // Green card recolor is gated on real persisted approval only (dbArcIsApproved),
      // never on "this is the only option" or "this day only has one arc" — that was
      // the ambient-tint bug Alyssa flagged. opts.approved is passed in by the caller.
      const lockedCls = opts.approved ? " db-card-locked" : "";

      let html = `<article class="db-card db-arc${lockedCls}">`;
      if (opts.optionChip) {
        // A/B cards have no section header above them, so they carry their own chip + title.
        html += `<div class="db-chip-row"><span class="db-chip lavender">${opts.optionChip}</span></div>`;
      }
      if (opts.provisional) html += `<p class="db-warn">${opts.provisional}</p>`;

      // ---- storyboard: compact hero cover row + slide-card grid ----
      // REDESIGNED 2026-07-07 (Alyssa's direct call: the old full-width
      // bordered box was "ugly," "huge," "long" — small "COVER" label +
      // one line of large serif text with a lot of empty vertical padding,
      // reading as an empty placeholder rather than a considered element.
      // Root cause of the emptiness: the box's only content was the
      // **Cover:** description line, and the post title had JUST been
      // removed from the day-heading row above (see the day-heading fix
      // in this same pass) — the title needs exactly one home now, and
      // this hero row is it, NOT the day-heading row.
      // New treatment: a single compact line — small mono "COVER" label,
      // then the title in AT KING serif immediately beside it, left-
      // aligned, tight line-height, no stretchy full-width empty box.
      // If a distinct **Cover:** description exists in source (rare —
      // most arcs only have a title), it renders as a quieter second line
      // directly under the title, same card, still compact.
      // REMOVED 2026-07-07 (Alyssa's direct flag): in every real pitch sheet,
      // the **Cover:** line is just the title repeated verbatim (see
      // Studio/Content/2026-W29-pitch.md — "**Cover:** The Email That
      // Wakes Up A Dead List" under a heading of the exact same title), so
      // this was rendering the same title twice, stacked, on every card —
      // not the rare distinct-description case the comment above assumed.
      // Root cause: the "distinct description" check was missing entirely —
      // coverText rendered whenever a **Cover:** line existed at all, with
      // no comparison against title. Fix: only treat it as a genuine second
      // line when it's actually different from the title (case/whitespace-
      // insensitive compare); otherwise there is nothing to show, and no
      // element renders — no scenario needs the same title shown twice.
      const coverTextRaw = coverLine ? coverLine.replace(/\*\*Cover:\*\*\s*/, "").trim() : null;
      const normFold = (s) => String(s).trim().toLowerCase().replace(/\s+/g, " ");
      const coverText = (coverTextRaw && normFold(coverTextRaw) !== normFold(title)) ? coverTextRaw : null;
      html += `<div class="db-storyboard-cover"><div class="db-sb-cover-row"><span class="db-sb-cover-label">Cover</span><span class="db-serif">${title}</span></div>`;
      if (coverText) html += `<span class="db-sb-cover-desc">${coverText}</span>`;
      html += `</div>`;
      if (slideLines.length) {
        html += `<div class="db-storyboard-grid">`;
        slideLines.forEach((slideText, i) => {
          const n = i + 1;
          const role = dbSlideRole(slideText, n);
          // Slide 1 duplicates the cover concept — skip its own mini-card since the cover card above already shows it.
          if (n === 1 && /^cover/i.test(role)) return;
          const bodyText = slideText.replace(/^[A-Za-z][A-Za-z0-9 ]{0,18}?:\s*/, "");
          const full = String(slideText).replace(/"/g, "&quot;");
          const isGenericRole = /^Slide \d+$/.test(role);
          const roleHtml = isGenericRole ? "" : `<span class="db-slide-role">${role}</span>`;
          // title="" keeps the native hover tooltip as a zero-JS fallback; the
          // card is also a click/keyboard toggle (see dbWireSlideExpand) since
          // Alyssa needs to actually read the full text to approve/redo — a
          // hover-only affordance wasn't discoverable enough on its own.
          html += `<div class="db-slide-card" title="${full}" tabindex="0" role="button" aria-expanded="false" aria-label="Slide ${n}${isGenericRole ? "" : " — " + role}, click to read full text"><span class="db-slide-num">${n}</span>${roleHtml}<span class="db-slide-text">${bodyText}</span><span class="db-slide-expand-hint">read more</span></div>`;
        });
        html += `</div>`;
      }

      if (sourcesLine) {
        const srcBody = sourcesLine.trim().replace(/^Sources:\s*/, "");
        const tokens = srcBody.split(/\s*[·,]\s*/).map(t => t.trim()).filter(Boolean);
        // Display label: basename only, humanized (strip extension, dashes/underscores -> spaces,
        // title-case each word) — full raw path stays intact as the link target so wikilink/href
        // resolution is untouched. Long raw paths as inline link text were the readability problem;
        // the underlying target never needs to change.
        const dbShortSourceLabel = (raw) => {
          const base = raw.split("/").pop().replace(/\.[a-zA-Z0-9]+$/, "");
          const words = base.replace(/[-_]+/g, " ").trim();
          return words.replace(/\b\w/g, (c) => c.toUpperCase());
        };
        const MAX_VISIBLE_SOURCES = 4;
        const visible = tokens.slice(0, MAX_VISIBLE_SOURCES);
        const extra = tokens.length - visible.length;
        const linksHtml = visible.map(t => {
          const esc = t.replace(/"/g, "&quot;");
          const label = dbShortSourceLabel(t).replace(/"/g, "&quot;");
          return `<a href="#" class="db-source-link" data-source="${esc}" title="${esc}">${label}</a>`;
        }).join(`<span class="db-sources-sep">·</span>`);
        const moreHtml = extra > 0 ? `<span class="db-sources-more">+${extra} more</span>` : "";
        html += `<div class="db-sources-strip"><span class="db-sources-label">Sources</span><span class="db-sources-links">${linksHtml}${moreHtml}</span></div>`;
      }
      if (noteLine) {
        const noteBody = noteLine.replace(/^\s*(Parked|Note):\s*/, "");
        const noteLabel = /^\s*Parked:/.test(noteLine) ? "Parked" : "Note";
        html += `<div class="db-arc-note"><span class="db-arc-note-label">${noteLabel}</span>${noteBody}</div>`;
      }
      html += dbArcReactRow(dayKey, title, !!opts.approved, "add arc notes (Enter to save)", "✓ saves your mark to this week's pitch sheet · reference slide numbers");
      if (opts.optionChip) {
        const t = String(title).replace(/"/g, "&quot;");
        html += `<button class="db-pick-btn" data-stage="arc ${dayKey}" data-title="${t}">Pick this one</button>`;
      }
      html += `</article>`;
      return html;
    }

    let html = "";
    let wedA = null, wedB = null, wedRendered = false;
    for (const block of blocks) {
      const lines = ("### " + block).split("\n");
      const titleLine = lines[0].replace(/^### /, "");
      const dayKey = titleLine.split(" — ")[0].trim();
      let title = titleLine.split(" — ").slice(1).join(" — ").trim();
      const provisionalMatch = title.match(/\*\((.+?)\)\*/);
      let provisional = null;
      if (provisionalMatch) {
        provisional = provisionalMatch[1];
        title = title.replace(/\s*\*\(.+?\)\*/, "").trim();
      }

      if (dayKey === "WED-A") { wedA = {title, lines, provisional}; continue; }
      if (dayKey === "WED-B") {
        wedB = {title, lines, provisional};
        // render the A/B pair now, in document order, once both are known
        html += `<div class="db-pick-banner"><strong>Wednesday — pick one.</strong><span class="db-label">A: ${wedA ? wedA.title : "?"} &nbsp;vs&nbsp; B: ${wedB.title}</span></div>`;
        html += `<div class="db-ab-grid">`;
        if (wedA) html += renderArcCard("WED-A", wedA.title, wedA.lines, {optionChip: "Option A", provisional: wedA.provisional, approved: dbArcIsApproved(raw, "WED-A", wedA.title)});
        html += renderArcCard("WED-B", wedB.title, wedB.lines, {optionChip: "Option B", provisional: wedB.provisional, approved: dbArcIsApproved(raw, "WED-B", wedB.title)});
        html += `</div>`;
        wedRendered = true;
        continue;
      }

      // Day-heading row shows ONLY the day name (Monday/Wednesday/Friday) —
      // NOT the post title. The title already renders once, inside the
      // cover card below (.db-storyboard-cover). Showing it a second time
      // here duplicated it (Alyssa flagged this directly, 2026-07-07):
      // "leave it to just say monday wednesday NOT the actual post title
      // since that's on the cover spot." The `<h2>${title}</h2>` that used
      // to sit beside the day name is removed outright, not hidden via CSS.
      html += `<section class="db-block"><div class="db-section-head"><span class="db-day-name">${dayFullLabel[dayKey] || dayKey}</span></div>`;
      // Single-arc days (MON/FRI) appearing in this section means the arc content is
      // locked in as the teaching layer for that day, but that is NOT the same thing
      // as Alyssa having clicked Approve here — the green card is gated strictly on
      // the persisted [approved] tag (dbArcIsApproved), never assumed from "only option".
      html += renderArcCard(dayKey, title, lines, {provisional, approved: dbArcIsApproved(raw, dayKey, title)});
      html += `</section>`;
    }

    // edge case: WED-A present without WED-B (never rendered above)
    if (wedA && !wedRendered) {
      html += `<div class="db-pick-banner"><strong>Wednesday — pick one.</strong><span class="db-label">A: ${wedA.title} &nbsp;vs&nbsp; B: ?</span></div>`;
      html += `<div class="db-ab-grid">` + renderArcCard("WED-A", wedA.title, wedA.lines, {optionChip: "Option A", provisional: wedA.provisional, approved: dbArcIsApproved(raw, "WED-A", wedA.title)}) + `</div>`;
    }

    dv.el("div", html, {});
    dv.el("p", `Source: <a href="${latest.file.path}">${latest.file.name}</a> — verbatim, no editorial condensing.`, {cls: "db-who"});
    dbWireArcReacts(dv.container);
    dbWireSlideExpand(dv.container);
    // wire source-line links to Obsidian's own navigation (raw hrefs aren't linked)
    dv.container.querySelectorAll(".db-source-link[data-source]").forEach(a => {
      if (a.dataset.wired) return;
      a.dataset.wired = "1";
      a.addEventListener("click", (e) => {
        e.preventDefault();
        app.workspace.openLinkText(a.getAttribute("data-source"), dv.current().file.path, false);
      });
    });
    // wire the A/B "Pick this one" buttons — picking an option IS approving that arc,
    // so this now sets the same persisted [approved] tag Approve does (one signal,
    // one mechanism) and greens that card immediately, matching Concepts' Choose.
    dv.container.querySelectorAll(".db-pick-btn[data-title]").forEach(btn => {
      if (btn.dataset.wired) return;
      btn.dataset.wired = "1";
      btn.addEventListener("click", async () => {
        const stage = btn.getAttribute("data-stage") || ""; // "arc WED-A" / "arc WED-B"
        const dayKey = stage.replace(/^arc\s+/, "");
        const title = btn.getAttribute("data-title");
        const ok = await dbAppendReact(stage, title, "✓ picked", "picked this one for Wednesday");
        await dbSetArcApproved(dayKey, title, true);
        if (ok) { const old = btn.textContent; btn.textContent = "picked ✓"; setTimeout(() => { btn.textContent = old; }, 2500); }
        const card = btn.closest(".db-arc");
        if (card) card.classList.add("db-card-locked");
        const row = card ? card.querySelector(".db-arc-react-row") : null;
        const approveBtn = row ? row.querySelector(".db-react-btn.approve") : null;
        if (approveBtn) { approveBtn.textContent = "✓ Approved"; approveBtn.classList.add("db-state-locked"); approveBtn.disabled = true; }
      });
    });
  }
}
```

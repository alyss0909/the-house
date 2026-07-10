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

<h1 class="db-page-title">01 Concepts</h1>
<p class="db-page-sub">This week's concepts — react to save your marks.</p>

```dataviewjs
// ============ shared react-append helper (append-only) ============
// The dashboard's ONLY write target is THIS WEEK'S PITCH SHEET (newest
// YYYY-Www-pitch.md). taste-ledger.md and every other note stay read-only.
// Never overwrites; adds one line per react under a single "## Dashboard reacts"
// heading at the end of the pitch sheet (created once if absent).
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
  // Read current content to see whether the heading already exists (avoid dupes).
  const existing = await app.vault.read(file);
  const now = new Date();
  const pad = (n) => String(n).padStart(2, "0");
  const stamp = `${now.getFullYear()}-${pad(now.getMonth()+1)}-${pad(now.getDate())} ${pad(now.getHours())}:${pad(now.getMinutes())}`;
  const safe = (s) => String(s == null ? "" : s).replace(/\s+/g, " ").trim();
  const line = `- [${stamp}] ${safe(stage)} · ${safe(title)} · ${safe(verdict)} · "${safe(words)}"`;
  let toAppend = "";
  if (!existing.includes(REACT_HEADING)) {
    const sep = existing.endsWith("\n") ? "" : "\n";
    toAppend = `${sep}\n${REACT_HEADING}\n\n${line}\n`;
  } else {
    const sep = existing.endsWith("\n") ? "" : "\n";
    toAppend = `${sep}${line}\n`;
  }
  await app.vault.append(file, toAppend);
  return true;
}

// Append a kept concept to the persistent idea bank (separate from the weekly pitch sheet).
async function dbSaveToIdeaBank(title, desc, offer, theme, words) {
  const path = "Team Inbox/pitches/idea-bank.md";
  let file = app.vault.getAbstractFileByPath(path);
  if (!file) {
    file = await app.vault.create(path, "---\ntitle: Good Idea Bank\npurpose: Parked concepts to pull from anytime.\n---\n\n# Good Idea Bank\n");
  }
  const now = new Date();
  const pad = (n) => String(n).padStart(2, "0");
  const stamp = `${now.getFullYear()}-${pad(now.getMonth()+1)}-${pad(now.getDate())}`;
  const safe = (s) => String(s == null ? "" : s).replace(/\s+/g, " ").trim();
  let entry = `\n## ${safe(title)}\n`;
  entry += `- **Saved:** ${stamp}`;
  if (safe(theme)) entry += ` · **Theme:** ${safe(theme)}`;
  if (safe(offer)) entry += ` · **Offer:** ${safe(offer)}`;
  entry += `\n`;
  if (safe(desc)) entry += `${safe(desc)}\n`;
  if (safe(words)) entry += `- Note: ${safe(words)}\n`;
  await app.vault.append(file, entry);
  return true;
}

// Add/remove the ✓ approval flag on a concept's numbered line in the newest pitch sheet.
// This is what drives the "db-card-locked" green state in the render loop below —
// appending to the reacts log alone does NOT set this flag.
// Choosing a concept always clears any [saved]/[rejected] state tag (mutually exclusive
// with "chosen" — a card can't be both green-locked and saved/rejected-tagged at once).
async function dbMarkConceptChosen(title, chosen) {
  const file = dbNewestPitchFile();
  if (!file) return false;
  const raw = await app.vault.read(file);
  const lines = raw.split("\n");
  const want = String(title).replace(/\s+/g, " ").trim();
  let changed = false;
  for (let i = 0; i < lines.length; i++) {
    const m = lines[i].match(/^(\d+\.\s*)(✓\s*)?(.+?)\s*$/);
    if (!m) continue;
    const { title: lineTitle } = dbSplitStateTag(m[3]);
    if (lineTitle !== want) continue;          // string compare — titles contain periods, don't regex them
    const marked = `${m[1]}✓ ${m[3].replace(/\s*\[(saved|rejected)\]\s*$/i, "").trim()}`;  // chosen, state tag cleared
    const bare   = `${m[1]}${m[3].replace(/\s*\[(saved|rejected)\]\s*$/i, "").trim()}`;     // rejected(via choose)/cleared, state tag cleared
    const next = chosen ? marked : bare;
    if (lines[i] !== next) { lines[i] = next; changed = true; }
    break;
  }
  if (changed) await app.vault.modify(file, lines.join("\n"));
  return changed;
}

// ============ saved / rejected state tag (parallel to the ✓ chosen prefix) ============
// Persisted as a trailing "[saved]" / "[rejected]" tag on the concept's own numbered
// line — same file-based state model as the ✓ prefix, just a suffix instead of a
// prefix so it never collides with the ✓/number parsing. Mutually exclusive with
// ✓ chosen (see dbMarkConceptChosen, which strips this tag when a concept is chosen)
// and with each other (setting one clears the other).
function dbSplitStateTag(rawTitle) {
  const s = String(rawTitle || "");
  const m = s.match(/^(.*?)\s*\[(saved|rejected)\]\s*$/i);
  if (m) return { title: m[1].replace(/\*\*/g, "").replace(/\s+/g, " ").trim(), tag: m[2].toLowerCase() };
  return { title: s.replace(/\*\*/g, "").replace(/\s+/g, " ").trim(), tag: null };
}

async function dbSetConceptStateTag(title, tag) {
  // tag: "saved" | "rejected" | null (null clears any existing tag)
  const file = dbNewestPitchFile();
  if (!file) return false;
  const raw = await app.vault.read(file);
  const lines = raw.split("\n");
  const want = String(title).replace(/\s+/g, " ").trim();
  let changed = false;
  for (let i = 0; i < lines.length; i++) {
    const m = lines[i].match(/^(\d+\.\s*)(✓\s*)?(.+?)\s*$/);
    if (!m) continue;
    if (m[2]) continue; // already chosen (✓) — chosen is the higher-priority state, leave it alone
    const { title: lineTitle } = dbSplitStateTag(m[3]);
    if (lineTitle !== want) continue;
    const next = tag ? `${m[1]}${lineTitle} [${tag}]` : `${m[1]}${lineTitle}`;
    if (lines[i] !== next) { lines[i] = next; changed = true; }
    break;
  }
  if (changed) await app.vault.modify(file, lines.join("\n"));
  return changed;
}

// Wire every .db-react-row in this note's container.
// Three actions: ✓ This week + ✕ Reject → weekly pitch sheet; ☆ Save idea → idea bank.
function dbWireReacts(container) {
  container.querySelectorAll(".db-react-row").forEach(row => {
    if (row.dataset.wired) return;
    row.dataset.wired = "1";
    const stage = row.getAttribute("data-stage") || "";
    const title = row.getAttribute("data-title") || "";
    const desc = row.getAttribute("data-desc") || "";
    const offer = row.getAttribute("data-offer") || "";
    const theme = row.getAttribute("data-theme") || "";
    const input = row.querySelector("input");
    const confirm = row.querySelector(".db-saved");
    const showSaved = (msg) => { if (confirm) { confirm.textContent = msg || "saved ✓"; confirm.classList.add("show"); setTimeout(() => confirm.classList.remove("show"), 2500); } };
    // Reflect whatever state was persisted to disk (parsed off the concept's own
    // numbered line by dbSplitStateTag, passed through as data-state-tag) the moment
    // this row is wired — this is what makes "Saved"/"Rejected" survive a reload.
    dbApplyRowState(row, row.getAttribute("data-state-tag") || null);
    const doReact = async (verdict, chosen) => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact(stage, title, verdict, words);
      if (chosen !== undefined) await dbMarkConceptChosen(title, chosen);
      if (chosen === true) dbApplyRowState(row, null); // chosen clears saved/rejected on this row's buttons too
      if (ok) { if (input) input.value = ""; showSaved(); }
    };
    const doReject = async () => {
      const words = input ? input.value : "";
      const ok = await dbAppendReact("concept", title, "✕ rejected", words);
      await dbMarkConceptChosen(title, false);   // clear any ✓ chosen state
      await dbSetConceptStateTag(title, "rejected");
      if (ok) { if (input) input.value = ""; showSaved(); }
      dbApplyRowState(row, "rejected");
    };
    const doIdea = async () => {
      const words = input ? input.value : "";
      const ok = await dbSaveToIdeaBank(title, desc, offer, theme, words);
      if (ok) await dbSetConceptStateTag(title, "saved");
      if (ok) { if (input) input.value = ""; showSaved("→ idea bank ✓"); }
      dbApplyRowState(row, "saved");
    };
    row.querySelectorAll(".db-react-btn").forEach(btn => {
      if (btn.classList.contains("week")) btn.addEventListener("click", () => doReact("✓ this week", true));
      else if (btn.classList.contains("reject")) btn.addEventListener("click", doReject);
      else if (btn.classList.contains("idea")) btn.addEventListener("click", doIdea);
    });
    if (input) {
      input.addEventListener("keydown", (e) => {
        if (e.key === "Enter") { e.preventDefault(); doReact("✎ note"); }
      });
    }
  });
}

// ============ CTA parsing (freebie/offer name + comment word) ============
// Sheet CTA formats seen: "comment for the Pin Planner (word: PIN vs Pinterest, parked)"
// "comment PIN → Pin Planner (word parked)" · "comment VIRAL → Slowly Viral class RSVP (verify in Notion)"
// "comment Yes Chef → Back of House" · "no CTA"
function dbParseCta(cta) {
  const s = String(cta || "").trim();
  if (/^no cta/i.test(s)) return {freebie: null, word: null, noCta: true};
  // freebie/offer name: text after "->" (or the word "for the"), before any trailing "(...)".
  let freebie = null;
  const arrowMatch = s.match(/(?:→|->)\s*([^(]+)/);
  if (arrowMatch) {
    freebie = arrowMatch[1].trim();
  } else {
    // tolerate both "for the X" and a bare "for X" (e.g. "comment WORD for Offer")
    const forTheMatch = s.match(/\bfor\s+(?:the\s+)?([^(]+)/i);
    if (forTheMatch) freebie = forTheMatch[1].trim();
  }
  if (freebie) freebie = freebie.replace(/\s+/g, " ").trim();
  // comment word: parse the parenthetical, e.g. "(word: PIN vs Pinterest, parked)" or "(word parked)".
  let word = null;
  const parenMatch = s.match(/\(([^)]*)\)/);
  if (parenMatch) {
    const inner = parenMatch[1];
    if (/parked/i.test(inner)) {
      word = "parked";
    } else {
      const wordMatch = inner.match(/word:?\s*([A-Za-z][A-Za-z ]*)/i);
      if (wordMatch) word = wordMatch[1].trim().split(/\s+vs\s+/i)[0].trim();
    }
  } else {
    // fall back to leading token after "comment"
    const commentMatch = s.match(/^comment\s+([A-Za-z]+)/i);
    if (commentMatch) word = commentMatch[1];
  }
  return {freebie, word, noCta: false};
}
function dbShortenCta(cta) {
  const s = String(cta || "").trim();
  if (/^no cta/i.test(s)) return "no CTA";
  return s.length > 28 ? s.slice(0, 25) + "..." : s;
}

// ============ concepts render ============
const pitchPages = dv.pages('"Team Inbox/pitches"')
  .where(p => p.file.name.match(/^\d{4}-W\d{2}-pitch$/))
  .sort(p => p.file.name, 'desc');

function reactRow(stage, title, desc, offer, theme, stateTag) {
  const esc = (s) => String(s == null ? "" : s).replace(/"/g, "&quot;");
  const tagAttr = stateTag ? ` data-state-tag="${stateTag}"` : "";
  return `<div class="db-react-row" data-stage="${stage}" data-title="${esc(title)}" data-desc="${esc(desc)}" data-offer="${esc(offer)}" data-theme="${esc(theme)}"${tagAttr}>`
    + `<div class="db-btn-row">`
    +   `<button class="db-react-btn week yes" aria-label="Choose for this week">✓ Choose</button>`
    +   `<button class="db-react-btn reject no" aria-label="Reject">✕ Reject</button>`
    +   `<button class="db-react-btn idea redo" aria-label="Save to idea bank">☆ Save</button>`
    +   `<span class="db-saved" aria-live="polite"></span>`
    + `</div>`
    + `<div class="db-note-wrap"><input type="text" placeholder="optional note (Enter to save)"></div>`
    + `</div>`;
}

// Reflect a persisted saved/rejected state tag on the row's buttons at render time
// (and again, live, right after a click — no reload needed to see the new state).
// Chosen (✓, green card) is handled separately via db-card-locked and is NOT this function's job.
function dbApplyRowState(row, stateTag) {
  const weekBtn = row.querySelector(".db-react-btn.week");
  const rejectBtn = row.querySelector(".db-react-btn.reject");
  const ideaBtn = row.querySelector(".db-react-btn.idea");
  // reset to default every time, then layer the active tag on top
  if (weekBtn) { weekBtn.textContent = "✓ Choose"; weekBtn.classList.remove("db-state-locked"); weekBtn.disabled = false; }
  if (rejectBtn) { rejectBtn.textContent = "✕ Reject"; rejectBtn.classList.remove("db-state-locked"); rejectBtn.disabled = false; }
  if (ideaBtn) { ideaBtn.textContent = "☆ Save"; ideaBtn.classList.remove("db-state-locked"); ideaBtn.disabled = false; }
  if (stateTag === "saved" && ideaBtn) {
    ideaBtn.textContent = "Saved";
    ideaBtn.classList.add("db-state-locked");
    ideaBtn.disabled = true;
    ideaBtn.setAttribute("aria-label", "Already saved to idea bank");
  } else if (stateTag === "rejected" && rejectBtn) {
    rejectBtn.textContent = "Rejected";
    rejectBtn.classList.add("db-state-locked");
    rejectBtn.disabled = true;
    rejectBtn.setAttribute("aria-label", "Already rejected");
  }
  if (weekBtn) weekBtn.setAttribute("aria-label", "Choose for this week");
  if (rejectBtn && rejectBtn.textContent === "✕ Reject") rejectBtn.setAttribute("aria-label", "Reject");
  if (ideaBtn && ideaBtn.textContent === "☆ Save") ideaBtn.setAttribute("aria-label", "Save to idea bank");
  row.setAttribute("data-state-tag", stateTag || "");
}

if (pitchPages.length === 0) {
  dv.el("div", "No pitch sheet found in Team Inbox/pitches/ yet. Once one exists (named like 2026-W28-pitch.md), concepts will render here automatically.", {cls: "db-empty"});
} else {
  const latest = pitchPages[0];
  const raw = await dv.io.load(latest.file.path);
  // ponytail: strip a leading YAML frontmatter fence before line-parsing — an
  // off-format sheet with `---\n...\n---` at the top used to hit the footer
  // `---` stop-check on line 1 and abort before ever reaching a day header.
  const body = raw.replace(/^---\s*\n[\s\S]*?\n---\s*\n/, "");
  const lines = body.split("\n");
  const themeMatch = raw.match(/\*\*Theme:\*\*\s*(.+?)(?:\s*·|\n|$)/);
  const themeStr = themeMatch ? themeMatch[1].trim() : "";

  const dayChipClass = {Monday: "mon", Wednesday: "wed", Friday: "fri"};
  let html = "";
  let inDayBlock = false;
  let pending = null; // {approved, title, desc:[]}

  // Concepts are now a title line ("N. Title") followed by a plain-English
  // description paragraph that ends with the CTA clause ("— comment ... " or "— no CTA").
  function flushConcept() {
    if (!pending) return;
    const desc = pending.desc.join(" ").trim();
    // pull the CTA clause off the description for the chip; keep the rest visible.
    // Accepts the original trailing "— comment ..." / "— no cta..." clause, PLUS
    // a "CTA: comment WORD for/→ Offer" label (any position in the line) — tolerance
    // for sheets that write the CTA as its own labeled clause instead of an em-dash tail.
    let ctaMatch = desc.match(/[—-]\s*(comment\b.*|no cta.*)$/i);
    if (!ctaMatch) ctaMatch = desc.match(/\bCTA:\s*(comment\b.*|no cta.*)$/i);
    const ctaStr = ctaMatch ? ctaMatch[1].trim() : "";
    const visible = ctaMatch ? desc.slice(0, ctaMatch.index).replace(/[—-]\s*$/, "").replace(/\bCTA:\s*$/i, "").trim() : desc;
    const parsed = dbParseCta(ctaStr);
    const approved = pending.approved;
    const cardCls = approved ? "db-card db-card-locked" : "db-card";
    // One oval per card: the freebie/offer name. Nothing when there's no CTA (Friday).
    const freebie = (!parsed.noCta && parsed.freebie) ? parsed.freebie : "";
    const chipRow = freebie ? `<div class="db-chip-row"><span class="db-chip db-pill-freebie">${freebie}</span></div>` : "";
    html += `<div class="${cardCls}"><h3>${pending.title}</h3><p class="db-concept-desc">${visible}</p>`
      + chipRow
      + reactRow("concept", pending.title, visible, freebie, themeStr, pending.stateTag) + `</div>`;
    pending = null;
  }

  for (const line of lines) {
    // case-insensitive day header match (ALL-CAPS / any-case sheets still parse);
    // normalize the captured name to Title-case for the dayChipClass lookup + display.
    const dayMatch = line.match(/^##\s*(monday|wednesday|friday)\s*[—-]\s*(.+)$/i);
    if (dayMatch) {
      flushConcept();
      if (inDayBlock) html += `</div>`;
      const dayName = dayMatch[1][0].toUpperCase() + dayMatch[1].slice(1).toLowerCase();
      const cls = dayChipClass[dayName] || "";
      // dayMatch[2] is like "Education (freebie: Email List Revival Plan)" — keep only the
      // category word ("Education"/"Offer"/"For The Girls") in an oval that matches the calendar.
      const catText = dayMatch[2].split(/\s*\(/)[0].trim();
      html += `<div class="db-day-head"><span class="db-day-name">${dayName}</span><span class="db-cal-type ${cls}">${catText}</span></div><div class="db-grid">`;
      inDayBlock = true;
      continue;
    }
    // stop at the footer / any other section
    if (line.match(/^---\s*$/) || line.match(/^###\s/) || (line.match(/^##\s/) && !dayMatch)) {
      flushConcept();
      if (inDayBlock) { html += `</div>`; inDayBlock = false; }
      break;
    }
    if (!inDayBlock) continue;
    const numMatch = line.match(/^(\d+)\.\s*(✓\s*)?(.+)$/);
    if (numMatch) {
      flushConcept();
      const { title: cleanTitle, tag: stateTag } = dbSplitStateTag(numMatch[3]);
      pending = { approved: !!numMatch[2], title: cleanTitle, stateTag, desc: [] };
      continue;
    }
    if (pending && line.trim() !== "") pending.desc.push(line.trim());
  }
  flushConcept();
  if (inDayBlock) html += `</div>`;

  if (html === "") {
    dv.el("div", "Pitch sheet found but no concept lines could be parsed. Check the sheet's day-group / numbered-list format hasn't changed.", {cls: "db-warn"});
  } else {
    const wrap = dv.el("div", html, {cls: "db-concepts-wrap"});
    dv.el("p", `Source: <a href="${latest.file.path}">${latest.file.name}</a>`, {cls: "db-who"});
    // Scope wiring to THIS block's rendered element so concept rows can never
    // pick up an arc row's data-stage (all rows here carry data-stage="concept").
    dbWireReacts(wrap || dv.container);
  }
}
```

---
cssclasses: [dashboard]
title: The Mailroom
updated: 2026-07-10
---

```dataviewjs
// ============ shared state ledger — this file is the only write target ============
// Every action lives as one hidden HTML-comment line under "## Mailroom state",
// self-contained (no cross-referencing an item table), so Larry's /mailroom
// command can act on it directly:
//   <!--state:reply:ACCT:THREADID:queued-->   -> Larry drafts, then flips to :done
//   <!--state:archive:ACCT:MESSAGEID:queued--> -> Larry archives, then flips to :done
//   <!--state:task:ID:done-->                  -> just a checklist, no Gmail action
const STATE_HEAD = "## Mailroom state";
const REACT_HEAD = "## Mailroom reacts";

async function mrRead() {
  const abs = app.vault.getAbstractFileByPath(dv.current().file.path);
  return { abs, text: await app.vault.read(abs) };
}
function mrStates(text) {
  const map = {};
  for (const m of text.matchAll(/<!--state:([^-]+(?:-(?!-)[^-]*)*)-->/g)) {
    const parts = m[1].split(":");
    const status = parts.pop();
    map[parts.join(":")] = status;
  }
  return map;
}
async function mrSetState(key, status) {
  const { abs, text } = await mrRead();
  const marker = `<!--state:${key}:`;
  const re = new RegExp(marker.replace(/[.*+?^${}()|[\]\\]/g, "\\$&") + "\\w+-->");
  let out;
  if (text.match(re)) {
    out = text.replace(re, `${marker}${status}-->`);
  } else {
    const sep = text.endsWith("\n") ? "" : "\n";
    const line = `${marker}${status}-->`;
    out = text.includes(STATE_HEAD)
      ? text.replace(STATE_HEAD, `${STATE_HEAD}\n${line}`)
      : `${text}${sep}\n${STATE_HEAD}\n${line}\n`;
  }
  await app.vault.modify(abs, out);
}
async function mrReact(line) {
  const { abs, text } = await mrRead();
  const d = new Date(); const p = n => String(n).padStart(2,"0");
  const stamp = `${d.getFullYear()}-${p(d.getMonth()+1)}-${p(d.getDate())} ${p(d.getHours())}:${p(d.getMinutes())}`;
  const entry = `- [${stamp}] ${line}`;
  if (!text.includes(REACT_HEAD)) {
    const sep = text.endsWith("\n") ? "" : "\n";
    await app.vault.modify(abs, `${text}${sep}\n${REACT_HEAD}\n\n${entry}\n`);
    return;
  }
  const lines = text.split("\n");
  const idx = lines.findIndex(l => l.trim() === REACT_HEAD);
  lines.splice(idx + 2, 0, entry);
  await app.vault.modify(abs, lines.join("\n"));
}
window.__mr = { mrRead, mrStates, mrSetState, mrReact };
```

```dataviewjs
const { mrRead, mrStates } = window.__mr;
const { text } = await mrRead();
const states = mrStates(text);
const isQueuedOrDone = k => states[k] === "queued" || states[k] === "done";

const replyItems = [
  {id:"reply:alyssa:19d1ad5a4b1bba2f", acct:"business", who:"Dennis Dampil — bookkeeper", subj:"Needs your June 2026 bank statements to close the books.", tag:"Draft"},
  {id:"reply:support:19f2003887a696d6", acct:"support", who:"Julien — Routine AI", subj:"Partnership proposal, sent demo videos, waiting on you.", tag:"Options"},
  {id:"reply:alyssa:19f46f3a4d38db97", acct:"business", who:"Bundles That Benefit", subj:"Online Business Bundle 2026 invite, chasing your answer.", tag:"Options"},
];
const taskItems = [
  {id:"task:dennis", acct:"business", who:"Send June bank statements to Dennis", subj:"Pairs with the draft above."},
  {id:"task:ananya", acct:"wellness", who:"Approve Ananya into Back of House group", subj:"She paid $198 and is waiting at the door."},
  {id:"task:notionsocial", acct:"business", who:"Notionsocial card failing — $144", subj:"Update the card or cancel before cut-off."},
  {id:"task:boh", acct:"business", who:"Back of House — 2 failed payments", subj:"Check ThriveCart dunning — recoverable revenue."},
  {id:"task:camila", acct:"business", who:"Close out Camila on Upwork", subj:"$460 paid. Reply + leave feedback."},
  {id:"task:security", acct:"personal", who:"Google security check", subj:"“Someone tried to view saved passwords.” 60-sec check."},
  {id:"task:horizon", acct:"support", who:"Horizon workflow — fixed", subj:"Commit 8a47c5d landed. Watch tomorrow's run go green."},
  {id:"task:addevent", acct:"support", who:"AddEvent plan limit approaching", subj:"Upgrade or prune before invites stop."},
];
// Filled in by "/mailroom sweep" as <!--away:ACCT:MESSAGEID:Sender — Subject--> lines; empty right now.
const awayItems = [...text.matchAll(/<!--away:([a-z]+):([^:]+):([^>]+)-->/g)].map(m => ({
  id: `archive:${m[1]}:${m[2]}`, acct: m[1], who: m[3].split(" — ")[0]?.trim() || m[3], subj: m[3],
}));

const ACCT_LABEL = {business:"business", support:"support", personal:"personal", wellness:"wellness"};

function statBox(cls, n, label) {
  return `<div class="db-mail-stat ${cls}"><div class="db-mail-stat-n">${n}</div><div class="db-mail-stat-l">${label}</div></div>`;
}
let head = `<h1 class="db-page-title">The Mailroom</h1>`;
head += `<p class="db-page-sub">Four inboxes, one desk. Click a card — it locks in instantly. Then tell Larry <code>/mailroom</code> to run the Gmail side. No server, no keys, nothing sends or deletes without the click.</p>`;
head += `<div class="db-mail-stats">`;
head += statBox("reply", replyItems.filter(i => !isQueuedOrDone(i.id)).length, "Need a reply");
head += statBox("task", taskItems.filter(i => !isQueuedOrDone(i.id)).length, "Open tasks");
head += statBox("away", awayItems.length ? awayItems.filter(i => !isQueuedOrDone(i.id)).length : 0, "Ready to file");
head += `</div>`;
dv.el("div", head, {});

function renderSection(container, {icon, title, sub, items, btnClass, btnLabel, queuedLabel, doneLabel, stateKind}) {
  const wrap = container.createEl("div");
  wrap.innerHTML = `<div class="db-mail-section-title"><span class="db-mail-section-icon">${icon}</span><h2>${title}</h2><span class="db-mail-sub">${sub}</span></div>`;
  if (!items.length) {
    wrap.innerHTML += `<div class="db-empty">Nothing here right now.</div>`;
    return;
  }
  const grid = wrap.createEl("div", {cls: "db-grid"});
  for (const it of items) {
    const state = states[it.id];
    const locked = state === "queued" || state === "done";
    const card = grid.createEl("div", {cls: "db-card" + (locked ? " db-card-locked" : "")});
    card.innerHTML = `
      <h3>${it.who}</h3>
      <div class="db-chip-row"><span class="db-chip lavender">${ACCT_LABEL[it.acct] || it.acct}</span>${it.tag ? `<span class="db-chip">${it.tag}</span>` : ""}</div>
      <p class="db-concept-desc">${it.subj}</p>
      <div class="db-react-row"><div class="db-btn-row">
        <button class="db-react-btn ${btnClass} ${locked ? "db-state-locked" : ""}">${locked ? (state === "done" ? doneLabel : queuedLabel) : btnLabel}</button>
      </div></div>`;
    grid.appendChild(card);
    if (!locked) {
      card.querySelector("button").addEventListener("click", async (e) => {
        card.classList.add("db-card-locked");
        e.currentTarget.classList.add("db-state-locked");
        e.currentTarget.textContent = queuedLabel;
        await window.__mr.mrSetState(it.id, "queued");
        await window.__mr.mrReact(`queued ${stateKind} · ${it.who}`);
      });
    }
  }
}

const root = dv.el("div", "", {});
renderSection(root, {icon:"✍️", title:"Needs reply", sub:"click to have Larry draft it", items: replyItems,
  btnClass:"week", btnLabel:"✓ Ready to draft", queuedLabel:"✓ Queued for Larry", doneLabel:"✓ Drafted", stateKind:"reply"});
renderSection(root, {icon:"✅", title:"Your tasks", sub:"click to mark done", items: taskItems,
  btnClass:"idea", btnLabel:"✓ Mark done", queuedLabel:"✓ Done", doneLabel:"✓ Done", stateKind:"task"});
renderSection(root, {icon:"📥", title:"Put away", sub:"click to queue for archive", items: awayItems,
  btnClass:"reject", btnLabel:"✓ Queue archive", queuedLabel:"✓ Queued", doneLabel:"✓ Archived", stateKind:"archive"});

if (!awayItems.length) {
  root.innerHTML += `<div class="db-empty">Today's noise pile is already cleared (53 archived). Say <code>/mailroom sweep</code> and Larry re-scans all four inboxes and fills this section with click-to-queue cards.</div>`;
}
dv.el("p", "Already replied, cleared: Breannah, Jennifer, Natalie.", {cls: "db-mail-sub", attr: {style: "margin-top:-8px"}});
```

<div class="db-mail-reacts">

## Mailroom reacts

- [2026-07-10 15:40] archived 53 across all 4 inboxes (curated noise) · Manychat invoice kept for Xero
- [2026-07-10 15:25] Horizon Pages build fixed (commit 8a47c5d)

</div>

## Mailroom state
<!-- hidden ledger — Larry's /mailroom command reads/writes this section. Do not delete the heading. -->

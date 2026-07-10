---
cssclasses: [dashboard]
title: The Mailroom
updated: 2026-07-10
---

```dataviewjs
// ---- header card: title, instructions, live counts read from this file ----
const content = await dv.io.load(dv.current().file.path);
const lines = content.split("\n");

const needsReply = lines.filter(l => /<!--draft:/.test(l));
const tasks = lines.filter(l => /^- \[[ x]\]/i.test(l) && !/<!--draft:/.test(l) && !/<!--arc:/.test(l));
const putAway = lines.filter(l => /<!--arc:/.test(l));
const openCount = arr => arr.filter(l => /^- \[ \]/.test(l)).length;

let head = `<div class="db-header-card">`;
head += `<div class="db-header-top"><h1>The Mailroom</h1>`;
head += `<span class="db-week-chip">${openCount(needsReply)} to draft &middot; ${openCount(tasks)} open tasks &middot; ${openCount(putAway)} to file</span>`;
head += `</div>`;
head += `<p class="db-header-sub">Four inboxes, one desk. Tick a box, then tell Larry <code>/mailroom</code> — he does the Gmail action with the tools he already has. No server, no keys, nothing sends or deletes without the box.</p>`;
head += `</div>`;
dv.el("div", head, {});
```

> [!tip]- How this works (open me)
> - **Check a Needs-reply box** → Larry writes the draft in your voice, straight into that account's Gmail Drafts for you to read.
> - **Check a Put-away box** → Larry archives it (out of inbox, never deleted, still in Gmail search).
> - **Check a Task** → just your checklist; Larry logs it done.
> - Then say `/mailroom` (or "run the mailroom") and he sweeps every checked box in one pass, ticks it off here, and logs it under Reacts.

```dataviewjs
const c = { icon: "✍️", title: "Needs reply", count: 3, sub: "tick to have Larry draft it" };
let h = `<div class="db-mail-section-card"><div class="db-mail-section-title"><span class="db-mail-section-icon">${c.icon}</span><h2>${c.title}</h2></div><span class="db-mail-count">${c.count} open</span></div>`;
dv.el("div", h, {});
```

- [ ] **Dennis Dampil** — send June 2026 bank statements <span class="db-acct-tag business">business</span> <!--draft:alyssa:19d1ad5a4b1bba2f-->
- [ ] **Julien — Routine AI** — partnership proposal, your call <span class="db-acct-tag support">support</span> <!--draft:support:19f2003887a696d6-->
- [ ] **Bundles That Benefit** — Online Business Bundle 2026 invite <span class="db-acct-tag business">business</span> <!--draft:alyssa:19f46f3a4d38db97-->

*Already replied, cleared: Breannah, Jennifer, Natalie.*

```dataviewjs
let h = `<div class="db-mail-section-card"><div class="db-mail-section-title"><span class="db-mail-section-icon">✅</span><h2>Your tasks</h2></div><span class="db-mail-count">just your checklist</span></div>`;
dv.el("div", h, {});
```

- [ ] Send June bank statements to Dennis *(pairs with the draft above)*
- [ ] Approve Ananya into Back of House group — she paid $198, waiting at the door
- [ ] Notionsocial card failing — $144, update or cancel before cut-off
- [ ] Back of House — 2 failed customer payments, check ThriveCart dunning
- [ ] Close out Camila on Upwork — reply + leave feedback
- [ ] Google security check — "someone tried to view saved passwords"
- [x] Horizon workflow — fixed ✓ (watch tomorrow's run go green)
- [ ] AddEvent plan limit approaching

```dataviewjs
let h = `<div class="db-mail-section-card"><div class="db-mail-section-title"><span class="db-mail-section-icon">📥</span><h2>Put away</h2></div><span class="db-mail-count zero">tick to archive</span></div>`;
dv.el("div", h, {});
```

*Today's noise pile was already cleared (53 archived). Say `/mailroom sweep` and Larry re-scans all four inboxes and refills this list for you to tick. Format he writes, one per line, e.g.:*
`- [ ] Sender — Subject <span class="db-acct-tag personal">personal</span> <!--arc:personal:MESSAGEID-->`

```dataviewjs
let h = `<div class="db-mail-reacts"><h2>Mailroom reacts</h2></div>`;
dv.el("div", h, {});
```

- [2026-07-10 15:40] Larry · archived 53 across all 4 inboxes (curated noise) · Manychat invoice kept for Xero
- [2026-07-10 15:25] Larry · Horizon Pages build fixed (commit 8a47c5d)

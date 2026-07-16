---
agent_id: felix
session_id: home-dashboard-build-2026-07-10
timestamp: 2026-07-10T21:30:00Z
type: end-of-session
linked_sops: [SOP-018-felix-build-a-component]
linked_workstreams: []
linked_guidelines: [GL-013-the-house-rules]
mined: true
---

# Built the whole-house HOME dashboard

## What I built

[[HOME]] at the vault root, `cssclasses: [dashboard, home]`. Six live dataviewjs blocks: nav, header, stats row, needs-you, this-week-in-content, signals bar list, rooms grid. Extended [[.obsidian/snippets/dashboard.css|dashboard.css]] with a new `.dashboard.home` scoped section (stat cards, bar-list, needs cards, rooms grid) that reuses the existing shared grammar (`.db-nav`/`.db-pill`, `.db-stage`, oat cards, AT KING/Karla/Roboto Mono) rather than inventing a parallel system. Nothing in the new CSS can leak into WS-011 (`dashboard/` notes carry only `cssclass: dashboard`, never `home`) or Mailroom.

Wired in per the no-orphan-files rule: one line added to [[HOUSE-MAP]]'s geography table, one line added to [[Notebook/DESK]] (link-only, the GL-013 desk exception).

## Real bug I found and fixed before shipping

Mailroom's own `mrStates()` regex (`/<!--state:([^-]+(?:-(?!-)[^-]*)*)-->/g`) is unbounded between `state:` and the next `-->`. Since MAILROOM.md's own dataviewjs source contains the literal text `` `<!--state:${key}:` `` inside template-literal strings with no closing `-->` right there, the regex can greedily swallow real state comments into one giant spurious match before it finally lands on a `-->` deep in the code. I confirmed this live: 3 real `queued` archive entries vanished under that pattern when I dry-ran it against the file mid-session (verified with a standalone Node script against the actual file, not a guess). I did not touch MAILROOM.md itself (out of scope, not asked, not my file to silently edit) — I used a tighter, safer character-class regex (`/<!--state:([a-z0-9:]+):(\w+)-->/g`) for HOME's own copy of this parser instead of replicating the bug. **Flag for Larry/Mack:** Mailroom's live stat counts (e.g. "Ready to file") may be undercounting for the same reason and could use the same hardening.

## What's 100% real live data vs stub

All five content sections are live, nothing invented:
- Open tasks: `dv.pages('"Studio/Team Knowledge/tasks/open"').length` — real count (21 at build time).
- Needs your call: parses `## Needs a ruling` bullets out of [[Notebook/DESK]] the same line-by-line way Mailroom parses its own headings (never a whole-file substring replace).
- Mailroom queue: parses real `<!--state:...:queued-->` markers (hardened regex, see above) — 1 at build time (Julien / Routine AI, mid-session the count actually changed under me because Mailroom was live and in active use by someone else in the same session, which is also why the CLI's "active file" kept flipping back to Mailroom while I was trying to screenshot).
- Journal entries this week: `dv.pages` over `Notebook/Journal/2026/07` filtered by real `file.mtime`, not filename dates.
- This week in content: reuses the exact same "does the newest pitch sheet have an Approved arc section yet" heuristic as [[Studio/Content/dashboard/00 Content Command Center]], relabeled into plain words (idea / outline / hook / draft / posted, no jargon, no arrows between the pills).
- Signals bar list: real recurrence counts parsed out of [[Studio/Signals/signals-index]] (13 real signals found, 8 shown per the cap I set).

Nothing on the page is a stub or placeholder link. Every fact is either a live dataviewjs read or a real `[[wikilink]]`.

## Plain-language pass

Grepped the file for em dashes, arrow characters, and the banned jargon list (rung/arc/reacts/metabolized/orphan/slate/gate) before shipping. Only hits were inside code comments (never rendered to her). Added a `plain()` sanitizer that runs on every dynamic string before it's inserted into the DOM — strips em dashes to commas, arrows to "to", and also strips raw `[[wikilink|label]]` bracket syntax down to plain text (the live DESK "Needs a ruling" bullet contains an inline wikilink; without this it would have rendered literal double brackets in a plain `<p>`).

## Visual verification

Attempted via the Obsidian CLI skill. `obsidian dev:screenshot` failed with exit 127 in this environment (likely a missing dependency, not something I can fix from here) — could not get a real screenshot. DOM inspection via `obsidian eval` was unreliable mid-session because Mailroom.md appears to have been actively open/in-use in the same live Obsidian window at the same time (its state file changed under me between reads, and the CLI's "active file" kept reverting to Mailroom.md every few seconds). When I did catch a clean read, the header (`.db-home-header`) and the signals bar list (8 `.db-home-bar-row` elements) were confirmed rendering correctly with the right classes and no Dataview errors (`dev:errors` stayed clean throughout). I did not get a clean confirmed render of the stats row or rooms grid inside the live app.

**What Val or manual QA should check:** open [[HOME]] directly in Obsidian, confirm all 6 dataviewjs blocks render (nav, header, 4 stat cards, needs-you, this-week-in-content, signals bars, rooms grid), check the rooms grid at a narrow pane width (the grid is `auto-fit, minmax(160px, 1fr)` and hasn't been breakpoint-tested live), and tab through the nav pills + room cards for keyboard focus (they're real `<a>` tags with `data-href`, same click-hijack pattern as the Content Command Center's proven nav, but not tabbed-through live in this session).

## Left for Larry

- `.obsidian/plugins/homepage/data.json` still points at `dashboard/00 Content Command Center`. Did not touch it — repointing to `HOME` is Larry's call with Alyssa, not mine to change silently.
- [[Notebook/DESK]]'s "Needs a ruling" bullet links to `[[2026-07-10-north-star-scope-error-trace]]`, which does not exist anywhere in the vault (confirmed via grep, only the DESK reference itself matches). Pre-existing broken link, not something I created or was asked to fix — flagging since HOME's needs-you card surfaces this bullet verbatim (with wikilink brackets stripped for display, but the underlying dead link is still real).
- Consider hardening Mailroom's own `mrStates()` regex with the same fix (see bug section above).

## Cross-references
- [[HOME]] — the dashboard itself.
- [[.obsidian/snippets/dashboard.css]] — the CSS extension.
- [[Studio/Team/Iris - Design System Architect/journal/2026-06-13-obsidian-vault-design-system]] — the locked design system I built to.
- [[Studio/Mailroom/MAILROOM]] — source of the state-parsing bug and the queue data.
- [[Notebook/DESK]] — source of the "needs your call" data.
- [[Studio/Signals/signals-index]] — source of the signals bar list.
- [[Studio/Content/dashboard/00 Content Command Center]] — source of the pipeline-stage heuristic.

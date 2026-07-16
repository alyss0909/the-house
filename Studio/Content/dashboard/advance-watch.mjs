// advance-watch.mjs — Content OS pipeline auto-advance TRIGGER DETECTOR
// =============================================================================
// Built by Mack (Automation Specialist), 2026-07-09.
// Contract implemented: dashboard/PIPELINE-CONTRACT.md (state machine, section
// headers, block formats, approval marks, the three auto-advance triggers).
//
// ---------------------------------------------------------------------------
// WHY THIS IS A DETECTOR, NOT A DAEMON  (read before you touch this file)
// ---------------------------------------------------------------------------
// Alyssa's order was "make approval auto advance": when she approves a stage in
// the dashboard, the next maker (Cass for arcs, Hermes for drafts) should run
// automatically and write its output back into the newest pitch sheet.
//
// The clean implementation is a daemon that, on each trigger, shells out to the
// Claude Code CLI headlessly:
//     claude -p "<maker prompt>" --allowedTools Read,Write,Edit,Glob,Grep
//
// I verified on 2026-07-09 that a headless `claude` binary is NOT available in
// this environment:
//     $ claude --version            -> bash: claude: command not found
//     PowerShell Get-Command claude  -> CommandNotFoundException
//     npm ls -g @anthropic-ai/claude-code -> (empty)
//     npx --no-install claude       -> could not determine executable to run
// No standalone binary, no npm global, not resolvable via npx. So a self-driving
// daemon that spawns the makers CANNOT run here. Per the ticket's explicit
// fallback instruction, I did NOT ship a maker-spawning daemon.
//
// WHAT SHIPS INSTEAD — the Larry-driven /loop:
//   * This file is the TRIGGER DETECTOR. It parses the newest pitch sheet, finds
//     which posts are ready to advance (per the contract's 3 triggers), enforces
//     idempotency (downstream block exists => already advanced, never re-run),
//     and prints a machine-readable list of pending advances. It writes NOTHING
//     into the pitch sheet by default (Mack never writes PKM content).
//   * Larry runs `/loop` (.claude/commands/loop.md). /loop calls this detector,
//     and for each pending trigger it dispatches the correct maker via Claude
//     Code's Agent tool (subagent_type: cass for arcs, hermes for drafts) with
//     the mandatory file-loads and rules those makers carry. The maker appends
//     its block in the exact contract format. Larry then logs the advance to
//     `## Dashboard reacts` and loops again.
//   * The Agent tool works here today; the headless CLI does not. Same makers,
//     same prompts, same idempotency — the loop body is a person-less relay
//     driven by Larry instead of by a background process.
//
// If a headless `claude` binary later becomes available, flip RUN_MODE to
// "spawn" below and wire spawnMaker() (stub included, prompts already written) —
// the detector logic is identical, only the executor changes.
//
// ---------------------------------------------------------------------------
// USAGE
// ---------------------------------------------------------------------------
//   node "Studio/Content/dashboard/advance-watch.mjs" --once      # print pending advances, exit
//   node "Studio/Content/dashboard/advance-watch.mjs" --watch      # poll every ~10s, print on change
//   node "Studio/Content/dashboard/advance-watch.mjs" --once --json # machine-readable for /loop
//   npm run advance         (=> --once, see dashboard/package note in README)
//   npm run advance:watch   (=> --watch)
//
// Stop --watch with Ctrl-C. It holds no locks and writes no pitch content, so
// killing it mid-run can never corrupt a sheet.
//
// ---------------------------------------------------------------------------
// KNOWN RACE — Obsidian editor buffer vs disk  (Felix, 2026-07-08 session log)
// ---------------------------------------------------------------------------
// The dashboard reads the sheet FROM DISK. Obsidian holds unsaved edits in an
// EDITOR BUFFER that only flushes to disk on save (or after the autosave delay).
// If Alyssa approves a stage and this detector reads the file before Obsidian
// has flushed, it sees stale bytes and reports no trigger (or a stale one). The
// 10s poll plus re-read-on-next-tick absorbs this: a missed trigger is picked up
// on the next poll once the buffer flushes. The detector is READ-ONLY, so the
// worst case is a one-cycle delay, never a lost or double advance. The real
// double-write guard is idempotency: the maker (via /loop) checks for the
// downstream block on disk immediately before writing, so even a duplicate
// trigger fires the maker at most once per post.
// =============================================================================

import { readFileSync, readdirSync, statSync } from "node:fs";
import { fileURLToPath } from "node:url";
import path from "node:path";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const PITCHES_DIR = path.join(__dirname, "..");
const POLL_MS = 10_000;

// Executor mode. "detect" = read-only, print pending advances for Larry's /loop
// (the only mode that works in this environment). "spawn" = shell out to a
// headless claude CLI (NOT available here as of 2026-07-09; stub only).
const RUN_MODE = "detect";

// ---------------------------------------------------------------------------
// Sheet selection — the sheet whose Mon-Fri ISO week window contains today is
// the single state machine, NOT simply the highest week number. Two weeks run
// concurrently (this week live + next week prepped ahead), so lexically-last
// silently points at next week's sheet as soon as it exists (caught 2026-07-13
// — the dashboard had been showing/advancing the wrong week for days).
// ---------------------------------------------------------------------------
function isoWeekMonday(year, week) {
  const simple = new Date(Date.UTC(year, 0, 1 + (week - 1) * 7));
  const dow = simple.getUTCDay() || 7;
  const monday = new Date(simple);
  monday.setUTCDate(simple.getUTCDate() + (dow <= 4 ? 1 - dow : 8 - dow));
  return monday;
}
function newestPitchSheet() {
  const files = readdirSync(PITCHES_DIR)
    .filter((f) => /^\d{4}-W\d{2}-pitch\.md$/.test(f))
    .sort(); // lexical sort works: YYYY-Www zero-padded
  if (files.length === 0) return null;
  const todayUTC = Date.UTC(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
  const current = files.find((f) => {
    const m = f.match(/^(\d{4})-W(\d{2})-pitch\.md$/);
    if (!m) return false;
    const mondayUTC = Date.UTC(
      isoWeekMonday(+m[1], +m[2]).getUTCFullYear(),
      isoWeekMonday(+m[1], +m[2]).getUTCMonth(),
      isoWeekMonday(+m[1], +m[2]).getUTCDate()
    );
    return todayUTC >= mondayUTC && todayUTC <= mondayUTC + 4 * 86400000;
  });
  return path.join(PITCHES_DIR, current || files[files.length - 1]);
}

// ---------------------------------------------------------------------------
// Parsers — read the three section headers from PIPELINE-CONTRACT.md exactly.
// ---------------------------------------------------------------------------

// Strip a "[approved]" / "[shipped]" / "[rejected]" / "[saved]" suffix and **,
// returning the bare title for string-pairing across stages (contract: the
// downstream heading title must match the upstream title verbatim).
function bareTitle(s) {
  return String(s || "")
    .replace(/\s*\[(approved|shipped|rejected|saved)\]\s*$/i, "")
    .replace(/\*\*/g, "")
    .replace(/\s+/g, " ")
    .trim();
}

// Normalize a concept's numbered-line text to its pairing TITLE. MON/WED concepts
// put the bare title on the numbered line (title == whole line). FTG/Friday concepts
// pack `TITLE — description — no CTA` on one physical line (contract §Concept block:
// description ends in "— comment …"/"— no CTA"). The arc/draft heading only ever
// carries the TITLE, so we pair on the leading segment before the first " — "
// em-dash description break, then strip any state tag. This makes the string-pair
// robust across both concept shapes.
function conceptTitle(rawRest) {
  const firstEmDash = String(rawRest).search(/\s+—\s+/);
  const head = firstEmDash === -1 ? rawRest : String(rawRest).slice(0, firstEmDash);
  return bareTitle(head);
}

// Trigger #1 source: approved concepts. A concept is `N. ✓ Title` under a
// `## Monday|Wednesday|Friday — …` header. Rejected/saved state tags are NOT
// an approval; only the ✓ prefix is.
function parseApprovedConcepts(body) {
  const lines = body.split("\n");
  const out = [];
  let day = null;
  for (const line of lines) {
    const dayMatch = line.match(/^##\s*(monday|wednesday|friday)\s*[—-]\s*(.+)$/i);
    if (dayMatch) {
      day = dayMatch[1][0].toUpperCase() + dayMatch[1].slice(1).toLowerCase();
      continue;
    }
    // Any other H2 ends the day blocks.
    if (/^##\s/.test(line) && !dayMatch) day = null;
    if (!day) continue;
    // `N. ✓ Title`  (the ✓ prefix is the approval mark)
    const m = line.match(/^(\d+)\.\s*✓\s*(.+)$/);
    if (m) {
      const title = conceptTitle(m[2]);
      if (title) out.push({ day, dayKey: dayKeyFor(day), title });
    }
  }
  return out;
}

function dayKeyFor(day) {
  return { Monday: "MON", Wednesday: "WED", Friday: "FRI" }[day] || day.toUpperCase();
}

// Collect the `### <DAYKEY> — Title [state]` headings inside a given H2 section.
// Returns [{ dayKey, title (bare), approved, shipped, raw }]
function parseStageHeadings(body, sectionHeader) {
  const lines = body.split("\n");
  const out = [];
  let inSection = false;
  for (const line of lines) {
    if (/^##\s/.test(line)) {
      inSection = line.trim().toLowerCase() === sectionHeader.trim().toLowerCase();
      continue;
    }
    if (!inSection) continue;
    const m = line.match(/^###\s+([A-Z]+(?:-[AB])?)\s*[—-]\s*(.+?)\s*$/);
    if (m) {
      const rawRest = m[2];
      out.push({
        dayKey: m[1].toUpperCase(),
        title: bareTitle(rawRest),
        approved: /\[approved\]\s*$/i.test(rawRest),
        shipped: /\[shipped\]\s*$/i.test(rawRest),
        raw: line.trim(),
      });
    }
  }
  return out;
}

// ---------------------------------------------------------------------------
// Trigger evaluation (contract §"Auto-advance triggers").
// ---------------------------------------------------------------------------
function evaluate(rawInput) {
  // Normalize CRLF -> LF first: this vault's files are edited on Windows and
  // often saved with \r\n, which leaves a trailing \r on every split("\n")
  // line and silently breaks any regex anchored with $ (caught 2026-07-13).
  const raw = rawInput.replace(/\r\n/g, "\n");
  const body = raw.replace(/^---\s*\n[\s\S]*?\n---\s*\n/, ""); // drop frontmatter

  const concepts = parseApprovedConcepts(body);
  const arcs = parseStageHeadings(body, "## Approved — slide skeletons");
  const drafts = parseStageHeadings(body, "## Drafts");

  // Idempotency keys: pair strictly by (dayKey + bare title).
  const arcKey = new Set(arcs.map((a) => `${a.dayKey}|${a.title.toLowerCase()}`));
  const draftKey = new Set(drafts.map((d) => `${d.dayKey}|${d.title.toLowerCase()}`));

  const pending = [];

  // Trigger #1: concept ✓ with no matching arc block => run Cass (substance/arc).
  // Idempotency also honours the terminal block: if a DRAFT already exists for the
  // post (e.g. FTG/Friday mood decks that skip the arc stage and are written
  // straight into ## Drafts), the arc is moot — never re-open an already-drafted
  // post. Presence of ANY downstream block = already advanced.
  for (const c of concepts) {
    const k = `${c.dayKey}|${c.title.toLowerCase()}`;
    if (!arcKey.has(k) && !draftKey.has(k)) {
      pending.push({ trigger: 1, stage: "arc", maker: "cass", dayKey: c.dayKey, title: c.title });
    }
  }

  // Trigger #2: arc [approved] with no matching draft block => run Hermes (writer).
  for (const a of arcs) {
    if (!a.approved) continue;
    const k = `${a.dayKey}|${a.title.toLowerCase()}`;
    if (!draftKey.has(k)) {
      pending.push({ trigger: 2, stage: "draft", maker: "hermes", dayKey: a.dayKey, title: a.title });
    }
  }

  // Trigger #3: draft [shipped] is terminal — nothing to do. (Surfaced for logs.)
  const shipped = drafts.filter((d) => d.shipped).map((d) => ({ dayKey: d.dayKey, title: d.title }));

  return { pending, shipped, counts: { concepts: concepts.length, arcs: arcs.length, drafts: drafts.length } };
}

// ---------------------------------------------------------------------------
// Maker prompts — reproduced from .claude/agents/cass.md and hermes.md so that
// whichever executor runs them (Larry's /loop Agent dispatch today, or a headless
// CLI later) carries the SAME mandatory file-loads and hard rules. /loop reads
// these strings; keep them in sync with the agent definitions.
// ---------------------------------------------------------------------------
export function arcPrompt({ sheetPath, dayKey, title }) {
  return [
    `You are Substance Guy (dispatch id cass), Rung 3 of the Content OS ladder. Build the slide-by-slide ARC for one Alyssa-APPROVED concept, then append it to the pitch sheet. Fresh context — this is a single-post job.`,
    ``,
    `TARGET: sheet "${sheetPath}", concept ${dayKey} — "${title}".`,
    ``,
    `MANDATORY loads before you write a single slide line (GL-007 token discipline — load in order, then stop):`,
    `1. Team/Cassius - Substance Specialist/AGENTS.md and AGENTS.md (root) for your contract + hard rules.`,
    `2. LOOK first: Read (Read tool, filename order) the real slide images of the closest exemplar for this slot from Library/Examples/Carousels/ (index: Library/Examples/Carousels/INDEX.md). Text about carousels is never a substitute for looking.`,
    `3. Studio/Analysis/carousel-slide-by-slide.md for her real arc shapes and which belief each slide moves.`,
    `4. The concept's teaching source (BOH transcript / offer file — enter the team's study via Studio/Analysis/COMPASS.md, BOH via Library/Programs/back-of-house/BOH-COMPASS.md). If the source is not obvious from the concept, read what the sheet's "Prepared by" line cites for that day; if still ambiguous, STOP and flag it, do not invent teaching.`,
    `5. Real data for EVERY number: Studio/Analysis/subject-line.md (email rates), the real offer file in Library/Offers/<offer>/MAP.md, Deliverables/2026-07-06-instagram-craft-foundation.md (IG benchmarks). Real engaged open rate ~40-57%; never 3%, never invented.`,
    `6. Hermes/FUNNEL.md (belief each offer's arc must land), Studio/Content/taste-ledger.md IN FULL (anti-patterns are law), Team Knowledge/Guidelines/GL-010-content-pitch-operating-brain.md.`,
    ``,
    `OUTPUT — append exactly ONE arc block into the "## Approved — slide skeletons" section of the sheet, in the EXACT contract format (Studio/Content/dashboard/PIPELINE-CONTRACT.md):`,
    `  ### ${dayKey} — ${title}`,
    `  **Cover:** <cover line>`,
    `  N. Role: [what the slide literally shows] → so that [belief shifted] — copy: "<real persuasive line that names + agitates the reader's current pain>"   (Role ∈ Cover/Frame/Proof/Step/CTA)`,
    `  Sources: <file> · <file>`,
    `  Note: <optional>`,
    `Heading title must match "${title}" VERBATIM (the watcher pairs by string). One arc block only. Real numbers from her real files only. Carry actual persuasive copy in each slide's text (this overrules GL-010's strip-persuasion for this rung). Prepend the attribution header "Prepared by: Cass · referenced: <sources>" if the section has none yet.`,
    ``,
    `HARD RULES: write ONLY into "## Approved — slide skeletons"; never invent a section name. Never CTA to or mention Unignorable Subject Lines. Pinterest is the only live chat word this cycle. Do NOT touch any concept, draft, or reacts line. Do NOT call any MCP/scrape tool — Read/Write/Edit/Glob/Grep only.`,
  ].join("\n");
}

export function draftPrompt({ sheetPath, dayKey, title }) {
  return [
    `You are Hermes, Alyssa's clone writer. Turn ONE approved arc into finished carousel deck copy in her voice, then append it to the pitch sheet. Fresh context — single-post job.`,
    ``,
    `TARGET: sheet "${sheetPath}", arc ${dayKey} — "${title}" (marked [approved] in "## Approved — slide skeletons"). Read that arc block first; it is your brief.`,
    ``,
    `PROTOCOL — every writing task, in order, no skips (per .claude/agents/hermes.md):`,
    `1. Load brain core: Hermes/SOUL.md, STYLE.md, TASTE.md, ANTI-AI.md, BUSINESS.md (prices/CTAs involved), and the matching Hermes/craft/<format>.md (carousel).`,
    `2. MANDATORY vault deep-load: open Hermes/README.md, find the recipe row for this format, read every listed vault file IN FULL end to end — full originals, never excerpts. No draft exists until this is done. Include her real slide images and analysis/carousel-slide-by-slide.md + analysis/carousel.md for the lane.`,
    `3. Write toward the verbatim anchors in the loaded originals, not toward rule descriptions.`,
    `4. Anti-slop scan: run the full Hermes/ANTI-AI.md checklist (zero em-dashes, no "its not this its that" anywhere incl. hooks/subjects, banned vocab, negative-parallelism shapes). Any hit = rewrite before scoring.`,
    `5. Self-score vs TASTE.md (kill on any 0 in refusals/pain-framing/CTA; pass >=14/18), then the lineup test beside 2 real passages.`,
    ``,
    `OUTPUT — append exactly ONE draft block into the "## Drafts" section, in the EXACT contract format:`,
    `  ### ${dayKey} — ${title}`,
    `  **Cover:** <cover line>`,
    `  **Caption:** <caption>`,
    `  N. <slide N final copy>   (one numbered line per slide, full final deck)`,
    `If "## Drafts" does not exist, create it once at the end of the sheet. FTG decks (Friday, no CTA): monospace permission-slip lines, no CTA. Heading title must match "${title}" VERBATIM.`,
    ``,
    `HARD RULES (her corrections outrank everything): no weekend-work framing; Norah's name never in a subject line; never invent product facts/prices/links/chat words (a blank chat word = "manual selection needed"); never load quarantined files (Hermes/SOURCES.md incl. all Wren files); ponytail discipline (reuse her existing lines/methods before inventing). Never CTA to or mention Unignorable Subject Lines. Pinterest is the only live chat word this cycle. Write ONLY into "## Drafts"; do not touch concepts/arcs/reacts. Read/Write/Edit/Glob/Grep only — no MCP/scrape.`,
  ].join("\n");
}

// Reacts log line the executor (Larry/loop, or spawn mode) appends AFTER the
// maker writes its block. Format is fixed by the contract.
export function reactsLogLine({ stage, title }) {
  const stamp = new Date().toISOString().slice(0, 16).replace("T", " ");
  return `- [${stamp}] auto · ${stage} · ${title} · advanced`;
}

// ---------------------------------------------------------------------------
// spawn-mode stub — only reachable if a headless claude CLI becomes available.
// Left unwired on purpose (RUN_MODE === "detect"). See header.
// ---------------------------------------------------------------------------
async function spawnMaker(_job, _sheetPath) {
  throw new Error(
    "spawn mode disabled: no headless `claude` CLI in this environment (verified 2026-07-09). " +
      "Use Larry's /loop (Agent-tool dispatch) instead — see file header and Studio/Content/dashboard/AUTO-ADVANCE-README.md."
  );
}

// ---------------------------------------------------------------------------
// Report + main loop.
// ---------------------------------------------------------------------------
function report(sheetPath, res, asJson) {
  if (asJson) {
    console.log(JSON.stringify({ sheet: path.basename(sheetPath), ...res }, null, 2));
    return;
  }
  const rel = path.relative(path.join(__dirname, ".."), sheetPath).replace(/\\/g, "/");
  console.log(`\n[advance-watch] ${rel}`);
  console.log(
    `  state: ${res.counts.concepts} ✓concepts · ${res.counts.arcs} arcs · ${res.counts.drafts} drafts`
  );
  if (res.pending.length === 0) {
    console.log("  pending advances: none — pipeline is idempotently caught up.");
  } else {
    console.log(`  pending advances (${res.pending.length}) — Larry /loop should dispatch:`);
    for (const p of res.pending) {
      console.log(`   • trigger #${p.trigger} → run ${p.maker} (${p.stage}) for ${p.dayKey} — "${p.title}"`);
    }
  }
}

function runOnce({ json }) {
  const sheet = newestPitchSheet();
  if (!sheet) {
    console.error("[advance-watch] no YYYY-Www-pitch.md found in Studio/Content/");
    process.exit(1);
  }
  const res = evaluate(readFileSync(sheet, "utf8"));
  report(sheet, res, json);
  return res.pending.length;
}

function runWatch({ json }) {
  console.log(`[advance-watch] polling newest pitch sheet every ${POLL_MS / 1000}s. Ctrl-C to stop.`);
  console.log("[advance-watch] READ-ONLY detector — writes nothing to the sheet. Larry's /loop does the advancing.");
  let lastSig = "";
  const tick = () => {
    const sheet = newestPitchSheet();
    if (!sheet) return;
    let raw;
    try {
      raw = readFileSync(sheet, "utf8");
    } catch {
      return; // Obsidian mid-flush; catch on next poll (see header: buffer race).
    }
    const res = evaluate(raw);
    const sig = statSync(sheet).mtimeMs + "|" + JSON.stringify(res.pending);
    if (sig !== lastSig) {
      lastSig = sig;
      report(sheet, res, json);
    }
  };
  tick();
  setInterval(tick, POLL_MS);
}

// entry — only when run directly, not when imported (e.g. by /loop or tests).
const runDirectly = fileURLToPath(import.meta.url) === path.resolve(process.argv[1] || "");
if (runDirectly) {
  const args = new Set(process.argv.slice(2));
  const json = args.has("--json");
  if (RUN_MODE !== "detect") void spawnMaker; // guardrail: never silently spawn in this env
  if (args.has("--watch")) runWatch({ json });
  else runOnce({ json });
}

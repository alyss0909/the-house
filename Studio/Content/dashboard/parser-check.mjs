// ponytail: one runnable check for the 01 Concepts.md parser fix (GL-008).
// Extracted verbatim (not reimplemented) from the dataviewjs block in
// "01 Concepts.md" so this test fails the moment that logic regresses.
// Run: node "Studio/Content/dashboard/parser-check.mjs"
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import path from "node:path";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const pitchesDir = path.join(__dirname, "..");

// ---- dbParseCta (copied verbatim from 01 Concepts.md) ----
function dbParseCta(cta) {
  const s = String(cta || "").trim();
  if (/^no cta/i.test(s)) return { freebie: null, word: null, noCta: true };
  let freebie = null;
  const arrowMatch = s.match(/(?:→|->)\s*([^(]+)/);
  if (arrowMatch) {
    freebie = arrowMatch[1].trim();
  } else {
    const forTheMatch = s.match(/\bfor\s+(?:the\s+)?([^(]+)/i);
    if (forTheMatch) freebie = forTheMatch[1].trim();
  }
  if (freebie) freebie = freebie.replace(/\s+/g, " ").trim();
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
    const commentMatch = s.match(/^comment\s+([A-Za-z]+)/i);
    if (commentMatch) word = commentMatch[1];
  }
  return { freebie, word, noCta: false };
}

// ---- dbSplitStateTag (copied verbatim from 01 Concepts.md) ----
function dbSplitStateTag(rawTitle) {
  const s = String(rawTitle || "");
  const m = s.match(/^(.*?)\s*\[(saved|rejected)\]\s*$/i);
  if (m) return { title: m[1].replace(/\*\*/g, "").replace(/\s+/g, " ").trim(), tag: m[2].toLowerCase() };
  return { title: s.replace(/\*\*/g, "").replace(/\s+/g, " ").trim(), tag: null };
}

// ---- concepts render loop (copied verbatim from 01 Concepts.md, dv.el calls stripped) ----
function parseConcepts(rawInput) {
  // Normalize CRLF -> LF (Windows-edited files break any $-anchored line regex).
  const raw = rawInput.replace(/\r\n/g, "\n");
  const body = raw.replace(/^---\s*\n[\s\S]*?\n---\s*\n/, "");
  const lines = body.split("\n");

  const dayChipClass = { Monday: "mon", Wednesday: "wed", Friday: "fri" };
  const concepts = [];
  let inDayBlock = false;
  let pending = null;
  let currentDay = null;

  function flushConcept() {
    if (!pending) return;
    const desc = pending.desc.join(" ").trim();
    let ctaMatch = desc.match(/[—-]\s*(comment\b.*|no cta.*)$/i);
    if (!ctaMatch) ctaMatch = desc.match(/\bCTA:\s*(comment\b.*|no cta.*)$/i);
    const ctaStr = ctaMatch ? ctaMatch[1].trim() : "";
    const visible = ctaMatch ? desc.slice(0, ctaMatch.index).replace(/[—-]\s*$/, "").replace(/\bCTA:\s*$/i, "").trim() : desc;
    const parsed = dbParseCta(ctaStr);
    const freebie = (!parsed.noCta && parsed.freebie) ? parsed.freebie : "";
    concepts.push({ day: currentDay, title: pending.title, approved: pending.approved, stateTag: pending.stateTag, visible, ctaStr, freebie });
    pending = null;
  }

  for (const line of lines) {
    const dayMatch = line.match(/^##\s*(monday|wednesday|friday)\s*[—-]\s*(.+)$/i);
    if (dayMatch) {
      flushConcept();
      const dayName = dayMatch[1][0].toUpperCase() + dayMatch[1].slice(1).toLowerCase();
      currentDay = dayName;
      void dayChipClass[dayName]; // exercised the same lookup the real block does
      inDayBlock = true;
      continue;
    }
    if (line.match(/^---\s*$/) || line.match(/^###\s/) || (line.match(/^##\s/) && !dayMatch)) {
      flushConcept();
      if (inDayBlock) inDayBlock = false;
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
  return concepts;
}

// ---- assertions ----
let failures = 0;
function assert(cond, msg) {
  if (!cond) { console.error(`FAIL: ${msg}`); failures++; }
  else console.log(`PASS: ${msg}`);
}

// 1. W29 regression baseline — must still render exactly as before (9 concepts, 3 per day).
const w29raw = readFileSync(path.join(pitchesDir, "2026-W29-pitch.md"), "utf8");
const w29 = parseConcepts(w29raw);
assert(w29.length === 9, `W29 baseline parses 9 concepts (got ${w29.length})`);
assert(w29.filter(c => c.day === "Monday").length === 3, "W29 Monday has 3 concepts");
assert(w29.filter(c => c.day === "Wednesday").length === 3, "W29 Wednesday has 3 concepts");
assert(w29.filter(c => c.day === "Friday").length === 3, "W29 Friday has 3 concepts");
assert(w29[1].stateTag === "saved", "W29 concept #2 state tag = saved");
assert(w29[7].stateTag === "rejected", "W29 concept #8 state tag = rejected");
assert(w29[0].freebie === "Email List Revival Plan", `W29 concept #1 freebie parses (got "${w29[0].freebie}")`);

// 2. W30 real sheet — LIVE content whose concept count changes week to week, so this is a
// parser smoke check, not a count pin (exact-count regression lives on the frozen W29 baseline above).
const w30raw = readFileSync(path.join(pitchesDir, "2026-W30-pitch.md"), "utf8");
const w30 = parseConcepts(w30raw);
assert(w30.length >= 1, `W30 real sheet parses at least 1 concept (got ${w30.length})`);

// 3. Torture sheet — YAML frontmatter + ALL-CAPS day headers + mid-line "CTA: comment X for Y".
// Generated in-memory (not written to disk) so this check stays runnable without a
// leftover fixture file lingering in Studio/Content/.
const w99raw = `---
title: Torture Test Sheet
purpose: temporary — exercises frontmatter + ALL-CAPS day headers + mid-line CTA
---
# Weekly Pitch Sheet — W99
**Theme:** W9 Torture · **Week:** Mon Jan 1 – Fri Jan 5, 2099

## MONDAY — Education (freebie: Torture Planner)

1. Torture Test Concept One
A concept whose CTA is written as a labeled clause. CTA: comment TORTURE for Torture Planner

2. Torture Test Concept Two [saved]
A second concept, still ALL-CAPS day header, still frontmatter above. — comment TORTURE → Torture Planner

## WEDNESDAY — Offer (Torture Planner → Back of House)

3. Torture Test Concept Three
Third concept under an ALL-CAPS Wednesday header. — no CTA

## FRIDAY — For The Girls (no CTA)

4. Torture Test Concept Four
Fourth concept, Friday, no CTA. — no CTA

---

*Torture Guy — temporary regression fixture.*
`;
const w99 = parseConcepts(w99raw);
assert(w99.length === 4, `Torture sheet (frontmatter + ALL-CAPS headers) parses 4 concepts (got ${w99.length})`);
assert(w99[0].day === "Monday", "Torture sheet ALL-CAPS 'MONDAY' normalizes to Monday");
assert(w99[2].day === "Wednesday", "Torture sheet ALL-CAPS 'WEDNESDAY' normalizes to Wednesday");
assert(w99[3].day === "Friday", "Torture sheet ALL-CAPS 'FRIDAY' normalizes to Friday");
assert(w99[0].freebie === "Torture Planner", `Torture sheet mid-line "CTA: comment X for Y" parses freebie (got "${w99[0].freebie}")`);
assert(w99[1].freebie === "Torture Planner", `Torture sheet trailing "— comment X → Y" still parses (got "${w99[1].freebie}")`);

console.log(failures === 0 ? "\nALL CHECKS PASSED" : `\n${failures} CHECK(S) FAILED`);
process.exit(failures === 0 ? 0 : 1);

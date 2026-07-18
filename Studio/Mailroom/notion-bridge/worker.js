/**
 * Mailroom Notion -> Gmail bridge (Cloudflare Worker)
 * ---------------------------------------------------
 * DRAFT / NOT LIVE. Do not deploy until:
 *   1. Alyssa places all four secrets herself (see SETUP.md).
 *   2. The remaining activation gate in SETUP.md is closed (Notion integration
 *      shared with ONLY the Mailroom DB). The Composio-slug gate is CLEARED —
 *      Larry verified the slugs live (draft-only + archive-label-only).
 *
 * Security posture reflects Vex's audit (2026-07-17, verdict FIX FIRST):
 *   HIGH-1 rate limiting (native binding + hourly draft cap in KV)
 *   HIGH-2 archive query never falls back to title; must be narrowing
 *   HIGH-3 pageId must belong to the Mailroom DB before any action
 *   MED-1  archive tag guard normalized + fail-closed
 *   MED-2  idempotency: no-op if row already handled
 *   MED-3  generic 500 to caller; detail only in server logs
 *   LOWs   body-size + content-type gate; done branch before Notion read;
 *          hash both sides before the constant-time secret compare
 *
 * WHAT IT IS
 *   A single public HTTPS endpoint that Notion's button "Send webhook"
 *   action POSTs to the instant she clicks a Mailroom row. It is the
 *   near-instant nudge; the durable source of truth stays the Status
 *   property the same button also sets (queued / done). If this Worker
 *   ever fails, the row simply stays "queued" and the polled /mailroom
 *   run picks it up later. Belt and suspenders on purpose.
 *
 * FLOW
 *   Notion button click  ->  (a) edit-property Status = queued|done
 *                            (b) Send webhook -> this Worker
 *   this Worker          ->  authenticate (hashed shared-secret header)
 *                        ->  rate-limit gate
 *                        ->  read the row from Notion (by pageId)
 *                        ->  assert row belongs to the Mailroom DB
 *                        ->  idempotency: skip if already handled
 *                        ->  ARCHIVE : narrowing-query guard + tag guard
 *                                      -> Composio remove INBOX label
 *                            DRAFT   : hourly cap -> Anthropic writes reply
 *                                      in her voice -> Composio create Gmail
 *                                      DRAFT (never send)
 *                            DONE    : task, no Gmail work -> ack (no read)
 *                        ->  write Status = handled back to the row
 *
 * DOCTRINE BAKED IN
 *   - Archive = remove from INBOX only, never delete.
 *   - Drafts only, never send. She reviews every reply.
 *   - Never auto-touch money/security/revenue rows on the archive path.
 */

// Inbox -> the authuser email the Gmail deep links and Composio connection use.
const INBOX_EMAIL = {
  personal: "accoleman100@gmail.com",
  support: "productiveentrepreneurteam@gmail.com",
  business: "alyssa@alyssacoleman.ca",
  wellness: "alyssacolemanwellness@gmail.com",
};

// HIGH-3: the only database whose rows this Worker will ever act on. A page
// id that is readable but parented anywhere else is rejected. Both accepted
// forms (data source id + database id) are normalized (hyphenless, lower).
const MAILROOM_DB_IDS = new Set([
  "ddf15d60e8b840bea6e91c99ba7452bf",
  "ee22093d51044162800354e40cb2bad4",
]);
const normId = s => String(s || "").replace(/-/g, "").toLowerCase();

// MED-1: fail-closed archive guard. Any row whose Tag normalizes to one of
// these (substring match) is never auto-archived. If the Tag is empty or
// unreadable, we also refuse — fail closed, never open.
const REFUSE_ARCHIVE_TERMS = [
  "money", "payment", "failed payment", "revenue", "security",
  "invoice", "refund", "chargeback", "bank",
];

// LOW: reject oversized bodies before parsing.
const MAX_BODY_BYTES = 8 * 1024;

// Archive refuses if the narrowed query resolves to more than this many
// messages — a Mailroom noise/reply row is one conversation, so a large
// match means the query was too broad to trust. Keeps archive single-scoped.
const MAX_ARCHIVE_MATCH = 10;

export default {
  async fetch(request, env) {
    try {
      return await handle(request, env);
    } catch (err) {
      // MED-3: never leak upstream bodies/messages to the caller. Detail goes
      // to the server log only; the row stays at "queued" so the polled
      // /mailroom fallback still catches it.
      console.error("mailroom-bridge 500:", err && err.stack || err);
      return json({ ok: false, error: "internal" }, 500);
    }
  },
};

async function handle(request, env) {
  // ---- 1. method + content-type + size + auth gate -----------------------
  if (request.method !== "POST") return json({ ok: false, error: "POST only" }, 405);

  const ctype = request.headers.get("content-type") || "";
  if (!ctype.toLowerCase().includes("application/json")) {
    return json({ ok: false, error: "unsupported media type" }, 415);
  }
  const clen = Number(request.headers.get("content-length") || "0");
  if (clen > MAX_BODY_BYTES) return json({ ok: false, error: "payload too large" }, 413);

  // LOW: hash both sides to fixed-length digests before the constant-time
  // compare, killing the length-timing leak on the raw secret.
  const presented = request.headers.get("x-mailroom-secret") || "";
  if (!env.WEBHOOK_SECRET || !(await hashedEqual(presented, env.WEBHOOK_SECRET))) {
    return json({ ok: false, error: "unauthorized" }, 401);
  }

  // ---- 2. HIGH-1: rate limit (after auth, before any work) ---------------
  if (env.RATE_LIMITER) {
    const { success } = await env.RATE_LIMITER.limit({ key: "global" });
    if (!success) return json({ ok: false, error: "rate limited" }, 429);
  }

  // Body read with a hard cap even if Content-Length lied.
  const raw = await readCapped(request, MAX_BODY_BYTES);
  if (raw === null) return json({ ok: false, error: "payload too large" }, 413);
  let body;
  try { body = JSON.parse(raw); } catch (e) { return json({ ok: false, error: "bad json" }, 400); }

  const action = String(body.action || "").toLowerCase();
  const pageId = String(body.pageId || "").trim();
  if (!pageId || !["draft", "archive", "done"].includes(action)) {
    return json({ ok: false, error: "missing action/pageId" }, 400);
  }

  // LOW: "done" is a self-serve task ack with no Gmail side. Branch it before
  // any Notion read — the button already set Status=done, nothing to do.
  if (action === "done") {
    return json({ ok: true, action, note: "task done, no gmail work" });
  }

  // ---- 3. read the row straight from Notion (don't trust the payload) -----
  const row = await getRow(pageId, env);

  // HIGH-3: the page must live in the Mailroom DB. Defense in depth on top of
  // the scoped integration token.
  if (!MAILROOM_DB_IDS.has(normId(row.parentDbId))) {
    return json({ ok: false, error: "row not in mailroom db" }, 403);
  }

  // MED-2: idempotency / replay protection. If the row is already handled,
  // no-op — never re-draft or re-archive.
  if (row.status === "handled") {
    return json({ ok: true, action, note: "already handled, no-op" });
  }

  const email = INBOX_EMAIL[row.inbox];
  if (!email) return json({ ok: false, error: "unknown inbox" }, 400);

  if (action === "archive") {
    // MED-1: fail-closed tag guard.
    const tagNorm = row.tag.trim().toLowerCase();
    if (!tagNorm || REFUSE_ARCHIVE_TERMS.some(t => tagNorm.includes(t))) {
      return json({ ok: false, error: "refused: protected or unreadable tag" }, 403);
    }
    // HIGH-2: require a specific, narrowing query. Never the title.
    const query = narrowingQuery(row);
    if (!query) return json({ ok: false, error: "refused: query not specific enough" }, 422);
    // Resolve the narrow query to concrete messageIds first, then strip ONLY
    // the INBOX label off those. Refuse if it matched nothing or too much.
    const messageIds = await resolveArchiveMessages(email, query, env);
    if (!messageIds.length) return json({ ok: false, error: "refused: query matched nothing" }, 422);
    if (messageIds.length > MAX_ARCHIVE_MATCH) {
      return json({ ok: false, error: "refused: query too broad" }, 422);
    }
    await gmailRemoveInbox(email, messageIds, env);
    await setStatus(pageId, "handled", env);
    return json({ ok: true, action, inbox: row.inbox, count: messageIds.length });
  }

  if (action === "draft") {
    // HIGH-2: require a specific, narrowing query. Never the title.
    const query = narrowingQuery(row);
    if (!query) return json({ ok: false, error: "refused: query not specific enough" }, 422);
    // Resolve the in-thread reply target BEFORE spending an Opus call, so a
    // no-match doesn't cost a model call.
    const target = await resolveThreadForReply(email, query, env);
    if (!target) return json({ ok: false, error: "refused: no matching thread" }, 422);
    // HIGH-1: hourly draft cap (each draft = an Opus call + a Gmail write).
    if (!(await underHourlyDraftCap(env))) {
      return json({ ok: false, error: "hourly draft cap reached" }, 429);
    }
    const draft = await anthropicDraft(row, env);
    await gmailCreateReplyDraft(email, target, draft, env);
    await setStatus(pageId, "handled", env);
    return json({ ok: true, action, inbox: row.inbox });
  }

  return json({ ok: false, error: "unhandled action" }, 400);
}

/* ------------------------------------------------------------------------ */
/* HIGH-2: query narrowing                                                    */
/* ------------------------------------------------------------------------ */
/*
 * Derive the archive target STRICTLY from the row's Gmail link (#search/<q>).
 * Never fall back to the row title. Refuse anything that isn't specific
 * enough to name a single conversation: empty, a bare operator like
 * "in:inbox", or fewer than two real tokens. If a resolved thread/message id
 * column is added later, prefer that over a text query.
 *
 * This narrowed query feeds the resolve step (resolveArchiveMessages /
 * resolveThreadForReply), which turns it into concrete message/thread ids —
 * so a broad query is refused here before it can ever de-inbox many threads.
 */
function narrowingQuery(row) {
  const url = row.gmailUrl || "";
  const marker = "#search/";
  const at = url.indexOf(marker);
  if (at === -1) return null; // no explicit search -> refuse (no title fallback)
  let q;
  try { q = decodeURIComponent(url.slice(at + marker.length)); }
  catch (e) { return null; }
  q = q.trim();
  if (!q) return null;
  // strip bare operators that don't narrow anything
  const bare = q.replace(/\b(in:inbox|category:\w+|is:unread|label:\w+)\b/gi, "").trim();
  if (!bare) return null;
  const tokens = bare.split(/\s+/).filter(Boolean);
  if (tokens.length < 2 && bare.length < 12) return null;
  return q;
}

/* ------------------------------------------------------------------------ */
/* HIGH-1: rate limiting helpers                                              */
/* ------------------------------------------------------------------------ */
/*
 * Burst cap = the native Rate Limiting binding (RATE_LIMITER, ~30/min, fixed
 * "global" bucket) declared in wrangler.toml. The hourly DRAFT cap below is a
 * best-effort KV counter (KV isn't strictly atomic, fine for a soft ceiling)
 * keyed on the current UTC hour, so a runaway loop can't rack up Opus calls.
 */
const HOURLY_DRAFT_CAP = 40;
async function underHourlyDraftCap(env) {
  if (!env.MAILROOM_KV) return true; // no KV bound -> don't block (native burst cap still applies)
  const d = new Date();
  const key = `drafts:${d.getUTCFullYear()}${d.getUTCMonth()}${d.getUTCDate()}${d.getUTCHours()}`;
  const n = Number((await env.MAILROOM_KV.get(key)) || "0");
  if (n >= HOURLY_DRAFT_CAP) return false;
  await env.MAILROOM_KV.put(key, String(n + 1), { expirationTtl: 3700 });
  return true;
}

/* ------------------------------------------------------------------------ */
/* Notion helpers                                                            */
/* ------------------------------------------------------------------------ */

const NOTION_VER = "2022-06-28"; // bump to the version your integration targets

async function notion(path, method, env, payload) {
  const res = await fetch(`https://api.notion.com/v1/${path}`, {
    method,
    headers: {
      Authorization: `Bearer ${env.NOTION_TOKEN}`,
      "Notion-Version": NOTION_VER,
      "Content-Type": "application/json",
    },
    body: payload ? JSON.stringify(payload) : undefined,
  });
  if (!res.ok) {
    // Detail is swallowed by the top-level handler (MED-3); log server-side.
    throw new Error(`notion ${path} ${res.status}: ${await res.text()}`);
  }
  return res.json();
}

// Pull the fields the Worker needs off the Mailroom row, plus parent DB id
// (HIGH-3) and current Status (MED-2).
async function getRow(pageId, env) {
  const p = await notion(`pages/${pageId}`, "GET", env);
  const props = p.properties || {};
  const sel = k => props[k]?.select?.name || "";
  const txt = k => (props[k]?.rich_text || []).map(t => t.plain_text).join("") || "";
  const title = (props["Name"]?.title || []).map(t => t.plain_text).join("");
  return {
    pageId,
    who: title,
    inbox: sel("Inbox"),
    type: sel("Type"),
    status: sel("Status"),
    tag: txt("Tag"),
    subject: txt("Subject"),
    when: txt("When"),
    gmailUrl: props["Gmail link"]?.url || "",
    parentDbId: p.parent?.database_id || "",
  };
}

async function setStatus(pageId, status, env) {
  return notion(`pages/${pageId}`, "PATCH", env, {
    properties: { Status: { select: { name: status } } },
  });
}

/* ------------------------------------------------------------------------ */
/* Composio (Gmail) helpers                                                   */
/* ------------------------------------------------------------------------ */
/*
 * Slugs verified live by Larry (read-only schema inspection, 2026-07-17) —
 * activation gate CLEARED. Account ids rotate on reconnect (see
 * Mailroom/README.md), so the Worker resolves the connection by the inbox
 * email at call time (user_id below) rather than hardcoding an account id.
 *
 * DRAFT  : resolve the single best thread via GMAIL_LIST_THREADS, then
 *          GMAIL_CREATE_EMAIL_DRAFT with thread_id + recipient_email + body
 *          and an EMPTY subject (a subject would fork a new thread). This
 *          creates a draft and returns a draft_id; sending is a SEPARATE
 *          action (GMAIL_SEND_DRAFT) that this Worker must NEVER call.
 * ARCHIVE: resolve concrete messageIds via GMAIL_FETCH_EMAILS, then
 *          GMAIL_BATCH_MODIFY_MESSAGES removeLabelIds:["INBOX"] only. Never
 *          add TRASH, never delete — archive stays reversible.
 */

async function composioExecute(actionSlug, connectedAccountEmail, input, env) {
  const res = await fetch(`https://backend.composio.dev/api/v3/tools/execute/${actionSlug}`, {
    method: "POST",
    headers: {
      "x-api-key": env.COMPOSIO_API_KEY,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      user_id: connectedAccountEmail, // resolve by email; ids rotate
      arguments: input,
    }),
  });
  if (!res.ok) throw new Error(`composio ${actionSlug} ${res.status}: ${await res.text()}`);
  return res.json();
}

// Unwrap Composio's result envelope defensively (shape can nest under data).
function composioData(r) {
  return (r && (r.data || r.response_data || r)) || {};
}
// "Name <a@b.com>" -> "a@b.com"; passes through a bare address.
function extractEmail(s) {
  const m = String(s || "").match(/<([^>]+)>/);
  return (m ? m[1] : String(s || "")).trim();
}

// DRAFT resolve: narrow query -> the single best thread to reply within.
// Uses GMAIL_LIST_THREADS to pick the thread, then GMAIL_FETCH_EMAILS scoped
// to that thread to read the other party's address (list_threads alone does
// not carry participant emails). Returns { threadId, recipientEmail } or null.
async function resolveThreadForReply(email, query, env) {
  const lr = composioData(await composioExecute("GMAIL_LIST_THREADS", email, {
    query, max_results: 5,
  }, env));
  const threads = lr.threads || lr.messages || [];
  if (!threads.length) return null;
  const threadId = threads[0].id || threads[0].thread_id || threads[0].threadId;
  if (!threadId) return null;

  // Read the thread to find the address to reply to (latest inbound sender).
  const fr = composioData(await composioExecute("GMAIL_FETCH_EMAILS", email, {
    query: `${query}`, thread_id: threadId, max_results: 25,
  }, env));
  const msgs = fr.messages || fr.emails || [];
  let recipientEmail = "";
  for (const m of msgs) {
    const from = extractEmail(m.from || m.sender || m.from_email || "");
    // Skip her own outbound messages; reply goes to the other party.
    if (from && from.toLowerCase() !== email.toLowerCase()) recipientEmail = from;
  }
  if (!recipientEmail) return null;
  return { threadId, recipientEmail };
}

// DRAFT create: in-thread reply draft. EMPTY subject on purpose. Never sends.
async function gmailCreateReplyDraft(email, target, draftBody, env) {
  return composioExecute("GMAIL_CREATE_EMAIL_DRAFT", email, {
    thread_id: target.threadId,
    recipient_email: target.recipientEmail,
    body: draftBody,
    // subject intentionally omitted — setting one forks a new thread.
  }, env);
}

// ARCHIVE resolve: narrow query -> concrete messageIds (caller applies the
// zero / too-broad guards before acting).
async function resolveArchiveMessages(email, query, env) {
  const fr = composioData(await composioExecute("GMAIL_FETCH_EMAILS", email, {
    query, max_results: MAX_ARCHIVE_MATCH + 5,
  }, env));
  const msgs = fr.messages || fr.emails || [];
  return msgs
    .map(m => m.id || m.message_id || m.messageId)
    .filter(Boolean);
}

// ARCHIVE act: remove ONLY the INBOX label. Never TRASH, never delete.
async function gmailRemoveInbox(email, messageIds, env) {
  return composioExecute("GMAIL_BATCH_MODIFY_MESSAGES", email, {
    message_ids: messageIds,
    remove_label_ids: ["INBOX"],
    // add_label_ids intentionally omitted — nothing is added, ever.
  }, env);
}

/* ------------------------------------------------------------------------ */
/* Anthropic (draft copy in her voice)                                       */
/* ------------------------------------------------------------------------ */
/*
 * Same pattern as the Instagram Saves Engine ideation step: call the API
 * directly, no Claude app needed. VOICE_SYSTEM below is Alyssa's canonical
 * 1:1 inbox voice, authored by Hermes from her Second Brain voice sources
 * (SOUL / STYLE / ANTI-AI + KILL-LIST). It is her reply register, not her
 * marketing register. Update it only through Hermes.
 */

const VOICE_SYSTEM = [
  "You draft a private 1:1 email reply as Alyssa Coleman (productivity strategist, creator of Back of House, soft CEO). This is a DRAFT she reviews and sends herself. You never send. Return only the reply body: no subject line, no signature block, no name (she signs off herself).",
  "",
  "REGISTER. This is her inbox, not her marketing. Warm, direct, human, a little casual. Mirror the sender: match their length, their formality, and their energy. A quick thank-you gets two or three sentences; a real question gets a real but tight answer. Open on the actual point in the first line. Sound like a real person typing a quick reply to someone she respects, not a brand.",
  "",
  "KEEP IT SHORT. The shortest reply that fully answers. Complete sentences, mostly plain, contractions welcome, an occasional '&' for 'and' is fine. A long comma-spliced sentence is more her than a clipped one, but never pad to fill space.",
  "",
  "NEVER INVENT. Do not state or promise any fact, price, date, time, link, deliverable, refund, or commitment that is not already in the note below or the thread. If the reply needs one, write a literal bracket placeholder for her to fill, like [confirm: price] or [confirm: which date works], and never guess. If the whole reply hinges on a decision only she can make, draft the warm framing around it and leave the decision as [her call: ...]. A draft with an honest placeholder beats a confident guess.",
  "",
  "HARD VOICE RULES (this is how someone who knows her can tell it is really her):",
  "- Zero em dashes, ever. Use a spaced hyphen ' - ', trailing dots '..', or parentheses for an aside.",
  "- No emoji.",
  "- No throat-clearing or corporate filler. Banned openers and lines: 'I hope this finds you well', 'I wanted to reach out', 'Just circling back', 'Thank you for reaching out', 'Per my last email', 'I trust you are well'. Start on the real thing.",
  "- Never the 'it's not X, it's Y' shape, or any move that rejects one thing and swaps in another (no 'not X, but Y', no 'less X, more Y'), anywhere, including the opening line.",
  "- No hype or filler words: quiet, quietly, delve, leverage, unlock, elevate, streamline, seamless, robust, empower, transform, effortless, synergy, holistic, 'take it to the next level', 'circle back', 'touch base', 'value-add', 'game changer'. Use plain verbs: is, has, uses, gives, sends.",
  "- No exclamation-point sincerity as a sign-off ('You've got this!'). Warm, not peppy.",
  "- No all-caps emphasis blocks, no stretched vowels ('soooo'), no promotional devices. That is her public voice, not her private inbox.",
  "- Do not stack short choppy sentences for effect; let sentences run naturally.",
  "",
  "CLOSE on one short warm line ('thanks so much for this' / 'talk soon' register), no name, no signature block. If you genuinely cannot draft a faithful reply from the note, return exactly one line: [needs Alyssa - not enough context to draft].",
].join("\n");

async function anthropicDraft(row, env) {
  const prompt =
    `Write a reply draft for this email in the ${row.inbox} inbox.\n` +
    `From/subject context: ${row.who} - ${row.subject}\n` +
    `Reason it needs a reply / her note: ${row.tag}. Timing: ${row.when}.\n` +
    `Return only the email body, no subject line, no signature block.`;
  const res = await fetch("https://api.anthropic.com/v1/messages", {
    method: "POST",
    headers: {
      "x-api-key": env.ANTHROPIC_API_KEY,
      "anthropic-version": "2023-06-01",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      model: "claude-opus-4-8",
      max_tokens: 800,
      system: VOICE_SYSTEM,
      messages: [{ role: "user", content: prompt }],
    }),
  });
  if (!res.ok) throw new Error(`anthropic ${res.status}: ${await res.text()}`);
  const data = await res.json();
  return (data.content || []).map(b => b.text || "").join("").trim();
}

/* ------------------------------------------------------------------------ */
/* utils                                                                      */
/* ------------------------------------------------------------------------ */

function json(obj, status = 200) {
  return new Response(JSON.stringify(obj), {
    status,
    headers: { "Content-Type": "application/json" },
  });
}

// Read the body with a hard byte cap even if Content-Length was absent/lied.
// Returns the string, or null if the cap was exceeded.
async function readCapped(request, cap) {
  const buf = await request.arrayBuffer();
  if (buf.byteLength > cap) return null;
  return new TextDecoder().decode(buf);
}

// Hash both inputs to fixed-length SHA-256 digests, then constant-time
// compare. Removes the length/prefix timing leak of comparing raw secrets.
async function hashedEqual(a, b) {
  const [ha, hb] = await Promise.all([sha256(a), sha256(b)]);
  let out = 0;
  for (let i = 0; i < ha.length; i++) out |= ha[i] ^ hb[i];
  return out === 0;
}
async function sha256(s) {
  const d = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(s));
  return new Uint8Array(d);
}

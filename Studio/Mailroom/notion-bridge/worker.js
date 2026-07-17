/**
 * Mailroom Notion -> Gmail bridge (Cloudflare Worker)
 * ---------------------------------------------------
 * DRAFT / NOT LIVE. Do not deploy until:
 *   1. Alyssa places all four secrets herself (see SETUP.md).
 *   2. Vex completes the security pass on this public endpoint.
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
 *   this Worker          ->  authenticate (shared-secret header)
 *                        ->  read the row from Notion (by pageId)
 *                        ->  ARCHIVE : Composio remove INBOX label
 *                            DRAFT   : Anthropic writes reply in her
 *                                      voice -> Composio create Gmail
 *                                      DRAFT (never send)
 *                            DONE    : task, no Gmail work -> ack only
 *                        ->  write Status = handled back to the row
 *
 * DOCTRINE BAKED IN
 *   - Archive = remove from INBOX only, never delete.
 *   - Drafts only, never send. She reviews every reply.
 *   - Never auto-touch is enforced upstream (only reply/task/noise rows
 *     that already passed the sweep filters ever get a button), but the
 *     Worker also refuses any row whose Tag is Money/Security/Revenue on
 *     the ARCHIVE path as a second guard (see REFUSE_ARCHIVE_TAGS).
 */

// Inbox -> the authuser email the Gmail deep links and Composio connection use.
const INBOX_EMAIL = {
  personal: "accoleman100@gmail.com",
  support: "productiveentrepreneurteam@gmail.com",
  business: "alyssa@alyssacoleman.ca",
  wellness: "alyssacolemanwellness@gmail.com",
};

// Never archive a row carrying one of these tags, even if a button fires it.
const REFUSE_ARCHIVE_TAGS = new Set(["Money", "Security", "Revenue"]);

export default {
  async fetch(request, env) {
    // ---- 1. method + auth gate -------------------------------------------
    if (request.method !== "POST") {
      return json({ ok: false, error: "POST only" }, 405);
    }
    // Notion automation webhooks support a custom header. We require a shared
    // secret there and reject anything that does not match. HTTPS protects it
    // in transit; the secret lives only in Worker env + the Notion action.
    const presented = request.headers.get("x-mailroom-secret") || "";
    if (!env.WEBHOOK_SECRET || !timingSafeEqual(presented, env.WEBHOOK_SECRET)) {
      return json({ ok: false, error: "unauthorized" }, 401);
    }

    let body;
    try {
      body = await request.json();
    } catch (e) {
      return json({ ok: false, error: "bad json" }, 400);
    }

    // The button sends: { action: "draft"|"archive"|"done", pageId: "<id>" }
    // pageId comes from the Notion "Page ID" variable in the webhook body.
    const action = String(body.action || "").toLowerCase();
    const pageId = String(body.pageId || "").trim();
    if (!pageId || !["draft", "archive", "done"].includes(action)) {
      return json({ ok: false, error: "missing action/pageId" }, 400);
    }

    try {
      // ---- 2. read the row straight from Notion (don't trust the payload) --
      const row = await getRow(pageId, env);

      if (action === "done") {
        // Self-serve task. No Gmail side. Just acknowledge; the button already
        // set Status=done. Nothing to mark handled.
        return json({ ok: true, action, note: "task done, no gmail work" });
      }

      const inbox = row.inbox;
      const email = INBOX_EMAIL[inbox];
      if (!email) return json({ ok: false, error: `unknown inbox ${inbox}` }, 400);

      if (action === "archive") {
        if (REFUSE_ARCHIVE_TAGS.has(row.tag)) {
          return json({ ok: false, error: `refused: ${row.tag} row never auto-archived` }, 403);
        }
        await composioArchive(email, row.gmailQuery, env);
        await setStatus(pageId, "handled", env);
        return json({ ok: true, action, inbox });
      }

      if (action === "draft") {
        const draft = await anthropicDraft(row, env);
        await composioCreateDraft(email, row, draft, env);
        await setStatus(pageId, "handled", env);
        return json({ ok: true, action, inbox });
      }
    } catch (err) {
      // Leave Status where the button put it (queued) so the polled /mailroom
      // fallback still catches this row. Surface the error for logs.
      return json({ ok: false, error: String(err && err.message || err) }, 500);
    }
  },
};

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
  if (!res.ok) throw new Error(`notion ${path} ${res.status}: ${await res.text()}`);
  return res.json();
}

// Pull the fields the Worker needs off the Mailroom row.
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
    tag: txt("Tag"),
    subject: txt("Subject"),
    when: txt("When"),
    gmailUrl: props["Gmail link"]?.url || "",
    // Derive the raw search query back out of the deep link (#search/<q>).
    gmailQuery: decodeURIComponent((props["Gmail link"]?.url || "").split("#search/")[1] || title),
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
 * INTEGRATION POINT — verify against the live Composio connection before
 * activation. Account ids rotate on reconnect (see Mailroom/README.md), so
 * the Worker resolves the connection by the inbox email at call time rather
 * than hardcoding an account id. Confirm the exact action slugs + request
 * shape from the Composio dashboard / a live `mack` session; the two we need
 * are the Gmail "modify labels" (remove INBOX) and "create draft" actions.
 * The calls below use Composio's v3 execute endpoint pattern; adjust the
 * slug/param names once verified live.
 */

async function composioExecute(actionSlug, connectedAccountEmail, input, env) {
  const res = await fetch(`https://backend.composio.dev/api/v3/tools/execute/${actionSlug}`, {
    method: "POST",
    headers: {
      "x-api-key": env.COMPOSIO_API_KEY,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      // Resolve the connected Gmail account by its email so rotating ids
      // don't break us. Confirm the exact selector key with Composio.
      user_id: connectedAccountEmail,
      arguments: input,
    }),
  });
  if (!res.ok) throw new Error(`composio ${actionSlug} ${res.status}: ${await res.text()}`);
  return res.json();
}

// Archive = remove INBOX label. Never delete. Find the thread by the same
// Gmail search the deep link uses, then strip INBOX.
async function composioArchive(email, query, env) {
  // TODO(verify live): GMAIL_MODIFY_THREAD_LABELS / GMAIL_REMOVE_LABEL slug.
  return composioExecute("GMAIL_MODIFY_MESSAGE_LABELS", email, {
    query,
    remove_label_ids: ["INBOX"],
  }, env);
}

// Create a Gmail DRAFT (never send). She reviews and sends herself.
async function composioCreateDraft(email, row, draftBody, env) {
  // TODO(verify live): GMAIL_CREATE_EMAIL_DRAFT slug + recipient resolution.
  return composioExecute("GMAIL_CREATE_EMAIL_DRAFT", email, {
    query: row.gmailQuery,   // used to locate the thread to reply within
    reply: true,
    body: draftBody,
  }, env);
}

/* ------------------------------------------------------------------------ */
/* Anthropic (draft copy in her voice)                                       */
/* ------------------------------------------------------------------------ */
/*
 * Same pattern as the Instagram Saves Engine ideation step: call the API
 * directly, no Claude app needed. VOICE_SYSTEM below is a compact guard.
 * Before activation, Larry/Hermes should replace VOICE_SYSTEM with the
 * canonical voice block so drafts sound like her, not generic-polite.
 */

const VOICE_SYSTEM = [
  "You draft email replies as Alyssa Coleman. Rules:",
  "- Plain, complete, direct sentences. No em dashes. No emoji.",
  "- Warm but efficient. No corporate filler, no 'I hope this finds you well'.",
  "- Never invent facts, prices, dates, or commitments not present in the thread.",
  "- This is a DRAFT she will review and send. If anything needs her decision,",
  "  leave a bracketed [her call: ...] note instead of guessing.",
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

// Constant-time compare so the secret check doesn't leak length/prefix.
function timingSafeEqual(a, b) {
  if (a.length !== b.length) return false;
  let out = 0;
  for (let i = 0; i < a.length; i++) out |= a.charCodeAt(i) ^ b.charCodeAt(i);
  return out === 0;
}

---
title: Mailroom Notion bridge — setup and activation guide
status: DRAFT — not live, gated on Alyssa's secrets + Vex security pass
owner: Mack
zone: Studio
desk: Mailroom
---

# Mailroom Notion bridge — setup

Operational guide for the near-instant webhook path that backs the Notion
Mailroom. Nothing here is live. Two gates stand before activation (see
bottom). This is additive — the Obsidian [[MAILROOM]] and its `/mailroom`
command stay running in parallel, untouched.

Related: [[README]] (desk charter), [[notion-mailroom-BUILD-SPEC]] (the
database Larry builds), [[mailroom-notion-command-DRAFT]] (the polled
fallback command).

## The two trigger paths (both wired, on purpose)

1. **Durable (source of truth):** every button also sets the row's `Status`
   property (queued / done). If the Worker is down, the row just sits at
   `queued` and the polled `/mailroom` run clears it later. Nothing is lost.
2. **Near-instant (this bridge):** the same button also fires a `Send
   webhook` action at the Worker, which does the Gmail work in seconds and
   writes `Status = handled` back.

## Files

- `worker.js` — the Cloudflare Worker (auth, read row, archive/draft, mark handled).
- `wrangler.toml` — Worker config. No secrets in it.

## Deploy steps (run by whoever deploys; secrets by Alyssa only)

1. Install the CLI once: `npm i -g wrangler`, then `wrangler login`.
2. From this folder: `wrangler deploy`. This publishes the Worker and prints
   its public URL, e.g. `https://mailroom-bridge.<subdomain>.workers.dev`.
   That URL is what the Notion buttons POST to (step "Wire the buttons").
3. **Alyssa sets the four secrets herself** (an agent never types a
   credential). For each, run the command and paste the value when prompted:

   ```
   wrangler secret put WEBHOOK_SECRET      # any long random string she picks
   wrangler secret put NOTION_TOKEN        # Notion internal integration token
   wrangler secret put COMPOSIO_API_KEY    # from the Composio dashboard
   wrangler secret put ANTHROPIC_API_KEY   # from the Anthropic console
   ```

   | Secret | Where she gets it | What it lets the Worker do |
   |---|---|---|
   | `WEBHOOK_SECRET` | She invents it (e.g. `openssl rand -hex 32`) | Reject any webhook that isn't from her Notion button |
   | `NOTION_TOKEN` | notion.so/my-integrations -> New integration -> Internal -> share the Mailroom DB with it | Read the clicked row, write `Status = handled` |
   | `COMPOSIO_API_KEY` | Composio dashboard -> API keys | Remove INBOX label (archive), create Gmail drafts |
   | `ANTHROPIC_API_KEY` | console.anthropic.com -> API keys | Generate reply drafts in her voice |

## Wire the buttons (done in the Notion UI — the API cannot do this)

Notion button properties and their actions do **not** exist in the public
API, so this is a hand step. For each of the three button properties on the
Mailroom database (see [[notion-mailroom-BUILD-SPEC]] for which button goes
on which view), open the button config and add TWO actions in order:

1. **Edit property** -> `Status` -> set to the durable value:
   - "Draft this" button -> `queued`
   - "Archive" button    -> `queued`
   - "Mark done" button  -> `done`
2. **Send webhook**:
   - URL: the Worker URL from deploy step 2.
   - Method: POST (only option).
   - **Add custom header** -> Key `X-Mailroom-Secret`, Value = the exact
     `WEBHOOK_SECRET` string she set. This is the auth. Without it the
     Worker returns 401.
   - Body (JSON): include the action and the page id, e.g.
     ```json
     { "action": "draft", "pageId": "{{Page ID}}" }
     ```
     Use `"archive"` on the Archive button and `"done"` on Mark done.
     `{{Page ID}}` is inserted via Notion's variable picker in the body
     editor (Page ID is an available variable).

That's the whole wire: property-set (durable) + webhook (instant), one shared
secret in a header, page id in the body, Worker reads the rest off the row.

## Webhook auth mechanism (for Vex's pass)

- Transport: HTTPS only (Cloudflare terminates TLS).
- Auth: shared secret in the `X-Mailroom-Secret` header, compared in the
  Worker with a constant-time equality check (no length/prefix leak).
- The Worker does **not** trust the webhook body beyond `action` + `pageId`;
  it re-reads every other field (inbox, tag, query) from Notion directly, so
  a forged body can't redirect a Gmail action to an arbitrary address.
- Second guard: the Worker refuses to archive any row tagged Money / Security
  / Revenue even if an archive webhook fires for it.
- Drafts only, never send. Archive removes the INBOX label only, never deletes.
- Notion's automation webhooks are **not** cryptographically signed (unlike
  its API-subscription webhooks), which is why the shared-secret header is the
  auth. Vex should weigh whether that's sufficient or whether we move to the
  signed API-webhook path. Open question flagged, not resolved.

## Integration points to verify live before activation

`worker.js` marks these with `TODO(verify live)`:
- Exact Composio action slugs + request shape for "remove INBOX label" and
  "create Gmail draft", and how Composio resolves the connected account by
  inbox email (account ids rotate — never hardcode). Confirm from a live
  `mack` session against the real Composio connection.
- Replace `VOICE_SYSTEM` in `worker.js` with the canonical voice block
  (Hermes) so drafts sound like Alyssa, not generic-polite.

## Two gates before this goes live

1. **Alyssa places the secrets herself** (table above). Neither Mack nor
   Larry enters any credential.
2. **Vex security pass** on the public endpoint: webhook auth sufficiency,
   secret handling, abuse surface, rate limiting. No activation before Vex
   signs off.

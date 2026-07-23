---
title: Pretty Links API — can Claude Code create/edit Alyssa's branded short links?
client: n/a (Alyssa's own site, alyssacoleman.ca)
status: research-only — no site access made
owner: Mack
created: 2026-07-22
tags: [research, api, wordpress, prettylinks, automation]
---

# Pretty Links API — feasibility for an external agent

Research for Alyssa's self-hosted WordPress site (alyssacoleman.ca), which runs the **Pretty Links** plugin for branded short links (e.g. `/pressclub`, currently 404-ing). Goal: can Claude Code programmatically list/create/edit her links? This note is research only — no access to her site was made. Filed in [[INDEX]].

## Verdict: YES, WITH CAVEATS

Programmatic create/edit is possible, but **only through the paid "Developer Tools" add-on**, which ships a real REST API. Her current setup almost certainly cannot do it yet — she must upgrade a paid tier and install one add-on first.

There are three access paths, in order of how much we'd want them:

| Path | Modern? | Auth | Verdict |
|---|---|---|---|
| **Developer Tools REST API** (`pl/v1`) | Yes | Plugin-issued API key | **Use this** — needs paid add-on |
| Legacy XML-RPC (`xmlrpc.php`, `prli.*` methods) | No | **raw WP username + password** | Avoid — insecure, deprecated surface |
| Local PHP functions (`prli_create_pretty_link()`) | n/a | in-WP only | Not usable by an external agent |

The old official docs page ([blairwilliams.com/pretty-link/api](https://blairwilliams.com/pretty-link/api/)) only describes the XML-RPC + PHP paths. The REST API is newer (launched ~2025) and lives behind the [Developer Tools add-on](https://prettylinks.com/blog/link-mangement-developer-tools/).

## (a) Auth method to use

**Plugin-issued API key** (bearer-style), NOT WordPress admin credentials. When Developer Tools is active it auto-generates a unique API key under **Pretty Links > Developer Tools > REST API**, with a regenerate button. This is exactly the model we want: a revocable token, never her WP admin password.

Note: we could NOT confirm from public docs the exact header name (e.g. `Authorization: Bearer <key>` vs `X-API-Key`) or whether it rides on top of a WP Application Password. That detail is only visible inside the add-on's own REST API screen. **First setup step is to read that screen and copy the live examples it shows** — the plugin documents its own routes and key format there.

## (b) What Alyssa must enable

1. **Upgrade her Pretty Links license** to **Marketer or Super Affiliate** tier. Developer Tools is not on Beginner/Lite. (Free Pretty Links = no REST API at all.)
2. **Install + activate** the Developer Tools add-on: WP admin > **Pretty Links > Add-ons > Developer Tools > Install**.
3. Open **Pretty Links > Developer Tools > REST API**, generate the API key, and hand it to us **masked** (we store it as a secret, never in a note or log).
4. Confirm her Pretty Links core plugin is current (REST layer requires the v4 foundation).

## (c) Concrete endpoints

Two namespaces exist (confirmed by PrettyLinks docs):

- **`pl/v1`** — public, v3-compatible REST API. This is the CRUD surface for links.
- **`pl-developer/v1`** — the add-on's own admin API (key management, webhooks).

Full base path follows standard WordPress REST: `https://alyssacoleman.ca/wp-json/pl/v1/...`. Expected shape (standard WP REST CRUD; exact path segment to be confirmed from the add-on's REST API screen):

- **List:** `GET  /wp-json/pl/v1/links`
- **Create:** `POST /wp-json/pl/v1/links`  (body: target URL, slug, group, redirect type)
- **Read one:** `GET  /wp-json/pl/v1/links/{id}`
- **Update:** `PUT/POST /wp-json/pl/v1/links/{id}`
- **Delete:** `DELETE /wp-json/pl/v1/links/{id}`

The legacy XML-RPC method names (`prli.get_all_links`, `prli.get_link`, `prli.create_pretty_link`) map to these operations and confirm list/create/read/update are all supported. Webhook events (`Link Added`, `Link Removed`, HMAC-signed) exist if we ever want push notification instead of polling.

## (d) Minimum setup steps (recap)

Marketer+ license → install Developer Tools add-on → generate API key → confirm base URL `https://alyssacoleman.ca/wp-json/pl/v1/` responds → we wire a small client (curl/HTTP, no MCP needed).

## The /pressclub 404

**Yes, the API can diagnose and fix this.** Once wired: `GET /wp-json/pl/v1/links` (or filter by slug) tells us whether a `pressclub` link exists at all. Three likely causes:
1. The link was never created (or was deleted) → `POST` to create it with the correct target URL.
2. The link exists but points at a dead/wrong target → `PUT` to update the target URL.
3. The link exists but the WP permalink/rewrite rules are stale → that's a WP-level flush, not an API fix; the API read still confirms the link record is intact so we know to look at rewrite rules.

So the API is enough to tell us **which** of these it is and to fix cases 1 and 2 directly.

## Gotchas / caveats

- **Paid dependency:** no add-on, no REST API. Full stop. Legacy XML-RPC is the only key-free path and it wants her raw WP password — do not use it.
- **XML-RPC is a security liability:** many hosts disable `xmlrpc.php`; it's a brute-force target. Another reason to go REST-only.
- **Exact auth header + route segments unverified** from public docs — read the live add-on screen before coding the client.
- **Rate limits:** none published. Assume conservative throttling and add retry/backoff; batch bulk edits.
- **Version dependency:** REST layer needs the v4 Pretty Links foundation; an old install may need a core update first.
- **Secret handling:** API key is stored masked, out of session logs and notes, revocable from her dashboard if leaked.

## Free / creative paths (no Marketer tier)

Alyssa won't pay for the add-on and has **hundreds** of existing Pretty Links. So the goal shifts: manage them for free without moving the links unless we have to. Ranked least-disruptive first.

**1. Verify core WP REST first — 5-min test, zero disruption if it works (likely NO).**
Pretty Links stores each link in `wp_posts`/`wp_postmeta` **plus** its own custom tables `wp_prli_links` / `wp_prli_link_meta`. So there IS a `pretty-link` custom post type — but the question is whether it's registered `show_in_rest = true`. Almost certainly **not**: PrettyLinks *sells* a separate paid REST add-on, which would be pointless if the CPT were already on the free core REST API. Cheap to confirm without touching anything that matters: `GET https://alyssacoleman.ca/wp-json/wp/v2/types` and look for a `pretty-link` type. If it appears, we win outright — a free **WP Application Password** (WP 5.6+ core, revocable, NOT her admin password) + `wp-json/wp/v2/<type>` gives full create/edit. Expected result: it's not there, and even if it were, the redirect target lives in the custom table so core REST likely wouldn't write it. Confirm, don't assume.

**2. Migrate to the Redirection plugin (John Godley) — best long-term free answer.**
Free, open-source, 2M+ installs, does the exact same short-link/301 job, and ships a **real REST API** (`redirection/v1`) that authenticates with a **WP Application Password** — the correct, safe auth model. It imports in bulk: native "import from other plugins" + CSV import, so the hundreds of existing links come over via a Pretty Links export → CSV → Redirection bridge (branded slugs like `/pressclub` preserved as the "source" column). Cost = a one-time migration and re-testing slugs; after that it's a clean, free, fully-scriptable system forever. Caveat: Redirection's REST API has a history of finicky external auth (many GitHub issues) — pin it to Application Password + test one call before bulk.

**3. Browser automation on the Pretty Links UI — zero migration, clunky at scale.**
Keep every link exactly where it is; have Claude drive `wp-admin` Pretty Links screens with Playwright/headless browser. Good for **occasional** edits and one-off fixes (e.g. repointing `/pressclub`). Bad for bulk — one link = a page load + form fill, no batch, and it breaks whenever the plugin UI changes. Auth caveat: browser login needs a form password, which App Passwords can't provide, so create a **dedicated limited-role WP user** for the bot with its own throwaway password — never her real admin password. Acceptable as a fallback, not a daily driver.

**4. Legacy XML-RPC / PHP hooks (the article she sent) — avoid.**
The `prli.*` XML-RPC methods on `xmlrpc.php` are the only key-free programmatic path on free Pretty Links, but they require a **raw WP username + password** (violates our auth rule), `xmlrpc.php` is widely disabled by hosts and is a brute-force target, and it's a deprecated surface. The PHP functions (`prli_create_pretty_link()`) only run *inside* WordPress, so they're not reachable by an external agent. No safe free workaround here.

**5. YOURLS — most disruptive, only if leaving WordPress shortening.**
Open-source self-hosted shortener with a clean API, but it's a **separate app** needing its own hosting/database, and migrating hundreds of links means rebuilding them off WordPress entirely and losing the in-WP integration. Full re-platform. Not worth it unless she wants to move shortening off the site.

### Short ranked verdict
1. **Confirm core WP REST** (`/wp-json/wp/v2/types`) — free + zero disruption if `pretty-link` is `show_in_rest`; expect no.
2. **Redirection plugin + App Password** — free, real API, bulk-imports the hundreds; best durable answer, one-time migration cost.
3. **Browser automation w/ a dedicated bot user** — no migration, fine for one-offs like `/pressclub`, painful in bulk.
4. **XML-RPC** — avoid (raw password, often disabled, insecure).
5. **YOURLS** — full re-platform, last resort.

Auth stays App-Password-or-API-key only in every case; browser automation uses a dedicated limited WP user, never her admin password.

## Sources

- [Pretty Links API (legacy XML-RPC/PHP) — blairwilliams.com](https://blairwilliams.com/pretty-link/api/)
- [Developer Tools add-on announcement — prettylinks.com](https://prettylinks.com/blog/link-mangement-developer-tools/)
- [Developer Tools add-on overview docs — prettylinks.com](https://prettylinks.com/docs/pretty-link-developer-tools-add-on-overview/)
- [Pretty Links plugin — wordpress.org](https://wordpress.org/plugins/pretty-link/)
- [Redirection plugin — johngodley/redirection (GitHub)](https://github.com/johngodley/redirection) · [Redirection REST API](https://redirection.me/developer/rest-api/) · [Import/Export](https://redirection.me/support/import-export-redirects/)
- [WP Application Passwords — WordPress core (5.6+)](https://make.wordpress.org/core/2020/11/05/application-passwords-integration-guide/)
- [YOURLS — self-hosted URL shortener](https://yourls.org/)

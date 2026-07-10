# ADAPT-EXPANSION — Slack Expansion v1.0.0 (LLM operating manual)

This is the LLM-facing operating manual for this Expansion. The user reads [[README]]. Larry/Mack/Vex/Nolan/Silas read this file when WS-003 invokes the Expansion.

---

## What this Expansion is

A **runtime** Expansion. It ships a Node.js Socket Mode listener that runs as a long-lived background process. It is NOT an `agent_pack` (no new specialists). It is NOT a pure `connector` (it owns a long-lived process, not just env vars + MCP). The runtime is the whole point.

## Manifest contract

- `slug: slack` — folder must be `Expansions/slack/`.
- `expansion_type: runtime` — Larry announces, NEVER auto-launches.
- `requires_agents: [Larry, Mack]` — both pre-hires must be present (they are by default in v1.7.0+).

## What WS-003 does for this Expansion

### Step 1 — Larry: present preview

Larry shows the user: 0 agents, 3 SOPs, 6 env vars (2 required + sensitive, 4 optional), 1 runtime, ~7 post-install steps.

### Step 2 — Vex: security review

Vex must check, in order:

1. **Token sweep.** Grep this folder for `xoxb-`, `xapp-`. Hit anywhere outside `.env.example` (which contains only keys, no values) → RED. The reference `.env.example` has empty values; this is the only safe pattern.
2. **`.env.example` review.** Lists the six env vars. No real tokens. No defaults beyond `SLACK_NOTIFY_OS=false`.
3. **Outbound network defaults.** Confirm `runtime/index.js` calls `chat.postMessage` with `unfurl_links: false` and `unfurl_media: false`. Confirm there is no code path where these default to `true`.
4. **Permission surface.** Manifest declares `env_vars` and `runtime`. No `mcp_servers`. No `adds_agents`. No surprises in the file tree (only `runtime/`, `scripts/`, `sops/`, plus the trinity files + INSTALL.md + LICENSE + .env.example).
5. **Scripts review.**
   - `install.sh`: only runs `npm install` inside `runtime/` and chmods `.env` to 600. No network calls beyond npm.
   - `start.command` / `start.sh` / `start.bat`: only spawn `node runtime/index.js` after sourcing `.env`. No curl, no privilege escalation.
   - `uninstall.sh`: only stops the listener and removes the plist. Does not touch user data unless the user opts in.
   - `launchd-plist.template`: minimal — `KeepAlive`, `RunAtLoad`, log redirects to `/tmp/mypka-slack-listener.log` and `.err`.

If all six pass → GREEN. The first time this version is presented to Vex, the manifest hash is NOT yet in `Expansions/.trusted-sources` — Vex returns YELLOW the first time, GREEN on subsequent installs of the same `(slug, version)` pair after Silas pins the hash.

### Step 3 — Nolan: merge

Three SOPs auto-numbered into `Team Knowledge/SOPs/`:

- [[Expansions/slack/sops/SOP-slack-incoming-routing]] → `SOP-NNN-slack-incoming-routing.md` (default owner: Larry).
- [[Expansions/slack/sops/SOP-slack-post-message]] → `SOP-NNN-slack-post-message.md` (default owner: Mack).
- [[Expansions/slack/sops/SOP-slack-listener-health]] → `SOP-NNN-slack-listener-health.md` (default owner: Mack).

No agents. No guidelines. No templates. No new workstreams.

### Step 4 — Silas: integrity

Confirm the three SOPs validate frontmatter. Confirm wikilinks resolve. Confirm the SOP indexes have new rows.

### Step 5 — Mack: connector wiring (the meat)

This is the biggest step for this Expansion.

#### 5.1 Env vars

Prompt for `SLACK_BOT_TOKEN` and `SLACK_APP_TOKEN` (both required, both sensitive — echo masked). Optional: `SLACK_DEFAULT_CHANNEL`, `SLACK_NOTIFY_OS` (default false), `SLACK_AUTORESPONDER_MIN` (default 30), `SLACK_IGNORE_CHANNELS`.

Write to `Expansions/slack/.env`. `chmod 600`.

#### 5.2 MCP servers

None. This Expansion uses the Slack Web API directly via `@slack/web-api`, not via Slack's official MCP server (which is request/response shaped, wrong for the listener architecture). v1.1 may register Slack's MCP for "search my Slack history" — not v1.0.

#### 5.3 Runtime announcement

Tell the user EXACTLY:

> "To launch the listener, double-click `Expansions/slack/scripts/start.command` (macOS) or run `bash Expansions/slack/scripts/start.sh` (Linux) / `Expansions/slack/scripts/start.bat` (Windows). The listener will run until you close the terminal window or `launchctl unload` the plist."

If the user wants autostart on macOS, walk them through copying the launchd plist template into `~/Library/LaunchAgents/` with the path placeholders filled in, then `launchctl load` it. Wait for explicit consent.

DO NOT auto-launch the listener. Hard rule.

Hand the user `SOP-NNN-slack-listener-health.md` for ongoing health checks.

### Step 6 — Larry: post-install validation

`test -s Expansions/slack/.env` — ensures tokens were saved.
`Team Inbox/slack-incoming/` and `Team Inbox/slack-outgoing/` exist — created by `install.sh`.

### Step 7 — Larry: archive + announce

Archive to `Expansions/_installed/slack-1.0.0/.manifest.json`. Update [[Expansions/INDEX]]. Announce: "Slack is wired. DM your bot or @-mention it; messages land in `Team Inbox/slack-incoming/` and I'll route them on my next session."

---

## Operating notes for Larry

When you find new files in `Team Inbox/slack-incoming/`, run `SOP-NNN-slack-incoming-routing.md`. It's your canonical procedure for reading the inbound message, routing it to a specialist (or answering yourself), composing the reply in `Team Inbox/slack-outgoing/<original-ts>.md` with the right frontmatter (channel, thread_ts, text), and archiving the inbound to `.processed/`.

You never quote raw Slack tokens or `.env` contents into a reply. Period.

## Operating notes for Mack

When the outbound queue has files, run `SOP-NNN-slack-post-message.md`. It drains the queue, posts via `chat.postMessage` with `unfurl_links: false` + `unfurl_media: false` (never override), handles 429 rate limits via `Retry-After`, retries 5xx with exponential backoff (3 attempts max), archives sent files to `.sent/`, and writes a `.error` sibling on permanent failures so you surface them to Larry.

When the listener health is in question, run `SOP-NNN-slack-listener-health.md`. Inspection: `launchctl list | grep mypka-slack`, mtime of `/tmp/mypka-slack-listener.log`, recent heartbeat lines. Recovery: `launchctl kickstart` on the listener label.

## Uninstall

Symmetric. Mack stops the listener (`launchctl unload`), removes the plist, clears `.env`. Nolan removes the three SOPs from `Team Knowledge/SOPs/`. Silas validates. Larry archives.

`Team Inbox/slack-incoming/` and `Team Inbox/slack-outgoing/` are kept by default — that's user data. The user can delete manually.

## Open questions / known gaps for v1.1+

- **Slack's official MCP server** (`https://mcp.slack.com/mcp`, GA late 2025) is the right tool for "search my Slack history for X" — not for inbound listening. v1.1 will optionally register it for read/search use cases.
- **File uploads** in either direction. Adds `files:read` permission surface; deferred.
- **Slash commands** require either a public webhook or a separate Socket Mode subscription pattern. DM/mention covers v1.0.
- **Autoresponder default-on** is configured via `SLACK_AUTORESPONDER_MIN` (default 30 min). When inbound arrives and no Larry session has been active for ≥ that many minutes, the listener posts an in-thread "Larry will reply when next active" reply. Set the env var to a very large number (e.g., 999999) to effectively disable.

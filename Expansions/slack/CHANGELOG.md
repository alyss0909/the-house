# Slack Expansion — Changelog

## 1.0.5 — 2026-06-18

Compatibility release. Removes the latent scaffold-version gate so the pack no
longer refuses to install (or flag as incompatible) on current/future scaffolds.

### Changed

- **Removed the `requires_scaffold_version` gate.** Deleted the
  `requires_scaffold_version` line from `expansion.yaml` and the matching
  manifest-contract bullet from `ADAPT-EXPANSION.md`. The bundled manifest had
  already dropped the `<2.0.0` ceiling, but the documented gate was still
  `">=1.7.0 <2.0.0"`; the whole version gate is now gone. All other gates
  (scaffold-presence preflight, `requires_agents`, the Vex security review,
  re-install detection) are unchanged.

## 1.0.4 — 2026-05-19

Security and reliability release. HYBRID architecture per the v1.0.4
recommendation (Linear COU-276). Resolves three confirmed findings in
myICOR-authored code and corrects the third-party dependency strategy.

### Fixed

- **F3 — Windows path break (Med-High).** `runtime/index.js` derived the
  runtime directory from `new URL(import.meta.url).pathname`, which yields a
  leading-slash drive path on Windows (`/C:/...`) that `path.dirname` mishandles.
  Now uses `fileURLToPath` from `node:url`. Also fixes percent-encoding
  corruption (`%20`, non-ASCII) on POSIX paths that contain spaces.
- **F2 — Autoresponder over-replies (Medium).** The in-thread autoresponder had
  no cooldown, so a burst of inbound messages produced one reply each. Added a
  per-channel cooldown `Map` keyed off `SLACK_AUTORESPONDER_MIN`: one
  autoresponse per channel per window. Also added the `bot_message` subtype
  filter to the `app_mention` handler so it matches the `message` handler and
  no longer captures or replies to other bots.
- **F6 — Hostile `.env` shell execution (Low-Med).** `start.sh` and
  `start.command` loaded the `.env` with `set -a; source .env`, executing the
  file as shell — a malicious `.env` could run arbitrary commands. Replaced with
  a strict `KEY=VAL` parser that only ever assigns literal values (mirrors the
  tokenized parser already used in `start.bat`).

### Changed — dependency strategy

- `runtime/package.json`: direct deps remain exact-pinned (the two official
  Slack SDKs). Package version bumped to 1.0.4.
- `runtime/package-lock.json`: regenerated fresh and `npm audit`-scanned at
  release — **0 vulnerabilities**. axios (transitive, via `@slack/web-api`)
  now resolves to 1.16.1.
- `scripts/install.sh`: changed from `npm install --omit=dev` to
  **`npm ci --omit=dev --ignore-scripts`** — installs strictly from the
  audited lockfile and blocks dependency lifecycle scripts.

### Security — integrity and ordering

- Verify the pack before extracting: compute the SHA-256 of the pack zip and
  confirm it matches the pack hash published with this pack in the myICOR
  library (`INSTALL.md` §6). Note: `config_json.manifest_sha256` on the library
  row currently hashes `expansion.yaml` only — it confirms the manifest is
  untampered but does not cover the runtime, scripts, or lockfile. A
  whole-zip-hash field is the right long-term home for full-pack integrity;
  flagged to the team as a follow-up.
- macOS quarantine clearing (`xattr -dr com.apple.quarantine`) now runs as the
  **last** step of `install.sh` — after integrity verification and after
  dependency install — never before. Gatekeeper protection is only relaxed on
  a pack that has already been verified.

### Note

F1 from the shared audit memo (a "Critical" axios CVE) was a false positive —
the shipped axios 1.16.0 was already clean. With v1.0.4 the lockfile is
release-cadence-refreshed and audited, so a stale-pin finding of that kind
cannot recur.

This release is **provisional**: it resolves the 4 findings quoted in the
shared audit memo (F1, F2, F3, F6). The auditor's full report lists 11 findings;
the remaining 7 (F4, F5, F7–F11) have not yet been reviewed. Vex re-audits the
built v1.0.4 pack, and final pre-publish sign-off waits on the full report.

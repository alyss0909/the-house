---
agent_id: mack
session_id: codex-2026-07-13-composio-cli-setup
timestamp: 2026-07-13T12:12:23-04:00
type: end-of-session
linked_sops: []
linked_workstreams: []
linked_guidelines: ["[[GL-013-the-house-rules]]"]
mined: true
---

# Composio CLI setup attempt

## What happened
- Alyssa asked to install Composio with `curl -fsSL https://composio.dev/install | bash` and then run `composio login`.
- The installer was run through Git Bash on Windows and exited with: `Windows is not supported. Please use WSL or install via npm: npm install -g @composio/cli`.
- WSL is available as a Windows command but no Linux distribution is installed.
- The advertised npm fallback failed because `@composio/cli` is not published on npm as of this session.
- GitHub releases for `ComposioHQ/composio` currently publish CLI assets for macOS and Linux only: `composio-darwin-*` and `composio-linux-*`. No Windows asset was present in the checked release list.
- PyPI has `composio` installed at `0.17.1`, but it is the SDK and does not provide a `composio login` CLI entrypoint.
- A follow-up `wsl.exe --install` attempt with elevated permission returned the same Windows guidance instead of starting an install, so WSL could not be provisioned from this Codex session.

## Outcome
Composio CLI is not installed on native Windows in this workspace. The honest next path is to install and configure WSL from Windows directly, then rerun the official installer inside WSL, or wait for Composio to publish a Windows-supported CLI package.

## Next agent note
Do not retry `npm install -g @composio/cli` unless npm shows that package exists. Check official release assets first.

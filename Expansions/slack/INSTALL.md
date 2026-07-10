# Slack Expansion — Install Walkthrough

This is the one-time Slack-app creation walkthrough. Takes ~5 minutes. You only need to do this once per workspace.

## 1. Create the Slack app

Go to **https://api.slack.com/apps** → **Create New App** → **From an app manifest** → choose your workspace.

Paste this manifest:

```yaml
display_information:
  name: Larry (myPKA)
  description: Larry, your myPKA team orchestrator. DMs and mentions route into your local myPKA.
  background_color: "#1a1a1a"
features:
  bot_user:
    display_name: Larry
    always_online: true
oauth_config:
  scopes:
    bot:
      - chat:write
      - app_mentions:read
      - im:history
      - im:read
      - im:write
settings:
  event_subscriptions:
    bot_events:
      - app_mention
      - message.im
  interactivity:
    is_enabled: false
  org_deploy_enabled: false
  socket_mode_enabled: true
  token_rotation_enabled: false
```

Click **Create**.

## 2. Generate the app-level token (xapp-)

In the app's settings sidebar: **Basic Information** → scroll to **App-Level Tokens** → **Generate Token and Scopes**.

- Token name: `socket-mode`
- Add scope: `connections:write`
- Click **Generate**

Copy the `xapp-...` token. You'll paste it into `.env` as `SLACK_APP_TOKEN`.

## 3. Install to workspace + grab the bot token (xoxb-)

In the sidebar: **Install App** → **Install to <Workspace>** → authorize.

After install: **OAuth & Permissions** → **Bot User OAuth Token**. Copy the `xoxb-...` token. You'll paste it as `SLACK_BOT_TOKEN`.

## 4. (Optional) Find your default channel ID

If you want Larry to post to a specific channel when there's no thread context:

In Slack, right-click the channel → **Copy link**. The URL ends with the channel ID (e.g., `C01ABCDEF23`). Paste it as `SLACK_DEFAULT_CHANNEL` in `.env`.

If you skip this, Larry will only post in-thread (replying to whoever DM'd or mentioned him).

## 5. Fill in `.env`

Inside `Expansions/slack/`:

```bash
cp .env.example .env
chmod 600 .env
```

Open `.env` and paste:

```
SLACK_BOT_TOKEN=xoxb-...
SLACK_APP_TOKEN=xapp-...
SLACK_DEFAULT_CHANNEL=C...   # optional
SLACK_NOTIFY_OS=false        # optional, set true for OS notifications on inbound
SLACK_AUTORESPONDER_MIN=30   # optional, minutes of Larry-inactivity before in-thread autoresponder
SLACK_IGNORE_CHANNELS=       # optional, comma-separated channel IDs to ignore
```

## 6. One-time install of Node dependencies

> **Before you extract the pack — verify it.** Compute the SHA-256 of the
> downloaded pack `.zip` and confirm it matches the pack hash published next to
> the download in the myICOR library. The myICOR library record is the
> authoritative source of that hash. Only extract and install once the hash
> matches. (Separately, `expansion.yaml` carries `manifest_sha256` — a hash of
> the manifest file itself, recorded on the pack's library row — which the
> scaffold uses to confirm the manifest has not been altered.)

```bash
bash Expansions/slack/scripts/install.sh
```

This runs `npm ci --omit=dev --ignore-scripts` inside `runtime/` — a strict
install from the shipped, myICOR-audited `package-lock.json`, with dependency
lifecycle scripts disabled — and creates `Team Inbox/slack-incoming/` +
`Team Inbox/slack-outgoing/`. On macOS it also clears the Gatekeeper quarantine
flag **as its last step**, after the verified pack has been installed.

## 7. Launch the listener

- **macOS:** double-click `Expansions/slack/scripts/start.command`
- **Linux:** `bash Expansions/slack/scripts/start.sh`
- **Windows:** double-click `Expansions/slack/scripts/start.bat`

You should see in the terminal:

```
[mypka-slack] Connected to Slack via Socket Mode
[mypka-slack] Listening on bot user UXXXXXXXX
[mypka-slack] Outbound queue: Team Inbox/slack-outgoing/
[mypka-slack] Inbound queue:  Team Inbox/slack-incoming/
```

DM the bot or @-mention it in a channel where it's invited. A new file should appear in `Team Inbox/slack-incoming/`.

## 8. (Optional) Install as a launchd service on macOS

For autostart on login:

```bash
# Copy and edit the plist template — replace ${PWD} with your actual myPKA path
sed "s|__VAULT_PATH__|$(pwd)|g" Expansions/slack/scripts/launchd-plist.template > ~/Library/LaunchAgents/com.mypka.slack-listener.plist

# Load it
launchctl load ~/Library/LaunchAgents/com.mypka.slack-listener.plist
```

To unload later:

```bash
launchctl unload ~/Library/LaunchAgents/com.mypka.slack-listener.plist
```

## Troubleshooting

- **`xoxb-...` token rejected (invalid_auth):** the token belongs to a different workspace, or the app was uninstalled. Re-check **OAuth & Permissions** → **Bot User OAuth Token**.
- **`xapp-...` token rejected:** Socket Mode wasn't enabled, or the token doesn't have `connections:write`. Regenerate at **Basic Information** → **App-Level Tokens**.
- **Bot doesn't see channel mentions:** invite the bot to the channel with `/invite @Larry`.
- **Listener stops after laptop sleep (macOS):** install as a launchd service (step 8). `KeepAlive` + `RunAtLoad` will restart it automatically.

For ongoing health checks, see [[Expansions/slack/sops/SOP-slack-listener-health]] (auto-numbered into your `Team Knowledge/SOPs/` after install).

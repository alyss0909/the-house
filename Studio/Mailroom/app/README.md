# The Mailroom — clickable dashboard

A real inbox dashboard whose buttons actually do things. Click **Archive checked** and the emails leave your inbox; click **Draft this** and a reply lands in your Gmail drafts. It works because it has its own tiny local server (`server.js`) that holds the Gmail access — the thing a Claude artifact/widget can't have.

## One-time setup (about 5 minutes)

1. Get a **Composio API key** — go to [app.composio.dev](https://app.composio.dev) → Settings → API Keys → Generate. This is what lets the server act on the Gmail accounts you already connected.
2. In this folder:
   ```
   cd Studio/Mailroom/app
   npm install
   copy .env.example .env      (Windows)   # or: cp .env.example .env
   ```
3. Open `.env` and paste your `COMPOSIO_API_KEY` and `ANTHROPIC_API_KEY` (Anthropic is only needed for the Draft buttons).
4. Start it:
   ```
   npm start
   ```
   Then open **http://localhost:4599**.

## Use it inside Obsidian

Install the **Custom Frames** community plugin → add a new frame with URL `http://localhost:4599`. The Mailroom then lives as a tab right inside your vault. (The `npm start` server has to be running for it to load — see "Always-on" below.)

## What each button does

- **Archive checked** — removes those emails from the inbox only (never deletes; still in Gmail search). Uncheck anything you want to keep first.
- **Draft this / Options** — writes a reply in your voice and saves it to that account's Gmail **Drafts**. Nothing is ever sent.
- **Mark done** — ticks a task off (local to the dashboard).

## Where the data comes from

`data.json` is the triage snapshot the page renders. Right now it's the 2026-07-10 snapshot. The **daily sweep** (`sweep.js`, wired next) will regenerate it each morning — re-triage all four inboxes, drop anything already replied to, and refresh the put-away pile — so the dashboard is current when you open it.

## Always-on (optional, later)

For the server to be up whenever you open Obsidian, we'll register `npm start` as a login item / background service and point the daily sweep at OS cron (never a Claude scheduled task — see the desk charter). Ask Larry to wire this once the manual version feels good.

## Notes

- First run resolves your connected Gmail accounts by email automatically (see `server.js` → `resolveAccounts`). If the Composio SDK method name differs on your version, that's the one spot to adjust — Larry can fix it in seconds on first run.
- Never commit `.env` — it holds your keys. (Add it to `.gitignore`.)

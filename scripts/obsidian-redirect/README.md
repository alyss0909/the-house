# Obsidian link redirector

Notion cannot open obsidian:// links, so vault links in Notion point at a tiny web page that bounces straight into Obsidian. This folder holds that page. It is one static HTML file, no server, no service, nothing to maintain.

## One-time deploy (about a minute, Alyssa does this once)

1. Go to github.com and log in as **alyss0909** (the personal account, same one that owns the-house repo).
2. Create a new **public** repository named exactly **vault-links**.
3. Upload the `index.html` from this folder to it (drag and drop on the repo page, commit).
4. In the repo: Settings, then Pages, then under Source pick "Deploy from a branch", branch master or main, folder root, save.
5. Two minutes later the page is live at `https://alyss0909.github.io/vault-links/` and every vault link in Notion starts working.

## How the links look

`https://alyss0909.github.io/vault-links/?f=Studio%2FTeam%20Knowledge%2Ftasks%2Fopen%2Ftsk-2026-07-16-001`

The page reads the `f` parameter and opens `obsidian://open?vault=the-house&file=...`. A different vault can be passed with `&v=vault-name`. If the automatic jump does not fire, the page shows an "Open the note" button as a fallback.

## Why not the community Vercel app

The popular fix online is someone else's free Vercel deployment. It works, but it can disappear or change any day and every link in Notion would die with it. This version is identical in function and lives under Alyssa's own GitHub account, which makes it permanent and free.

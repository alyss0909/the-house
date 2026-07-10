---
agent_id: larry
session_id: team-inbox-merge-and-cleanup
timestamp: 2026-05-28T00:00:00Z
type: close-session
linked_sops: []
linked_workstreams: []
linked_guidelines: ["GL-001-file-naming-conventions"]
---

# Team Inbox — merge, reformat, and consolidation pass

## Context

Alyssa came in with a pile of Team Inbox notes that needed reformatting, merging, and deduplication. No new routing decisions needed — this was a cleanup pass: take messy Google Keep exports, make them readable, collapse related files into one clean doc, and delete the leftovers.

## What we did

- **Larry** reformatted `2024-09-26-websites I like.md` into grouped sections (Sales Pages, Vibes, Specific Elements, Brand Inspo, Design Inspo Accounts).
- **Larry** reformatted `2025-07-16-Service pros consider hiring.md` into grouped sections (VAs, Web Design, Copywriters, Social & Content, Pinterest, Design, Tools).
- **Larry** merged `2026-03-25-sales page inspo.md` into websites I like, deleted source.
- **Larry** reformatted `2026-04-28-Stock Image Inspo.md`; merged `2026-04-28-httpskaboompics...-trunc.md` into it, deleted source.
- **Larry** merged `2026-04-28-Hook Vault.md` into `2026-04-30-Hooks.md` as a new "Hook Templates" section, deleted source.
- **Larry** merged 3 scattered GitHub/tool files into `2026-05-28-GITHUBS im into.md` (with AI & Writing, Obsidian, Tools sections), deleted 2 source files.
- **Larry** merged 12 Claude-related files into new `2026-04-27-Claude Notes.md` with 5 sections: Setup & Integrations, Wishlist, Content Skills / Wiring, Prompts & Techniques, IG Saves & Articles. Excluded `LARRY.md` and `2026-05-13-7 pillar prompt framework AI.md` per Alyssa's direction.
- **Larry** added `2026-05-14-sheet ai.md` (geekinthesheets.app) to GitHubs file under Tools, deleted source.
- **Larry** merged `2026-04-28-Big Random List.md` + `2026-05-22-Consider.md` into `2026-04-28-Big Picture To Dos.md` (Build / Figure Out sections), deleted both sources.
- **Larry** added `2026-05-23-Content Repurposing.md` content (repurposing angles) to Claude Notes → Content Skills / Wiring, deleted source.
- **Larry** added `2026-05-12-Aughd set up-trunc.md` link to Claude Notes → Setup & Integrations, deleted source.
- **Larry** added `2026-05-05-Youre a text file substack.md` to Claude Notes → IG Saves & Articles, deleted source.
- **Larry** added `2026-04-30-Templates.md` (training material list) to Claude Notes → Prompts & Techniques, deleted source.
- **Larry** merged `2026-04-27-I want my talking heads to be like this.md` + `2026-04-27-Sales labelling.md` into `2026-04-27-Talking Head Inspo.md`, deleted both sources.
- **Larry** merged `2026-05-13-7 AI imagery prompt.md` + `2026-04-28-ai imagery.md` into `2026-04-28-AI Imagery.md`, deleted both sources.

## Decisions made

- **All Claude notes go in one file** with subheadings — not split by topic. Alyssa corrected an initial suggestion to split them.
- **LARRY.md stays separate** — not folded into Claude Notes.
- **`2026-05-13-7 pillar prompt framework AI.md` stays separate** — Alyssa wants it as a standalone reference doc for the rebrand.
- **GitHubs file = broad "tools I'm into"** — not restricted to actual GitHub repos.
- **IG/home/office/email files not merged** — Alyssa decided to leave those as-is.
- **Big Picture To Dos** = two sections: Build (concrete things to make) and Figure Out (system-level thinking).

## Insights

- When a Google Keep export is just a URL, the filename is often the URL slug truncated — reading the file reveals what it actually is. Worth glancing at before assuming it's junk.
- Claude Notes is growing into a meaningful reference doc. Worth routing to PKM properly (likely a KE or Topic) once the rebrand pass is done.
- Alyssa's "GitHubs" label is really "tools/resources I want to revisit" — not repo-specific.

## Realignments

- "no all those claude things are like how to use claude... i think they can all go into claude but maybe subheadings" — Larry had proposed splitting into 2 files; Alyssa confirmed one file with subheadings.
- "dont bring larry md over into that one tho" — Larry would have included it; excluded per instruction.
- "the 7 pillar one is actually one i wanna keep separate bc its about making ai imagery and i think it should be its own doc so i can reference it in the rebrand thing" — kept separate.
- "i dont wanna merge the others you suggested about ig/home/email" — Larry had proposed those merges; Alyssa declined.

## Open threads

- [ ] `2025-07-16-Service pros consider hiring.md` — prior session flagged this as a duplicate of an existing journal entry. We reformatted it this session but did NOT delete it. Still needs resolution.
- [ ] `2026-05-13-7 pillar prompt framework AI.md` — kept separate per Alyssa; still sitting in Team Inbox. Route to PKM (likely under rebrand or brand-world KE) when ready.
- [ ] Claude Notes (`2026-04-27-Claude Notes.md`) — still in Team Inbox. Should be routed to PKM once content settles.
- [ ] All other open threads from `[[2026-05-28-team-inbox-bulk-processing]]` remain open (Penn filing pass, restored files routing, office-reno stub, etc.).

## Next steps

1. Resolve the `Service pros consider hiring` duplicate question
2. Route `7 pillar prompt framework AI.md` to rebrand KE
3. Pick up Penn filing pass from prior session's open threads

## Cross-links

- `[[2026-05-28-team-inbox-bulk-processing]]` — same-day prior session; bulk triage and routing decisions
- `[[2026-05-27-vault-enrichment-interlinking-and-cleanup]]` — most recent structural work before today

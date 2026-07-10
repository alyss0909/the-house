> For the complete documentation index, see [llms.txt](https://help.blotato.com/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://help.blotato.com/claude-skills/claude-skills.md).

# Free Claude Skills

Free Claude skills you install once, then use forever. They take you from blank page to scheduled social post in one conversation.

Works in Claude Code, Claude Desktop, and Claude Cowork.

## What's in the pack

7 skills compose into one workflow, in two tiers.

**Starter pack** — blank page to scheduled post:

| Skill                                                            | When to use it                                                               |
| ---------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| [content-coach](/claude-skills/claude-skills/content-coach.md)   | "I don't know what to post". Front door for beginners. Auto-runs the others. |
| [brand-brief](/claude-skills/claude-skills/brand-brief.md)       | One-time setup. Captures your business, customer, CTA, story, and voice.     |
| [post-writer](/claude-skills/claude-skills/post-writer.md)       | "Write me a post about X for Instagram". Produces a graded, polished post.   |
| [post-grader](/claude-skills/claude-skills/post-grader.md)       | "Is this post any good?". Scores a draft and lists the top 3 fixes.          |
| [post-scheduler](/claude-skills/claude-skills/post-scheduler.md) | "Schedule this to LinkedIn". Ships the post via Blotato.                     |

**Creator Multiplier** — turn one idea into many, and make every one get read:

| Skill                                                      | When to use it                                                                                                    |
| ---------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| [repurpose](/claude-skills/claude-skills/repurpose.md)     | "Turn this blog post into a week of content". Produces 3 LinkedIn posts, 5 X threads, 2 short-form video scripts. |
| [viral-hooks](/claude-skills/claude-skills/viral-hooks.md) | "Give me a hook for this". A library of 100 proven hook frameworks that opens every post.                         |

repurpose auto-grades each post with post-grader, free in the Starter pack above. Install the Starter pack too for the full quality loop.

You only need to know one skill on day one: content-coach. It calls the others behind the scenes. When you have a long blog post, newsletter, or transcript to break apart, start with repurpose instead.

## How to install

Each skill is one file: `SKILL.md`. The install method depends on which Claude product you use.

### Claude Code or Claude Desktop (filesystem install)

1. Create a folder at `~/.claude/skills/[skill-name]/`
2. Create a file inside called `SKILL.md`
3. Copy the SKILL.md contents from the skill's page in this guide
4. Restart Claude Code, or fully quit and relaunch Claude Desktop

Use `~/.claude/skills/` for skills available in every Claude session. Use `.claude/skills/` for project-only skills.

### Claude Cowork (ZIP upload)

Cowork does not use a local skills folder. You upload skills through the app UI.

1. Create a folder on your computer named `[skill-name]/` (use the skill's slug, e.g., `post-writer`)
2. Create a file inside called `SKILL.md`
3. Copy the SKILL.md contents from the skill's page in this guide into that file
4. Compress the folder into a ZIP file
5. Open Claude Cowork
6. Click **Customize** in the left sidebar
7. Click **Skills**
8. Click the **+** button, then **Upload a skill**
9. Select the ZIP file
10. Toggle the skill on

Repeat for each skill. There is no `.plugin` file — Blotato skills are distributed as copy-paste SKILL.md text, which you package into a ZIP yourself for Cowork.

For organization-wide install, an admin enables it under **Organization settings > Skills**.

### Confirm it loaded

Type one of the trigger phrases from the skill's page. If the skill responds, it loaded.

### Install in this order

1. [brand-brief](/claude-skills/claude-skills/brand-brief.md)
2. [content-coach](/claude-skills/claude-skills/content-coach.md)
3. [post-writer](/claude-skills/claude-skills/post-writer.md)
4. [post-grader](/claude-skills/claude-skills/post-grader.md)
5. [post-scheduler](/claude-skills/claude-skills/post-scheduler.md)
6. [viral-hooks](/claude-skills/claude-skills/viral-hooks.md)
7. [repurpose](/claude-skills/claude-skills/repurpose.md)

Install viral-hooks before repurpose — repurpose calls it to open every post.

## How they work together

A beginner only needs to know one skill: content-coach. The coach calls the others as needed.

```
content-coach
   ↓ (no brand brief yet?)
brand-brief        → saves brand-brief.md
   ↓
content-coach      → brainstorms 5 ideas
   ↓ (you pick one)
post-writer        → drafts hook, body, CTA
   ↓ (auto-runs)
post-grader        → scores, lists fixes, post-writer applies them, loops to 8+/10
   ↓ (you approve)
post-scheduler     → schedules via Blotato
```

Once [[Deliverables/2026-07-05-social-skills-repo-intake/blotato-official/brand-brief]] exists, you can call any skill standalone:

* post-writer directly when you have an idea
* post-grader directly when you wrote a draft and want feedback
* post-scheduler directly when you have finished copy

### The Creator Multiplier flow

The Starter pack takes you from one idea to one post. The Creator Multiplier tier takes you from one long piece of content to a full week of posts.

```
repurpose          → reads a blog post, newsletter, or YouTube transcript
   ↓
repurpose          → extracts the core themes
   ↓ (for every output)
viral-hooks        → opens each post with a tested hook from the 100-hook library
   ↓
repurpose          → writes 3 LinkedIn posts, 5 X threads, 2 short-form video scripts
   ↓ (auto-runs)
post-grader        → scores each one, loops to 8+/10
   ↓ (you pick which to ship)
post-scheduler     → schedules via Blotato
```

viral-hooks also runs inside the Starter pack: post-writer calls it to open every post. You can call viral-hooks standalone any time you have a draft with a weak opening line.

## Beginner walkthrough

Sarah owns a handmade candle business. She has never posted on social. She installed the skills.

### Session 1: blank page

Sarah types: "I want to start posting but I don't know what to do."

1. Claude triggers content-coach
2. content-coach checks the working folder for a brand brief. None found, so it silently invokes brand-brief
3. brand-brief asks 5 short questions: what you sell, who buys, one CTA, recent story, vibe. Saves answers to [[Deliverables/2026-07-05-social-skills-repo-intake/blotato-official/brand-brief]]
4. content-coach reads the brief and generates 5 specific post ideas tied to her candles and audience
5. Sarah picks one: "the customer who used my candle in a proposal"
6. content-coach asks which platform. She says Instagram
7. content-coach calls post-writer with the idea, brief, and platform
8. post-writer drafts hook, caption, and CTA
9. post-writer auto-invokes post-grader. Grader scores hook 6/10 and CTA 5/10, suggests fixes, post-writer applies them
10. content-coach shows the final post and asks "Approve and ship?"
11. Sarah says yes. content-coach calls post-scheduler. Done.

One conversation, blank page to scheduled post.

### Session 2: she has momentum

Sarah types: "give me a few more ideas."

content-coach triggers. Brand brief already exists, so it skips intake and jumps straight to ideation. Same flow, faster.

### Session 3: she wrote her own draft

Sarah types: "is this caption any good?" and pastes her draft.

Claude invokes post-grader directly. Grader scores it, shows fixes inline. Sarah accepts the rewrite, then types "schedule this for tomorrow morning". post-scheduler fires.

### Session 4: power user

Sarah types: "write me a post about \[idea]."

post-writer fires directly. Grader runs after. Scheduler runs on approval.

## What the skills are tuned for

The pack is optimized for virality, not clean copy alone. The grader weights hook strength at 50%. The first 3 words decide whether the post gets read. The other dimensions (curiosity, emotional charge, share-worthiness, voice match, polarity, platform fit) split the remaining 50%.

The skills steer toward:

* Hook patterns with high virality ceilings: receipts ("I tested 47 X"), reverse ("most people think X, here's why they're wrong"), stolen lessons ("I copied X")
* Brand briefs capturing your strong opinion or wedge. The contrarian belief fuels polarizing posts.
* CTAs driving shares, saves, or polarizing comments. Not "what do you think?"
* Platform-algorithm fit: LinkedIn rewards comments, IG rewards saves, FB rewards shares, TikTok rewards completion. CTAs match the metric.

## Universal voice rules baked in

Every post the skills produce follows these rules:

* Contractions always ("don't" not "do not")
* Active voice, short sentences
* Address the reader as "you"
* Numbers as digits ("3 tips" not "three tips")
* No em dashes
* One concrete idea per post
* Specific details over generic statements

## Customizing

You own these files. Edit them.

* Update hook patterns in `post-writer/SKILL.md` to add ones working for your niche
* Add your own proven hooks to the library in `viral-hooks/SKILL.md`, or change the counts in `repurpose/SKILL.md` (3 LinkedIn, 5 X threads, 2 video scripts)
* Adjust grading rubric weights in `post-grader/SKILL.md` if you care more about CTA than hook
* Re-run brand-brief any time your business changes

## Dependencies

* Required: Claude with file system access (Read, Write, Edit tools)
* Optional: Blotato MCP server for scheduling. Without it, post-scheduler falls back to writing the post to a file you paste manually. To set up, see [Claude Code MCP setup](/api/claude-code.md) or [MCP Server Setup](/api/mcp/setup.md)

## FAQs

### Where do I get the free Claude skills?

Click any skill name in the table above. Each skill's page has the full SKILL.md as a copy-paste block. Follow the 4-step install at the top of the page.

### Are the Claude skills free?

Yes. The full content creator pack is free to download and use.

### What Claude skills do you offer for content creation?

Seven skills in two tiers. Starter pack: content-coach, brand-brief, post-writer, post-grader, post-scheduler — they chain together, and content-coach orchestrates them. Creator Multiplier: repurpose (one long piece of content into 3 LinkedIn posts, 5 X threads, and 2 short-form video scripts) and viral-hooks (a library of 100 proven hook frameworks that opens every post).

### Do the skills work in Claude Cowork?

Yes. The same SKILL.md content works in Claude Code, Claude Desktop, and Claude Cowork. The install method differs: Claude Code and Claude Desktop read skills from `~/.claude/skills/[skill-name]/SKILL.md` on your filesystem. Cowork has no local skills folder — you save the SKILL.md inside a folder named after the skill, ZIP the folder, then upload it via **Customize > Skills > + > Upload a skill** inside the Cowork app. Full steps in the [Claude Cowork install section above](#claude-cowork-zip-upload).

### Do I need Blotato to use the skills?

No. Six of the seven skills work without Blotato. post-scheduler is the only one needing it, and even there it falls back to saving the post as a copy-paste file if Blotato isn't connected.

### Can I edit the skills?

Yes. Each skill is one SKILL.md file. Open it, change anything, save. Claude reads the updated version next session.

### How do I share my own skills?

Same pattern. Create a folder named `[your-skill-name]/` with a `SKILL.md` file inside (frontmatter: name, description, allowed-tools, plus instructions). For Claude Code or Desktop, place the folder under `~/.claude/skills/` and restart. For Cowork, ZIP the folder and upload via **Customize > Skills > + > Upload a skill**.


---

# Agent Instructions
This documentation is published with GitBook. GitBook is the documentation platform designed so that both humans and AI agents can read, navigate, and reason over technical content effectively. Learn more at gitbook.com.

## Querying This Documentation
If you need additional information that is not directly available in this page, you can query the documentation dynamically by asking a question.

Perform an HTTP GET request on the current page URL with the `ask` query parameter, and the optional `goal` query parameter:

```
GET https://help.blotato.com/claude-skills/claude-skills.md?ask=<question>&goal=<endgoal>
```

`ask` is the immediate question: it should be specific, self-contained, and written in natural language.
`goal` is optional and describes the broader end goal you are ultimately trying to accomplish on behalf of the user. GitBook uses it to tailor the answer towards what is most useful for that goal.

The response will contain a direct answer to the question and relevant excerpts and sources from the documentation.

Use this mechanism when the answer is not explicitly present in the current page, you need clarification or additional context, or you want to retrieve related documentation sections.

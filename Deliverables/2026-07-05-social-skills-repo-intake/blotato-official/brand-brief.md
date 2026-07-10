> For the complete documentation index, see [llms.txt](https://help.blotato.com/llms.txt). Markdown versions of documentation pages are available by appending `.md` to page URLs; this page is available as [Markdown](https://help.blotato.com/claude-skills/claude-skills/brand-brief.md).

# brand-brief

One-time setup skill. Captures your business, customer, CTA, story vault, and voice. Saves to `brand-brief.md` so every other content skill reads it. Without this, AI output is generic. With it, every post sounds like your business.

## Install

1. Create a folder: `~/.claude/skills/brand-brief/`
2. Inside the folder, create a file: `SKILL.md`
3. Copy the entire block below into the file (include the frontmatter at the top)
4. Restart Claude Code, or fully quit and relaunch Claude Desktop

## When it triggers

* "Set up my brand"
* "Save my business info"
* "Update my brand brief"
* "I want my posts to sound like my business"
* Auto-invoked by content-coach or post-writer when no brief exists yet

## SKILL.md

````md
---
name: brand-brief
description: Capture or update a small business owner's brand brief — what they sell, who buys, the action they want readers to take, recent stories, and voice. Saves to brand-brief.md so other content skills can reference it. Triggers on "set up my brand," "update my business info," "save my brand voice," or when other skills need brand context and the file is missing.
allowed-tools: Read, Write, Edit, Glob, AskUserQuestion
---

# Brand Brief

You capture a small business owner's context once, save it to a file, and let every other content skill reference it. Without this, AI output is generic. With it, every post is specific to their business, audience, and voice.

This skill is the **foundation**. It runs once on day one and gets updated maybe quarterly.

## When to Activate

- User says "set up my brand," "save my business info," "update my brand brief," "I want my posts to sound like my business."
- Another skill (like `content-coach` or `post-writer`) needs context but `brand-brief.md` doesn't exist yet.
- User wants to refresh an outdated brief.

## Workflow

### Step 1: Check for existing brief

Look for `brand-brief.md` in the current directory.

- **If exists**: Read it. Ask "Want to update what's there, or start fresh?"
- **If new**: Skip to Step 2.

### Step 2: Ask 6 questions, one at a time

Don't dump all 6 at once. Ask one. Wait for the answer. Ask the next. Each answer should be 1-3 sentences. If they give you 1 word, ask a gentle follow-up.

**1. What's your business — what do you sell?**

Looking for: the product or service, in plain words. "Handmade soy candles" beats "wellness lifestyle products."

**2. Who's your customer — describe one real person who buys from you.**

Looking for: a specific human, not a demographic. "Mid-30s women who hate the smell of synthetic candles and want their house to feel cozy" beats "women 25-45."

If they say "everyone," push back: "Pick one. Which type buys most often, or which type do you wish bought more?"

**3. What's the one action you want someone to take after seeing your posts?**

Looking for: a single verb. Buy, follow, sign up for the newsletter, DM you, visit the website. ONE thing. If they list 3, ask which is most important.

**4. What's a strong opinion you have about your industry — something most people doing what you do would push back on?**

Looking for: a real wedge. The contrarian belief. The thing they argue with peers about. This is the **single biggest viral fuel** in their entire brief. Without it, every post sounds like every other small business.

If they say "I don't really have one," push: "Pick something. What's a habit other [industry] people have that you think is a mistake? What's a piece of common advice you ignore? What do customers thank you for that competitors don't do?" Get something specific, even if it's small.

If they're still stuck, this is a flag — note it in the brief and tell them: "We'll come back to this. Strong opinions are how posts go viral. Watch for what bothers you when you scroll competitor content this week."

**5. Tell me one recent story, win, or thing that happened in your business.**

Looking for: a real, specific moment. A customer review. A mistake they fixed. A milestone. This becomes raw material for posts later. If they don't have one, ask: "What's the most common question customers ask you?"

**6. What's your voice — pick the closest 2-3 from this list, or describe it yourself.**

Options: warm and personal, witty and dry, raw and honest, professional and clean, playful and irreverent, expert and authoritative, scrappy and underdog.

Or have them describe it in 5 words.

### Step 3: Write the brief to a file

Save to `brand-brief.md` in the current directory:

```markdown
# Brand Brief

> Captured: [today's date]
> Update this file as the business evolves.

## Business
[What they sell, in plain words]

## Customer
[The specific person — what they want, what they hate, where they hang out if mentioned]

## Primary CTA
[The one action]

## Strong Opinion / Wedge
[The contrarian belief from Q4 — something most people in their industry would push back on. This is the viral fuel. Reference it when generating contrarian-take and "most people think X" posts.]

## Story Vault
- [Story 1 from their answer to Q5]
- [Add more over time]

## Voice
[2-3 voice traits + 5-word self-description if given]

## Universal Voice Rules (apply to every post)
- Contractions always ("don't" not "do not")
- Active voice, short sentences
- Address the reader as "you"
- Numbers as digits ("3 tips" not "three tips")
- No em dashes — use commas, periods, or "..."
- One concrete idea per post, not three
- Specific details over generic statements
```

### Step 4: Confirm

Show them the file. Ask: "This is what I saved. Anything to fix or add?"

If they're happy, you're done. Any future skill can now read this file.

## What NOT to Do

- Don't ask 10 questions. Five. That's it. They'll bail otherwise.
- Don't write their voice section in marketing-speak ("authentic, value-driven, customer-centric"). Use their actual words.
- Don't invent details. If they didn't answer something, leave it blank or put "TBD."
- Don't treat this as a one-time fixed document. Tell them: "Update this whenever your business changes — new product, new audience, new vibe."
- Don't ask about social platforms here. That's for the post itself.

## Why This File Matters

Every other skill in this set reads `brand-brief.md` first. Without it:
- `post-writer` produces generic posts that could be for any business
- `content-coach` ideates without context, suggesting irrelevant topics
- `post-grader` can't check if the voice matches because there's no defined voice

With it, every output sounds like *their* business, not a content template.
````

## Related skills

* [content-coach](/claude-skills/claude-skills/content-coach.md): auto-invokes brand-brief on first run
* [post-writer](/claude-skills/claude-skills/post-writer.md): reads brand-brief.md for voice and audience
* [post-grader](/claude-skills/claude-skills/post-grader.md): grades voice match against the brief


---

# Agent Instructions
This documentation is published with GitBook. GitBook is the documentation platform designed so that both humans and AI agents can read, navigate, and reason over technical content effectively. Learn more at gitbook.com.

## Querying This Documentation
If you need additional information that is not directly available in this page, you can query the documentation dynamically by asking a question.

Perform an HTTP GET request on the current page URL with the `ask` query parameter, and the optional `goal` query parameter:

```
GET https://help.blotato.com/claude-skills/claude-skills/brand-brief.md?ask=<question>&goal=<endgoal>
```

`ask` is the immediate question: it should be specific, self-contained, and written in natural language.
`goal` is optional and describes the broader end goal you are ultimately trying to accomplish on behalf of the user. GitBook uses it to tailor the answer towards what is most useful for that goal.

The response will contain a direct answer to the question and relevant excerpts and sources from the documentation.

Use this mechanism when the answer is not explicitly present in the current page, you need clarification or additional context, or you want to retrieve related documentation sections.

---
title: "Full Tutorial: Build Self-Improving Claude Skills in 20 Min (Eval + Memory)"
source: "https://creatoreconomy.so/p/full-tutorial-build-self-improving-claude-skills-in-20-min"
author:
  - "[[Peter Yang]]"
published: 2026-06-03
created: 2026-06-04
description: "Learn how to build a skill from scratch, set up evals so it checks its own work, and add memory so it improves over time"
tags:
  - ai
  - second-brain
---
### Learn how to build a skill from scratch, set up evals so it checks its own work, and add memory so it improves over time

Dear subscribers,

Today, I want to show you how to build Claude Skills that catch their own mistakes and get better the more you use them.

> **I've become completely AI-skill pilled. I love encoding my knowledge and taste into skills and then reusing them to save time every week.**

**[Watch my video now](https://youtu.be/uT3EQPVIEb0)** to see me build a skill from scratch in 5 steps complete with an eval loop and memory.

![](https://www.youtube.com/watch?v=uT3EQPVIEb0)

Timestamps:

- ([00:00](https://www.youtube.com/watch?v=uT3EQPVIEb0)) What an AI skill is and the 5 steps
- ([01:56](https://www.youtube.com/watch?v=uT3EQPVIEb0&t=116s)) Step 1: Give AI your personal context and examples
- ([05:00](https://www.youtube.com/watch?v=uT3EQPVIEb0&t=300s)) Step 2: Edit the description to trigger the skill reliably
- ([05:59](https://www.youtube.com/watch?v=uT3EQPVIEb0&t=359s)) Step 3: Build an eval loop to have AI fix its own mistakes
- ([11:54](https://www.youtube.com/watch?v=uT3EQPVIEb0&t=714s)) Step 4: Add memory so the skill improves itself over time
- ([13:40](https://www.youtube.com/watch?v=uT3EQPVIEb0&t=820s)) Step 5: Build a skill editor to improve all your skills
- ([17:44](https://www.youtube.com/watch?v=uT3EQPVIEb0&t=1064s)) Where human taste still plays a role

---

I'm proud to partner with **[Linear](https://linear.app/partners/behind-the-craft)**

![](https://substackcdn.com/image/fetch/$s_!FJ_o!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0629929c-6ed2-447b-b8f1-802ed3ec7183_1456x735.jpeg)

As teams ship faster with AI agents, the bottleneck shifts from building to deciding what to build.

Linear's new Agent understands your full workspace context: roadmap, issues, customer requests, and code. Ask it to surface patterns across feedback, scope out a spec, or catch you up on team progress.

---

## A quick recap of AI skills

As I shared [before](https://creatoreconomy.so/p/how-to-use-claude-skills-to-write-better-and-avoid-ai-slop), a skill is just a folder with instructions that AI can trigger for a given task. In this tutorial, I'm going to build an /edit-post skill that can edit any newsletter or long-form piece. Here's what the skill folder will look like at the end:

```markup
edit-post/
├ skill.md
├ example-tutorial.md
├ example-personal.md
├ example-product.md
├ evals.md
├ memory.md
```
1. **skill.md** tells AI what the skill does and when to trigger it.
2. **The example files** include my best posts so the skill can learn my writing style.
3. **evals.md** will have pass/fail checks the skill uses to grade its own output.
4. **memory.md** will log lessons from past chats so the skill gets better over time.

Now let's build these files in 5 steps.

---

### 1\. Create the skill using your examples and personal context

My newsletter has three types of posts: tutorials like this one, [personal essays](https://creatoreconomy.so/p/40-life-lessons-i-know-at-40-i-wish-i-knew-at-20?utm_source=publication-search) on career and life, and [deep dives on AI trends and concepts](https://creatoreconomy.so/p/curious-beginners-guide-to-ai-agents?utm_source=publication-search). I saved my best posts for each type in separate md (text) files below:

![](https://substackcdn.com/image/fetch/$s_!pRW3!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F616ec080-d1d8-409e-a247-0927b6d774bb_1250x568.png)

Then I gave Claude Code all three example files and this prompt:

Create an **edit-post skill** that helps me edit a draft newsletter or any long-form post based on these examples. Review the examples, ask me questions, and keep the skill to about one page.

The most important thing here is to give AI as much personal context and examples of good output as you can. You should also keep these context files separate from the main skill.md for two reasons:

1. **It keeps the skill.md lean** because AI can decide which example posts to load (e.g., tutorial vs. personal post) based on your draft.
2. **It lets you share the skill more easily** without revealing your personal posts or information.

---

### 2\. Be explicit about when AI should trigger the skill

When you ask AI a question, it doesn't load the whole skill by default. Instead, it only reads the name and description to decide whether to load the full skill:

![](https://substackcdn.com/image/fetch/$s_!xfgC!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F7dd460f5-7c26-480c-9636-05702184fe06_1206x348.png)

So it's very important to include explicit "Use when…" instructions so AI knows when to trigger the skill automatically. You can always trigger it by hand too (type /edit-post).

---

### 3\. Test the skill manually, then build an evals.md loop

Once you have a skill drafted, test it manually a few times.

For example, I ran /edit-post on a real draft, then gave it feedback to improve. After a few manual iterations, tell AI:

Create an eval.md with 10 pass/fail checks across these categories: Introduction (does it hook the reader?), voice (is there AI slop?), substance (is there a practical insight?), and CTA (are the next steps clear?).

An eval is just written instructions that asks the AI to check its own work. I prefer pass/fail over scoring evals (like 4/5) because AI can't reliably tell a 3/5 from a 4/5. Here's a snippet of the evals that it generated for me:

![](https://substackcdn.com/image/fetch/$s_!LzQU!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc70627e3-3607-4e2e-99ab-92c7f8d43f32_1254x658.png)

Before we run the evals, give AI one more prompt:

When you run the evals, spin up a separate agent with a clean context window. If any eval fails, send it back to iterate until all evals pass.

This sets up the evals loop where one agent edits the post, a second agent grades it, and because the grader has a clean context window, it isn't biased by the first agent's work. If anything fails, the two will keep working until everything passes:

![](https://substackcdn.com/image/fetch/$s_!TOnh!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F44865064-1f41-46c8-b30f-0e2f3306be8e_1346x1014.png)

When I ran the loop on a newsletter draft, it took five rounds between the two agents to pass all the evals. AI stripped every em dash and "X, not Y" phrase along the way.

I think setting up this evals loop makes a big difference in leveling up your skills. You can just kick it off, go get coffee, and come back to a cleaner draft. You should still review and edit the final output manually of course.

---

### 4\. Give the skill a memory.md so it improves over time

Evals improve the skill's output and memory improves the skill itself.

To set it up, ask AI:

Create a memory.md for this skill that logs our past conversations using it. Be concise and make sure it doesn't overlap with evals.md.

A **memory.md** is just a text file with a reverse-chronological log of what the skill learned from your past chats. Here's an example:

![](https://substackcdn.com/image/fetch/$s_!itNV!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc947186c-10e3-4f0c-bbd9-b3d082b3ae0d_1216x554.png)

Setting this up is optional, but I've found it useful for feedback that doesn't fit a clean pass/fail check, like "make the voice more authentic." Make sure skill.md references both evals.md and memory.md.

---

### 5\. Build a skill that builds skills

I've been skillmaxxing for days, and I do worry that relying on AI to write skills could lead to a mess of slop that drags down the model's response quality.

That's why I built **/skill-editor** and **/no-ai-slop** skills to make all my skills concise and strip AI slop like em dashes, "X, not Y" phrasing, and duplicate instructions. Here's a snapshot of my /no-ai-slop skill:

![](https://substackcdn.com/image/fetch/$s_!X2oD!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F79748b28-8b9d-4121-9a66-980bdf88bb88_623x380.png)

When I ran these skills on the /edit-post skill we just built, it caught a few em dashes, removed some redundant formatting, and made the skill more concise.

---

**Quick plug:** I've made this full post free, but if you want to copy my **/skill-editor** and **/no-ai-slop** skills, along with a dozen other handcrafted skills, consider becoming a paid subscriber to unlock all my skills and prompts at [behindthecraft.com](http://behindthecraft.com/).

![](https://substackcdn.com/image/fetch/$s_!vOGf!,w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F0bb8346b-2c92-4aa7-95b2-b4ea01bbbf9d_1400x933.png)

---

## Follow these 5 steps to build skills that improve themselves

Here's how you put this guide into practice. First, reflect on your past week and brainstorm with AI workflows that you can streamline with skills. Then create each skill by following these 5 steps:

1. **Give AI** your personal context and best-in-class examples to draft the skill.
2. **Trigger the skill reliably** by including "use when XYZ" in the description.
3. **Build an evals.md** with pass/fail checks so AI can loop to improve its own output.
4. **Add a memory.md** with lessons from your chats so the skill improves over time.
5. **Build (or copy) a /skill-editor** skill to keep all your skills clean and concise.

**[Watch the video now](https://youtu.be/uT3EQPVIEb0)** and subscribe to my channel if you enjoyed this tutorial. Let me know if you have any questions in the comments!

---

*Filed from Team Inbox on 2026-06-04. Source: [[Peter Yang]] via [[creatoreconomy-so]]. Related: [[ai-tools]], [[second-brain]].*

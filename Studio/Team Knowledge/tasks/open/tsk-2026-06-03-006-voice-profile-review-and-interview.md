---
id: tsk-2026-06-03-006
title: Review AI-mined voice profile + do gap interview
status: open
priority: 2
assignee: alyssa
created: 2026-06-03
due: 2026-06-11
tags: [second-brain, voice-profile, copy]
---

# Review AI-mined voice profile + do gap interview

## Context

During the 2026-06-03 session, Larry mined your entire Second Brain (7 training transcripts, 2 webinars, sales pages, about page, home page, all existing analysis) to answer the Ruben Hassid 100-question voice interview on your behalf. Two files were created:

- **[[Studio/Analysis/voice-archive]]** — full 100-question archive with evidence, sources, and confidence ratings (HIGH/MED/LOW)
- **`PKM/Second Brain/analysis/about_me.md`** — compressed XML voice profile (~3,000 tokens), AI-ready for loading into any copy session

This task has two parts.

---

## Part 1 — Review both files

Open both files and read them critically. You're looking for:
- Anything that's **wrong** (crossed a wire, misread your voice)
- Anything that's **almost right but off** (direction correct, wording not yours)
- Anything that's **missing** that you'd expect to see
- Anything that **surprised you** (in a good way — keep it)

Annotate inline if you want, or just note reactions as you go. After reading, tell Larry what needs correcting. Larry will update `about_me.md` directly.

**Start with `about_me.md`** (the short one) — it's the distillation. If something is wrong there, it will trace back to the archive.

---

## Part 2 — Do your gap interview

13 questions couldn't be answered confidently from your files. These are the ones that need to come from you directly — they're the internal/opinion layer that no amount of copy analysis can surface.

**Run this in a fresh Claude session.** Paste the Taste Interviewer prompt first (below) so it stays in character, then tell it to skip straight to the gap questions — you're only answering the ones marked below.

**Use Wispr Flow or dictate** — these are opinion questions, voice is faster and more honest.

---

### The Gap Questions (13 total)

Paste this into a fresh Claude session to do the interview:

```
You are a Taste Interviewer helping me fill gaps in my existing voice profile. I've already completed most of a 100-question interview via AI analysis of my existing content. I only need you to ask me the following 13 questions — one at a time, in order. Push back on vague answers. Ask for specific examples. Don't let me say "I don't know" without trying a reframe first.

After all 13 answers, compile everything into a clean markdown section I can paste into my voice-archive.md.

Here are the 13 questions:

**BELIEFS & CONTRARIAN TAKES**
Q14: What do you actually believe about AI and automation that most people in the "productivity" or "systems" space get wrong? Not what you teach — your real opinion.
Q15: What's your honest prediction for your industry in 3-5 years? Where is this all going?

**WRITING MECHANICS**
Q21: What words do you overuse without always noticing — the ones you'd have to consciously cut?

**AESTHETIC CRIMES**
Q41: What content format do you find lazy or uninspired? Specific — not just "low quality."
Q44: What visual or design choices feel immediately off-brand or tacky to you?
Q46: What kind of testimonials or social proof make you roll your eyes?
Q48: What makes you immediately unsubscribe from someone's list?

**VOICE & PERSONALITY**
Q54: What does your voice sound like when you're genuinely excited about something — not performed excitement, real excitement?
Q55: What does your voice sound like when you're skeptical? How do you communicate doubt?

**STRUCTURAL PREFERENCES**
Q71: What's your philosophy on email length — is there a rule you actually follow?
Q80: Is there something structural you do in almost every piece of content that you might not even notice you're doing?

**HARD NOs**
Q81: What topics would you genuinely never write about — even if they'd perform well?
Q85: What kind of partnerships or collaborations would you decline, no matter how good the opportunity looked?

**RED FLAGS**
Q96: What does "trying to sound like you" look like when it goes wrong? What's the tell that someone has the style but not the substance?

Begin with Q14.
```

---

## Part 3 — After the interview

Paste your 13 answers back to Larry. Larry will:
1. Update [[Studio/Analysis/voice-archive]] with your answers (replacing LOW/MED with your actual words)
2. Recompile `about_me.md` to reflect the updates
3. Add the final `about_me.md` to your CLAUDE.md or system prompt so it loads automatically in every copy session

---

## Next step after all of this (from the article)

Once `about_me.md` is final, the next phase from Ruben's article is:
- **Make it "always on"** — load it into your Claude Code project folder / CLAUDE.md so it reads automatically every session
- **Test it** — open a blank session with just the file loaded, give it a copy prompt, see if it sounds like you
- **Hand it to anyone writing copy for you** — this IS the onboarding doc for a future copywriter hire
- **Keep it alive** — your taste changes; update the file when you notice something is stale

This lives in `reference_voice_profile_methodology.md` in Larry's memory if you want the full article context again.

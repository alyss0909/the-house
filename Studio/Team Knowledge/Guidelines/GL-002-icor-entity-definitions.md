---
title: GL-002 appendix — iCOR entity definitions (vault copy)
date: 2026-07-16
owner: Larry maintains; every agent reads before routing anything into Notebook/Life
status: ACTIVE — exported from host-local memory 2026-07-16 to close the autopsy's "no host-local memory" leak
linked_guidelines: ["GL-002", "GL-014-the-compounding-architecture"]
---

# iCOR entity definitions

These definitions were cited by session logs as mandatory reading but lived only in one host's private memory, invisible to every other agent and machine (found by the 2026-07-11 autopsy, closed 2026-07-16). This is now the vault copy and the single source. Read before making any routing recommendation. Source: the original myPKA scaffold files.

## Key Elements

"The load-bearing walls of your life — Health, Family, Career, Wealth, Creative work. Stable dimensions that shift only with major life changes. Four to seven files, no more: fifteen means they are Topics in disguise. A Key Element is a lens, not a tracker — no streaks, no numbers to optimize. Key Elements are the slowest-changing layer; Topics may graduate into one over time."

- A Key Element is the HOME for Goals that serve it.
- Sorting heuristic: **holds goals = Key Element.**

## Topics

"The signal layer the team watches." Linked to a Key Element via the `key_element` field. Template sections: "What I think about here," "Things I'm tracking," "Sources."

- Topics are things actively developing or being watched right now.
- They can graduate to a Key Element over time (the promotion path).
- Sorting heuristic: **holds ideas = Topic.**
- Stay lean — only a few active Topics at a time.

## Goals

"An outcome with a horizon and an explicit definition of 'shipped.' Three load-bearing pieces: a result that exists in the world, a date, and an observable test you can point at. Without a horizon, a Goal is a wish."

- Sits inside the Key Element it serves.
- Driven day-to-day by Habits.
- Delivered through a bounded Project.

## Projects

"A time-bound push that moves a Goal forward."

- Has status, a linked Key Element (`key_element` field), and linked offers.
- "Part of [key element]."

## Habits

"Recurring rhythms with a cadence and a definition of done. A Habit is not a Goal (no finish line), not a Project (no scope), and not a streak (no number to optimize). It maintains; it does not end."

- Feeds the Goal or Key Element named in its "Why I do it" field.

## Alyssa's approved Key Elements tree (as of 2026-05-26)

Top level: Business, Life.
Under Business: Emails, Socials, Promos, Offers, Clients, Operations.
Under Life: Becoming, Parenting, Home.
The GL-002 extension enables a `parent_key_element` field for two-level nesting (max depth 2).

## Common mistake to avoid

Do NOT recommend adding new Key Elements for things that are actively developing or idea-stage. Those are Topics. Key Elements are stable and slow. Only recommend a new Key Element if it is truly a load-bearing life dimension that will not change.

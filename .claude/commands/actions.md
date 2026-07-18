---
name: actions
description: Read HOME.md's "## Actions state" ledger and run every entry marked "queued" — mailroom sweep, weekly review, monthly review, or trend scout. Same click-then-say-the-word shape as the Content Studio's /content-run and the Mailroom's own queue. Say "/actions" to run everything queued right now.
user_invocable: true
---

# /actions — run every queued card on the HOME dashboard

Alyssa clicks a card in `HOME.md`'s Actions section. The click writes one real line
to the hidden `## Actions state` ledger:

```
<!--state:action:<slug>:queued-->
```

Saying **/actions** in chat is the trigger that reads that ledger and actually runs
the real work, same two-step shape as tapping a content option then saying`r`n"/content-run" in the Content Studio, or clicking a Mailroom card then saying`r`n"/mailroom".

## One pass (default)

1. **Read** `HOME.md`. Find every line matching `<!--state:action:<slug>:queued-->`
   between `<!--action-ledger-start-->` and `<!--action-ledger-end-->`.
2. If none are queued, report "nothing queued" and stop.
3. For each queued slug, run the real thing:
   - **mailroom-sweep** → invoke the `mailroom` skill with args `sweep` (same as
     someone typing "/mailroom sweep" directly).
   - **weekly-review** → invoke the `weekly-review` skill (WS-006). Uses whatever
     date range the skill's own default resolves to (the most recent complete week).
   - **monthly-review** → invoke the `monthly-review` skill. Same default-range rule.
   - **trend-scout** → follow `Studio/Team Knowledge/SOPs/SOP-033-run-trend-scout-brief.md`
     exactly. This one has no packaged skill yet, run the SOP's real steps directly.
4. **Flip the ledger line** for each slug that completed from `queued` to `handled`
   (string-replace that exact line, keep everything else untouched). If a step fails
   partway, leave its ledger line at `queued` so the next `/actions` pass retries it,
   and report the failure to Alyssa instead of silently marking it done.
5. **Log.** Append one line per completed action to `## Actions reacts` (insert
   directly under that heading in `HOME.md`):
   `- [YYYY-MM-DD HH:MM] ran <slug>`
6. **Report** in chat what actually ran and what it produced (link to the real
   output: the weekly wrap file, the mailroom draft count, the new trend report).

## Guardrails

- Only ever act on a ledger line whose status is exactly `queued`. `handled` = already
  done, never repeat without a fresh click.
- Multiple different slugs queued at once may run in any order; they don't depend on
  each other. Don't run the same slug twice in one pass even if it appears more than
  once (it won't, `queueAction` in HOME.md's own JS replaces the existing line rather
  than duplicating it, but check anyway).
- If a slug in the ledger doesn't match one of the four known actions above, skip it,
  report it in chat, and leave its status untouched rather than guessing what it means.

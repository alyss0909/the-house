---
date: 2026-04-10
tags:
  - ai
---
# How to Stop Hitting Claude Usage Limits

23 habits for saving Claude credits, from least-known to obvious. Claude counts tokens — roughly one per word. Every message causes Claude to re-read the entire conversation from the top. Message 30 means Claude re-reads 29 exchanges before answering.

**1. Convert files before uploading.** A single PDF page costs 1,500-3,000 tokens. Screenshots are worse. Extract text, paste as plain text, crop screenshots tight.

**2. Plan in Chat. Create the file at the end.** File creation uses more of your limit than regular chat. Do thinking in Chat (cheap), building in Cowork (expensive).

**3. Say "ask me questions" instead of writing a long prompt.** A 500-word prompt costs 500 tokens every re-read. Use: "I want to [task] to [success criteria]. Ask me questions before you start."

**4. Use Wispr Flow to give richer answers.** Voice answers are more context-rich in one shot, which means fewer correction messages.

**5. Stop asking Claude to redo the whole thing.** "Only redo section 3. Keep everything else to save tokens." Add "No commentary. No explanations. Just the output."

**6. Batch your tasks into one message.** Three prompts = three full context reloads. One prompt with three tasks = one reload.

**7. Use the same prompt structure every time.** Similar prompts get partially cached. Keep a stable prompt library and swap only the variable part.

**8. Edit your message instead of sending a follow-up.** Click Edit on your original message, fix it, regenerate. The old exchange gets replaced, not stacked.

**9. Pick the right product for the task.** Quick question: Chat with Haiku. Report from files: Cowork with Opus. Chart from data: Code with Sonnet.

**10. Keep ABOUT ME files under 2,000 words each.** Cowork reads your folder before every task. A 22,000-word about-me burns thousands of tokens before real work starts.

**11. Restart the conversation instead of sending follow-ups.** A 20-message session burns ~105,000 tokens. A 30-message session: 232,000. Use "Restart the conversation from here" on an earlier message.

**12. Summarize and start fresh every 15-20 messages.** Ask Claude to summarize everything important, copy it, open a new session, paste as first message.

**13. Use Sonnet or Haiku for simple tasks. Save Opus for deep work.** If the task takes Claude less than 30 seconds to answer, it probably doesn't need Opus.

**14. Don't dump your entire folder into Cowork.** If Claude doesn't need it for this task, it shouldn't be reading it.

**15. Start a new chat when the topic changes.** New topic = new chat. Always.

**16. Turn off features you're not using.** Web search, connectors, and Explore mode all add tokens to every response even when you don't need them.

**17. Use Projects for recurring work.** Upload the file once. It gets cached. Every new conversation inside that project references it without burning tokens again.

**18. Turn off Memory and add User Preferences.** Set up Styles (Concise or custom). Persists across chats without eating your context.

**19. Use scheduled tasks for recurring work.** Use the /schedule plugin instead of running the same report manually in a growing session.

**20. Give Claude Code a clear scope before it starts.** Code goes wide if you let it. Be specific: "Create a bar chart from this CSV showing monthly revenue for 2025. Save it as chart.png."

**21. Use the CLAUDE.md file to set permanent context.** Put recurring instructions there. Keep it short — if it's for workflows you only use sometimes, put those in Skills instead. Skills load on demand. CLAUDE.md loads every single time.

**22. Spread your work across the day.** Claude uses a rolling 5-hour window for usage limits. Split into 2-3 sessions so previous usage rolls off.

**23. Stop using Claude for things Claude is bad at.** Claude can't generate images: use Gemini. Real-time search: use Grok.

**Related notes**
- [[2026-04-04-6-ways-cut-claude-token-usage|6 Ways to Cut Claude Token Usage]]

**Connections:** [[ruben-hassid]] [[ai-tools]] [[pkm]]

*[Source](https://ruben.substack.com/p/how-to-stop-hitting-claude-usage)*

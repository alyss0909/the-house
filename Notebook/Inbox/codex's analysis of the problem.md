NOTE: this is the codex view, should be taken with a grain of salt.. just its perspective our goal is to find the root issue and pressure test solutions

**The Problems**

1. **Context overload, not knowledge scarcity.**  
    The house has the needed knowledge, but agents are being asked to hold too much at once: carousel forensics, Hermes voice, offer facts, buyer psychology, anti-AI rules, taste rulings, product logistics, inspiration, and prior failures. More files are becoming more noise.
    
2. **No clean authority hierarchy.**  
    `carousel-slide-by-slide.md` is clear, but it sits beside many summaries, quickrefs, tests, old frameworks, and generated outputs. Agents cannot easily tell “this is source-calibrated and load-bearing” vs. “this was an old attempt / derivative / opinion.”
    
3. **The workflow collapses thinking and writing into one pass.**  
    The agent is expected to understand the angle, choose the buyer psychology, map the offer, choose the carousel precedent, pull source copy, and write in your voice all at once. That is where it degrades into generic synthesis.
    
4. **The system keeps responding to failures by adding more instructions.**  
    That is likely the main loop. A bad draft happens, then the house adds a ruling, framework, taste note, quickref, or checklist. Each one may be individually true, but collectively they make the next run more cognitively crowded.
    
5. **There is no strong regression/eval loop for “does this feel like Alyssa?”**  
    There are taste notes and analysis, but not a small stable test set that says: given this offer + angle, a good output must preserve these specific traits and avoid these known failure modes. So the system keeps learning verbally, not operationally.
    

**Research Backing**  
Anthropic’s context-engineering guidance backs the first problem: agents perform better with the “smallest possible set of high-signal tokens,” and too much context causes attention degradation / context rot. So “load more of the house” is not a reliable fix.  
Source: [https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)

Anthropic’s evals guidance backs the fourth/fifth problems: without evals, teams get stuck in reactive loops where fixing one failure creates another. Failures need to become test cases, not just new instructions.  
Source: [https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)

OpenAI’s prompting guidance backs the hierarchy/clarity issue: prompts should be specific, use clear output formats/examples, reduce vague instructions, and say what to do instead of only adding prohibitions. Your system has many prohibitions and references, but not enough compact “do this exact thing now” operating shape.  
Source: [https://help.openai.com/en/articles/6654000-prompt-engineering](https://help.openai.com/en/articles/6654000-prompt-engineering)

So the sharper conclusion is: **the fix is probably deletion, ranking, and evals before adding anything new.** The question is not “what framework is missing?” It’s “which 80% of the current content-brain should stop being in the writer’s way?”

**What Is Sitting There But Underused**  
The underused gold is:

`carousel-slide-by-slide.md`  
This has the real flow intelligence, but it’s written as analysis, not as a reusable “choose this when…” system.

`carousel-flow-and-weird-hooks.md`  
This has the best education/trend spine and the slide-8 aha distinction. It should be mandatory for carousel structure, not optional deep reference.

`taste-ledger.md`  
This is huge. You literally already said the missing thing: after concept approval, the writer should use persuasion, break belief on slide 2, and identify what’s broken. The file says each slide should be: “what the slide shows → so that [the belief we shift].” That is probably the missing production rule.

`boh-teaching-index-phases-0-2.md` and `boh-teaching-index-phases-3-5.md`  
These hold your actual philosophy of belief-building: diagnosis before prescription, old way/new way, Double Yes, Right Time Offer, story is not the point, belief before buy. These are not consistently mapped to social posts.

**What Is Actually Being Used**  
The system is using:

`METHOD.md`: live craft authority.

`carousel-quickref.md`: goal → archetype selection.

`carousel-framework.md`: trend report, manifesto, step framework, story/POV, product reveal, data argument.

The issue: those are mostly **format/archetype rules**, not always **buyer-psychology rules**. “Step Framework” tells the writer the shape. It does not fully force the argument: “what current belief makes them not buy, what do they need to believe instead, and what proof earns that?”
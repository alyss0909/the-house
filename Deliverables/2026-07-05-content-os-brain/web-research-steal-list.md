# Content OS Ecosystem Research — Web Sweep

Date: 2026-07-05 | Researcher: Pax | For: Larry → Alyssa's multi-agent Content OS build
Brief: survey mature content assembly-line systems, GitHub/Claude skills per agent role (concept-pitcher, hook-gen, mean critic, A/B pre-tester, teacher, copywriter), IG carousel algo signals, and anti-patterns.

---

## Executive summary

The ecosystem Alyssa wants to steal from already exists in pieces, nowhere as a whole. The strongest steals: (1) the pillar→atomize→distribute assembly line (GaryVee model + Justin Welsh 1-3-5), (2) the adversarial review panel pattern with blind scoring and a supreme judge (agent-review-panel repo — the best "mean Alyssa" blueprint found), (3) fan-out→tournament selection for concept pitching (documented Claude Code subagent pattern), (4) the six-pass refinement protocol + AI-tell detection from create-viral-content, and (5) FeedHive-style pre-publish scoring — which is real but should be reframed as "checklist scoring against known algo signals," not prediction, because true engagement prediction is mostly snake oil without your own historical data. The homogenization risk is empirically documented (Science Advances 2024) and the documented fix — diverse forced personas at the ideation stage — maps directly onto her swarm design.

---

## 1. Content assembly-line / batch workflow systems

### 1a. GaryVee Content Model (reverse pyramid) — the OG team assembly line
- One "pillar" asset (keynote, vlog, Q&A) → team atomizes into **30+ platform-native micro-pieces** (quotes, images, clips, articles), each "over-indexed" for the platform it lands on. Documented case: one keynote → 30+ pieces → 35M views.
- Operating pattern to steal: **editorial meeting → pillar production → analyze/repurpose pass → contextual reformat per platform → distribute → community listening feeds next pillar.** It's a loop, not a line.
- Sources: [GaryVee Content Strategy](https://garyvaynerchuk.com/the-garyvee-content-strategy-how-to-grow-and-distribute-your-brands-social-media-content/), [official model PDF (86 pages)](https://s3.amazonaws.com/gv2016wp/wp-content/uploads/20180725172810/GV-Content-Model-1.pdf), [Biteable breakdown](https://biteable.com/blog/gary-vees-content-framework-one-video-30-content-pieces/). **Confidence: High** (primary source + multiple independent writeups).

### 1b. Justin Welsh's 1-3-5 + content library — the solo-creator flywheel
- **1 idea → 3 formats → 5 platforms ≈ 16 posts** per idea. Weekly cadence: one pillar per week, atomized in one pass, distributed across days.
- Killer operational detail: he **tracks publication dates and re-runs high performers at 6/12/18/24 months** — a "730-day content library" where proven content is an asset that gets re-deployed, not archived. This is the cheapest A/B data source there is: your own winners.
- Sources: [Justin Welsh — Repeatable Content](https://www.justinwelsh.me/newsletter/the-power-of-repeatable-content), [730-Day Content Library](https://www.justinwelsh.me/newsletter/build-a-content-library), [Tweet Hunter breakdown of the system](https://tweethunter.io/blog/justin-welsh-content-repurposing-system). **Confidence: High.**

### 1c. n8n "content factory" pipelines — the automation-native pattern
- Mature templates converge on the same stage-gate shape: **Ideation → Research → Draft → Human Review gate → Platform Adaptation → Images → Publish → Analytics loop.**
- Batch discipline: monthly batch ideation (20-30 seed keywords → 100+ ideas overnight → calendar stays full); one anchor asset → 6-8 publish-ready platform variants per run; explicit human-approval node before anything ships.
- The pattern worth stealing isn't the tooling, it's the **approval-gate placement**: after draft, before adaptation — so one approval covers all variants.
- Sources: [n8n multi-platform content factory template](https://n8n.io/workflows/3066-automate-multi-platform-social-media-content-creation-with-ai/), [system-prompt-composition publishing factory](https://n8n.io/workflows/3135-automated-social-media-content-publishing-factory-system-prompt-composition/), [step-by-step build guide](https://medium.com/@caring_smitten_gerbil_914/step-by-step-guide-to-building-an-ai-powered-social-media-content-factory-with-n8n-402f039b0824), [NextAutomation guide](https://nextautomation.us/blog/how-to-automate-content-creation). **Confidence: Medium-High** (many independent templates agree on the shape; individual template quality varies).

### Shared operating patterns across all three (+ Blotato, which Alyssa knows)
1. **Anchor asset first, variants second.** Nobody generates variants from scratch; everything derives from one approved pillar.
2. **One human gate, placed early.** Approve the concept/draft once; automation handles the fan-out.
3. **Grader with a threshold before scheduler** (Blotato's 8+/10 with hook weighted 50% is the cleanest published version of this).
4. **Analytics feed the next ideation batch** — the loop closes or the system decays.
5. **Weekly theme cadence** — one pillar/theme per week keeps the grid coherent and batching sane.

---

## 2. GitHub / Claude skills per agent role

### (a) Hook generation with data-backed libraries
- **[aaaronmiller/create-viral-content](https://github.com/aaaronmiller/create-viral-content)** — the strongest single repo found. Three hook architectures: **Prediction+Stakes, Tribal Identity Split, Before/After Compression.** Cites a 40-source research base incl. BuzzSumo's 100M-headline dataset. Also ships **100+ "AI tells" with replacements** (text, platform-specific, visual) and platform templates (Reddit/X/LinkedIn/etc.). Detailed formulas live in `title-formulas.md` and `refinement-protocol.md` in-repo — worth cloning and reading directly.
- **[shixinzhang/tiktok-viral-hooks](https://github.com/shixinzhang/tiktok-viral-hooks)** — open library of viral-video teardowns: exact 3-second opener quoted, hook pattern named, retention move identified, 2-sentence steal-able template per video. This is genuinely data-backed (real viral posts, deconstructed) rather than formula-guessing. TikTok-centric but the hook patterns transfer to carousel slide 1.
- **[Viral Hook Creator skill](https://mcpmarket.com/tools/skills/viral-hook-creator)** — 18 psychological hook patterns + trigger-word library, per-platform. (Page rate-limited during research; pattern list not extracted. **Single source — flagged.**)
- **Trap to know:** GitHub searches for "hooks" mostly return **Claude Code lifecycle hooks** (e.g., disler/claude-code-hooks-mastery, the "Hook Factory" skill) — unrelated to content hooks. Filter accordingly.

### (b) Concept-pitching / multi-option idea agents
- No single dominant repo; the pattern is documented as a Claude Code orchestration shape: **fan-out → reduce → synthesize**, with parallel subagents generating independent concepts, then **tournament/pairwise comparison** for selection — explicitly recommended for creative work because "taste is hard to specify but easy to compare." Sources: [Claude Code agent teams docs](https://code.claude.com/docs/en/agent-teams), [alexop.dev deterministic orchestration](https://alexop.dev/posts/claude-code-workflows-deterministic-orchestration/), [ivern.ai subagent guide](https://ivern.ai/blog/claude-code-subagents-multi-agent-guide-2026), [MindStudio subagents](https://www.mindstudio.ai/blog/claude-code-sub-agents-explained). **Confidence: High** on the pattern.
- **[contains-studio/agents](https://github.com/contains-studio/agents)** — best off-the-shelf agent-pack structure: 40+ agents in departments, incl. a marketing dept (**instagram-curator, tiktok-strategist, content-creator, twitter-engager, growth-hacker**). Each agent = YAML frontmatter + 500+ word system prompt with expertise, workflow integration, constraints, and **success metrics**. Steal the file format and the "success metrics in the contract" convention, not necessarily the prompts (generic voice).
- Key steal for the pitcher swarm: **assign each pitching agent a forced-divergent persona/lens BEFORE generation** (see anti-patterns §4 — this is also the documented homogenization fix).

### (c) Adversarial critic / "mean Alyssa" pattern
- **[wan-huiyan/agent-review-panel](https://github.com/wan-huiyan/agent-review-panel)** — the best existing blueprint. Mechanics worth stealing wholesale:
  - 4-6 reviewers with **distinct personas AND distinct reasoning strategies** (systematic enumeration, adversarial simulation, backward reasoning).
  - **Blind independent scoring before debate** (anti-groupthink), private confidence self-rating, **sycophancy detection** (flags position changes not backed by new evidence), correlated-bias warning on unanimous agreement.
  - **Control-validation gate:** run a deliberately bad decoy input; any reviewer who can't score the decoy clearly below the real deliverable gets dropped. Brilliant calibration trick for a "mean Alyssa" — feed her a known-mediocre carousel and check she actually tears it down.
  - Supreme judge renders verdict (REVISE/APPROVE, 0-10 score, P0-P3 severity, confidence tier), then a **post-judge verification gate demotes hallucinated findings.**
- Academic backing for the pattern: the **DEBATE framework** (Scorer + devil's-advocate Critic + Commander) measurably improves LLM judgment quality — [Agent-as-a-Judge survey](https://arxiv.org/html/2508.02994v1); [Triall on adversarial review](https://triall.ai/blog/adversarial-ai-review) ("shift the incentive from produce a good-sounding answer to find the flaws"). **Confidence: High** (repo + papers agree).
- create-viral-content's **six-pass refinement protocol** is a lighter single-agent version: The Skeptic, The Expert, **The Scroller** (stopping-power check — perfect for hooks), The Competitor, The Editor, plus visual passes.

### (d) A/B pre-testing / engagement prediction — reality check
- **What actually exists:** [FeedHive](https://blog.picmim.com/blog/ai-predict-social-media-post-success) 0-100 pre-publish score (claims training on 1.5M+ posts — most transparent on the market); [Dash Social Predictive AI](https://www.dashsocial.com/features/predictive-ai) (visual scoring, strong for IG, trained on YOUR account history); various "virality predictor" sites of dubious rigor.
- **What's real vs snake oil:** models trained on *your own historical account data* (Dash Social approach) have legitimate signal. Generic universal "will this go viral" scores are weak — even vendors concede predictions can't track algorithm shifts or what your audience cares about *this month* ([Picmim analysis](https://blog.picmim.com/blog/ai-predict-social-media-post-success)). **Confidence: High** that generic prediction is unreliable; **Medium** on FeedHive's specific claims (vendor-sourced).
- **Recommendation for the A/B tester agent:** don't build a fake predictor. Build a **rubric scorer against documented algo signals** (§3) + Alyssa's own post-performance history, and treat real A/B as post-publish (hook variants across posts, tracked). Blotato's grader-with-threshold is the honest version of this role.
- **True A/B pre-testing that isn't snake oil:** Justin Welsh's method — republish proven winners on a 6-month cycle and let your own archive be the training data.

### (e) Multi-agent swarm orchestration for creative work
- Canonical patterns from [Claude Code agent teams docs](https://code.claude.com/docs/en/agent-teams) and practitioner guides ([alexop.dev](https://alexop.dev/posts/claude-code-workflows-deterministic-orchestration/), [MindStudio teams-vs-subagents](https://www.mindstudio.ai/blog/claude-code-agent-teams-vs-sub-agents)):
  - **Fan-out → reduce → synthesize** (parallel pitchers, orchestrator merges)
  - **Adversarial verify** (generator + independent critic, different context windows)
  - **Judge panel + tournament** (rubric-holding reviewer; pairwise finals for taste questions)
  - **Loop-until-dry** (iterate generator↔critic until critic passes it or improvement stalls)
- Subagents = isolated contexts reporting to one orchestrator (right for the pitch swarm); agent teams = peer sessions (overkill here). **Confidence: High.**

---

## 3. Instagram carousel algorithm signals, 2026

Triangulated across [Buffer](https://buffer.com/resources/instagram-algorithms/) (4M+ post dataset), [Later](https://later.com/blog/how-instagram-algorithm-works/), [Hootsuite](https://blog.hootsuite.com/instagram-algorithm/), [Marketing Agent carousel deep-dive](https://marketingagent.blog/2026/01/03/mastering-instagram-carousel-strategy-in-2026-the-algorithm-demands-swipes-not-just-scrolls/), [Clixie](https://www.clixie.ai/blog/instagram-algorithm), [CreatorFlow](https://creatorflow.so/blog/instagram-algorithm-2026/):

| Signal | Detail | Confidence |
|---|---|---|
| **Shares (esp. DM sends)** | #1 discovery signal in 2026; Mosseri-confirmed direction. "Content people send to friends" gets broader distribution. | **High** (Mosseri statements + all major sources) |
| **Saves** | Highest-intent value signal. 50 saves + 100 likes beats 500 likes + 5 saves. Carousels are the top save-generating format (0.55% avg ER, highest of any format). | **High** |
| **Swipe-through** | Each swipe counts as an engagement event; swiping lifts session duration (~27% vs single image per one practitioner source). | **Medium-High** (mechanism confirmed broadly; the 27% figure is single-source) |
| **Second-serve mechanic** | Unswiped slides are treated as "new content" — IG re-serves the carousel later, often leading with slide 2. Design implication: **slide 2 must work as a standalone hook.** | **High** (Buffer + Marketing Agent + others independently) |
| **First 30-60 min velocity** | Early likes/saves/shares gate wider distribution. | **Medium** (widely repeated by practitioners; Instagram doesn't publish the window) |
| **Weighted comments** | Longer/substantive comments weigh more than emoji drops. | **Low-Medium** (practitioner claim, not officially confirmed) |
| **Mosseri's five monitored interactions** | Likelihood you: spend a few seconds on it, comment, like, share, tap the profile photo. | **High** (direct Mosseri statement via Buffer) |
| **Slide count** | Up to 20 slides allowed; practitioners cite 6-13 as sweet spot (more re-serve opportunities without completion collapse). | **Low-Medium** (heuristic, not data-published) |

**A/B-tester scoring model implication:** weight the rubric roughly — shareability (would someone DM this?) > save-worthiness (reference value / "I'll need this later") > swipe pull (open loop slide-to-slide, slide 2 as second hook) > comment provocation > like-bait. Hook still gates everything (nothing else fires if slide 1 doesn't stop the scroll), consistent with Blotato's 50% hook weighting.

---

## 4. Anti-patterns and documented mitigations

1. **Homogenization / diversity collapse** — empirically proven: GenAI raises individual output quality but makes everyone's output *more similar to each other* ([Doshi & Hauser, Science Advances 2024](https://www.science.org/doi/10.1126/sciadv.adn5290)). A pitch swarm without forced divergence produces five flavors of the same idea. **Documented fix:** structured prompting with **diverse forced personas at ideation** restores diversity ([arXiv 2504.13868](https://arxiv.org/abs/2504.13868)). Give each pitcher a locked, distinct lens. **Confidence: High.**
2. **Slop-at-scale / AI tells** — pipelines optimize for grader approval, not humans. create-viral-content's 100+ AI-tell replacement list is the working countermeasure; the "teacher/copywriter" stage must run a de-AI pass against a voice profile (Alyssa already has Hermes/writing-style assets — that's the moat generic pipelines lack).
3. **Cascading error / context compression across handoffs** — one agent's bad output becomes every downstream agent's trusted input; nuance dies in handoff summaries ([Augment Code](https://www.augmentcode.com/guides/why-multi-agent-llm-systems-fail-and-how-to-fix-them), [Galileo](https://galileo.ai/blog/agent-failure-modes-guide)). **Fix:** pass the full artifact between stages, not summaries; schema-validate at each boundary; confidence scores at checkpoints pause the pipeline below threshold.
4. **Alignment/spec drift** — agents forget *why* over long runs; "Problem Drift" affects up to 89% of long generative interactions ([arXiv eval-in-the-wild](https://arxiv.org/pdf/2605.01604)). **Fix:** a living spec (brand brief + voice profile + algo rubric) every agent re-reads per task — exactly Blotato's brand-brief-first chain.
5. **Sycophantic critics / groupthink** — a critic that sees the generator's reasoning agrees with it. **Fixes from agent-review-panel:** blind scoring before debate, sycophancy detection, decoy-input calibration ("can the mean reviewer actually pan a known-bad post?").
6. **Over-optimization to the grader (Goodhart)** — everything scores 9/10 against the rubric and reads identical. **Fixes:** tournament comparison against *past winners* (not just rubric), periodic rubric refresh from real post analytics, Welsh-style re-run of proven content as ground truth.
7. **Fake prediction confidence** — treating a pre-publish "virality score" as ground truth. Vendors themselves concede pattern-matching on stale data ([Picmim](https://blog.picmim.com/blog/ai-predict-social-media-post-success)). **Fix:** score = checklist against known signals + own-account history; validate post-publish and feed results back.

---

## Methodology

Nine web searches + five targeted page/repo fetches, 2026-07-05. Prioritized primary sources (GitHub repos, GaryVee's own model PDF, Justin Welsh's newsletters, Science Advances paper, Claude Code official docs) over aggregator blogs. IG algo claims triangulated across 4+ independent practitioner sources; single-source figures flagged inline.

## Limitations

- Viral Hook Creator skill page rate-limited; its 18 patterns not extracted (single-source, unverified).
- create-viral-content's full formula files (`title-formulas.md`, `refinement-protocol.md`) not read in-repo — worth a clone-and-read before building the hook agent.
- IG algorithm claims are practitioner-observed, not Instagram-published, except Mosseri's direct statements. Weights (e.g., "shares are #1") are directional, not quantified.
- FeedHive's 1.5M-post training claim is vendor-sourced only.
- No mature open-source repo found that implements the *whole* pitch→critic→score→polish chain for social content; the assembly is the novel part of Alyssa's build.

## Recommendations

1. Clone create-viral-content and tiktok-viral-hooks; extract formulas into a local hook library seeded with Alyssa's own top-performing hooks.
2. Model "mean Alyssa" on agent-review-panel: blind score → debate → judge, with a decoy-post calibration gate.
3. Build the A/B tester as a weighted rubric scorer (share > save > swipe > comment; hook gates all) — not a virality predictor.
4. Force divergent personas on every pitcher agent (the one empirically validated homogenization fix).
5. Pass full artifacts between stages; make the brand brief + voice profile + rubric a living spec every agent re-reads.

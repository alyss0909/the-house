# Social Skills Repo Intake Plan

Date: 2026-07-05  
Owner: Larry  
Research: Pax  
Adoption gate: Vex license/security pass -> Mack clone pass -> Silas provenance/index pass -> Hermes skill extraction
Status: executed for Tier 1 on 2026-07-05. See `Deliverables/2026-07-05-social-skills-repo-intake/manifest.md` and `Deliverables/2026-07-05-social-skills-repo-intake/CONTENT-OS-HANDOFF.md`.

## Executive read

Alyssa was right: the team already had a Blotato and GitHub-repo thread, and the fix is not more blank-page prompt writing.

The best path is to clone selected upstream repos as exact external references, preserve their licenses and README files, then extract only the useful patterns into our own system with provenance. "Copy exactly" means exact upstream clone for reference, not laundering someone else's writing into Hermes as if it were ours.

## Prior mentions found locally

### Blotato

Local references:

- `PKM/Journal/2026/06/2026-06-17-blotato-claude-skills.md`
- `PKM/Journal/2026/06/2026-06-29-blotato-evaluation.md`
- `Hermes/learning/anti-ai-web-research.md`
- `Deliverables/2026-07-05-content-os-brain/web-research-steal-list.md`
- `Team Knowledge/session-logs/2026/07/2026-07-05-23-30_larry_hermes-rebuild-and-content-os-genesis.md`

Blotato skills Alyssa had already surfaced:

| Skill | What it does | Adopt? |
|---|---|---|
| `content-coach` | Orchestrates social content workflow | Mine/adapt into Larry/Test Kitchen, not direct install |
| `brand-brief` | Captures voice/brand context before writing | Make our own using `Hermes/MAP.md`, `Hermes/STYLE.md`, `Hermes/TASTE.md`, source load rules |
| `post-writer` | Writes platform-native posts | Skip direct use; Hermes writes final copy |
| `post-grader` | Scores posts, with hook weighted heavily | Adopt the scoring pattern for the Maitre d' station |
| `post-scheduler` | Schedules via Blotato MCP, fallback file output | Skip for now; Alyssa's actual path is Kit/ManyChat/Notion, not Blotato scheduling |
| `repurpose` | Turns one long asset into many platform-native pieces | Adopt the model: anchor asset -> platform-native derivative, not truncation |
| `viral-hooks` | Top 100 hooks library | Clone/mine if available; use as hook reference, never as Alyssa voice source |

Prior verdict still stands: skip Blotato MCP for now; pull the hook/scoring/brand-brief patterns into our own Content OS.

### Git repos already mentioned by Alyssa/team recently

| Repo | Why it matters | Status |
|---|---|---|
| `aaaronmiller/create-viral-content` | Claude skill for hooks, platform templates, AI-tell detection, six-pass refinement | Priority clone/mine |
| `shixinzhang/tiktok-viral-hooks` | Real viral video hook breakdowns by opener, retention move, and reusable formula | Clone/mine, despite low stars |
| `wan-huiyan/agent-review-panel` | Adversarial review panel blueprint for Mean Alyssa: blind scoring, debate, judge, calibration | Priority clone/mine |
| `contains-studio/agents` | High-star agent-pack structure with marketing/social roles and success metrics | Clone/mine structure only |
| `hardikpandya/stop-slop` | High-star anti-AI prose skill; strong source for structural tells | Priority clone/mine |
| `Byk3y/no-slop` | Prose linter based on Wikipedia AI-writing signs | Mine/adapt; low stars but concept useful |
| `jalaalrd/anti-ai-slop-writing` | Agent-skill anti-slop rules across hosts | Mine/adapt; license unclear |
| `theclaymethod/unslop` | Voice-preset de-AI skill | Mine/adapt after license check |
| `conorbronsdon/avoid-ai-writing` | Deterministic AI-writing detector categories | Research follow-up |
| `shannhk/avoid-slop` | Directory of anti-slop tools | Research follow-up |
| `realrossmanngroup/no_ai_slop_writing_rules` | Voice-anchored CLAUDE.md writing rules | Research follow-up |
| `DietrichGebert/ponytail` | Lazy senior-dev philosophy, already integrated as GL-008 | Already handled; not social |
| `linuz90/claude-telegram-bot` | Telegram -> Claude workflow trigger layer | Existing Mack task; not social |
| `Anbeeld/WRITING.md` | Humanizer/writing style reference from May journal | Research follow-up |
| `ruvnet/ruflo` | Agent orchestration platform from May journal | Not social; maybe relevant later |

## New high-value repos found in this pass

| Repo | Stars checked 2026-07-05 | License | Adopt? | Why |
|---|---:|---|---|---|
| `coreyhaines31/marketingskills` | 36.4k | MIT | Clone exact, mine heavily | Best high-star marketing skill pack. Has `social`, `copywriting`, `content-strategy`, `marketing-psychology`, `ab-testing`, email, CRO, launch, offer, and related skills. Strongest "stop inventing from scratch" candidate. |
| `contains-studio/agents` | 12.4k | no license listed | Clone exact for reference only; license-check before reuse | Best high-star agent contract library. Mine structure, success metrics, department organization. Do not paste prompts into our team without permission/license clarity. |
| `hardikpandya/stop-slop` | 13.4k | MIT | Clone exact, mine into Hermes anti-slop gate | Strongest star-backed anti-AI prose source. Already partially mined. |
| `zubair-trabzada/ai-marketing-claude` | 2.0k | MIT | Clone exact, inspect | Marketing suite with `/market social`, content calendar, copy, emails, ads, audit. More broad than Alyssa needs, but useful for skill architecture. |
| `GoogleCloudPlatform/genai-for-marketing` | 503 | Apache-2.0 | Mine selectively, do not center | Enterprise/example app for generative marketing workflows; likely overbuilt for Hermes but useful for campaign personalization patterns. |
| `Anil-matcha/Free-AI-Social-Media-Scheduler` | 436 | MIT | Maybe clone later, not now | Scheduling and AI generation infrastructure. Lower relevance unless Mack builds publishing automation. |
| `alonw0/web-asset-generator` | 441 | MIT | Maybe clone later | Useful for social graphics/asset generation, not hook/caption failure. |
| `blacktwist/social-media-skills` | 305 | MIT | Priority clone/mine | Very directly relevant: content strategy, calendar, platform strategy, post writer, thread writer, carousel writer, caption writer, repurposer, hook writer, performance analyzer. |
| `stevenflanagan1/social-ai-team` | 156 | no license listed | Clone exact for reference only; license-check before reuse | Directly relevant social team: brand onboarding, content calendar, caption writer, creative designer, LinkedIn/Threads/X writers, publisher, performance review. Includes optional Blotato publisher idea. |
| `aaaronmiller/create-viral-content` | 46 | no license listed | Priority clone/reference; adapt only after license check | Low stars but exact problem fit: hook architectures, title formulas, six-pass refinement, AI tells. |
| `wan-huiyan/agent-review-panel` | 25 | MIT | Priority clone/mine | Direct pattern for Mean Alyssa adversarial gate. |
| `hyperfx-ai/marketing-skills` | 48 | MIT | Maybe clone later | Broad marketing skills with MCP angle; less social-copy specific. |
| `shixinzhang/tiktok-viral-hooks` | 6 | license unclear/NOASSERTION | Clone for reference only; do not reuse text verbatim | Low stars but exact hook-teardown value. Use patterns, not copied lines. |
| `EricTechPro/instagram-carousel-skills` | 4 | MIT | Clone/mine after priorities | Direct carousel skill. Small but relevant. |

## Adoption recommendation

### Tier 1: clone first

1. `coreyhaines31/marketingskills`
2. `blacktwist/social-media-skills`
3. `hardikpandya/stop-slop`
4. `wan-huiyan/agent-review-panel`
5. `aaaronmiller/create-viral-content`
6. `shixinzhang/tiktok-viral-hooks`

### Tier 2: clone next if Tier 1 is useful

1. `zubair-trabzada/ai-marketing-claude`
2. `stevenflanagan1/social-ai-team`
3. `contains-studio/agents`
4. `EricTechPro/instagram-carousel-skills`

### Tier 3: park for Mack/automation later

1. `Anil-matcha/Free-AI-Social-Media-Scheduler`
2. `GoogleCloudPlatform/genai-for-marketing`
3. `alonw0/web-asset-generator`
4. `hyperfx-ai/marketing-skills`

## What becomes ours

Build our own skills from proven external patterns:

| Our skill/station | External material to mine | Output in our system |
|---|---|---|
| Test Kitchen | Blotato `content-coach`, `blacktwist/content-strategy-sms`, `marketingskills/content-strategy`, forced-persona research | Persona-pitch skill for monthly/weekly content concepts |
| Hook Bench | Blotato `viral-hooks`, `create-viral-content`, `tiktok-viral-hooks`, `blacktwist/hook-writer-sms` | Hook pattern library for carousel covers, slide-2 hooks, captions |
| Caption/Carousel Writer Support | `blacktwist/caption-writer-sms`, `carousel-writer-sms`, `EricTechPro/instagram-carousel-skills` | Hermes support files only; Hermes remains final writer |
| Maitre d' Scorer | Blotato `post-grader`, `marketingskills/ab-testing`, IG algorithm notes | Honest rubric scorer, not virality predictor |
| Mean Alyssa | `agent-review-panel`, `create-viral-content` six-pass refinement | Blind adversarial review + decoy calibration |
| Anti-AI Gate | `stop-slop`, `no-slop`, `anti-ai-slop-writing`, `unslop`, Alyssa's `ANTI-AI.md` | Keep source-specific rules senior; external tells as supporting lint |
| The Pass | `social-ai-team` packaging/publisher flow, Blotato repurpose model | Notion/ManyChat/designer handoff, no direct Blotato dependency yet |

## Exact copy protocol

Do not paste repo content into Hermes or Team Knowledge directly.

Use this intake shape:

```text
Deliverables/2026-07-05-social-skills-repo-intake/
  README.md
  manifest.md
  repos/
    coreyhaines31__marketingskills/
    blacktwist__social-media-skills/
    hardikpandya__stop-slop/
    wan-huiyan__agent-review-panel/
    aaaronmiller__create-viral-content/
    shixinzhang__tiktok-viral-hooks/
  extracted/
    hook-patterns-map.md
    social-skill-coverage-map.md
    anti-slop-crosswalk.md
    mean-alyssa-review-panel-map.md
```

Each cloned repo keeps its upstream `.git`, README, LICENSE, and commit history. Extraction files cite upstream paths and commit hashes. Nothing is promoted to Hermes until Silas verifies provenance and Larry decides the artifact fate.

## Commands ready for Mack

Run only after approval and Vex license/security pass:

```powershell
git clone https://github.com/coreyhaines31/marketingskills.git Deliverables/2026-07-05-social-skills-repo-intake/repos/coreyhaines31__marketingskills
git clone https://github.com/blacktwist/social-media-skills.git Deliverables/2026-07-05-social-skills-repo-intake/repos/blacktwist__social-media-skills
git clone https://github.com/hardikpandya/stop-slop.git Deliverables/2026-07-05-social-skills-repo-intake/repos/hardikpandya__stop-slop
git clone https://github.com/wan-huiyan/agent-review-panel.git Deliverables/2026-07-05-social-skills-repo-intake/repos/wan-huiyan__agent-review-panel
git clone https://github.com/aaaronmiller/create-viral-content.git Deliverables/2026-07-05-social-skills-repo-intake/repos/aaaronmiller__create-viral-content
git clone https://github.com/shixinzhang/tiktok-viral-hooks.git Deliverables/2026-07-05-social-skills-repo-intake/repos/shixinzhang__tiktok-viral-hooks
```

## Open cautions

- `aaaronmiller/create-viral-content`, `contains-studio/agents`, and `stevenflanagan1/social-ai-team` showed no license in GitHub metadata. Exact private clone/reference is okay for review; reuse/adaptation needs a stricter Vex/license check.
- `shixinzhang/tiktok-viral-hooks` has a CC BY-NC-SA-style badge in the README area but GitHub metadata reports `NOASSERTION`; preserve attribution and do not reuse verbatim hooks as publishable Alyssa copy.
- High stars do not equal high fit. `marketingskills`, `stop-slop`, and `contains-studio/agents` are star-backed. `create-viral-content` and `tiktok-viral-hooks` are lower-star but closer to the exact hook failure.
- Hermes must stay the final writer. External skills can feed maps, rubrics, and tests. They do not get to write as Alyssa.

## Next action

Tier 1 clone pass is complete. The six repos are exact Git checkouts under `Deliverables/2026-07-05-social-skills-repo-intake/repos/`, with hashes captured in `manifest.md`.

Blotato public official docs are captured under `Deliverables/2026-07-05-social-skills-repo-intake/blotato-official/`; no public upstream Blotato Claude Skills GitHub repo, zip, raw download, or install command was found. Actual Blotato skill files still require authenticated delivery or explicit Blotato-provided source.

Next: Content OS team reads `CONTENT-OS-HANDOFF.md`, completes the four extracted maps, then Larry decides what gets promoted into Hermes/Content OS vs parked as referenced external research.

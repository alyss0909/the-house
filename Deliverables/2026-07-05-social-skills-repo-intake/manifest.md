# Social Skills Repo Intake Manifest

Date: 2026-07-05
Owner: Larry
Clone executor: Mack
Research support: Pax
Provenance support: Silas
Status: Tier 1 cloned; Blotato all 7 SKILL.md files extracted as vendor/reference copies; no live Claude install

## Operating Rule

These repos are exact external references. Do not edit the upstream clone folders directly. Extract only what we need into `extracted/`, with source path + commit hash. External work can improve Content OS maps, rubrics, lint rules, station support, and pressure tests. It does not become Alyssa source.

Mean Alyssa runs internally before Alyssa sees status. The team should catch source-boundary mistakes, fake completion, raw installs, and provenance gaps before reporting back.

## Tier 1 Repos

| repo_id | upstream_url | local_path | commit_hash | license_detected | allowed_use | prohibited_use | adoption_tier | content_os_station_target | promotion_status |
|---|---|---|---|---|---|---|---|---|---|
| `coreyhaines31__marketingskills` | `https://github.com/coreyhaines31/marketingskills` | `Deliverables/2026-07-05-social-skills-repo-intake/repos/coreyhaines31__marketingskills` | `30dbd7f793b86f0ec2f007757b333afac93c24db` | MIT | Mine/adapt with attribution and license retained where copied | Do not paste broad generic marketing rules into Hermes voice files | Tier 1 | Test Kitchen, Maitre d', offer/copy strategy | reference-cloned |
| `blacktwist__social-media-skills` | `https://github.com/blacktwist/social-media-skills` | `Deliverables/2026-07-05-social-skills-repo-intake/repos/blacktwist__social-media-skills` | `4f85b07069983b3b0b9bbe6519fed7017edcce81` | MIT | Mine/adapt hook, caption, carousel, calendar, repurpose, platform strategy skills | Do not let it write final Alyssa copy | Tier 1 | Hook Bench, Caption/Carousel support, The Pass | reference-cloned |
| `hardikpandya__stop-slop` | `https://github.com/hardikpandya/stop-slop` | `Deliverables/2026-07-05-social-skills-repo-intake/repos/hardikpandya__stop-slop` | `8da1f030185bdfe8471220585162991eaeb970e9` | MIT | Mine/adapt anti-AI structure and lint categories | Do not replace Alyssa-specific ANTI-AI rules | Tier 1 | Anti-AI Gate | reference-cloned |
| `wan-huiyan__agent-review-panel` | `https://github.com/wan-huiyan/agent-review-panel` | `Deliverables/2026-07-05-social-skills-repo-intake/repos/wan-huiyan__agent-review-panel` | `8174d40212cc743fdeaf28928ecf3bd4b63d517f` | MIT | Mine/adapt review-panel mechanics, calibration, blind scoring | Do not import panel prose as team canon without provenance | Tier 1 | Mean Alyssa | reference-cloned |
| `aaaronmiller__create-viral-content` | `https://github.com/aaaronmiller/create-viral-content` | `Deliverables/2026-07-05-social-skills-repo-intake/repos/aaaronmiller__create-viral-content` | `51483020215d9259c7565511c289d87ac43d3bcb` | no license file detected | Reference-only unless license is clarified | No verbatim reuse in Hermes, Team Knowledge, or publishable copy | Tier 1 | Hook Bench, Mean Alyssa, anti-AI review | reference-cloned |
| `shixinzhang__tiktok-viral-hooks` | `https://github.com/shixinzhang/tiktok-viral-hooks` | `Deliverables/2026-07-05-social-skills-repo-intake/repos/shixinzhang__tiktok-viral-hooks` | `0d9c79a8b5c66a83488d852abbbecd7789306ee1` | CC BY-NC-SA 4.0 | Reference-only pattern study; attribution required if used | No commercial verbatim reuse; no direct hook copy into Alyssa output | Tier 1 | Hook Bench | reference-cloned |

## Blotato Status

No public official Blotato Claude Skills GitHub repo, zip, raw download, or install command was found. The free skills are distributed inside Blotato's docs as copy-paste `SKILL.md` blocks. Those blocks have now been extracted exactly from the official markdown pages.

Official docs are saved under `Deliverables/2026-07-05-social-skills-repo-intake/blotato-official/`.

Exact extracted vendor/reference copies are saved under `Deliverables/2026-07-05-social-skills-repo-intake/blotato-skills/`.

Do not install these directly into `.claude/skills/`. The team does not activate outside skills raw. They are first assessed, crosswalked, and adapted into Content OS/Hermes-owned skills with provenance.

Captured pages and files:

- `source-note.md` - Alyssa's original Keep-note provenance and `automation` connection
- `claude-skills.md`
- `brand-brief.md`
- `content-coach.md`
- `post-writer.md`
- `post-grader.md`
- `post-scheduler.md`
- `viral-hooks.md`
- `repurpose.md`

Extracted vendor/reference skills:

- `brand-brief/SKILL.md`
- `content-coach/SKILL.md`
- `post-writer/SKILL.md`
- `post-grader/SKILL.md`
- `post-scheduler/SKILL.md`
- `viral-hooks/SKILL.md`
- `repurpose/SKILL.md`

Use the extracted files as Blotato vendor references. They are free to download/use per the docs, but still preserve provenance and do not mix them into Alyssa source without attribution and an explicit Content OS promotion decision.

## Extraction Files

- `extracted/social-skill-coverage-map.md`
- `extracted/hook-patterns-map.md`
- `extracted/anti-slop-crosswalk.md`
- `extracted/mean-alyssa-review-panel-map.md`

Each extraction must cite `repo_id`, local source path, and commit hash.

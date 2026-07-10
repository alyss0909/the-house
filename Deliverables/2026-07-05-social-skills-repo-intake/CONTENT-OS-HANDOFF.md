# Content OS Handoff: Social Skill Repo Intake

Date: 2026-07-05
Owner: Larry
Status: ready for Content OS team assessment

## What Is Ready

Tier 1 social/media/copy/review repos have been cloned exactly into:

`Deliverables/2026-07-05-social-skills-repo-intake/repos/`

They are full Git checkouts with upstream history preserved. Use them as pressure-tested reference material before building or editing Content OS stations.

This intake contains both:

- all seven Blotato free Claude Skills extracted as exact vendor/reference `SKILL.md` files in `blotato-skills/`
- six Tier 1 external repos cloned exactly in `repos/`

Nothing from this intake is live-installed as a raw Claude skill. The active `.claude/skills/` folder should remain empty unless the team creates our own adapted Content OS skill after extraction and approval.

## Start Here

1. Read [[Deliverables/2026-07-05-social-skills-repo-intake/manifest]] first.
2. Use the cloned repos in `repos/` as the source material.
3. Put all derived assessment into `extracted/`.
4. Do not edit the cloned repo folders directly.
5. Do not paste external prose into `Hermes/` as Alyssa voice.
6. Run the Mean Alyssa preflight before anything is shown to Alyssa.

## Mean Alyssa Preflight Rule

Mean Alyssa is not a task Alyssa should have to perform after sloppy work is shown to her. Before any Content OS update, handoff, or "done" message reaches Alyssa, Larry runs an internal Mean Alyssa pass:

- What would Alyssa immediately call bullshit on?
- Did we confuse "reference copy" with "installed/activated"?
- Did we turn a plan into actual files, or only describe the plan?
- Did we preserve provenance and source boundaries?
- Did we make Alyssa correct clerical/system errors the team should have caught?

If any answer fails, fix it before replying. Only surface the final corrected version and mention meaningful tradeoffs, not avoidable mess.

## Best Immediate Source Paths

Hook and viral-content work:

- `repos/blacktwist__social-media-skills/skills/hook-writer-sms/SKILL.md`
- `repos/aaaronmiller__create-viral-content/SKILL.md`
- [[Deliverables/2026-07-05-social-skills-repo-intake/repos/aaaronmiller__create-viral-content/references/title-formulas]]
- [[Deliverables/2026-07-05-social-skills-repo-intake/repos/aaaronmiller__create-viral-content/references/refinement-protocol]]
- `repos/shixinzhang__tiktok-viral-hooks/by-pattern/en/`

Caption/carousel/social workflow:

- `repos/blacktwist__social-media-skills/skills/caption-writer-sms/SKILL.md`
- `repos/blacktwist__social-media-skills/skills/carousel-writer-sms/SKILL.md`
- `repos/blacktwist__social-media-skills/skills/content-repurposer-sms/SKILL.md`
- `repos/blacktwist__social-media-skills/skills/content-calendar-sms/SKILL.md`
- `repos/blacktwist__social-media-skills/skills/performance-analyzer-sms/SKILL.md`

Marketing/copy strategy:

- `repos/coreyhaines31__marketingskills/skills/copywriting/SKILL.md`
- `repos/coreyhaines31__marketingskills/skills/copy-editing/SKILL.md`
- `repos/coreyhaines31__marketingskills/skills/content-strategy/SKILL.md`
- `repos/coreyhaines31__marketingskills/skills/ab-testing/SKILL.md`

Anti-AI and quality gate:

- `repos/hardikpandya__stop-slop/SKILL.md`
- [[Deliverables/2026-07-05-social-skills-repo-intake/repos/hardikpandya__stop-slop/references/phrases]]
- [[Deliverables/2026-07-05-social-skills-repo-intake/repos/hardikpandya__stop-slop/references/structures]]
- [[Deliverables/2026-07-05-social-skills-repo-intake/repos/aaaronmiller__create-viral-content/references/ai-tells]]

Mean Alyssa / adversarial review:

- `repos/wan-huiyan__agent-review-panel/README.md`
- [[Deliverables/2026-07-05-social-skills-repo-intake/repos/wan-huiyan__agent-review-panel/docs/research-foundations]]
- `repos/wan-huiyan__agent-review-panel/docs/review-examples.md`

Blotato:

- [[Deliverables/2026-07-05-social-skills-repo-intake/blotato-official/source-note]] captures Alyssa's original Keep-note provenance and the `automation` connection.
- `blotato-official/` has official public docs and skill descriptions.
- `blotato-skills/` has all seven exact extracted `SKILL.md` files from the official docs.
- No official public GitHub repo or zip source pack was found; Blotato distributes these as copy-paste `SKILL.md` blocks in the docs.
- Treat Blotato as a vendor/free-skill reference layer. Do not activate the raw skills directly in `.claude/skills/`. Use them for Content OS pressure testing and adaptation, but do not blend their text into Alyssa source without provenance.

## Content OS Integration Order

1. Build [[Deliverables/2026-07-05-social-skills-repo-intake/extracted/social-skill-coverage-map]]: map each repo skill to a Content OS station.
2. Build [[Deliverables/2026-07-05-social-skills-repo-intake/extracted/hook-patterns-map]]: compare Blotato `viral-hooks`, Blacktwist hooks, create-viral-content formulas, and TikTok hook patterns.
3. Build [[Deliverables/2026-07-05-social-skills-repo-intake/extracted/anti-slop-crosswalk]]: merge external AI-tell categories with Alyssa's existing [[Hermes/ANTI-AI]] as a support lint layer only.
4. Build [[Deliverables/2026-07-05-social-skills-repo-intake/extracted/mean-alyssa-review-panel-map]]: adapt review-panel mechanics into blind scoring, decoy calibration, and tournament review.
5. Only after those four maps exist, update Content OS station files or create our own project skills.

## Source Boundary

External repos can make Content OS smarter. They cannot become Alyssa source. Alyssa source remains her own work and the Hermes source maps. These repos should improve how we pitch, score, pressure-test, lint, and package content before Hermes writes the final copy.

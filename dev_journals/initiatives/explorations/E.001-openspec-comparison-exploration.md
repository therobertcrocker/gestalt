# OpenSpec Comparison — Exploration

> **Initiative:** `E.001`, the first exploration in gestalt. gestalt has no `E.` type yet, so
> the doc takes the shape of gm-toolkit's `E.002`, `E.004` and `R.029`.
> **Feeds:** no paused doc. The answer may feed `F.004` (lighter change flow) and the
> direction of the plugin.
> **Status:** session 1 of 2 (audit) written; waits on Robert's review. Branch
> `exploration/openspec`.
> **Source snapshot:** OpenSpec at commit `82a0be5` (2026-11-16), version 2.0.0. OpenSpec paths
> below are relative to the root of that repo. gestalt paths are relative to this repo.

## In Plain Words

First draft, after the audit. Session 2 rewrites it when the answer is settled.

- **What:** OpenSpec is an open-source tool that does a job near gestalt's. It makes an AI
  assistant write down what a change will do before it writes code. This exploration asks what
  to borrow from it, what gestalt has that it lacks, and whether to move over to it.
- **What the audit found:** the two overlap less than they first seem to. OpenSpec's centre
  is a living spec: a set of files that says what the system does today, kept current by
  merging each finished change into it. gestalt's centre is how the work runs: session modes,
  the tracker, the closes, git, review and how Claude talks. OpenSpec has no git, code review,
  retro, backlog or multi-session work. gestalt has no record of what the system does today,
  only architecture pages for why it is shaped as it is.
- **Short answer:** open until session 2.

## Questions

Robert's prompt, in his words:

1. What is it doing that we should also do?
2. What do we do that it lacks?
3. Would it make sense to just move over to that project?

**Deciding criteria for question 3,** from the session setup. Robert picked all five; none is
ranked above the others yet.

| Criterion | The test |
|---|---|
| Fit | Does it hold how Robert works without bending it out of shape? |
| Upkeep | Does it cut the time spent keeping gestalt's skills and rules up to date? |
| Reach | Does it reach past Claude Code: other AI tools, other people, other projects? |
| Own the roadmap | Is Robert free of someone else's project choices, release pace and breaking changes? |
| Effectiveness | Does it produce the effect Robert wants when he works with LLMs? |

## Current State

From reading both repos. Nothing from OpenSpec was installed or run. An agent read OpenSpec end
to end and wrote a report; the claims below that carry weight were spot-checked against its
source (see Unverified claims for the rest).

### OpenSpec in brief

**What it is.** A TypeScript command-line tool plus a set of agent skills. MIT licence. npm
install needs Node 22.12 or later; a standalone binary needs no Node (`package.json`,
`README.md`). 60 releases from 0.1.0 to 2.0.0. About 57% of changelog credits go to one
maintainer. Telemetry is on by default (`README.md`, Telemetry).

**The loop.** explore → propose → human review → apply → archive (`docs-lab/start/quickstart.md`).

| Step | What it writes |
|---|---|
| Explore | Nothing by default; a thinking mode that writes no code |
| Propose | `openspec/changes/<name>/` with `proposal.md`, delta specs, `design.md` when needed, `tasks.md`; then stops |
| Review | Robert edits the files or tells the agent |
| Apply | Code; ticks `- [ ]` to `- [x]` in `tasks.md`; a fresh chat is advised |
| Archive | Merges the deltas into `openspec/specs/`, moves the folder to `changes/archive/YYYY-MM-DD-<name>/` |

**The spec format.** One `spec.md` per capability (a behaviour area), under `openspec/specs/`.
Each holds `### Requirement:` blocks with SHALL or MUST, and each requirement holds
`#### Scenario:` blocks of WHEN and THEN bullets (`openspec/specs/cli-version/spec.md`). A
spec is a behaviour contract: "if the implementation can change without changing externally
visible behavior, it likely does not belong in the spec" (`schemas/spec-driven/schema.yaml`).

**Delta specs.** A change does not rewrite the main spec. It writes a delta with `ADDED`,
`MODIFIED` (the whole requirement block), `REMOVED` (with Reason and Migration) or `RENAMED`
sections. Archive merges them in that fixed order, whole requirement by whole requirement
(`src/core/specs-apply.ts`). A change that touches no behaviour must set `skip_specs: true`.

**Gates.** Few, and mostly soft.

- `openspec validate` checks delta structure: headers, empty requirements, clashes between
  sections, and a MODIFIED block that drops a scenario. Missing SHALL or WHEN/THEN fail only
  with `--strict`. It never checks `proposal.md` or `design.md`.
- An artifact counts as done when its file exists; the tool does not read it
  (`docs-lab/reference/schemas/schema-yaml.md:91`).
- Open tasks only warn at archive. The verify skill is optional and only reports.
- "Plan only, no code" in the propose skill is a prompt rule, not a check.

**Customising it.** Three levers (`docs-lab/customize/`):

- A profile picks which of the 12 skills get installed. It is per machine, not per project.
- `openspec/config.yaml` adds a `context` string and per-artifact `rules` to every
  instruction the agent gets.
- A schema defines the artifacts as a dependency graph of Markdown files with templates. One
  ships (`spec-driven`). A fork is a snapshot that never gets upstream fixes.

Edits to the installed skills are overwritten by `openspec update` with no backup
(`docs-lab/help/upgrade-to-2.md:8`). Lasting changes go in `config.yaml` or in a skill with
another name.

**Claude Code.** Version 2.0 writes one `SKILL.md` per workflow into `.agents/skills/openspec-*/`
and symlinks each from `.claude/skills/`. No slash-command files, no `CLAUDE.md` edits, no
hooks, no settings. About 30 other AI tools get the same skills from the same folder. Updates
reach a project only when someone runs `openspec update` in it; the maintainers' own repo ran
stale (`docs-lab/Notes.md`).

**What it does not have.**

| Area | State in OpenSpec |
|---|---|
| Git | Never branches, commits or merges in a project; the skills give no commit or branch guidance |
| Code review | None; the nearest is the optional verify skill, a report against the plan |
| Retros | None; one community schema adds a retrospective artifact |
| Version tags | None |
| Architecture docs | None; specs are behaviour only, and `design.md` decisions stay in the archive with no path out |
| Backlog or roadmap | None; `list` and `view` show active and archived changes |
| Initiatives | Tried and pulled: `--initiative` now fails with "no longer supported" (`src/commands/workflow/new-change.ts:60`) |
| Multi-session work | One change folder, one `tasks.md`; no phases, efforts or hand-offs |
| Collaboration rules | None; tone, pacing and questions are left to the user's own `CLAUDE.md` |

**Where it is heading.** Stores (beta): a planning repo shared by many code repos. A new
internal motto, "Specs are what is true. Work is what is in motion." An experimental
`openspec/work/` layout (goal → roadmap → slices → result) that the CLI does not read yet.
A docs rewrite in `docs-lab/`, much of it headings only. The maintainers note that "plan before
code" is a weak pitch now that every tool has a plan mode (`docs-lab/Notes.md`).

**Weak spots seen in the source.**

- Two open changes that edit the same requirement's text: the second archive wins with no
  warning. A fix is planned in `openspec-parallel-merge-plan.md` and not built.
- A delta cannot drop one scenario from a requirement.
- Two archive paths: the CLI merges in code with rollback; the default archive skill has the
  agent hand-edit the main specs, then `mv` the folder.
- Frequent breaking reshapes: commands to skills (1.0), `project.md` to `config.yaml`, per-tool
  copies to one shared folder (2.0).

### gestalt in brief

**What it is.** One Claude Code plugin: three rules files (155 lines) imported by each project's
`CLAUDE.md`, 12 skills and one SessionStart hook, about 2,200 lines in all
(`plugins/gestalt/`). Claude Code only.

**The loop.** Backlog → Up Next → Current → Discovery → Plan → Execution (one phase per
session) → effort close → initiative close → merge and tag. Arcs add a level above. Each work
type (feature, refactor, bugfix, docs, chore) weights the modes differently
(`skills/session-modes/SKILL.md`).

**What it writes.** The tracker `dev_journals/planned-work.md`; a discovery doc, a plan (with
phases, commits and literal tasks) and a retro per initiative; arc docs; architecture pages
with Key Decisions under `docs/architecture/`.

**Gates.** Mostly prompt rules, as in OpenSpec, but with more stops. The close skills stop for
Robert at fixed points (base, picks, squash, merge, tag) and run real git checks: clean tree,
gate passes, effort commits unbroken, tree identical after a squash
(`skills/effort-close/SKILL.md`, `skills/initiative-close/SKILL.md`).

**Updates.** Through the plugin marketplace: Claude Code pulls the new version in the
background, and the rules reach every project one session later. No command per project.
Projects do not edit the plugin; corrections go into memories and `/gestalt:graduate` folds
them back into the rules.

### Side by side

| Topic | OpenSpec | gestalt |
|---|---|---|
| Centre of gravity | What the system does (living specs) | How the work runs (sessions, git, collaboration) |
| Unit of work | A change folder | An initiative, split into efforts and phases |
| Before code | Proposal, delta specs, design (optional), tasks | Discovery doc, then a plan with literal code per task |
| Plan detail | Task checklist in prose | Each task carries the literal edit |
| Record of current behaviour | `openspec/specs/`, kept current at archive | None |
| Record of why | `design.md`, left in the archive | Discovery doc and Decision Record; durable ones graduate to architecture pages |
| History | `changes/archive/<date>-<name>/` | `_completed/<ID>-<name>/` plus git history |
| Backlog | None | Tracker with types, triggers and promotion rules |
| Git | None | Branches, scoped commits, squash per effort, `--no-ff` merge, tags |
| Review | Human reads the plan; optional verify report | `/code-review` at each effort and before merge, picked fixes |
| Retro | None | One per initiative and per arc |
| Collaboration and tone | None | Rules for pacing, questions, tone, push-back |
| Machine checks | `openspec validate` on spec structure; status and dashboard commands | None for docs; git checks inside the close skills |
| Tools reached | About 30 AI tools | Claude Code |
| Updates | `openspec update` by hand in each project | Marketplace, automatic |
| Custom edits survive updates | Only in `config.yaml` or renamed skills | Yes; Robert owns the source |
| Multi-repo | Stores (beta) | Multi-product layout inside one repo |

### Findings from the audit

**Candidates for question 1** (OpenSpec has it; gestalt does not). A list for the options,
not a recommendation.

1. A living record of what the system does today, kept current as each change lands.
2. Deltas: a change says what it adds, changes and removes in that record, so a reviewer sees
   the behaviour change, not only the code change.
3. Scenarios in WHEN and THEN form, which double as acceptance checks.
4. A machine check of artifact structure (`openspec validate`).
5. A status command and a dashboard that read state from the files and name the next step.
6. An explore mode with no artifact: think out loud, write nothing unless asked.
7. A per-project `context` and `rules` layer injected into every instruction.
8. Reach to other AI tools from one shared skills folder.

**Candidates for question 2** (gestalt has it; OpenSpec does not). Git and delivery, code
review, retros, the tracker and its promotion rules, efforts and arcs, phase-sized execution
with hand-offs, plans with literal code, a home for durable decisions (architecture pages),
the collaboration and tone rules, and the memory-to-rules loop (`/gestalt:graduate`).

**Facts that bear on question 3, by criterion.**

| Criterion | What the audit shows |
|---|---|
| Fit | OpenSpec covers about the Discovery-to-Plan slice of gestalt, with a different artifact; everything after apply would still be gestalt's |
| Upkeep | gestalt's upkeep is its own skills; a move would keep most of them and add OpenSpec's update step per project |
| Reach | OpenSpec wins clearly; gestalt reaches Claude Code only |
| Own the roadmap | OpenSpec reshapes often, mostly by one maintainer, and overwrites skill edits on update |
| Effectiveness | Neither repo holds measured evidence; gestalt has gm-toolkit's run history, and no gestalt initiative has a retro yet |

**A third shape showed up:** take OpenSpec's living spec and deltas as one more artifact inside
gestalt, without the tool. The options in session 2 should weigh it beside "borrow ideas" and
"move over".

### Unverified claims

For session 2 to check before it relies on them. All come from the agent's report.

- The changelog credit counts and the "60 releases" count.
- The list of about 30 supported tools.
- The two archive paths behave as described (read from `src/core/archive.ts` in part only).
- The per-machine profile can give two teammates different skill sets.
- Effectiveness: is there any evidence in OpenSpec's repo or docs of measured results? None
  was found, but the search was not aimed at it.

## Existing Patterns

Places in gestalt where an OpenSpec idea could land, if session 2 picks one.

- **Architecture pages** (`skills/session-modes/templates/arch-page.md`): the nearest thing to
  a living record. They hold shape and Key Decisions, not behaviour, and they update at
  initiative close.
- **Discovery template** (`skills/session-modes/templates/discovery.md`): has optional
  sections (User-Facing Impact, Replaces / Retires) where a delta would sit.
- **Initiative close step 8** (`skills/initiative-close/SKILL.md`): the moment a delta would
  merge, next to the Key Decisions graduation.
- **`F.004` lighter change flow** (`dev_journals/planned-work.md`): OpenSpec's single change
  folder is one model of a light flow.
- **The SessionStart hook** (`hooks/hooks.json`): the place a status line could go.

## Options

Session 2.

## Recommendation

Session 2.

## Follow-on Rows

Session 2.

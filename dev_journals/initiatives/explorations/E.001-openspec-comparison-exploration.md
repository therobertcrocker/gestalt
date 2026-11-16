# OpenSpec Comparison — Exploration

> **Initiative:** `E.001`, the first exploration in gestalt. gestalt has no `E.` type yet, so
> the doc takes the shape of gm-toolkit's `E.002`, `E.004` and `R.029`.
> **Feeds:** no paused doc. The answer may feed `F.004` (lighter change flow) and the
> direction of the plugin.
> **Status:** complete (reviewed by Robert). Two sessions; rows are filed. Branch
> `exploration/openspec`.
> **Source snapshot:** OpenSpec at commit `82a0be5` (2026-11-16), version 2.0.0. OpenSpec paths
> below are relative to the root of that repo. gestalt paths are relative to this repo.

## In Plain Words

- **What:** OpenSpec is an open-source tool that does a job near gestalt's. It makes an AI
  assistant write down what a change will do before it writes code. This exploration asks what
  to borrow from it, what gestalt has that it lacks, and whether to move over to it.
- **What the audit found:** the two overlap less than they first seem to. OpenSpec's centre
  is a living spec: a set of files that says what the system does today, kept current by
  merging each finished change into it. gestalt's centre is how the work runs: session modes,
  the tracker, the closes, git, review and how Claude talks. OpenSpec has no git, code review,
  retro, backlog or multi-session work. gestalt has no record of what the system does today,
  only architecture pages for why it is shaped as it is.
- **Short answer:** stay on gestalt, and take OpenSpec's living spec as a gestalt artifact.
  A move would not retire much of gestalt: everything after "write the plan" would stay as
  gestalt's own skills, now on top of a tool that reshapes often. But OpenSpec's core idea
  fits a real problem. gm-toolkit spreads "what the system does" over five places, and the
  parts no close step owns drift from the code. OpenSpec keeps one record per behaviour area
  and updates it as each change lands.
- **How it lands:** a new feature row, `F.005`, with its own Discovery. Each project's docs
  split by question: a behaviour spec per area (what), Key Decisions (why), slimmed
  architecture pages (code shape), and runbooks per area (how to extend it). The spec is
  carved out of what exists, not added on top, and initiative close merges each change into
  it. OpenSpec's one-folder change flow becomes an input to `F.004` (lighter change flow).
  Two more rows: an exploration type for gestalt (`F.006`) and a list of the projects on
  gestalt for process reviews (`F.007`).

## Questions

Robert's prompt, in his words:

1. What is it doing that we should also do?
2. What do we do that it lacks?
3. Would it make sense to just move over to that project?

**Deciding criteria for question 3,** from the session setup. Robert picked five, then dropped
Effectiveness in session 2. None of the four is ranked above the others yet.

| Criterion | The test |
|---|---|
| Fit | Does it hold how Robert works without bending it out of shape? |
| Upkeep | Does it cut the time spent keeping gestalt's skills and rules up to date? |
| Reach | Does it reach past Claude Code: other AI tools, other people, other projects? |
| Own the roadmap | Is Robert free of someone else's project choices, release pace and breaking changes? |

## Current State

From reading both repos. Nothing from OpenSpec was installed or run. An agent read OpenSpec end
to end and wrote a report; the claims below that carry weight were spot-checked against its
source (see Unverified claims for the rest).

### OpenSpec in brief

**What it is.** A TypeScript command-line tool plus a set of agent skills. MIT licence. npm
install needs Node 22.12 or later; a standalone binary needs no Node (`package.json`,
`README.md`). 58 releases from 0.1.0 to 2.0.0 in 15 months (first commit 2025-08-05; one
`## x.y.z` heading each in `CHANGELOG.md`). 167 of 298 changelog credits (56%) go to one
maintainer, and the two core maintainers wrote 679 of 988 non-merge commits (`MAINTAINERS.md`,
`git shortlog`). Telemetry is on by default (`README.md`, Telemetry).

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
  `openspec update` removes the skills a profile leaves out (`src/core/update.ts`), so the
  last person to run it in a project sets the skills for everyone
  (`docs-lab/customize/profiles.md`).
- `openspec/config.yaml` adds a `context` string and per-artifact `rules` to every
  instruction the agent gets.
- A schema defines the artifacts as a dependency graph of Markdown files with templates. One
  ships (`spec-driven`). A fork is a snapshot that never gets upstream fixes.

Edits to the installed skills are overwritten by `openspec update` with no backup
(`docs-lab/help/upgrade-to-2.md:8`). Lasting changes go in `config.yaml` or in a skill with
another name.

**Claude Code.** Version 2.0 writes one `SKILL.md` per workflow into `.agents/skills/openspec-*/`
and symlinks each from `.claude/skills/`. No slash-command files, no `CLAUDE.md` edits, no
hooks, no settings. 47 other AI tools, plus a vendor-neutral target, get the same skills from
the same folder (`AI_TOOLS` in `src/core/config.ts`, `src/core/shared-skill-target.ts`). Updates
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
- Two archive paths: the CLI merges in code with rollback (`src/core/archive.ts`); the default
  archive skill runs the sync skill, where the agent hand-edits the main specs, checks the
  result, then `mv`s the folder (`skills/openspec-archive-change/SKILL.md`). The agent path
  can add one scenario without copying the whole requirement; the CLI path cannot.
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
| Tools reached | 48 AI tools | Claude Code |
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

**A third shape showed up:** take OpenSpec's living spec and deltas as one more artifact inside
gestalt, without the tool. The options in session 2 should weigh it beside "borrow ideas" and
"move over".

### Claims checked in session 2

Session 1 left five claims from the agent's report unverified. Session 2 re-cloned OpenSpec at
`82a0be5` and checked each one. The doc above now carries the corrected text.

| Claim | Result |
|---|---|
| 60 releases; about 57% of credits to one maintainer | Wrong count: 58 releases. Credits: 56% (167 of 298) |
| About 30 supported tools | Wrong count: 48 (47 named tools plus a vendor-neutral target) |
| Two archive paths behave as described | Holds; the agent path also checks its own result before the move |
| A per-machine profile can give teammates different skill sets | Holds, and stronger: `update` removes the skills a profile leaves out |
| No measured evidence of effectiveness | Holds; `README.md`, `docs/` and `docs-lab/` hold no benchmark, study or measured result |

### gm-toolkit in practice

Session 1 read gestalt's rules, not a project that runs on them. Session 2 read gm-toolkit, the
largest project on gestalt and the one it came from, to test the claims the options lean on.
Other projects run on gestalt too; this pass did not read them. An agent sampled its
discovery docs, plans, all seven retros, the trackers and six architecture pages; the claims
below were spot-checked. Paths are relative to gm-toolkit's root; `FM` is
`dev_journals/faction-manager`, `A1` is `FM/initiatives/_completed/arcs/A.001-data-driven-rulebook`.

- **Architecture pages carry behaviour, not only why.** `docs/architecture/engine/goals.md`
  gives the step-by-step goal evaluation and a catalogue of when each goal moves and completes.
  `dice.md` has a section "Orders that must hold". `docs/rules/swn-faction-mechanics.md`
  records the engine's readings of the book too (see gm-toolkit's doc layers, below).
  `campaigns/sandbox/TESTING.md` is not a tool doc: it is the sandbox campaign's guide to
  running game scenarios (Robert, session 2).
- **Those behaviour records drift.** Initiative close graduates Key Decisions only
  (`skills/initiative-close/SKILL.md` in gestalt), so page bodies lag. `D.010`
  (`FM/planned-work.md:316`) is a catch-up row for the bodies after arc `A.001`.
- **Sessions do learn behaviour from code, and get it wrong.** At least six cases. The
  `A.001.8` discovery "read history, not source, in two places" (`A1/initiatives/A.001.8-*/
  *-retro.md:72`). The old TUI was deleted and "no one compared it against the rebuild; goal
  selection was lost" (`FM/planned-work.md:50`, `E.003`). Against that, re-grounding has a
  record of catching such errors before code, as the Plan sessions did for `A.001.8`.
- **Behaviour deltas are used, but not always.** 12 of 31 discovery docs have User-Facing
  Impact or Replaces / Retires. Where used, User-Facing Impact states the behaviour change
  plainly; Replaces / Retires lists code, not behaviour.
- **Tests in plans are mostly prose.** gestalt allows it: "Test descriptions in plain language
  are the only exception" (`skills/session-modes/feature-flow.md:36` in gestalt). Many plan
  test cases read as given, when, then in prose. No doc uses WHEN/THEN syntax.
- **Most work is bigger than one change folder.** About 3 of the 12 recent initiatives fit one
  folder and one task list (`A.001.1`, `A.001.4`, `R.029`). Six ran 3 to 6 efforts. No bugfix
  ran as its own initiative; bugs are folded into features.
- **Nearly all of gestalt is in use.** Arcs, effort closes, retros, tags, Decision Records,
  hand-offs and tracker triggers all show up. The two weak spots are page bodies (above) and
  moving completed docs, skipped in 9 of 12 releases.

### gm-toolkit's doc layers

Robert asked whether the architecture pages, `docs/contributing/` and OpenSpec's living spec
could be joined. Session 2 read, end to end: all 24 architecture pages, the four contributing
guides, both `docs/rules/` files and `campaigns/sandbox/TESTING.md`. It also read the frozen
decisions log's header and index, the archived process doc's decision-record section
(`docs/_archive/process/session-modes.md`) and the `D.002` project review. Each drift claim
below was checked against the code. Not read: Robert's other gestalt projects, gm-toolkit's
tests, the archived spatial decisions log and the archived templates.

**What each layer is.**

| Layer | What it holds | Kept current |
|---|---|---|
| `rules/swn-assets.md` | A verbatim transcription of the book; "the project's source of truth for SWN asset data" | Needs no upkeep |
| `rules/swn-faction-mechanics.md` | The book's rules, plus the engine's readings in game terms: Goal Rulings ("The engine reads them as follows"), and permission on drift orders, relocates and the Lobbyists' order | Edited as rulings change; `CLAUDE.md` routes "Rules behavior" here |
| Architecture pages, Key Decisions | Why, with provenance; many are behaviour rulings ("A reset wins its batch", "Transport Lockdown is checked before permission") | Yes; appended at every close |
| Architecture pages, Shape | Code mechanism: structs, method names, step lists, counts; behaviour sits here only because it has no other home | No |
| Architecture pages, catalogues | Behaviour tables: Goals, Actions, Mutations, the S-flag effects | Mixed |
| `contributing/` | Recipes to add one more of a kind, as file-by-file steps | No; `D.002` found 2 commits and 2 inbound links |
| `pf2e/` pages (the newest) | Mostly behaviour in plain game terms: the turn, degrees of success, damage order, dying, "Not modelled yet" | Too new to judge |

`campaigns/sandbox/TESTING.md` is the sandbox campaign's guide to running game scenarios, not
a tool doc, so it is outside this question.

**Drift, checked against the code.**

| Doc | Says | Code |
|---|---|---|
| `effect-mutation.md`, Shape | `TagEngine` with four Go tag handlers; "five categories" | `engine/tag` is gone, as the page's own Key Decisions say; six categories |
| `effect-mutation.md`, catalogue | `tag_added` embeds the full `Tag` | `TagAdded` carries `TagID` (`domain/mutation.go:293`) |
| `actions.md`, Purpose | Four actions "and eight others" | 10 registered (`actions/register.go`) |
| `overlays.md` | "all twelve actions are now wired" | 10 in `ImplementedActions` |
| `hooks.md`, Key Decisions | "Eight small interfaces" for Cat 4 | 12 (`hooks/rule_modifier.go`) |
| `world-movement.md`, Shape | An order advances by `def.Speed` hexes | Movement points with `Banked` (`world/movement.go:46`) |
| `persistence.md`, Shape | Drift costs in `drift_costs.toml`; out of range takes the worst cost | `settings.toml`; the rating is clamped to the table (`rulebook.go:30`) |
| `contributing/engine.md` | "Implement a tag handler" in `engine/tag/` | The package is gone |
| `contributing/interface.md` | A `newOverlay` switch whose default is a placeholder | The `askEntries` table; a missing row panics (`execution.go:381`) |

**What it shows.**

- **What close appends stays current; what nobody owns rots.** Key Decisions are graduated
  at every close and match the code. Shape bodies and the contributing recipes are touched
  by no step. Even a Key Decision drifts when it restates a count.
- **Behaviour has no home of its own.** It sits in five places: the rules doc, the
  catalogues, Key Decisions, Shape step lists and the PF2e pages. None is organised by the
  question a session asks, such as "what does Lobbyists do?": that answer spans `hooks.md`,
  `world-movement.md`, `actions.md` and the rules doc.
- **The old decisions log failed on the same point.** The archive says it failed "because
  nobody retrieves on that axis" (branch and time). Key Decisions fixed that for why, by
  filing it per subsystem. OpenSpec files what per behaviour area, the axis a reader asks on.
- **The upkeep must come from the change process.** OpenSpec merges each change into the
  spec at archive. gestalt's Key Decisions stay current for the same reason. `D.010` is what
  the lack of it costs.
- **Doc volume is a hard limit.** `D.002` found doc volume to be "the mechanism behind the
  big-picture loss", and the May review said not to grow the process docs. A new record must
  take content out of the pages, not copy it.

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

Two words, used the same way in every option below:

- **living spec** — a set of files that says what the system does today, one file per
  behaviour area, kept current as each change lands
- **delta** — a change's list of what it adds, changes and removes in the living spec

### Question 1 — What to borrow

In every option, gestalt borrows an idea, not OpenSpec's code or its CLI. B-1 to B-8 are the
audit's eight candidates, in the same order; B-9 comes from Existing Patterns, B-10 from
the gm-toolkit pass, and B-11 from the read of gm-toolkit's doc layers. Robert can take
any mix. Each lean is a first view for review.

#### B-0 — Borrow nothing

The baseline. gestalt stays as it is.

#### B-1 — A living spec

One file per behaviour area, such as `docs/specs/<area>.md`, with requirements and scenarios.
The initiative close merges each change into it.

- **For:** a session can learn what the system does without reading the code. gm-toolkit has
  real cases where behaviour was lost or misread (gm-toolkit in practice).
- **Against:** it clashes with two gestalt rules. "Docs reflect the source; they are not a
  source of truth" (`rules/code-and-docs.md`), and "only the source shows what's there"
  (`rules/working-together.md`). A living spec is meant to be the contract the code follows.
  And gm-toolkit already keeps behaviour in several places (the rules doc, the page
  catalogues, Key Decisions, Shape step lists), and the page bodies drift. A further place
  adds drift; it does not fix it.
- **Lean:** leave as a new record on top. B-11 takes the idea as a split of what is there.

#### B-2 — Deltas

Each discovery doc lists the behaviour it adds, changes and removes, and the close merges the
list into the living spec.

- **For:** a reviewer sees the change in behaviour, not only the change in code.
- **Against:** with no B-1, there is nothing to merge into. The discovery template already has
  User-Facing Impact and Replaces / Retires (`templates/discovery.md`), which carry the same
  content in prose. In gm-toolkit, 12 of 31 discovery docs use them, and Replaces / Retires
  lists code, not behaviour.
- **Which archive path:** if B-1 and B-2 are taken, gestalt copies the agent path: the close
  skill edits the spec and Robert reviews the edit, as Key Decisions graduate today. The CLI
  path needs OpenSpec's code.
- **Lean:** leave; it goes with B-1.

#### B-3 — Scenarios in WHEN and THEN form

- **For:** acceptance checks in plain words, written before the code.
- **Against:** gestalt plans already carry test cases, mostly in plain language, which the
  plan rules allow (`feature-flow.md:36`). In gm-toolkit many read as given, when, then in
  prose. A WHEN/THEN syntax would add form, not content, and a scenario in the discovery doc
  would be a second copy that can drift.
- **Lean:** leave.

#### B-4 — A structure check for docs

- **For:** catches a doc that drops a required section.
- **Against:** gestalt has no build and no tests, and review catches a missing section.
  OpenSpec's own check skips `proposal.md` and `design.md`, and is soft without `--strict`.
- **Lean:** leave.

#### B-5 — A status line at session start

The SessionStart hook prints the Current Initiatives rows, beside the architecture index.

- **For:** the session knows where work stands before its first read.
- **Against:** the Discovery, Plan and close skills already read the tracker as a step, and
  Execution starts from a plan or a hand-off. A second script to keep.
- **Lean:** leave.

#### B-6 — An explore mode that writes nothing

- **For:** a named way to think out loud with no artifact.
- **Against:** a plain chat with no skill does this today, and the rule "Explain X is not go do
  X" already guards it. An exploration like this one covers the case that needs a doc.
- **Lean:** leave.

#### B-7 — A per-project context and rules layer

- gestalt already has it. A project's `CLAUDE.md` adds its facts and wins over the rules where
  they disagree, except on the doc layout (`rules/working-together.md`).
- **Lean:** nothing to do.

#### B-8 — Reach to other AI tools

Publish gestalt's skills in a shared folder that other tools read, as OpenSpec does with
`.agents/skills/`.

- **For:** the same process in another AI tool, or for another person.
- **Against:** much of gestalt is Claude Code, not only its skills. The rules arrive through
  `@` imports in `CLAUDE.md`, updates through the plugin marketplace, the architecture index
  through a hook, and four skills and the hand-off template call AskUserQuestion. A port means a second delivery
  path to keep, and no other tool is in use today.
- **Lean:** leave, unless Robert names a tool or a person.

#### B-9 — A one-folder change as a light flow

OpenSpec runs a change as one folder: a proposal, a task list, then one archive step.

- **For:** a direct model for `F.004`, which asks for a lighter path for process-doc edits in
  this repo.
- **Against:** none for the input itself. `F.004` decides the shape. In gm-toolkit, about 3 of
  12 initiatives were this small, and bugs never ran on their own, so a light flow may also
  suit bugfixes there.
- **Lean:** take, as an input to `F.004`.

#### B-10 — Merge behaviour changes into the architecture pages at close

From the gm-toolkit pass. OpenSpec's real habit is not the spec format; it is that every
change updates the record of current behaviour as it lands. gestalt can do that with the
pages it already has. The discovery doc states the behaviour it adds, changes and removes, in
plain words (User-Facing Impact made required and widened to engine behaviour). Initiative
close then updates the bodies of the pages that behaviour touches, written against the merged
code, next to today's Key Decisions graduation.

- **For:** fixes a problem gm-toolkit has today: page bodies lag the code (`D.010`), and
  sessions misread behaviour. No new artifact, and no clash with "docs reflect the source",
  because the close writes the page from the code that landed.
- **Against:** more work at every initiative close, and a discovery section that 19 of 31
  docs skip today. It reduces drift; it does not stop it between closes. The pages stay a
  mix of what, how and why, and Shape is the part that rots (gm-toolkit's doc layers).
- **Lean:** take in B-11's form.

#### B-11 — A behaviour spec by area, carved out of the pages

From the read of gm-toolkit's doc layers. Split the record by the question a reader asks,
and give "what does it do" its own home, kept current by B-10's close step.

```
question                 home                          kept current by
what does it do?     ->  behaviour spec, per area  ->  delta in discovery, merged at close
why is it this way?  ->  Key Decisions (as today)  ->  graduation at close (as today)
how is code shaped?  ->  arch page Shape, slimmed  ->  seams and contracts only, no counts
the game's own rules ->  rules/ (the book)         ->  rarely changes
```

- **The spec** is one file per behaviour area, in plain terms with no function names. In
  gm-toolkit's faction manager the areas would be combat, purchase and permission,
  movement, goals, abilities and effects, and the turn with its bookkeeping.
  `pf2e/engine.md` is already close to this style. (This will have to be actually checked when we make this iniative in gm-toolkit)
- **Seeded by moving, not copying.** The engine readings move out of the rules doc; the
  catalogues, the Shape step lists and the behaviour rulings move out of the pages. The
  pages keep seams, contracts and Key Decisions.
- **Each rule cites the Key Decision behind it,** so decision records gain a target in
  behaviour, and the old adherence comes back pointed at what the system does.
- **The close merges against the merged code,** so "docs reflect the source" holds: the
  delta is intent until the close, and the merged spec records what landed.
- **For:** takes OpenSpec's two working parts (a record per behaviour area, kept current by
  the change process) and keeps gestalt's why. It fixes the drift class `D.010` caught,
  because the part that rots gets smaller and the part that stays gets an owner step.
- **Against:** a one-time migration in each project (24 pages and 5,189 lines in
  gm-toolkit), a heavier close, and a new template in gestalt. Only a net move keeps it
  inside `D.002`'s doc-volume limit. The template is shaped by one project so far: a
  project with no game rules layer has to fit it too.
- **Lean:** take, as a feature row with its own Discovery.

### Question 2 — What gestalt has that OpenSpec lacks

The audit answers this one, so it gets no options. Each item below is work OpenSpec does not
do at all:

- **Delivery** — branches, scoped commits, a squash per effort, `--no-ff` merges and tags.
  OpenSpec never touches git.
- **Review** — `/code-review` at each effort and before merge, with picked fixes. OpenSpec has
  an optional report against the plan.
- **Learning** — a retro per initiative and per arc, and memories folded back into the rules
  by `/gestalt:graduate`.
- **Planning above one change** — the tracker with types, triggers and promotion rules,
  efforts and arcs. OpenSpec tried initiatives and pulled them. Its `openspec/work/` layout
  (goal, roadmap, slices) is experimental, and the CLI does not read it.
- **Work across sessions** — one phase per session, hand-offs and re-grounding. OpenSpec has
  one `tasks.md` per change.
- **Plans with literal code** — each task carries the edit. OpenSpec's tasks are prose.
- **A home for why** — Key Decisions on architecture pages. OpenSpec leaves `design.md` in the
  archive.
- **How Claude works with Robert** — tone, pacing, questions and push-back.
- **Updates with no step per project** — the marketplace brings each change to every project.

**What it means for question 3:** every item above survives any move, as gestalt's own skills
or rules, because OpenSpec has nothing to replace it with. gm-toolkit uses nearly all of them
(gm-toolkit in practice).

### Question 3 — Move over or not

**In every option, the question 2 items stay with gestalt.** So "move over" can only mean
that OpenSpec takes over the slice from idea to plan, or part of it.

#### M-0 — Change nothing

The baseline. gestalt as it is, with no picks from question 1.

#### M-1 — Stay, and take the small picks

gestalt as it is, plus the question 1 picks other than B-1 and B-2. On the leans, that is B-9
only.

- **For:** no new artifact, no new tool. Each pick is a small edit to a skill or a row.
- **Against:** no record of current behaviour, and reach stays Claude Code only.

#### M-2 — Stay, and build a living spec inside gestalt

The third shape from the audit: B-1 and B-2 as a gestalt artifact, with no tool. A new
template, a Behaviour Changes section in the discovery template, and a merge step in
initiative close next to the Key Decisions graduation.

- **For:** gets OpenSpec's main idea and keeps everything gestalt owns. No release pace to
  follow.
- **Against:** the clash with "docs reflect the source" (B-1). The upkeep lands on every
  initiative that changes behaviour, in every project. No `validate` and no merge in code; the
  agent edits the spec, as in OpenSpec's default skill. In gm-toolkit it would be one more
  behaviour record beside those that already drift. M-6 is the same idea as a split, not an
  addition.

#### M-3 — Run OpenSpec beside gestalt, for the living spec only

Each project installs OpenSpec. Discovery writes delta specs in an `openspec/changes/` folder
next to the discovery doc, and initiative close runs `openspec archive`. gestalt keeps the
rest.

- **For:** the merge in code with rollback, `openspec validate`, and a spec format other tools
  can read. Less for gestalt to write than M-2.
- **Against:** two tools before code, with two docs per change. The clash from B-1 stays.
  `openspec update` by hand in each project, a profile that is per machine, skill edits that
  `update` overwrites, and 58 releases in 15 months with at least three breaking reshapes.

#### M-4 — Move the slice from idea to plan into OpenSpec

A custom schema replaces the discovery doc and the plan with OpenSpec's change folder,
reshaped to carry gestalt's sections. gestalt keeps the tracker, efforts, Execution, the
closes and the rules, as skills with their own names on top.

- **For:** the before-code half reaches 48 tools. One change format, with OpenSpec's status and
  validate commands.
- **Against:** most of gestalt stays, now coupled to OpenSpec's file layout. A change folder
  has one task list; phases, commits per task, the Decision Record and efforts have to be
  forced into templates. In gm-toolkit, about 9 of 12 initiatives were too big for one folder. A forked schema never gets upstream fixes. The same per-project
  update step and release pace as M-3, now on the core loop.

#### M-5 — Stay, and keep the architecture pages current at close

From the gm-toolkit pass. M-1 plus B-10: OpenSpec's merge habit, applied to the pages gestalt
already keeps. On the leans, the picks are B-9 and B-10.

- **For:** takes the one OpenSpec habit that fixes a measured problem in gestalt's largest
  project. No new artifact and no tool.
- **Against:** a heavier initiative close, in every project.

#### M-6 — Stay, and split the record by question

From the read of gm-toolkit's doc layers. M-1 plus B-10 and B-11: a behaviour spec per area,
carved out of the pages and the rules doc, kept current at each close, beside Key Decisions
for why and slimmed pages for code shape.

- **For:** OpenSpec's living spec, with no tool, no rule clash and gestalt's why intact. It
  targets the drift class the review found, not one catch-up.
- **Against:** a migration in each project and a new gestalt template; worth it only as a
  net move of content. Shaped by one project so far.

#### The four criteria

| Option | Fit | Upkeep | Reach | Own the roadmap |
|---|---|---|---|---|
| M-0 | Full | Today's | Claude Code | Full |
| M-1 | Full | Today's, plus small one-time edits | Claude Code | Full |
| M-2 | Bends one rule (docs follow the code) | A spec edit on every behaviour change | Claude Code | Full |
| M-3 | Two tools and two docs before code | gestalt's, plus an OpenSpec update in each project | One slice reaches 48 tools | Shared, for one slice |
| M-4 | Plans and efforts forced into one folder | Most of gestalt, plus a forked schema and updates | Half the loop reaches 48 tools | Shared, for the core loop |
| M-5 | Full | Today's, plus a page-body update at each close | Claude Code | Full |
| M-6 | Full; the docs move to a new split | A one-time migration per project, then a spec merge at each close | Claude Code | Full |

**Where the criteria pull.** Fit, Upkeep and Own the roadmap favour M-0, M-1, M-5 and M-6. Reach is
the only one that favours M-3 or M-4, and only in part: the rules, hooks and updates still
reach Claude Code only. Upkeep here means upkeep of
gestalt; M-5's close step is project upkeep that `D.010` shows is owed anyway.

<br/>

## Recommendation

All the calls below are Robert's, from review in session 2.

- **Question 3: M-6.** Stay on gestalt. A move keeps most of gestalt anyway (question 2) and
  adds a tool that reshapes often. gm-toolkit does have the problem a living spec aims at:
  behaviour is spread over five places and the part nobody owns rots. The fix is a split by
  question, with the spec carved out of what exists and merged at each close (B-11), not a
  record on top (M-2). M-5 is the smaller step if the migration costs too much.
- **Question 1: B-9, B-10 and B-11.** OpenSpec's one-folder change goes to `F.004` as an
  input; its living spec and merge-at-close become the split. B-1 and B-2 are absorbed by
  B-10 and B-11. B-3 to B-8 are not taken: covered already (B-3, B-6, B-7), or more than
  their present use (B-4, B-5, B-8).
- **Reach does not matter now.** Robert works in Claude Code only, so Reach drops out as a
  criterion. Fit, Upkeep and Own the roadmap all point the same way, and no ranking of the
  criteria was needed.
- **What would change the answer:** a second AI tool or a second person in Robert's
  projects (B-8, M-3 or M-4).

### The B-11 calls

- **Prose by default, structure where it helps.** Robert leans to plain prose rules in game
  terms, as the Goal Rulings and `pf2e/engine.md` read, and is open to requirement and
  scenario blocks where they make sense. `F.005`'s Discovery decides where.
- **`contributing/` becomes runbooks.** One runbook per layer or behaviour area, for how to
  extend it, in place of today's recipe guides. `F.005`'s Discovery shapes them, next to the
  page slimming.
- **gm-toolkit shapes the template.** It is gestalt's primary project, and later projects
  inherit its structure; none is mature enough to have drifted. No other project is read
  first.

### Close-out calls

- **The doc stays in `explorations/`,** with the Explorations row marked Complete, as
  gm-toolkit did for `E.002` and `E.004`.
- **`exploration/openspec` merges into `main` with `--no-ff`,** after one `docs:` commit. No
  code review and no tag: the branch changes docs only.
- **`F.006` is filed,** so the next exploration has a flow and these two calls stop coming
  back.
- **`F.007`'s update method is decided in its own session.**

<br/>

## Follow-on Rows

Filed in `planned-work.md` after Robert's review: `F.004` amended, and `F.005`, `F.006` and
`F.007` added under Features.

**Re-scoped after close (Robert, 2026-11-16):** migrate first, then record the process. The
shape of the split depends on gm-toolkit's content, as gestalt's docs flow expects for
discover-at-write work. So the migration runs in gm-toolkit as `D.012`, a multi-effort docs
initiative with a pilot effort, and `F.005` waits on it and then writes what worked into the
plugin. The table below keeps `F.005` as first filed.

| ID | Item | Type | Detail |
|---|---|---|---|
| `F.004` | Lighter change flow for gestalt (amend the row) | `feature` | Add: OpenSpec's one-folder change (a proposal, a task list, one archive step) is one model for the light path (`E.001` B-9) |
| `F.005` | Behaviour spec, kept current at close | `feature` | Split each project's docs by question: a behaviour spec per area (what), Key Decisions (why), slimmed architecture pages (code shape), seeded by moving content out of the pages and rules docs; `contributing/` becomes runbooks per layer or behaviour area. Spec rules in prose by default, with structure where it helps. Discovery states the behaviour delta; initiative close merges it against the merged code, next to the Key Decisions graduation. Own Discovery, shaped on gm-toolkit; gestalt templates first, then gm-toolkit's migration (`E.001` B-10, B-11, M-6) |
| `F.006` | Exploration type for gestalt | `feature` | Define the `E.` flow and template in `session-modes`: sessions, doc place at close, branch and merge; reads gm-toolkit's `D.009` findings and `E.001` |
| `F.007` | List of projects on gestalt | `feature` | A list of every project that runs on gestalt, so a process review knows what to read. How it stays current is decided in its own session; the options: a search of Robert's GitHub repos for the `gestalt@gestalt` line in `.claude/settings.json` (current on every machine; needs `gh`), a scan of `~/.claude/projects` (this machine only; also what `/gestalt:graduate` relies on, so graduate misses projects on other machines), or a list `/gestalt:adopt` reminds Robert to update (drifts) |

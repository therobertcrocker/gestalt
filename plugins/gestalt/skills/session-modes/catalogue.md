# Catalogue

What the gestalt plugin has, which kind of work each part serves, and the holes it still has. Read it in a process review, or before a new skill is designed; no session loads it by default.

Update this file in the same commit that adds or removes a skill, a flow file or a template, or changes who starts a skill.

## Skills

Starters open a session or a doc, and Claude or Robert may start them. Closes and upkeep skills carry `disable-model-invocation: true`, so only Robert starts them. Reference skills hold rules that a session loads when the work needs them.

| Skill | Group | Started by | Command | What it does |
|---|---|---|---|---|
| `seed` | Starter | Claude or Robert | `/gestalt:seed write\|plant <name> [<ID>]` | Writes a seed for coming work, or plants it as a Backlog row, or on an existing row given by ID |
| `explore` | Starter | Claude or Robert | `/gestalt:explore <E.ID>` | Runs an exploration in one session with three stops; files the follow-on rows |
| `audit` | Starter | Claude or Robert | `/gestalt:audit <R.ID>` | Runs a refactor's audit the way an exploration runs; names the Plan |
| `arc-discovery` | Starter | Claude or Robert | `/gestalt:arc-discovery <A.ID>` | Sets an arc's success criteria and binding decisions from its seed, on the arc branch |
| `arc-plan` | Starter | Claude or Robert | `/gestalt:arc-plan <A.ID>` | Cuts an arc into initiatives, writes their rows and merges the arc branch |
| `discovery` | Starter | Claude or Robert | `/gestalt:discovery <ID>` | Starts a Discovery session and scaffolds the discovery doc |
| `plan` | Starter | Claude or Robert | `/gestalt:plan <ID>[.E<n>]` | Starts a Plan session for an initiative or one effort |
| `execute` | Starter | Claude or Robert | `/gestalt:execute <ID>[.E<n>][.P<n>]` | Starts an Execution session for one phase |
| `coordinate` | Starter | Claude or Robert | `/gestalt:coordinate <ID>[.E<n>]` | Runs an effort's phases from one session, one sub-agent per phase |
| `effort-close` | Close | Robert only | `/gestalt:effort-close <ID>.E<n>` | Reviews an effort, makes one fix commit and squashes the effort |
| `initiative-close` | Close | Robert only | `/gestalt:initiative-close <ID>` | Reviews the branch, writes the retro, runs the pre-merge checklist, merges and tags |
| `arc-close` | Close | Robert only | `/gestalt:arc-close <arc-ID>` | Reviews an arc's seams, writes the arc retro, moves the arc's docs, merges and tags |
| `adopt` | Upkeep | Robert only | `/gestalt:adopt` | Moves a project onto the plugin: settings, imports, the doc layout |
| `graduate` | Upkeep | Robert only | `/gestalt:graduate` | Folds process memories from any project into the gestalt rules and skills |
| `session-modes` | Reference | Claude or Robert | `/gestalt:session-modes` | The lifecycle, the flow per work type, session discipline and the templates |
| `style-guide` | Reference | Claude or Robert | `/gestalt:style-guide` | Document types, headings, tables and writing style for project docs |
| `diagram-kit` | Reference | Claude or Robert | `/gestalt:diagram-kit` | The rules for Mermaid diagrams in project docs |
| `go` | Reference | Claude or Robert | `/gestalt:go` | Robert's Go rules beyond the general code style |

## Around the skills

- **Flow files** in `skills/session-modes/` — `lifecycle.md`, `session-discipline.md`, `feature-flow.md`, `refactor-flow.md`, `bugfix-flow.md`, `docs-chore-flow.md`, `exploration-flow.md`, `efforts.md`, `arcs.md`, and this file
- **Templates** in `skills/session-modes/templates/` — `seed.md`, `discovery.md`, `exploration.md` (an exploration or an audit), `arc-discovery.md`, `arc-plan.md`, `implementation-plan.md`, `docs-plan.md`, `execution-handoff.md`, `retro.md`, `arch-page.md`
- **Hooks** — two SessionStart hooks in `hooks/hooks.json`: `scripts/architecture-index.sh` lists the architecture pages, and `scripts/seed-index.sh` lists the seeds
- **Briefs** — `arc-close/review-brief.md`, which `arc-close` gives to its review agent, and `coordinate/phase-brief.md`, which `coordinate` gives to each phase agent

## Coverage

| Work | Written process | Template | Skill |
|---|---|---|---|
| Seed | `lifecycle.md`, `session-discipline.md` | `seed.md` | `seed` |
| Exploration | `exploration-flow.md` | `exploration.md` | `explore` |
| Refactor audit | `exploration-flow.md`, `refactor-flow.md` | `exploration.md` | `audit` |
| Arc-discovery | `arcs.md` | `arc-discovery.md` | `arc-discovery` |
| Arc-plan | `arcs.md` | `arc-plan.md` | `arc-plan` |
| Arc close | `arcs.md` | `retro.md` | `arc-close` |
| Feature | `feature-flow.md` | `discovery.md`, `implementation-plan.md` | `discovery`, `plan`, `execute`, the closes |
| Refactor | `refactor-flow.md` | `implementation-plan.md`, "Steps only" | `audit`, `plan`, `execute`, the closes |
| Bugfix, non-trivial | `bugfix-flow.md` | `implementation-plan.md`, "Steps only" | `plan`, `execute`, `initiative-close` |
| Bugfix, trivial; chore; single-session docs | `bugfix-flow.md`, `docs-chore-flow.md` | Not needed | None |
| Docs, multi-effort | `docs-chore-flow.md` | `docs-plan.md` | `plan`, `initiative-close`; `execute` does not fit |
| An effort's phases in sub-agents | `efforts.md` | `coordinate/phase-brief.md` | `coordinate` |
| Effort close | `efforts.md` | Not needed | `effort-close` |
| Execution hand-off | A comment in the template | `execution-handoff.md` | `execute` reads one; none writes it |
| Tracker moves | `lifecycle.md` | Not needed | New rows only: `seed plant`, `explore`, `arc-plan` |

## Known holes

Gaps that no skill or template fills yet. A hole gets a tracker row only on the day Robert chooses to fill it.

| Hole | What the source shows |
|---|---|
| Hand-off writer (planned) | `execution-handoff.md` says to write a hand-off at the end of a session; `execute` reads one, and no skill writes it |
| `execute` for a docs plan (planned) | `execute` finds its scope by phase and ticked phase box; `docs-plan.md` has efforts and no phases |
| Light bugfix plan (planned) | `bugfix-flow.md` names three parts (root cause, fix approach, test plan); `implementation-plan.md` gives a small bugfix one line, "Steps only" |
| Refactor plan (planned) | `refactor-flow.md` asks for a target pattern and a unit list; `implementation-plan.md` gives a small refactor the same one line |
| Tracker moves (planned) | `lifecycle.md` gives the rules for a promotion and a write-up; no skill does them. New rows come from `seed plant`, `explore` and `arc-plan` |

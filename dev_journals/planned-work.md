# Planned Work

Pre-discovery initiative tracker. Items move to Current Initiatives when they are scoped. At that point a write-up is added below, and a discovery doc is written before implementation begins.

<br/>

## Current Initiatives

Full write-ups below.

| ID      | Item | Type | Status | Detail |
|---------|------|------|--------|--------|
| `F.008` | Skills expansion | `feature` | In-Progress | Add skills for seeds, explorations and the arc stages, a coordinator that runs an effort's phases in sub-agents, and a catalogue of the skills gestalt has and still needs; takes in `F.006` |

---
<br/>

## Up Next (Ready or Near Ready)

| ID      | Item | Type | Trigger | Detail |
|---------|------|------|---------|--------|

---
<br/>

## Explorations

Look at a part of the system, or at something outside it, weigh options and file each follow-on as its own row. Trigger values as in the Backlog.

| ID      | Item | Trigger | Detail |
|---------|------|---------|--------|
| `E.001` | OpenSpec comparison | `--` | **Complete** (2026-11-16): stay on gestalt, and take OpenSpec's living spec as a gestalt artifact (`F.005`); follow-ons `F.004` (amended), `F.005`, `F.006`, `F.007`. Compare gestalt with OpenSpec (`Fission-AI/OpenSpec`): what it does that gestalt should do, what gestalt does that it lacks, and whether to move over to it. Two sessions on `exploration/openspec`. Doc: [`E.001-openspec-comparison-exploration.md`](initiatives/explorations/E.001-openspec-comparison-exploration.md) |

---
<br/>

## Backlog

**Trigger values:**

- `--` — no gate; pick up at any time
- `ready` — scoped; can be promoted now
- `after <ID>` — waits on another item
- `before <ID>` — must land before another item, or a phase of one
- `when <condition>` — waits on a condition
- `needs triage` — cause not known

### Features

| ID      | Item | Trigger | Detail |
|---------|------|---------|--------|
| `F.004` | Lighter change flow for gestalt | `--` | The full Discovery, Plan, Execution and close flow is too heavy for this repo's process-doc edits; talk through a lighter path for changes here and write it into this repo's `CLAUDE.md`. OpenSpec's one-folder change (a proposal, a task list, one archive step) is one model for the light path (`E.001` B-9). `F.008` is the sample of the full flow on process files: its Discovery (2026-11-20) ran as a chain of small rulings over past artifacts, not a code survey, and its doc grew to about 600 lines with sections the template lacks; its "Notes for Plan" lists where the plan template, the phase budget, the gate and the review may pinch. Read how its Plan, Execution and closes went before designing the light path. One data point already in: three sessions per effort (plan, execute, effort close) was overkill for F.008's efforts. Effort 2 took about ten minutes of work and 3% of Robert's usage, most of it spent reading the same context again in each session. From effort 3 on, F.008 runs each effort in one session and keeps the stops (F.008 overview plan, Decision Record, entry 2). The light path should merge sessions and keep the stops |
| `F.005` | Behaviour spec process, recorded from gm-toolkit | `when` gm-toolkit `D.012` closes | Migrate first, then record: gm-toolkit's `D.012` moves its docs to the split (a behaviour spec per area for what, Key Decisions for why, slimmed architecture pages for code shape, runbooks per area for how to extend) and finds the shape. This row then writes what worked into the plugin: templates for the spec, the runbook and the slim architecture page; the merge step in `/gestalt:initiative-close` (replacing gm-toolkit's local close rule); a behaviour-delta section in the discovery template; the new paths in `code-and-docs.md`; and `/gestalt:adopt` (`E.001` B-10, B-11, M-6) |
| `F.007` | List of projects on gestalt | `--` | A list of every project that runs on gestalt, so a process review knows what to read. How it stays current is decided in its own session; the options: a search of Robert's GitHub repos for the `gestalt@gestalt` line in `.claude/settings.json` (current on every machine; needs `gh`), a scan of `~/.claude/projects` (this machine only; also what `/gestalt:graduate` relies on, so graduate misses projects on other machines), or a list `/gestalt:adopt` reminds Robert to update (drifts) |

### Chores

| ID      | Item | Trigger | Detail |
|---------|------|---------|--------|
| `C.002` | Rules weight check | `when` two projects run on the plugin for a month | Note whether imported rules are followed as well as a project's own `CLAUDE.md` text; adjust wording or placement if not (Discovery, Open Question 4) |
| `C.003` | Phase budget review | `when` gm-toolkit A.001.7 Effort 4 closes | The phase budget went from about 800 to about 1,500 lines with a cap of about 4 commits; the trial phases run only to about 1,020 lines. Too high if a session compacts mid-phase or debugging in a phase runs past about 20 minutes. If clean, the commit cap holds; 1,500 stays unproven until a phase runs that large |

---
<br/>

# Initiative Write-Ups

## F.008 — Skills Expansion

**Problem:** Three kinds of work run with no skill and, for two of them, no written process. Seeds and explorations are named in the rules as "process not defined yet", although four seeds and four explorations exist across gestalt and gm-toolkit. An arc has a close skill only: `/gestalt:discovery` and `/gestalt:plan` scaffold the feature templates in the feature folders, which is wrong for an arc, and arc-discovery and arc-plan have no templates. No list shows which skills exist and which are missing. The session and close skills can be started only by a command Robert types, so a Claude session cannot hand a phase to a sub-agent through them; the gm-toolkit coordinator experiment (`F.041.E4`, 2026-11-19 to 2026-11-20) worked around that with hand-written briefs and scored 20 of 25.

**Approach:** One multi-effort initiative with one discovery doc. Discovery starts with a catalogue of the session modes and skills, then settles each front; the Plan session slices the efforts. The fronts:

- **Seeds** — a seed process, a template and a skill with two jobs: write a seed, and plant it
- **Explorations** — the `E.` flow, a template and a skill, from the four exploration docs and gm-toolkit's `D.009` findings log
- **Arc stages** — skills and templates for arc-discovery and arc-plan, with the seed in place of the arc concept
- **Sub-agents** — a coordinator skill built on the experiment's loop and brief template, and the hand-only flag removed from `discovery`, `plan` and `execute`
- **Catalogue** — the skills gestalt has and the ones it still needs, kept where a process review can read it

**Unlocks:** Every stage of work, from a first idea to an arc close, starts from a skill. `one-claude` can run as an arc on skills made for arcs. An effort can run under a coordinator, so easy findings are caught phase by phase.

**Trigger:** `--`

**Status:** In-Progress, on `feature/skills-expansion`.

**Decided before Discovery** (Robert, 2026-11-20):

| # | Question | Decision |
|---|---|---|
| 1 | Container | One initiative with one discovery doc and the fronts as efforts; `F.006` folds in |
| 2 | Seed skill | Two jobs: write a seed, and plant it as a tracker row |
| 3 | Seed and row | The seed stays beside its row after planting |
| 4 | Arc concept | The seed replaces the arc concept; arc-discovery reads the seed |
| 5 | Sub-agents | A coordinator skill, and the hand-only flag comes off `discovery`, `plan` and `execute`; the three close skills stay hand-only |
| 6 | Exploration branch | Exempt from the branch rule; an exploration may commit on `main` |
| 7 | Exploration close-out | The doc stays in `explorations/`; the tracker row is removed once the follow-on rows are filed |
| 8 | Exploration sessions | One session with two stops: a review after the audit, and a spot check before sign-off |
| 9 | Exploration ID | Always an `E.` ID, also when the exploration serves one initiative |

**Settled in Discovery:** the three questions this write-up left open. The seed write job takes a chat draft as a second source (decision 19). F.008 takes eight of the retro's ten follow-ups (decision 32). The docs say a sub-agent can call a skill once the hand-only flag is off; whether a built-in agent type can is the discovery doc's one open question, and a trial in Execution answers it.

**Input:**

- Coordinator experiment retro — `/workspaces/gm-toolkit/dev_journals/gestalt-outbox/2026-11-20-phase-coordinator-experiment-retro.md`
- Exploration findings log — `/workspaces/gm-toolkit/dev_journals/faction-manager/initiatives/discovery/D.009-exploration-type-findings.md`
- Explorations — gestalt `E.001`; gm-toolkit `E.002`, `E.004` and `R.029` under `dev_journals/faction-manager/initiatives/explorations/`
- Seeds — gestalt `dev_journals/initiatives/seeds/one-claude-seed.md`; gm-toolkit `repo-layout-seed.md` (campaigns), `codex-assistant-seed.md` (codex) and `living-spec-migration-seed.md` (faction-manager)

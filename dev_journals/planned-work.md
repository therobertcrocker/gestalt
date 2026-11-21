# Planned Work

Pre-discovery initiative tracker. Items move to Current Initiatives when they are scoped. At that point a write-up is added below, and a discovery doc is written before implementation begins.

<br/>

## Current Initiatives

Full write-ups below.

| ID      | Item | Type | Status | Detail |
|---------|------|------|--------|--------|

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
| `F.004` | Lighter change flow for gestalt | `--` | The full Discovery, Plan, Execution and close flow is too heavy for this repo's process-doc edits; talk through a lighter path for changes here and write it into this repo's `CLAUDE.md`. OpenSpec's one-folder change (a proposal, a task list, one archive step) is one model for the light path (`E.001` B-9). `F.008` is the sample of the full flow on process files: its Discovery (2026-11-20) ran as a chain of small rulings over past artifacts, not a code survey, and its doc grew to about 600 lines with sections the template lacks; its "Notes for Plan" lists where the plan template, the phase budget, the gate and the review may pinch. Read how its Plan, Execution and closes went before designing the light path. One data point already in: three sessions per effort (plan, execute, effort close) was overkill for F.008's efforts. Effort 2 took about ten minutes of work and 3% of Robert's usage, most of it spent reading the same context again in each session. From effort 3 on, F.008 runs each effort in one session and keeps the stops (F.008 overview plan, Decision Record, entry 2). The light path should merge sessions and keep the stops. F.008 closed on 2026-11-21: about 4,350 lines of discovery doc and plans for about 1,460 lines of plugin change, and 44 review fixes over six fix commits, most of them logic gaps in skill steps that the plans had written out in full. One session per effort held up for efforts 3 to 5 (`_completed/F.008-skills-expansion/F.008-skills-expansion-retro.md`, section 2) |
| `F.005` | Behaviour spec process, recorded from gm-toolkit | `when` gm-toolkit `D.012` closes | Migrate first, then record: gm-toolkit's `D.012` moves its docs to the split (a behaviour spec per area for what, Key Decisions for why, slimmed architecture pages for code shape, runbooks per area for how to extend) and finds the shape. This row then writes what worked into the plugin: templates for the spec, the runbook and the slim architecture page; the merge step in `/gestalt:initiative-close` (replacing gm-toolkit's local close rule); a behaviour-delta section in the discovery template; the new paths in `code-and-docs.md`; and `/gestalt:adopt` (`E.001` B-10, B-11, M-6) |
| `F.007` | List of projects on gestalt | `--` | A list of every project that runs on gestalt, so a process review knows what to read. How it stays current is decided in its own session; the options: a search of Robert's GitHub repos for the `gestalt@gestalt` line in `.claude/settings.json` (current on every machine; needs `gh`), a scan of `~/.claude/projects` (this machine only; also what `/gestalt:graduate` relies on, so graduate misses projects on other machines), or a list `/gestalt:adopt` reminds Robert to update (drifts) |

### Bugfixes

| ID      | Item | Trigger | Detail |
|---------|------|---------|--------|
| `B.001` | The next free ID can be handed out twice | `when` an ID is handed out twice | `seed plant`, `explore` and `arc-plan` take the next free ID from the tracker and the file names under `dev_journals/initiatives/` on the current branch only. Two ways that gives an ID out again: work on two branches picks the same number (F.008 E4 review, finding 4); and a closed trivial bugfix or chore leaves no row and no file, so its number looks free (F.008 initiative review, finding 2). A scan of commit subjects across branches would catch both |

### Chores

| ID      | Item | Trigger | Detail |
|---------|------|---------|--------|
| `C.002` | Rules weight check | `when` two projects run on the plugin for a month | Note whether imported rules are followed as well as a project's own `CLAUDE.md` text; adjust wording or placement if not (Discovery, Open Question 4) |
| `C.003` | Phase budget review | `when` gm-toolkit A.001.7 Effort 4 closes | The phase budget went from about 800 to about 1,500 lines with a cap of about 4 commits; the trial phases run only to about 1,020 lines. Too high if a session compacts mid-phase or debugging in a phase runs past about 20 minutes. If clean, the commit cap holds; 1,500 stays unproven until a phase runs that large |

---
<br/>

# Initiative Write-Ups

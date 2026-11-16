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
| `E.001` | OpenSpec comparison | `--` | Compare gestalt with OpenSpec (`Fission-AI/OpenSpec`): what it does that gestalt should do, what gestalt does that it lacks, and whether to move over to it. Two sessions on `exploration/openspec`. Doc: [`E.001-openspec-comparison-exploration.md`](initiatives/explorations/E.001-openspec-comparison-exploration.md) |

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
| `F.004` | Lighter change flow for gestalt | `--` | The full Discovery, Plan, Execution and close flow is too heavy for this repo's process-doc edits; talk through a lighter path for changes here and write it into this repo's `CLAUDE.md` |

### Chores

| ID      | Item | Trigger | Detail |
|---------|------|---------|--------|
| `C.002` | Rules weight check | `when` two projects run on the plugin for a month | Note whether imported rules are followed as well as a project's own `CLAUDE.md` text; adjust wording or placement if not (Discovery, Open Question 4) |
| `C.003` | Phase budget review | `when` gm-toolkit A.001.7 Effort 4 closes | The phase budget went from about 800 to about 1,500 lines with a cap of about 4 commits; the trial phases run only to about 1,020 lines. Too high if a session compacts mid-phase or debugging in a phase runs past about 20 minutes. If clean, the commit cap holds; 1,500 stays unproven until a phase runs that large |

---
<br/>

# Initiative Write-Ups

# Planned Work

Pre-discovery initiative tracker. Items move to Current Initiatives when they are scoped. At that point a write-up is added below, and a discovery doc is written before implementation begins.

<br/>

## Current Initiatives

Full write-ups below.

| ID      | Item | Type | Status | Detail |
|---------|------|------|--------|--------|
| `F.003` | Initiative and arc close skills | `feature` | In-Progress | Add `/gestalt:initiative-close <ID>` and `/gestalt:arc-close <ID>`: review, fix commit, plain-words summary and a retro, then the close-out steps |

---
<br/>

## Up Next (Ready or Near Ready)

| ID      | Item | Type | Trigger | Detail |
|---------|------|------|---------|--------|

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

## F.003 — Initiative and Arc Close Skills

**Problem:** The pre-merge checklist (review, promote decisions, tracker, move docs) has no skill; Robert runs it from memory, the same gap `/gestalt:effort-close` closed for effort boundaries. An arc has no close step at all: it ends when its last initiative merges, and nothing looks back at the arc as a whole. No session asks whether the work did what it set out to do, or what it changed about the project.

**Approach:** Two hand-run skills shaped like `effort-close`. `/gestalt:initiative-close <ID>` runs the whole pre-merge checklist: a code review, one fix commit for the picked findings, a plain-words summary, and a retro that answers five fixed questions while the review runs. `/gestalt:arc-close <ID>` does the same one level up, reading each initiative's retro.

**Unlocks:** Every initiative and arc ends the same way, with one command. The retros build a record of how initiatives went, which later arcs and process changes can read.

**Trigger:** `--`

**Status:** In-Progress. The discovery doc is `docs/initiatives/discovery/F.003-initiative-and-arc-close-discovery.md`.

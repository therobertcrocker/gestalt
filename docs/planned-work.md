# Planned Work

Pre-discovery initiative tracker. Items move to Current Initiatives when they are scoped. At that point a write-up is added below, and a discovery doc is written before implementation begins.

<br/>

## Current Initiatives

Full write-ups below.

| ID      | Item | Type | Status | Detail |
|---------|------|------|--------|--------|
| `F.002` | Effort close skill | `feature` | In-Progress | Add `/gestalt:effort-close <ID>.E<n>`, one session that runs an effort boundary: interim review, review `fix:` commits, effort squash |

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

_None._

### Chores

| ID      | Item | Trigger | Detail |
|---------|------|---------|--------|
| `C.002` | Rules weight check | `when` two projects run on the plugin for a month | Note whether imported rules are followed as well as a project's own `CLAUDE.md` text; adjust wording or placement if not (Discovery, Open Question 4) |

---
<br/>

# Initiative Write-Ups

## F.002 — Effort Close Skill

**Problem:** At an effort boundary, the process has three steps in a fixed order: an interim review, `fix:` commits for the review's findings, then the effort squash with the fixes replayed on top. `efforts.md` and the git-and-delivery rules describe the steps, but no skill runs them. `/gestalt:execute` ends when the effort's last phase is committed. The only reminder is the "Ahead" line of a hand-off, if one was written. To scope `/code-review` to only the effort's commits, the user must find the effort's base commit by hand.

**Approach:** Add a hand-run skill, `/gestalt:effort-close <ID>.E<n>`. It is the new session that `efforts.md` asks for at the boundary. It finds the effort's base commit, runs the review on that range, makes the `fix:` commits that Robert selects, then squashes the effort and replays the fixes on top.

**Unlocks:** Each effort boundary runs the same way, with one command and no need to recall steps from three docs. `/gestalt:execute` can name that command when a phase finishes an effort.

**Trigger:** `--`

**Status:** In-Progress. The discovery doc is `docs/initiatives/discovery/F.002-effort-close-discovery.md`.

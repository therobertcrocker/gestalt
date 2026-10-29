# Planned Work

Pre-discovery initiative tracker. Items move to Current Initiatives when they are scoped. At that point a write-up is added below, and a discovery doc is written before implementation begins.

<br/>

## Current Initiatives

Full write-ups below.

| ID      | Item | Type | Status | Detail |
|---------|------|------|--------|--------|
| `F.001` | Process plugin extraction | `feature` | In-Progress | Move gm-toolkit's CLAUDE.md rules, `docs/process/`, hooks and process memories into this repo as one Claude Code plugin, so that every project shares one copy |

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
- `when <condition>` — waits on a condition
- `needs triage` — cause not known

### Features

_None._

---
<br/>

# Initiative Write-Ups

## F.001 — Process Plugin Extraction

**Problem:** Robert's process lives in gm-toolkit: `CLAUDE.md`, `.claude/settings.json`, `docs/process/` and about 48 feedback memories. Robert now has a second and a third project. Copying the files would let them drift. The memories are per-repo, so a new project starts without them.

**Approach:** Build a Claude Code plugin in this repo. Always-on rules load through a SessionStart hook. The session modes, style guide and diagram kit become skills, and the templates go with them. Project facts stay in each project's own `CLAUDE.md`. Each project enables the plugin from its `.claude/settings.json`.

**Unlocks:** One copy of the process for every project. A change to the process lands everywhere. A new devcontainer gets the process with no manual setup.

**Trigger:** a second project exists (met 2026-10-29).

**Status:** In-Progress. The discovery doc is `docs/initiatives/discovery/F.001-process-plugin-extraction-discovery.md`.

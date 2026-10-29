# Process Plugin Extraction — Discovery

## In Plain Words

_Pending. The Discovery session fills this._

## Problem

_Pending._

## Architecture Context

This repo has no architecture pages yet. The binding context is the Claude Code plugin platform; see **Platform Constraints** below.

## Design Summary

_Pending._

## Open Questions

_Pending._

---

## Source Inventory

What the extraction draws from. The counts are from 2026-10-29.

| Source | Where | Size | Notes |
|---|---|---|---|
| Project instructions | `gm-toolkit/CLAUDE.md` | 75 lines | Mix of generic rules (collaboration, commits, Three Principles, code style) and project facts (docs routing table, `planned-work.md` path, Go, LSP) |
| Project settings | `gm-toolkit/.claude/settings.json` | 4 permissions, 1 hook | Permissions are Go-specific, plus `LSP` and a mermaid `WebFetch`. The SessionStart hook injects the `docs/architecture/` page index |
| Process docs | `gm-toolkit/docs/process/` | about 1,625 lines in 9 files | `session-modes.md` (459), `diagram-kit.md` (267), `style-guide.md` (149), 6 templates |
| Process memories | `~/.claude/projects/-workspaces-gm-toolkit/memory/` | 51 files | About 48 feedback, 2 user, 1 project. **They exist only inside the gm-toolkit devcontainer.** |

**Path coupling.** `docs/process/` holds about 70 hard-coded gm-toolkit paths: `docs/initiatives` (about 35), `planned-work` (about 25), and a few `docs/architecture`, `dev_journals`, `faction` and `swn` references.

## Platform Constraints

Checked against the Claude Code docs on 2026-10-29 (`plugins-reference`, `memory`, `plugin-marketplaces`).

- **A plugin can't ship CLAUDE.md.** "A `CLAUDE.md` at the plugin root isn't loaded as context ... To include instructions that load into Claude's context, put them in a skill."
- **A plugin can't set permissions.** Plugin `settings.json` applies "only `agent` and `subagentStatusLine`". Other keys are dropped.
- **A plugin can ship:** skills, commands, agents, hooks (`hooks/hooks.json`), output styles, MCP servers, LSP servers, monitors, workflows and `bin/` executables.
- **Hook environment:** hook commands get `CLAUDE_PLUGIN_ROOT`, `CLAUDE_PLUGIN_DATA` and `CLAUDE_PROJECT_DIR`. So a SessionStart hook can `cat "${CLAUDE_PLUGIN_ROOT}/<file>"` into `additionalContext`.
- **Namespacing:** every component is prefixed with the plugin name, for example `/gestalt:session-modes`.
- **Output styles:** only one is active at a time, so a plugin output style would replace Learning mode.
- **Versions:** a `version` in `plugin.json` pins users to that version until it changes. A marketplace added from a local path loads the plugin in place, so edits take effect on `/reload-plugins` with no version bump.
- **Distribution:** `.claude-plugin/marketplace.json` makes a git repo a marketplace. A private repo works.
- **Imports:** `@path` imports in a project CLAUDE.md that point outside the project need a one-time approval. `~/.claude/CLAUDE.md` and `~/.claude/rules/` load with no approval, but they are per-machine.
- **Auto memory** is per-repo and per-machine. `autoMemoryDirectory` can move it.

**Not yet verified:** that a project's `.claude/settings.json` can declare the marketplace and enable the plugin, so that a fresh container installs it automatically.

## Environment Notes

- Only `/workspaces/gm-toolkit` is mounted from the Windows host. `~/.claude` and this clone (`~/gestalt`) live inside the container, so push often.
- In this container, git works over HTTPS. SSH host keys aren't set up.
- `sources/gm-toolkit-memory/` is a frozen snapshot of the gm-toolkit memory folder (52 files, 2026-10-29). It is Discovery input and a backup. It is not a live copy.
- **Design-space change:** if every project's devcontainer bind-mounts the same host folder at `~/.claude`, then `~/.claude/CLAUDE.md`, `~/.claude/rules/` and the memories are shared across containers. That makes user-level config a real alternative to the plugin, or a partner to it. Weigh it in the Design Summary.

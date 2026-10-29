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
- **Design-space change:** if every project's devcontainer bind-mounts the same host folder at `~/.claude`, then `~/.claude/CLAUDE.md` and `~/.claude/rules/` are shared across containers. That makes user-level config a real alternative to the plugin, or a partner to it. Weigh it in the Design Summary.

## Persistence and Sharing

Seed notes from the setup session (2026-10-29). These are the setup session's view, for Discovery to test, not ratified decisions.

**The mount.** gm-toolkit commit `669c2d8` bind-mounts `%USERPROFILE%\.claude-devcontainer` at `~/.claude` and sets `CLAUDE_CONFIG_DIR=/home/vscode/.claude`, so `.claude.json` lives inside the mount too. Other project containers are meant to mount the same folder.

| Goal | Does the shared mount do it? |
|---|---|
| Memories survive a rebuild | Yes |
| Login, settings and plugins shared across project containers | Yes |
| `~/.claude/CLAUDE.md` and `~/.claude/rules/` apply in every project | Yes |
| Memories shared across projects | **No.** Auto memory is keyed per repo (`projects/-workspaces-<repo>/memory/`). A new project starts with zero memories |
| Off-machine backup | **No.** `%USERPROFILE%` root is not in OneDrive by default (Known Folder Move covers Desktop, Documents and Pictures only). The mount guards against losing the container, not the disk |

**Reframe: shared rules, not shared memory.** About 48 of the 51 memories are process preferences (commit cadence, plan discipline, question style), not project facts. Those should graduate out of memory into rules that load in every project: the plugin, or `~/.claude/rules/`. Only project facts (for example "FacCreds are called Coin", lipgloss for the TUI only, the `sandbox-claude` campaign) stay in per-project auto memory.

**Rejected: one shared memory pool.** `autoMemoryDirectory` in user settings could point every project at one folder. Rejected because project facts would leak across projects, and only the first 200 lines or 25 KB of `MEMORY.md` load, so a merged pool would push entries past the cutoff.

| Kind of knowledge | Home | Shared how |
|---|---|---|
| Process rules (most memories today) | gestalt plugin, or `~/.claude/rules/` | Plugin install, or the shared mount |
| Project facts | Per-project auto memory | Not shared, by design |
| Claude-side state (login, settings, transcripts) | `~/.claude` on the bind mount | Survives rebuilds |
| Off-machine safety | gestalt repo for rules; an explicit backup of `.claude-devcontainer` if wanted | Git; backup tool not chosen |

**Plugin vs `~/.claude/rules/`** for the graduated rules is open. Git versioning and use on other machines favour the plugin. Simplicity favours the rules folder.

**Concurrency risk (low).** Two containers open at once both write the shared `.claude.json` over the Windows 9p mount. Claude Code expects several sessions on one machine and keeps five rotating backups of that file in `backups/`.

**Ownership on the Windows mount.** Files created from Linux keep uid 1000, and `chmod` works. Files created from Windows show as uid 0, mode 777, and `vscode` can't `chmod` them. Seed or restore the mount from inside the container (for example, by extracting a tarball), not with `docker cp` of a folder.

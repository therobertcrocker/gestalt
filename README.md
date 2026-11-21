# gestalt

Robert's working process for Claude Code, packaged as one plugin: the collaboration rules, the session modes, the doc templates and the hooks that every project shares.

**Status:** shipped as v0.1.0. The tracker is `dev_journals/planned-work.md`.

The repo is a Claude Code plugin marketplace. `.claude-plugin/marketplace.json` lists one plugin, `plugins/gestalt/`. `sources/` is a frozen snapshot of gm-toolkit's process from 2026-10-29: Discovery input and backup, never loaded.

<br/>
<br/>

# The devcontainer

The repo runs in a VS Code devcontainer (`.devcontainer/`). The container itself is disposable. The host is Ubuntu in WSL2, and three paths come from it as bind mounts:

- **`/workspaces/gestalt`** — this repo, at `~/dev/gestalt` on the host
- **`~/.claude`** — all Claude Code state: memories, login, settings, plugins and transcripts. The host folder is `~/.claude-devcontainer` in WSL, shared with every other project container (gm-toolkit too). `CLAUDE_CONFIG_DIR` points here, so `.claude.json` lives inside the mount too
- **`/workspaces/gm-toolkit`** — gm-toolkit, **read-only**. It is the source material for the extraction. The mount expects gm-toolkit and gestalt to be sibling folders on the host (`~/dev/`)

Everything else in the container is lost on a rebuild: side clones, `/tmp`, shell history and the `gh` login.

Keep the repos and the state folder in the WSL filesystem, not under `/mnt/c`. A mount from `C:\` reaches the container over 9p, which is slow and once corrupted a git ref. If write errors come back on the state folder, the fallback is one shared named volume: every project mounts `source=claude-state,target=/home/vscode/.claude,type=volume`, with the state folder copied in once. A new volume may be owned by root and need a `chown`.

<br/>

## First time

On a new machine, set up the host first: install Ubuntu (`wsl --install -d Ubuntu`), turn on Ubuntu in Docker Desktop's **Settings → Resources → WSL integration**, add the **WSL** extension to VS Code on Windows, and install `git` and `gh` in Ubuntu with `gh auth login` and `gh auth setup-git`.

1. Make sure `~/.claude-devcontainer` exists in WSL. If gm-toolkit's container already runs with the mount, it does. On a new machine, create it: an empty folder means a fresh Claude login with no memories.
2. In Ubuntu, clone this repo next to gm-toolkit, so the two are sibling folders:
   ```sh
   cd ~/dev
   git clone https://github.com/therobertcrocker/gestalt.git
   ```
3. Open the folder from WSL: `cd ~/dev/gestalt && code .`. VS Code shows **WSL: Ubuntu** in the bottom-left corner. Then run **Dev Containers: Reopen in Container**.
4. Do the checks in **After a start or rebuild** below.

<br/>

## Rebuild

**Before:**

1. Commit and push anything outside the mounts that you want to keep.
2. Close every Claude Code session in this container.

**Rebuild:** in VS Code, run **Dev Containers: Rebuild Container**.

Then do the checks below.

<br/>

## After a start or rebuild

1. Check the mounts before you start `claude`:
   ```sh
   echo $CLAUDE_CONFIG_DIR                                        # /home/vscode/.claude
   ls ~/.claude/projects/-workspaces-gm-toolkit/memory | wc -l    # not 0
   ls /workspaces/gm-toolkit/docs/_archive/process                 # the source docs
   ```
2. Log in to GitHub: `gh auth login`, then `gh auth setup-git`. Plain `git push` works without either, because VS Code injects a credential helper. The second command stores a credential that Claude Code's plugin installer can use without a prompt; it needs that to clone the private marketplace.
3. Start `claude`. It should already be logged in. Accept the workspace trust dialog; that registers the gestalt marketplace from `.claude/settings.json`. `/plugin` should list `gestalt@gestalt` as enabled, and `/context` should list the three rules files under Memory files. This repo's own memory folder (`projects/-workspaces-gestalt/memory/`) starts empty, which is expected: auto memory is per repo.
4. If the start or rebuild created or changed `.devcontainer/devcontainer-lock.json`, commit it.

<br/>
<br/>

# The plugin

`plugins/gestalt/` is the plugin; `.claude-plugin/marketplace.json` lists it. What it ships:

- **Always-on rules** in `plugins/gestalt/rules/`: `working-together.md`, `git-and-delivery.md`, `code-and-docs.md`. A project's `CLAUDE.md` imports them with one `@` line each, from `~/.claude/plugins/marketplaces/gestalt/`. This checkout imports them by relative path instead.
- **Skills** in `plugins/gestalt/skills/`: `session-modes` (with the doc templates), `style-guide`, `diagram-kit`, `go`; the starters `seed`, `explore`, `audit`, `arc-discovery`, `arc-plan`, `discovery`, `plan`, `execute`, `coordinate`; the close skills `effort-close`, `initiative-close`, `arc-close`; the upkeep skills `graduate` and `adopt`. `skills/session-modes/catalogue.md` lists each one with what it does, and the holes still open.
- **Two SessionStart hooks**: one lists `docs/architecture/` pages when a project has a wiki, the other lists the seeds when a project has any.
- **Templates** in `plugins/gestalt/templates/`: the starter `CLAUDE.md` and the devcontainer snippet.

## Adopting it in a project

In that project's session, run `/gestalt:adopt`. It writes the settings, the snippet and the imports, and lists what the project can drop.

## Changing the process

Edit the rules or skills here, on a branch, and merge. Other projects get the change after their marketplace updates (auto-update is on in each project's settings; `/plugin marketplace update gestalt` forces it). Corrections made in other projects reach here through `/gestalt:graduate`.

To test unpushed skill or hook edits, run `claude --plugin-dir plugins/gestalt`. Rule edits need nothing; this checkout imports them from the working copy.

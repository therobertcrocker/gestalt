# gestalt

Robert's working process for Claude Code, packaged as one plugin: the collaboration rules, the session modes, the doc templates and the hooks that every project shares.

**Status:** in Discovery. See `docs/planned-work.md` (F.001).

<br/>
<br/>

# The devcontainer

The repo runs in a VS Code devcontainer (`.devcontainer/`). The container itself is disposable. Three paths come from the Windows host as bind mounts:

- **`/workspaces/gestalt`** — this repo
- **`~/.claude`** — all Claude Code state: memories, login, settings, plugins and transcripts. The host folder is `%USERPROFILE%\.claude-devcontainer`, shared with every other project container (gm-toolkit too). `CLAUDE_CONFIG_DIR` points here, so `.claude.json` lives inside the mount too
- **`/workspaces/gm-toolkit`** — gm-toolkit, **read-only**. It is the source material for the extraction. The mount expects gm-toolkit and gestalt to be sibling folders on the host

Everything else in the container is lost on a rebuild: side clones, `/tmp`, shell history and the `gh` login.

<br/>

## First time

1. Make sure `%USERPROFILE%\.claude-devcontainer` exists. If gm-toolkit's container already runs with the mount, it does. On a new machine, create it: an empty folder means a fresh Claude login with no memories.
2. Clone this repo next to gm-toolkit, so the two are sibling folders:
   ```powershell
   cd <the folder that holds gm-toolkit>
   git clone https://github.com/therobertcrocker/gestalt.git
   ```
3. In VS Code, open the `gestalt` folder, then run **Dev Containers: Reopen in Container**.
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
   ls /workspaces/gm-toolkit/docs/process                          # the source docs
   ```
2. Log in to GitHub: `gh auth login`. (Plain `git push` works without it, because VS Code injects a credential helper.)
3. Start `claude`. It should already be logged in. This repo's own memory folder (`projects/-workspaces-gestalt/memory/`) starts empty, which is expected: auto memory is per repo.
4. If the start or rebuild created or changed `.devcontainer/devcontainer-lock.json`, commit it.

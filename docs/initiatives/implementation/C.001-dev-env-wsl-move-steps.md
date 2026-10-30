# C.001 — Moving the dev environment into WSL

## In Plain Words

- **What:** move gestalt, gm-toolkit, wayfinder-dice-lab and the shared Claude state folder from `C:\` into the WSL filesystem. The devcontainers, the three mounts and the shared `~/.claude` stay as they are; only where the files live changes.
- **Why:** today every mount reaches the container over 9p from `C:\`. It is slow, and it corrupted a git ref during F.001 Phase 1.
- **How:** set up a WSL distro, clone the repos and copy the state folder into it, change the mount path, then reopen each container from WSL. Steps 4 and 5 are done by hand; a session afterwards commits the `devcontainer.json` change and updates the README.

## 1 — Get a Linux distro

In PowerShell on Windows:

```powershell
wsl -l -v
```

Docker Desktop already runs on WSL2, but it may have installed only its own `docker-desktop` distro. If that is the only one listed, install Ubuntu:

```powershell
wsl --install -d Ubuntu
```

It asks for a Linux username and password. To open it later: the Start menu (**Ubuntu**), the Windows Terminal dropdown, or `wsl` in PowerShell.

## 2 — Connect the tools

- **Docker Desktop:** Settings → Resources → WSL integration → turn on Ubuntu → Apply & restart. Check: `docker ps` in Ubuntu runs without an error.
- **VS Code, on Windows:** install the **WSL** extension. Dev Containers is already installed. VS Code itself is not installed in WSL; `code .` from WSL opens the Windows app and sets up a small server in WSL on its own.
- **GitHub, in Ubuntu:**

  ```sh
  sudo apt update && sudo apt install -y git gh
  gh auth login && gh auth setup-git
  git config --global user.name "Robert Crocker"
  git config --global user.email "sir.author.doyle@gmail.com"
  ```

## 3 — Move the files

Before this step: push all three repos, and close every container.

In Ubuntu:

```sh
mkdir -p ~/dev && cd ~/dev
git clone https://github.com/therobertcrocker/gestalt.git
git clone https://github.com/therobertcrocker/gm-toolkit.git
git clone https://github.com/therobertcrocker/wayfinder-dice-lab.git
git -C gestalt checkout feature/process-plugin-extraction
cp -a "/mnt/c/Users/<you>/.claude-devcontainer" ~/.claude-devcontainer
```

- The gm-toolkit and wayfinder-dice-lab URLs are guessed from gestalt's; use the real ones if they differ.
- The three repos stay sibling folders, so gestalt's read-only gm-toolkit mount (`${localWorkspaceFolder}/../gm-toolkit`) still resolves.
- Keep the Windows copy of `.claude-devcontainer` as a backup until everything works.
- Copying from WSL also fixes ownership: the files belong to your Linux user (uid 1000), which matches the container's `vscode` user.

## 4 — Fix the mount path, before the first container start

```sh
cd ~/dev/gestalt && code .
```

VS Code opens with **WSL: Ubuntu** in the bottom-left corner. In each repo's `.devcontainer/devcontainer.json`, change `${localEnv:USERPROFILE}` to `${localEnv:HOME}`.

Do this here, in the WSL window. `USERPROFILE` does not exist in WSL, so a container started first would get the wrong mount: Claude would start with no login and no memories.

## 5 — Start it and check

Run **Dev Containers: Reopen in Container**. Then, inside the container:

```sh
grep -E "/workspaces|/.claude" /proc/mounts   # no "9p" anywhere
ls ~/.claude/projects                         # all three projects listed
```

Start `claude` and do the README's **After a start or rebuild** checks. Repeat steps 4 and 5 for gm-toolkit and wayfinder-dice-lab.

## 6 — Close out in a session

- Commit the `devcontainer.json` change in each repo.
- Update gestalt's README: the host paths (`~/.claude-devcontainer` in WSL, the repos under `~/dev/`), and opening from WSL.
- F.001 Phase 4's devcontainer snippet uses `${localEnv:HOME}` (F.001 plan, Decision Record entry 5).
- Remove `C.001` from `docs/planned-work.md` and delete this file.

## Fallback

If write errors come back, or the host folder gets in the way, switch the state to one shared named volume. Every `devcontainer.json` mounts `source=claude-state,target=/home/vscode/.claude,type=volume`, and the state folder is copied into the volume once. A new volume may be owned by root, so the snippet may need a `chown` step; check that when building it.

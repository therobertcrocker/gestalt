# Process Plugin Extraction — Discovery

## In Plain Words

- **What:** turn Robert's way of working with Claude Code into one Claude Code plugin, built in this repo. The plugin loads the everyday rules at the start of every session. It gives the bigger guides (session modes, the style guide, the diagram kit) as skills that load when needed, and it ships the doc templates.
- **Why:** today all of this lives inside gm-toolkit. Its memories are tied to that one repo, so a new project starts with none of them, and copying the files would let the copies drift apart.
- **How it fits:** every project turns the plugin on from its own `.claude/settings.json`, and gets it from GitHub. A change to the process is made once, here, and every project picks it up. When Claude is corrected in any project, it still writes a memory there. A gestalt session later turns those memories into plugin rules.
- **What it unblocks:** projects two and three get the full process with no copying, and so does any new project. Each one adopts it with `/gestalt:adopt`.

## Problem

Robert's process grew up inside gm-toolkit, and it is spread across four places there (see **Source Inventory**):

- **`CLAUDE.md`** mixes rules for any project (collaboration, commits, merge steps, code style) with gm-toolkit facts (its docs table, Go, LSP).
- **`docs/process/`** (about 1,600 lines) holds the session modes, the style guide, the diagram kit and six templates. About 70 gm-toolkit paths are written into it.
- **`.claude/settings.json`** holds a useful SessionStart hook and some permissions.
- **51 auto memories.** 41 of them are process preferences, not gm-toolkit facts. Auto memory is kept per repo, so these exist only for gm-toolkit. A new project starts with zero of them, even inside the shared `~/.claude` mount.

There are now a second and a third project. Copying the files into them gives three copies that drift apart. Leaving things as they are means the new projects work without the process. Neither is acceptable.

The platform adds constraints: a plugin can't ship a `CLAUDE.md` or set permissions, and hook context is capped at 10,000 characters (see **Platform Constraints**). So the extraction can't just move the files. The rules need a new shape.

## Architecture Context

This repo has no architecture pages yet. The binding context is the Claude Code plugin platform; see **Platform Constraints** below.

## Design Summary

gestalt becomes a private GitHub marketplace with one plugin, `gestalt`, listed by a relative path (D11). The plugin has three layers, sorted by how often each piece is needed:

1. **Always-on rules.** They're loaded at every session start, and again after compaction, by SessionStart hooks. They come from the generic half of gm-toolkit's `CLAUDE.md` (D4) and the 22 memories that apply in any session (D3). They're shortened and split into two or three themed files, each under the 10,000-character cap, and a repo check guards the cap (D10). A project's own `CLAUDE.md` wins where it disagrees, except on paths (D2, D4). The architecture-index hook also moves here (D2).
2. **Skills loaded when needed.** `session-modes` is a short router with the flows and templates as reference files (D7). It has thin starter commands: `discovery`, `plan`, `execute` (D8). There are also `style-guide` (with a one-line always-on pointer, D9), `diagram-kit`, and a small `go` skill for Go-only rules (D5). The 17 memories that only matter in one mode go into these skills (D3).
3. **Upkeep skills, run by hand.** `graduate` turns process memories written in any project into rules (D6). `adopt` moves one project onto the plugin (D13).

Every project uses one fixed doc layout (D2), so the rules can name paths directly. Projects keep a short `CLAUDE.md` for their own facts, using the starter template (D4). They copy the devcontainer snippet for the shared `~/.claude` mount (D12). A plugin can't set permissions. Permissions needed everywhere, such as the diagram kit's mermaid `WebFetch`, go in user settings on the shared mount. Language-specific ones stay in each project.

F.001 builds the plugin and adopts it in gestalt. gm-toolkit and the other projects adopt it later, each as a chore in its own tracker (D13).

### Decisions

**D1 — The always-on rules ship in the plugin (2026-10-29).** The generic `CLAUDE.md` rules and the graduated memories live in this repo, and nowhere else. A plugin SessionStart hook loads them into context. We don't use `~/.claude/rules/`.

- **Why:** the rules get git history and work on any machine. They don't depend on the shared `~/.claude` mount, which has no off-machine backup.
- **Rejected:** `~/.claude/rules/` only (no history, needs the mount). Plugin copies the rules into `~/.claude/rules/` (an extra install step, and copies that can drift).
- **Risks to check:** hook context may carry less weight than `CLAUDE.md` content, and the hook must run again after compaction. See **Platform Constraints**, Not yet verified. *Later on 2026-10-29: the compaction re-run is verified. The weight risk is still open.*

**D2 — One fixed doc layout for every project (2026-10-29).** The plugin assumes `docs/planned-work.md`, `docs/initiatives/{discovery,implementation,arcs,completed}/` and `docs/architecture/`. A project can't override these paths. Parts a project doesn't use yet, such as arcs or an architecture wiki, are optional, and the rules say "if the project has X".

- **Why:** Robert runs every project, so they can all match. Overrides would bring back small differences between projects, and preventing those is the point of F.001. Most of the about 70 hard-coded paths are process layout, not gm-toolkit facts, so they stay as written.
- **Follow-ons:** gm-toolkit moves its tracker from `docs/dev_journals/faction-manager/planned-work.md` to `docs/planned-work.md`. Robert confirmed it can move. References between the process docs (`docs/process/...`) become references to the skills. gm-toolkit's architecture-index SessionStart hook now works in any project, so it moves into the plugin. The other gm-toolkit-only files (the dev journal, the frozen decisions log, the SWN rules, `contributing/`) stay in gm-toolkit's own `CLAUDE.md` table.
- **Rejected:** fixed defaults with a "Paths" override section in `CLAUDE.md`, and per-project path config read by the hook.

**D3 — The memories sort four ways (2026-10-29).** Of the 51 memories, 22 become always-on rules, 17 move into the skill for the mode where they matter, 2 go into a Go skill and 10 stay in gm-toolkit. **Memory Sort** below lists every memory.

- **Why:** a rule that matters in only one mode loads only with that mode's skill, so the session-start context stays small.
- **Correction to the seed notes:** **Persistence and Sharing** says about 48 memories are process rules. Only 41 leave gm-toolkit, and only 22 of those are always-on. Most of the 10 that stay are Go design rules for gm-toolkit's engine.

**D4 — `CLAUDE.md` splits into always-on rules and a short project file (2026-10-29).** The generic parts of gm-toolkit's `CLAUDE.md` move to the always-on rules, next to the D3 memories. gm-toolkit keeps about 15 lines. **CLAUDE.md Split** below lists each section.

- **Project wins:** if a project's `CLAUDE.md` contradicts a plugin rule, the project wins, and the rules file says so. D2 means paths can't use this exception.
- **Starter template:** the plugin ships a starter `CLAUDE.md` as a template (intro, tools, extra docs rows), so a new project starts in the right shape. A plugin can't load a `CLAUDE.md` as context (Platform Constraints), but it can ship one as a template file.

**D5 — General code style is always-on; Go rules are a skill (2026-10-29).** Full parameter names, YAGNI, no comments and fence-signs are always-on in every project. "Avoid type aliases" and "no one-const packages" go into a small Go skill that loads only when Go code is involved.

- **Why:** not every project is a Go project. Go rules shouldn't load in a project with no Go code.
- **Rejected:** all of them always-on (Go rules would load in non-Go projects). Code style per project (the same duplication F.001 removes).

**D6 — Rule changes reach gestalt through a memory inbox (2026-10-29).** When Robert corrects Claude in any project, Claude still writes a memory in that project. A `/gestalt:graduate` skill, run in a gestalt session, reads every project's memory folder through the shared `~/.claude` mount. It turns the process memories into rules and leaves the project facts where they are.

- **Why:** a correction takes effect straight away, as today, and gestalt stays the only place the rules are edited. The shared mount is what lets one gestalt session see every project's memories.
- **Rejected:** mounting gestalt in every container and editing the rules directly (one session makes commits in two repos). Collecting changes by hand (corrections get lost, the drift problem again).
- **Follow-on:** a memory that has graduated must be removed from its project, or it loads twice. The graduate skill does this.

**D7 — session-modes is one skill: a router with reference files (2026-10-29).** `SKILL.md` is short. It holds the lifecycle stages, the mode rules and a table that says which file to read for which kind of work. The per-type flows (feature, refactor, bugfix, docs and chore), efforts, arcs, session discipline and the 6 templates are separate files in the skill folder, and Claude reads them only when needed. The 15 session-modes memories (D3) go into the files where they apply.

- **Why:** a feature Discovery session reads `SKILL.md`, the feature flow and the discovery template, and nothing about arcs or bugfixes. Most of `session-modes.md` can move into the files with light edits.
- **Rejected:** one skill per mode (`session-modes.md` is organised by work type, not by mode, so it would need a rewrite, and the shared parts would split or be copied). One big file (about 1,200 lines whenever it loads).

**D8 — The plugin ships mode starter commands (2026-10-29).** `/gestalt:discovery <ID>`, `/gestalt:plan <ID>` and `/gestalt:execute <ID>` start a session the right way: read the tracker row, open or scaffold the doc, reflect back, ask the first question. Each one is a thin wrapper that points into the session-modes skill and doesn't copy it.

- **Why:** the routine for starting a session is the same every time. A starter writes it down once, so I don't have to rebuild it from memories each time.

**D9 — The style guide is a skill, plus one always-on pointer (2026-10-29).** The always-on rules have one line: before writing or editing a doc, load `/gestalt:style-guide`. The guide itself loads only then.

- **Why:** doc work is common, so a skill alone could be missed. The pointer costs one line of context per session, not 149.
- **Follow-on:** about a third of `style-guide.md` covers gm-toolkit-only docs (the dev journal, the tracking journal, the frozen decisions log). Under D4 those parts stay in gm-toolkit. The Plan decides where they live there.
- **Rejected:** always-on in full (149 lines in sessions that don't touch a doc). Skill only (relies on the description matching).

**D10 — The always-on rules are shortened and split into themed files (2026-10-29).** Each rule keeps the rule, a one-line why and the how-to. The incident stories stay in `sources/` as history. The rules go into two or three themed files (for example *working together*, *git and commits*, *code style*), and each file is loaded by its own SessionStart hook. A check in the repo fails when any file goes over 10,000 characters.

- **Why:** hook context is capped at 10,000 characters per string (Platform Constraints), and the raw material is about 31,000 (26,100 from the 22 memories, about 5,000 from `CLAUDE.md`). Without the check, a rule added through D6 could push a file over the cap, and its end would silently become a 2,000-character preview.
- **Rejected:** shorten only (one file right at the cap, with no room to grow). Split only (four or more files of stories loaded at every session start).

**D11 — Projects get the plugin from GitHub over HTTPS (2026-10-29).** Each project's `.claude/settings.json` declares the marketplace as `{"source": "git", "url": "https://github.com/therobertcrocker/gestalt.git"}` and enables the plugin in `enabledPlugins`. The plugin sits in the marketplace repo by a relative path, so it loads after the trust prompt with no install step (Platform Constraints).

- **Why:** a real, versioned plugin that works on any machine. Other projects see only pushed work, so an unfinished edit in gestalt can't reach them.
- **Credentials:** the repo is private. A no-prompt `git ls-remote` against it succeeded in this container on 2026-10-29, through VS Code's credential helper. The HTTPS URL form avoids the SSH probe, so `CLAUDE_CODE_PLUGIN_PREFER_HTTPS` isn't needed.
- **Updates:** omit `version` in `plugin.json`, so installs follow commits. Turn on auto-update for the marketplace once. That state lives on the shared `~/.claude` mount, so it covers every container. A pushed change loads one session later, or straight away after `/plugin marketplace update`.
- **Testing unpushed edits:** in gestalt, `claude --plugin-dir <plugin folder>` loads the working copy over the installed one. The Plan checks how that override behaves when the names are the same.
- **Rejected:** a read-only bind mount of the host checkout as a `directory` source. It has a faster edit loop, but unfinished edits leak into every project, and it only works with the sibling-folder layout.

**D12 — gestalt ships a standard devcontainer snippet as a template (2026-10-29).** Each project copies it into its own `devcontainer.json`. It has the shared `~/.claude` bind mount and `CLAUDE_CONFIG_DIR`. D11 needs no extra mount or env var.

- **Hook dependencies:** the plugin's hooks run in every project's container. If they use `jq`, as gm-toolkit's architecture-index hook does, the snippet must install it (gestalt's own `devcontainer.json` does this in `postCreateCommand`). The other way out is for the hooks to depend only on POSIX `sh`. The Plan picks one. Whichever it picks, the snippet and the hooks must agree. This answers Robert's note under Open Questions.

- **Why:** the mount lines are already copied across three repos. A template is still a copy, but it's small, stable, and there's one place to get it.
- **Rejected:** a Dev Container Feature (it may not be able to add bind mounts, and it's more work). No snippet.

**D13 — Projects adopt the plugin through a `/gestalt:adopt` skill (2026-10-29).** The plugin ships an adopt skill that walks one project through adoption. It checks the D11 settings and the D12 snippet. It shows the `CLAUDE.md` lines and the memories that repeat a plugin rule. It checks the D2 layout and lists what to move, and it lists permissions that belong in user settings. Each adoption is a chore in that project's own tracker, not part of F.001.

- **Scope of F.001:** build the plugin and adopt it in gestalt itself (its settings, a starter `CLAUDE.md`, the snippet). gestalt is the first test of the adopt routine.
- **Order in each project:** enable the plugin first and check that the rules load, then trim. For a session or two the rules load twice, which is harmless. Trimming first would leave a window with no rules.
- **gm-toolkit's adoption** covers: settings (D11), removing its own architecture-index hook (D2), trimming `CLAUDE.md` (D4) and the gm-toolkit-only parts of the style guide (D9), deleting `docs/process/`, moving the tracker (D2), and removing the 41 memories that left (D3; backed up in `sources/`).
- **Why:** gm-toolkit is read-only in gestalt's container, and under D11 gestalt isn't mounted in gm-toolkit's. A skill travels with the plugin, so the adopting session has it. Projects two and three reuse it.
- **Rejected:** an F.001 Effort 2 with a written gm-toolkit plan (the plan can't reach that container, and nothing can be reused). Ad hoc adoption by hand (paid for three times).

### Plugin Components

What the plugin ships, from D1 to D9. All names get the `gestalt:` prefix.

| Component | Kind | Source | Decision |
|---|---|---|---|
| Always-on rules | Text file, loaded by a SessionStart hook | 22 memories + the generic half of `CLAUDE.md` | D1, D3, D4, D5 |
| Architecture index | SessionStart hook | gm-toolkit `.claude/settings.json` | D2 |
| `session-modes` | Skill (router + reference files + templates) | `session-modes.md`, 6 templates, 15 memories | D7 |
| `discovery`, `plan`, `execute` | Starter skills, run by hand | new | D8 |
| `style-guide` | Skill | `style-guide.md` (the generic parts) | D9 |
| `diagram-kit` | Skill | `diagram-kit.md`, 2 memories | D3 |
| `go` | Skill | 2 memories | D5 |
| `graduate` | Skill, run by hand | new | D6 |
| Starter `CLAUDE.md` | Template file | new | D4 |
| Devcontainer snippet | Template file | gm-toolkit and gestalt `devcontainer.json` | D12 |
| Rules size check | Repo script (not shipped in the plugin) | new | D10 |
| `adopt` | Skill, run by hand | new | D13 |

### Memory Sort

The full D3 list. Names are the file names in `sources/gm-toolkit-memory/`.

| Destination | Count | Memories |
|---|---|---|
| Always-on rules | 22 | `communication_style`, `user_profile` (the generic half), `feedback_maintain_comms_profile`, `feedback_memory_discipline`, `feedback_yagni`, `feedback_verify_before_suggesting`, `feedback_interactive_questions`, `feedback_dont_trim_robert_lists`, `feedback_do_only_the_asked_step`, `feedback_no_shell_file_edits`, `feedback_side_tasks_to_agents`, `feedback_echo_banners`, `feedback_no_section_symbol`, `feedback_learn_by_doing_scope`, `feedback_no_learn_by_doing_tests`, `feedback_dislikes_ui_work`, `feedback_pre_commit_summary`, `feedback_git_add_all`, `feedback_git_commits`, `feedback_commit_timing_bundling`, `feedback_implementation_efficiency`, `feedback_no_placeholder_names` |
| Session-modes skill | 15 | `feedback_session_modes`, `feedback_discovery_discipline`, `feedback_plan_discipline`, `feedback_decisions_log_scope`, `feedback_interim_effort_review`, `feedback_branch_timing`, `feedback_branch_initiative_layering`, `feedback_table_one_liners`, `feedback_initiative_id_filenames`, `feedback_refactor_reground`, `feedback_handoffs_not_committed`, `feedback_no_plan_replay_checks`, `feedback_consult_arch_docs`, `feedback_arch_docs_reflect_source`, `feedback_deferred_refactor` |
| Diagram-kit skill | 2 | `feedback_diagram_authorship`, `feedback_block_keyword` |
| Go skill (D5) | 2 | `feedback_avoid_type_aliases`, `feedback_no_one_const_packages` |
| Stays in gm-toolkit | 10 | `feedback_terminology`, `feedback_lipgloss`, `project_data_location`, `feedback_claude_sandbox_copy`, `feedback_exploration_findings_log`, `feedback_rules_calls`, `feedback_data_driven_over_bespoke`, `feedback_two_channel_logger`, `feedback_error_return_over_observer`, `feedback_static_data_consolidation` |

### CLAUDE.md Split

The full D4 list, by section of `sources/gm-toolkit/CLAUDE.md`.

| Section | Goes to | Notes |
|---|---|---|
| Collaboration 1–4, 6–8 | Always-on rules | Item 8 (playful) merges with `communication_style` |
| Collaboration 5 (LSP, not grep) | Stays in the project | Depends on the project having an LSP server |
| Collaboration 9–11 (pre-commit, pre-merge, tagging) | Always-on rules | D2 removed the gm-toolkit paths |
| Collaboration 12–13 (conventional commits, Three Principles) | Always-on rules | |
| Documentation Discipline table | Split | Generic rows go to the always-on rules, and the style guide, diagram kit and session modes rows point to skills. The dev journal, `contributing/`, decisions log and SWN rules rows stay |
| Session Modes, Session Boundaries | Always-on rules (the short version), session-modes skill (the detail) | Mode boundaries apply in every session |
| Model Selection | Always-on rules | |
| Code Style | Always-on rules (D5) | |

## Open Questions

For the Plan session. Each one depends on detail that only shows up while writing the plan.

1. **How the rules files split by theme.** D10 fixes two or three files under the cap. Which rule goes in which file depends on how short the rules get, so the Plan decides it while it drafts them.
2. **Repo layout.** Whether the plugin sits at the repo root or in `plugins/gestalt/`, and how the `sources/` snapshots, the size check and the docs sit next to it. This is mechanical, but it fixes the `source` path in `marketplace.json`.
3. **Plan checks, not design questions.** Test that `claude --plugin-dir` overrides the installed copy of the same name (D11). Watch whether hook-loaded rules are followed as well as `CLAUDE.md` rules (D1). Only use will show this.

should gestalt also provide a standard devcontainer snippet? Right now the mount lines are copied into three repos, which is a small version of the same duplication problem. **Decided: yes, see D12.**

---

## Out of Scope

- **Adopting the plugin in gm-toolkit and projects two and three.** Each is a chore in that project's own tracker, done with `/gestalt:adopt` (D13). F.001 adopts it in gestalt only.
- **Redesigning the process.** The session modes, style guide and diagram kit move into skills with light edits: new paths, skill references, the gm-toolkit-only parts removed. Changing what the process *says* is separate work.
- **A shared memory pool across projects.** Rejected in **Persistence and Sharing**. Project facts stay in per-project auto memory.
- **Off-machine backup of `%USERPROFILE%\.claude-devcontainer`.** Git covers the rules. A backup of the rest of Claude's state is a separate decision.
- **Permissions in the plugin.** The platform can't do it. They go in user settings or project settings (**Design Summary**).
- **A plugin output style.** Only one can be active, so it would replace Learning mode (Platform Constraints).

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

**Verified later on 2026-10-29** (`hooks`, `plugins/host-marketplace`, `plugins/org`):

- **Project settings install the plugin.** A project's `.claude/settings.json` can set `extraKnownMarketplaces` and `enabledPlugins`. The marketplace is registered once the user accepts the workspace trust dialog for that folder. A plugin that the marketplace lists by a **relative path** then loads with no install step. A plugin listed by an external source (its own GitHub repo) does not: each user must run `claude plugin install` once.
- **Marketplace sources** include `github` (`{"source":"github","repo":"owner/repo"}`), `git` and `directory` (`{"source":"directory","path":"/abs/path"}`). A `directory` marketplace loads its plugins in place: edits take effect at the next session start, with no update step.
- **Private GitHub access** uses the git credentials already on the machine, and no prompt is allowed. A `owner/repo` source tries SSH first. With no SSH key, set `CLAUDE_CODE_PLUGIN_PREFER_HTTPS=1`, or installs from `/plugin` and updates fail.
- **Updates from a git marketplace** need `/plugin marketplace update`, or auto-update turned on by the user (it is off by default). With no `version` in `plugin.json`, users follow commits.
- **SessionStart runs again after compaction.** Its matchers are `startup`, `resume`, `clear`, `compact` and `fork`.
- **Hook context is capped at 10,000 characters per string.** Over the cap, Claude Code saves the output to a file and passes only the path and a 2,000-character preview. The cap can't be raised. Each hook's string is measured separately, so several hooks can each add up to 10,000 characters.
- **Hook context is added as a system reminder** at the start of the conversation. The docs advise writing it as factual statements, not as imperative system instructions.

**Still not verified:** that hook-injected rules carry about as much weight as `CLAUDE.md` content in practice (D1). Only real use will show this.

## Environment Notes

- ~~Only `/workspaces/gm-toolkit` is mounted from the Windows host. `~/.claude` and this clone (`~/gestalt`) live inside the container, so push often.~~ Out of date since gestalt's devcontainer (`31ce1c0`): gestalt is bind-mounted at `/workspaces/gestalt`, `~/.claude` is the shared host mount, and gm-toolkit is mounted read-only. See `README.md`.
- In this container, git works over HTTPS. SSH host keys aren't set up.
- `sources/gm-toolkit-memory/` is a frozen snapshot of the gm-toolkit memory folder (52 files, 2026-10-29). It is Discovery input and a backup. It is not a live copy.
- `sources/gm-toolkit/` is a frozen snapshot of the rest of the kit: `CLAUDE.md`, `.claude/settings.json` and `docs/process/` (11 files, gm-toolkit commit `5db4d96`, 2026-10-29). Same status as the memory snapshot.
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

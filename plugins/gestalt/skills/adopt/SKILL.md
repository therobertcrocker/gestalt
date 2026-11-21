---
name: adopt
description: Move the current project onto the gestalt plugin: settings, devcontainer snippet, CLAUDE.md imports, the doc layout, and a list of what the project can now drop. Works for an empty repo and for an existing project. Run by hand in that project's session.
disable-model-invocation: true
---

Adopt the gestalt plugin in the current project. Order: enable first, check that the rules load, then trim. For a session or two the rules may load twice, which is harmless; trimming first would leave a window with no rules.

Report each step as done, already done, or needs Robert. Make the edits with Edit and Write only. Ask before every deletion.

## 1. Settings

Check `.claude/settings.json` for an `extraKnownMarketplaces.gestalt` entry and `enabledPlugins["gestalt@gestalt"]: true`. If missing, add them, keeping any existing keys:

```json
{
  "extraKnownMarketplaces": {
    "gestalt": {
      "source": { "source": "git", "url": "https://github.com/therobertcrocker/gestalt.git" },
      "autoUpdate": true
    }
  },
  "enabledPlugins": { "gestalt@gestalt": true }
}
```

Tell Robert: the marketplace registers when he accepts the workspace trust dialog, and clones in the background after the session starts. If this session was the first in the container, the rules import may not resolve until the next session; restart once after this skill finishes.

## 2. Devcontainer

Check `.devcontainer/devcontainer.json` for the `~/.claude` bind mount and `CLAUDE_CONFIG_DIR`. If missing, merge `${CLAUDE_PLUGIN_ROOT}/templates/devcontainer-snippet.json` into it (read the file; add the mount to `mounts`, the variable to `containerEnv`, and the Claude install to `postCreateCommand` if Claude isn't installed another way). The hooks need no package beyond POSIX `sh`.

## 3. CLAUDE.md

- No `CLAUDE.md`: copy `${CLAUDE_PLUGIN_ROOT}/templates/CLAUDE.md` to the repo root, fill the project section with Robert, delete the guidance comments.
- Existing `CLAUDE.md`: add the three import lines from the template at the top, under the title. Then list every line or section that repeats a plugin rule (collaboration, commits, merge steps, code style, session modes, model selection, doc rows for the style guide, diagram kit, session modes and templates) and offer each for removal. Keep project facts: what it is, build and test commands, tools, an LSP rule, extra doc rows, and any rule the project wants to override (keep it, worded as an override).

The imports point outside the repo, so Claude Code shows an approval dialog once; Robert accepts it.

## 4. Doc layout

Ask Robert whether the project is single-product or multi-product (code-and-docs rules, Project layout) and, for multi-product, the product names. Record the shape and the products in the project section of `CLAUDE.md`.

Check for `dev_journals/planned-work.md`, `dev_journals/initiatives/{discovery,implementation,arcs,seeds,explorations,_completed}/` and `docs/architecture/`; in a multi-product project, check `dev_journals/project-planning.md` and the tracker and folders under each `dev_journals/<product>/`. Report which exist. For an empty repo, create the tracker with the Current Initiatives, Up Next, Explorations and Backlog tables and an empty write-ups section, and the six `initiatives/` folders with a `.gitkeep` each. A multi-product project also gets `dev_journals/project-planning.md` with a table of the products and their status, and one tracker and set of folders per product. For an existing project whose tracker lives elsewhere, list what moves; the move is Robert's call and its own commit.

Add the hand-off pattern to `.gitignore` if absent: `dev_journals/initiatives/implementation/*-handoff.md`, or `dev_journals/*/initiatives/implementation/*-handoff.md` for a multi-product project.

## 5. Permissions

A plugin can't set permissions. List what the project needs: the diagram kit's `WebFetch(domain:mermaid.js.org)` belongs in user settings on the shared mount (`~/.claude/settings.json`) since every project uses it; language-specific entries (`Bash(go test *)`, `LSP`) stay in the project's `.claude/settings.json`. Report, don't edit user settings.

## 6. Duplicates

- Hooks: if `.claude/settings.json` or `.claude/settings.local.json` has a SessionStart hook that lists `docs/architecture/`, offer to remove it; the plugin's hook does the same.
- Memories: read `~/.claude/projects/<this project's folder>/memory/MEMORY.md` and list every memory whose rule the plugin already carries. Offer to delete them (and their `MEMORY.md` lines). Memories about this project's own code and data stay. A memory that is newer than the plugin's rule is graduate's job, not deletion; say so.
- Process docs: if `docs/process/` exists and matches the plugin's skills (session modes, style guide, diagram kit, templates), offer to delete the folder. Parts with no plugin home are listed for Robert to re-home before deletion. For gm-toolkit those are: the Dev Journal, Tracking Journal, Section Order, frozen Decisions Log, Features Tracker and Progress sections of its style guide, and the dev-journal and decisions-log rows of its `CLAUDE.md` table.

## 7. Check

Tell Robert to start a new session and confirm: `/plugin` lists `gestalt@gestalt` as enabled; `/context` lists the three rules files under Memory files; `/gestalt:session-modes` is in the `/` menu. Then the trim steps above that were deferred can run.

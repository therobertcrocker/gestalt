# gestalt — Claude Instructions

@plugins/gestalt/rules/working-together.md
@plugins/gestalt/rules/git-and-delivery.md
@plugins/gestalt/rules/code-and-docs.md

## This project

- gestalt is the store for the process plugin and the bootstrapper for new projects. The plugin is `plugins/gestalt/`; the marketplace file is `.claude-plugin/marketplace.json`.
- This checkout imports the rules by relative path, so an edit to a rules file is live in the next session with no push. Skills and hooks come from the installed copy. To test unpushed skill or hook edits, run `claude --plugin-dir plugins/gestalt`; it replaces the installed copy for that session.
- Other projects import the rules from `~/.claude/plugins/marketplaces/gestalt/`, which Claude Code updates on `/plugin marketplace update` or in the background. A pushed change reaches them one session later.
- Single-product layout: the tracker and initiative folders sit directly in `dev_journals/`.
- `sources/` is a frozen snapshot of gm-toolkit's process and memories (2026-10-29). Discovery input and backup. Never edited, never loaded.
- `/workspaces/gm-toolkit` is mounted read-only in this container. Read it for reference; never edit it from here.
- No build or tests. The check is `claude plugin validate .` from the repo root.

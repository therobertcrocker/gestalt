---
name: feedback-claude-sandbox-copy
description: "Claude runs the app only against campaigns/sandbox-claude (gitignored copy); campaigns/sandbox is Robert's manual test bed"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 157580dc-d939-4bec-a0a7-a9e09f4935fa
  modified: 2026-10-23T18:38:35.931Z
---

When Claude runs the faction TUI or CLI, use `--campaign sandbox-claude` (gitignored at `campaigns/sandbox-claude/`, registered, not active). Never run against `campaigns/sandbox`, and never reset it.

**Why:** Robert asked for a private copy for Claude so his manual sandbox state never gets out of whack. `sandbox` stays his.

**How to apply:** Build the binary into the scratchpad, `reset-campaign.sh sandbox-claude <scenario>`, drive the TUI in a detached tmux session (`send-keys` + `capture-pane -p`). `--dryrun` uses an in-memory smoke campaign, so it does not test campaign data. If the copy drifts from `sandbox`, re-copy it and keep `campaign.toml` id `sandbox-claude`.

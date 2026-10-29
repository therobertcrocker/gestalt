---
name: feedback-git-add-all
description: "Always use git add -A when staging; don't check first or be selective"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 2a4fc0e9-74ca-4c5d-b80a-01811d60a4e4
---

Always use `git add -A` when staging commits. Don't check gitignore status, don't hand-pick files, don't run intermediate status commands first.

**Why:** Wastes tokens on back-and-forth. `-A` only stages what git tracks anyway (gitignored files are still ignored). If something gets added unexpectedly, that's caught at review time, not staging time.

**How to apply:** Every commit — just run `git add -A` then commit.

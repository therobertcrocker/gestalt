---
name: feedback-no-shell-file-edits
description: "Edit source and doc files only with Edit/Write tools — never python/sed/heredoc scripts, which desync the open VS Code buffers and gopls"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 2387e5d2-2321-47b4-89c7-48004e9a56a7
  modified: 2026-10-11T17:37:02.289Z
---

Change project files only with the Edit and Write tools. Do not use python scripts, `sed -i`, heredocs, or `sed -n ... > file` extraction, even for many mechanical find/replace pairs from a plan.

**Why:** Shell edits bypass the IDE integration. On s-flag Effort 1 Commit 2, a python script edited `rulebook.go` while it was open. gopls kept checking the stale buffer and showed a false `undefined: convertRelocate` in `effects.go`. A save from the stale tab would also have overwritten the work on disk. Robert asked that this not happen again; it was not necessary.

**How to apply:** Use one Edit call per find/replace anchor, and Write for new files, even when the plan gives literal code. Reading with Bash (`cat`, `grep`, `sed -n` to stdout) is still fine. Related: [[feedback-implementation-efficiency]].

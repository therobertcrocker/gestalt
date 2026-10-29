---
name: feedback_branch_timing
description: "When to cut the feature branch for a multi-effort initiative — overview plan on main, everything from effort planning on is on the branch"
metadata:
  node_type: memory
  type: feedback
  originSessionId: b789f016-e348-4730-8e46-c4a1db2161f9
  modified: 2026-10-26T15:45:15.749Z
---

For a multi-effort initiative, the overview plan is written and committed on `main`. The feature branch is cut right after that. Every effort session runs on the branch, including the per-effort Plan sessions, not only execution.

**Why:** Robert's call (2026-10-26, A.001.7). The overview is initiative-level framing that belongs with the discovery on main; effort plans are part of the branch's work and should merge with it.

**How to apply:** after the overview plan commits, cut `feature/<initiative-name>` (if Robert hasn't). At the start of any effort Plan or Execution session, confirm the branch is checked out before writing anything. Don't write "cut at the first execution session" in plan docs.

Related: [[feedback_branch_initiative_layering]], [[feedback_git_commits]], [[feedback_session_modes]].

---
name: feedback_pre_commit_summary
description: "At the end of an Execution (commit) session, the wrap-up report includes a plain-language summary and a small review — no asking first"
metadata:
  node_type: memory
  type: feedback
  originSessionId: a6e02c67-184e-4e5c-b9bc-ee06d59efc0c
  modified: 2026-10-21T22:48:38.366Z
---

When the work of a commit session is done (code written, tests green, staged) and before the commit, the end-of-session report includes a plain-language summary of what we did and a small review. Do not ask first; put it in the wrap-up report.

- Plain language: what changed and why, in everyday terms. Not a diff walk-through or a file list.
- Small review: one short pass for risks, gaps, or things that drifted from the plan. Not a full /code-review. That stays at pre-merge.
- Fold it into the normal wrap-up (status, deviations); don't add a separate "want the summary?" question.

**Why:** Robert does not want to commit work he does not fully understand. Asked for 2026-10-11; on 2026-10-21 he said the ask was redundant, since the wrap-up already summarizes, so the plain-language part and review go straight into it.

**How to apply:** Last step before the commit prompt in every Execution session. Still never commit until Robert says so ([[feedback_commit_timing_bundling]]).

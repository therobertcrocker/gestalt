---
name: feedback-interim-effort-review
description: "Every effort boundary gets an interim code review before the squash and the next effort; don't skip to \"next effort\""
metadata:
  node_type: memory
  type: feedback
  originSessionId: 99f4345a-0cbf-492c-b2e3-3c4c958594fd
  modified: 2026-10-22T18:55:56.694Z
---

When an effort's last phase is committed, the next step is always the Interim Effort Review: a senior-engineer `/code-review` of that effort's diff only (since the effort's first commit). It is not optional in practice, although `docs/process/session-modes.md` section 8 still calls it "optional ... Robert's call".

**Why:** Robert, 2026-10-22, after A.001.6 Effort 4 closed and I listed only "squash" and "Effort 5" as follow-ons: "Remember that we always have an interim review after an effort." The review catches structural issues while the next effort is still cheap to redirect.

**How to apply:** At an effort boundary, name the order: interim review → review `fix:` commits → effort squash (the fixes replay on top, kept separate, per [[git-commit-cadence-on-feature-branches]]) → next effort. The review does not touch planned-work or trigger a merge; that is the branch-level pre-merge checklist. The review runs in its own new session, not at the end of the execution session that closed the effort; that session ends once the last phase is committed.

---
name: feedback-handoffs-not-committed
description: Session hand-off files are never committed; the session that uses a hand-off deletes it
metadata:
  node_type: memory
  type: feedback
  originSessionId: 28d0e944-28a2-49b5-8cfa-9cc6b3f9b6e8
  modified: 2026-10-21T02:50:36.794Z
---

Hand-off files (e.g. `docs/initiatives/implementation/<initiative>-effort-N-handoff.md`) are written for the next session to read, are not staged or committed, and are deleted by the session that consumes them.

**Why:** Robert said so after I offered to commit an Effort 1 execution hand-off (2026-10-20). A hand-off is a transient message between sessions, not a project artifact; the plan's Decision Record carries anything durable.

**How to apply:** When writing a hand-off, don't offer to commit it. When starting a session from a hand-off, delete the file during that session. This overrides the CLAUDE.md "all file changes must be committed" rule for hand-off files only. Write hand-offs from `docs/process/templates/execution-handoff.md`, named `*-handoff.md` in `docs/initiatives/implementation/`: `.gitignore` ignores that pattern there (2026-10-21), so `git add -A` is safe. A hand-off elsewhere or named otherwise is not ignored. Because ignored files leave `git status`, deleting the consumed hand-off is the only guard against a stale one.

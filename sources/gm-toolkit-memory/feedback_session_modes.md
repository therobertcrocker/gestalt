---
name: feedback_session_modes
description: "Session-mode boundaries and how modes sequence — one mode per session, each phase is its own session, and the multi-Effort Discovery→Plan flow"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1d2bdcda-c2bc-49df-9b10-02be8388c99c
  modified: 2026-10-21T16:07:14.394Z
---

Work flows through three modes, each its own Claude session: **Discovery** (produces a discovery doc) → **Plan** (produces an implementation plan + its phase breakdown) → **Execution** (implements *one* phase). A session ends at its deliverable; do not start the next mode's work in the same session even if its inputs are ready.

**Why:** Each mode needs a different style of thinking (exploratory / architectural / executional). Mixing them degrades all three — planning goes shallow because the model is already on implementation, and implementation drifts from the plan because it was never internalized as a separate artifact. Robert has flagged this repeatedly; "it keeps happening."

**How to apply (boundaries):**
- **Plan → Execution is the most-violated boundary.** When the session produced an implementation plan, stop after it's written/approved/handed off. Don't write code, edit source, sketch the first file, or stage edits. End the turn confirming the deliverable.
- **Plan mode is a strong signal.** When plan mode is active and the deliverable is a file (discovery doc or implementation plan), that file is the *entire* session output. ExitPlanMode is the end of the session, not a handoff into implementation — don't queue file edits or Bash to run after exit.
- **Execution scope comes from the hand-off** (`session-modes.md` section 10, Execution scope). One phase = one session (set 2026-10-20). With no scope named, do one phase (work that fits one session is written as one phase). Finishing it does not mean the next phase starts in the same session.
- **The phase is the boundary, not the commit.** If the next commit is in the same phase, keep going in this session, even when the hand-off scoped only one commit ("If it is in the same phase, its the same session", 2026-10-21). Stop only at a phase end.
- **If Robert pushes to keep going,** suggest opening a new session rather than crossing the boundary.

**How to apply (multi-Effort flow):** For an initiative split into Efforts (sub-initiatives), the flow is **one Discovery doc** (across N sessions) that designs **all** Efforts → a **Plan stage producing an Effort Overview doc + one Effort Plan doc per Effort** (Plan mode, one session per doc) → execution. The single Discovery doc owns the full design surface for every Effort; per-Effort splitting happens only at Plan. Don't push later Efforts' design (e.g. their modals/UX) into their own discovery passes or into Execution-time decisions. At Plan time expect an Overview + N per-Effort plans, not one monolithic plan. (Robert corrected the assumption that Efforts 2/3 would get their own discovery passes.)

Related: [[feedback_discovery_discipline]], [[feedback_plan_discipline]].

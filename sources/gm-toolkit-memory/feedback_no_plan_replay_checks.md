---
name: feedback-no-plan-replay-checks
description: "Don't run anchor/replay validation scripts over a finished plan's Find/Replace edits"
metadata:
  node_type: memory
  type: feedback
  originSessionId: cdcd4751-8ba0-467f-926b-d7275ea08245
  modified: 2026-10-22T21:49:52.293Z
---

Don't replay or mechanically validate a plan's Find/Replace anchors after writing it (scripts that apply every edit in order to check they land).

**Why:** Robert sees it as execution-session work spent in a Plan session, for little benefit; the execution session re-grounds and the compiler catches misses anyway (2026-10-22, Effort 5 plan).

**How to apply:** In Plan sessions, quote anchors from the current source as you write tasks and stop there. Related: [[feedback_implementation_efficiency]], [[feedback_plan_discipline]].

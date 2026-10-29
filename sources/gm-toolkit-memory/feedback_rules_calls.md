---
name: feedback-rules-calls
description: "Rules interpretations (when an asset fires, how a tie reads) are Robert's call — ask, never settle them as \"micro-decisions\" in a plan"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 28d0e944-28a2-49b5-8cfa-9cc6b3f9b6e8
  modified: 2026-10-20T16:20:26.178Z
---

Any reading of game rules text that changes how often or when something happens at the table (e.g. "does Cracked Comms fire on a tie?") goes to Robert as an explicit question before it lands in a plan. Do not record it as a self-made micro-decision and mention it after the fact.

**Why:** In the A.001.6 Effort 1 plan session I ruled Cracked Comms out on ties on my own and only flagged it afterwards; a side agent caught it, and the rules doc (`swn-faction-mechanics.md:150`, "both Attack and Counterattack succeed") actually supported the other reading. Robert then made the call himself.

**How to apply:** While planning, when code needs a branch on rules semantics (ties, "succeeds", "attacked", timing words), check `docs/rules/` for the governing line, then ask through AskUserQuestion with both readings and their table-frequency consequences. See [[feedback_interactive_questions]].

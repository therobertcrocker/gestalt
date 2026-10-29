---
name: Don't over-read or over-think before writing
description: When the spec is detailed, read only the files strictly needed and start writing — don't pre-solve every edge case in your head
type: feedback
originSessionId: f9b616d4-6ba8-447c-a0be-79e16462fdbe
---
When an implementation doc specifies the work clearly (signatures, triggers, thresholds, formulas), trust it. Read only the files you'll directly import or call into. Don't pull in tangentially related files "for context."

**Why:** On goal_engine.go (Phase 2), I read attack.go, the full loader.go, mutation_engine.go twice, and action.go — none of which were necessary. The spec already had every handler's trigger, XP formula, and GoalLock type. It cost a large number of tokens for zero additional insight.

**How to apply:**
- Read the spec doc + the domain types you'll use directly (faction.go, mutation.go, etc.) + any data files needed (tags.toml). Stop there.
- Don't read existing action/engine files "to understand patterns" unless the spec is ambiguous about structure.
- Start writing. Let the compiler surface issues rather than pre-solving every edge case in internal deliberation.
- If I catch myself reading a third or fourth file before writing a line of code, stop and ask: does the spec already answer this?

**Refactor caveat:** This rule is calibrated for *feature* implementation, where the spec invents structure that didn't exist before. For *refactor* implementation, the spec is describing existing code, and the description may have drifted from reality. Before treating refactor-plan instructions as authoritative, verify the plan's claims about current source — at minimum, read the files the plan claims to be transforming. See [[feedback-refactor-reground]].

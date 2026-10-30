---
name: plan
description: Start a Plan session for one initiative, by its tracker ID. Run by hand at the start of the session.
disable-model-invocation: true
argument-hint: "[ID]"
---

Start a Plan session for initiative `$0`. Mode: Plan. The session ends when the plan is written and Robert has signed off; do not write code, edit source or stage edits.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `feature-flow.md` (the Plan section and Work breakdown levels apply to every type) and the flow file for the ID's type prefix. For a multi-effort initiative, read `efforts.md` too.
2. Read the `$0` row and write-up in `docs/planned-work.md`, then the discovery doc's In Plain Words, then the rest of it. For an effort plan, read the overview plan's In Plain Words and decisions first.
3. Check the branch. A single-effort plan is written on `feature/<initiative-name>`; cut it if on `main`. An overview plan is written on `main`; an effort plan on the branch. Say which applies before writing anything.
4. Re-ground: re-read the code the discovery doc describes. The doc is a snapshot and may have decayed; the plan is written against the source, not the doc.
5. Put the discovery doc's Open Questions to Robert, with context in one turn and the question batch in the next. Then settle phases, commits and tasks in conversation.
6. Write the plan in one pass from `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/implementation-plan.md` (or `docs-plan.md` for a multi-effort docs initiative) at the path `session-discipline.md`, File locations, gives. Check the two line budgets with the template's `awk` commands before sign-off.

---
name: execute
description: Start an Execution session for one initiative, by its tracker ID. Run by hand at the start of the session.
disable-model-invocation: true
argument-hint: "[ID]"
---

Start an Execution session for initiative `$0`. Mode: Execution. The session ends when the last commit in scope lands.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md` (Execution scope and Re-grounding) and the flow file for the ID's type prefix.
2. Look for a hand-off at `docs/initiatives/implementation/$0-*-handoff.md`. If one exists, read it: it names the plan, the phase and the commits in scope. Delete it during this session; it is never committed. If there is none, read the plan's Overview list and ask Robert which phase is in scope; with no answer, the scope is the next unfinished phase.
3. Confirm the feature branch is checked out.
4. Read the plan's In Plain Words, the In plain words line of the phase in scope, Decisions Ratified in Planning, the Decision Record so far, Shared Context, then the tasks of the first commit in scope.
5. Re-ground on the code each task touches. Check every Find anchor against the current source; log drift in the Decision Record before editing.
6. Run the commits in scope one at a time: edit with Edit and Write only, gate (build, test), log decisions, give the wrap-up summary and short review, commit with the plan's message, then start the next commit without asking. Stop at the end of the phase. If the work surfaces a scope change, pause and discuss before proceeding.

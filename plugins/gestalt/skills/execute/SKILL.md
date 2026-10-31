---
name: execute
description: Start an Execution session for one initiative, by its tracker ID or a work address that names an effort and phase. Run by hand at the start of the session.
disable-model-invocation: true
argument-hint: "[ID][.E<n>][.P<n>]"
---

Start an Execution session for `$0`. Mode: Execution. The session ends when the last commit in scope lands.

`$0` is a tracker ID, or a work address that adds `.E<n>` and `.P<n>` to it (`session-discipline.md`, File locations). Below, `<ID>` is the tracker ID: `$0` up to its first `.E` or `.P`.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md` (Execution scope, Re-grounding and File locations) and the flow file for the ID's type prefix.
2. Find the scope.
   - Look for a hand-off at `docs/initiatives/implementation/<ID>-*-handoff.md` or `<ID>.E*-handoff.md`. If one exists, read it: it names the plan, the phase and the commits in scope. Delete it during this session; it is never committed. If it names a different phase from `$0`, ask Robert which one is right.
   - If `$0` names a phase, that phase is the scope. With `.E<n>`, it is in effort n's plan, or in the overview plan's Effort n section when the effort has no plan of its own; without, in the single-file plan. In a multi-effort initiative, `.P<n>` without `.E<n>` does not name one phase: ask which effort.
   - If `$0` names an effort and no phase, the scope is that effort's first phase whose box is not ticked.
   - With no hand-off and no address, read the plan's Overview list and ask Robert which phase is in scope; with no answer, the scope is the first phase whose box is not ticked.
3. Confirm the feature branch is checked out.
4. Read the plan's In Plain Words, the In plain words line of the phase in scope, Decisions Ratified in Planning, the Decision Record so far, Shared Context, then the tasks of the first commit in scope.
5. Re-ground on the code each task touches. Check every Find anchor against the current source; log drift in the Decision Record before editing.
6. Run the commits in scope one at a time: edit with Edit and Write only, gate (build, test), log decisions, give the wrap-up summary and short review, commit with the plan's message, then start the next commit without asking. In a multi-effort initiative, the subject carries the effort scope `E<n>` (`feat(E2): ...`); add it if the plan's message has none. In the phase's last commit, tick the phase's box in the Overview list; if the phase finishes an effort, tick the effort's Done box in the overview plan's Effort Summary too, and end the wrap-up by naming the next step: `/gestalt:effort-close <ID>.E<n>` in a new session. Stop at the end of the phase. If the work surfaces a scope change, pause and discuss before proceeding.

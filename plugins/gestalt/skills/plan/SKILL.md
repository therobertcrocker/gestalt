---
name: plan
description: Start a Plan session for one initiative, by its tracker ID, or for one effort by a work address. Run by hand at the start of the session.
disable-model-invocation: true
argument-hint: "[ID][.E<n>]"
---

Start a Plan session for `$0`. Mode: Plan. The session ends when the plan is written and Robert has signed off; do not write code, edit source or stage edits.

`$0` is a tracker ID, or a work address `<ID>.E<n>` for the plan of effort n (`session-discipline.md`, File locations). Below, `<ID>` is the tracker ID: `$0` up to its first `.E`. With `.E<n>`, the session writes `$0-<initiative-name>-plan.md`.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `feature-flow.md` (the Plan section and Work breakdown levels apply to every type) and the flow file for the ID's type prefix. For a multi-effort initiative, read `efforts.md` too.
2. Read the `<ID>` row and write-up in `dev_journals/planned-work.md` (under `dev_journals/<product>/` in a multi-product project), then the discovery doc's In Plain Words, then the rest of it. For an effort plan, read the overview plan's In Plain Words and decisions first.
3. Check the branch. Every plan is written on `feature/<initiative-name>`, cut when Discovery started. If on `main`, say so and cut it before writing anything.
4. Re-ground: re-read the code the discovery doc describes. The doc is a snapshot and may have decayed; the plan is written against the source, not the doc.
5. Put the discovery doc's Open Questions to Robert, with context in one turn and the question batch in the next. Then settle phases, commits and tasks in conversation.
6. Write the plan in one pass from `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/implementation-plan.md` (or `docs-plan.md` for a multi-effort docs initiative) at the path `session-discipline.md`, File locations, gives. Check the two line budgets with the template's `awk` commands before sign-off.

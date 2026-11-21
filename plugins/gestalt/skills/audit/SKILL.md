---
name: audit
description: Run the audit of one refactor, by its R. ID - the current code inventoried, target shapes weighed and one chosen, in one session with three stops; the refactor's Plan comes next. Use when Robert asks to audit a refactor, or to start a refactor whose target shape is not known yet.
argument-hint: "[R.ID]"
---

Run the audit of refactor `$0`. An audit is a refactor's first session when its target shape is not known: it inventories the current code, weighs the candidate targets and chooses one. It runs the way an exploration runs, holds the refactor's Design Spec, and ends in one unscoped `docs:` commit on the refactor's branch.

A **stop** waits for Robert. Between stops, go on without asking.

1. **The address.** `$0` is an `R.` ID. If it is an `E.` ID, name `/gestalt:explore $0` and stop. Any other ID: say so and stop. In a multi-product project, every `dev_journals/` path below reads `dev_journals/<product>/`; when the product is not clear from the session, ask.
2. **Read** `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `refactor-flow.md` and `exploration-flow.md` in the same folder, and the template `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/exploration.md`. If `docs/architecture/` exists, read `architecture-overview.md` and the page that covers the area; their Key Decisions are binding.
3. **The row.** Find `$0` in Current Initiatives in `dev_journals/planned-work.md`. If there is no row, or it is not there, say so and stop: promotion is Robert's call. Read the write-up, and the seed if it points at one. If the row or the write-up names an exploration that already chose the target, that exploration counts as the audit: say so, name `/gestalt:plan $0` and stop.
4. **Branch.** On `main`, check out `feature/<initiative-name>` if it exists, or cut it if it does not, before anything is written; every session of the refactor runs on it.
5. **The doc.** If `dev_journals/initiatives/explorations/$0-*-audit.md` exists, read it and continue from the state its header gives. Otherwise copy the template to `dev_journals/initiatives/explorations/$0-<name>-audit.md`, with `<name>` the initiative name in kebab-case, and leave out the EXPLORATION-ONLY section.
6. **The middle.** Run the seven steps and three stops of `exploration-flow.md`. Before the second stop, Robert's review of the audit, draft the Design Spec; Robert ratifies it at that stop, before any option is written. At the flow's step 7, file nothing.
7. **Commit.** `git add -A`, then one commit with the subject `docs: $0 audit` and the session's attribution lines.
8. **The end.** Name the next step: `/gestalt:plan $0`, in a new session. Do not promote or edit any row.

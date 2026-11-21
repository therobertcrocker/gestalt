---
name: explore
description: Run an exploration for one row of the Explorations table, by its E. ID - a question looked into, options weighed and follow-on rows filed, in one session with two stops. Use when Robert asks to explore a question or to run an exploration. For a refactor's audit, use the audit skill.
argument-hint: "[E.ID]"
---

Run the exploration `$0`. An exploration answers a question that has no row yet: it looks into the question, weighs options and files each follow-on as its own row. It is one session, and ends in one unscoped `docs:` commit on the branch the session stands on.

A **stop** waits for Robert. Between stops, go on without asking.

1. **The address.** `$0` is an `E.` ID. If it is an `R.` ID, name `/gestalt:audit $0` and stop. Any other ID: say so and stop. In a multi-product project, every `dev_journals/` path below reads `dev_journals/<product>/`; when the product is not clear from the session, ask.
2. **Read** `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `lifecycle.md` and `exploration-flow.md` in the same folder, and the template `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/exploration.md`.
3. **The row.** Find `$0` in the Explorations table of `dev_journals/planned-work.md`. If there is no row, say so and stop: a new row is Robert's call. Read each doc or row that the row says the answer feeds.
4. **Checks**, before anything is written:
   - `git status --porcelain` prints nothing. If it prints, show it and stop: the exploration's commit uses `git add -A`, so that work would ride in it. Robert commits it first, or says to let it ride.
   - On a branch other than `main`, if the newest subject with an `(E<n>)` scope in `git log --format=%s main..HEAD` is not a closed effort's `fix(E<n>): address effort review findings`, warn: an effort is in progress, the exploration's commit is unscoped, so `/gestalt:effort-close` step 3 will stop on it and ask Robert to keep it there. This is a warning, not a stop.
5. **Branch.** No branch is cut. The commit lands on the branch the session stands on, `main` included.
6. **The doc.** If `dev_journals/initiatives/explorations/$0-*-exploration.md` exists, read it and continue from the state its header gives. Otherwise copy the template to `dev_journals/initiatives/explorations/$0-<name>-exploration.md`, with `<name>` the row's Item in kebab-case, and leave out the AUDIT-ONLY section.
7. **The middle.** Run the seven steps and two stops of `exploration-flow.md`. At the second stop, propose an ID for each new row: the next free number for its prefix, one more than the highest number with that prefix in the tracker and in the folder names at every depth under `dev_journals/initiatives/_completed/`. Robert confirms the rows and their IDs with his sign-off.
8. **File**, the flow's step 7:
   - Add each new row to the Backlog table for its type (`lifecycle.md`, Stage 1), apply each row change, and remove each closed row.
   - For each piece of work the exploration feeds: a row in the Backlog or Up Next takes the answer in its Detail. A Current Initiative's write-up gets one line, "Answered by `$0`: [link to the doc]", and nothing more.
   - Mark each row Filed in the doc, set the header's Status to complete, and remove the `$0` row from the Explorations table. The doc stays in `explorations/`.
9. **Commit.** `git add -A`, then one commit with the subject `docs: $0 <name in plain lower-case words> exploration` and the session's attribution lines.
10. **The end.** Name the next mode for each follow-on row, from "How it lands". Do not promote any row; promotion is Robert's call (`lifecycle.md`).

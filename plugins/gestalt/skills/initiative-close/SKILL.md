---
name: initiative-close
description: Close one initiative by its tracker ID, in one session - branch review, one fix commit for the picked findings, a retro, the rest of the pre-merge checklist, then the merge and the tag. Run by hand after the initiative's last phase, or its last effort close, is committed.
disable-model-invocation: true
argument-hint: "<ID>"
---

Close the initiative `$0`. Mode: Initiative close. The session ends when the merge is tagged, or when Robert decides no tag is warranted. It does not push or delete the branch.

`$0` is a tracker ID. If it names an effort or a phase (`.E<n>`, `.P<n>`), ask whether Robert meant `/gestalt:effort-close` or `/gestalt:execute`.

A **stop** waits for Robert. Between stops, go on without asking.

1. **Read.** `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md` (File locations, Decision records), the flow file for the Type in the tracker row, `efforts.md` if the initiative has an overview plan, and `arcs.md` if it is in an arc. Then the `$0` row and its write-up in `docs/planned-work.md`; note the Type, which step 9 needs after step 8 removes the row. Then the discovery doc and every plan: In Plain Words first, then the decisions and the Decision Record. For an arc initiative, read the arc concept, arc-discovery and arc-plan under `docs/initiatives/arcs/`. If `docs/architecture/` exists, read `architecture-overview.md` and the pages the work touched. Initiative close is for an initiative with a branch and a plan; for a trivial bugfix, a chore or a single-session docs item, say so and stop.
2. **Checks.** If one fails, say which one and stop.
   - The feature branch is checked out, not `main`.
   - Every phase box in the plan's Overview is ticked. With an overview plan, every Done box in the Effort Summary is ticked.
   - With an overview plan, every effort is closed: this prints nothing.
     ```sh
     git log --format='%h %s' main..HEAD | grep -E '^[0-9a-f]+ [a-z]+\(E[0-9]+\)!?:' | grep -vE '^[0-9a-f]+ fix\(E[0-9]+\):'
     ```
     If it prints commits, name their effort and `/gestalt:effort-close <ID>.E<n>`.
   - `git status --porcelain` prints nothing.
   - The gate passes: the build and test command in the project's `CLAUDE.md`.
3. **Review.** The base is `git merge-base main HEAD`. Show it and `git log --oneline <base>..HEAD`. A docs initiative whose diff changes no code skips the review (`docs-chore-flow.md`, Pre-Merge Checklist): say so and go to step 4; if unsure whether something counts as code, ask. Otherwise point the upstream at the base for the length of the review:
   ```sh
   git rev-parse --abbrev-ref @{upstream}   # the old upstream; an error means there is none
   git branch -f review/$0-base <base>
   git branch --set-upstream-to=review/$0-base
   ```
   If the old upstream is `review/$0-base`, an earlier run stopped mid-review and the real upstream was lost: ask Robert what it was. Run `/code-review high` with no target, through the Skill tool. It runs as a background agent; go on to step 4 while it runs.
4. **Retro.** Copy `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/retro.md` to `docs/initiatives/implementation/$0-<initiative-name>-retro.md`, with the initiative name from the discovery doc's file name. If the file exists from an earlier run, continue from it. Fill every section from what step 1 read, `git diff <base>..HEAD` and the changed code. Leave the Rework score for step 6.
5. **Pick.** Wait for the review's findings. Then put the upstream back with `git branch --set-upstream-to=<old upstream>`, or `git branch --unset-upstream` if there was none, and delete the temporary branch with `git branch -D review/$0-base`. If there are no findings, say so and go to step 7. Otherwise show every finding, numbered, with its `file:line` and summary. **Stop:** Robert picks the findings to fix. Ask with AskUserQuestion, multi-select; with more than four findings, add questions rather than drop any, and split the findings evenly so each question has at least two options. A finding Robert does not pick but wants kept goes into the retro's Follow-ups as a row.
6. **Fixes.** If Robert picked nothing, go to step 7. Otherwise, for each pick in turn: edit with Edit and Write only, then run the gate. Running this skill approves each pick, so do not wait for a go-ahead between fixes. If a fix changes what a plan says, log it in that plan's Decision Record and fix the plan body. If a fix turns into a design call, stop and ask. After the last pick, `git add -A` and make one commit for all the picks. Write its message file with the Write tool in the scratchpad: the subject `fix: address initiative review findings`, a blank line, one bullet per pick that says what it fixes, then the session's attribution lines. Commit with `git commit -F <message file>`.
7. **Retro sign-off.** Fill the retro's Rework score. Show the retro's In Plain Words, each answer in short, the rating table and the verdict. **Stop:** Robert signs off, or says what to change; edit the retro until he signs off. Then, if Follow-ups has rows, **stop:** Robert picks the rows that go into the tracker, with AskUserQuestion multi-select split as in step 5.
8. **Close-out.** The pre-merge checklist, steps 2 to 4 (git-and-delivery rules, Merging and tagging):
   - If `docs/architecture/` exists, load `/gestalt:style-guide`, then graduate architecturally significant entries from the plans' Decision Records into the matching page's Key Decisions.
   - In `docs/planned-work.md`, remove the `$0` row and its write-up, and add the picked follow-up rows to the Backlog.
   - Move the discovery doc, every plan and the retro with `git mv` into the completed folder that `session-discipline.md`, File locations, names: `docs/initiatives/_completed/$0-<initiative-name>/`, or for an arc initiative `docs/initiatives/_completed/arcs/<arc-ID>-<arc-name>/initiatives/$0-<initiative-name>/`. For an arc initiative, also follow `arcs.md`, Arc completion.

   Run the gate, `git add -A`, and commit with the subject `docs: close $0` and the session's attribution lines.
9. **Merge.** Write the merge message file with the Write tool in the scratchpad. The subject is `<type>: $0 <initiative name>`: the type from the Type noted in step 1 (`feat` for feature, `refactor` for refactor, `docs` for docs, `fix` for bugfix), the name in plain lower-case words, as in `feat: F.002 effort close skill`. Then a blank line, the retro's In Plain Words as the body, and the session's attribution lines. **Stop:** Robert approves the merge. Then:
   ```sh
   git checkout main && git merge --no-ff <feature branch> -F <message file>
   ```
   If the merge conflicts, run `git merge --abort`, show the conflicting files and stop.
10. **Tag.** Find the current version with `git describe --tags --abbrev=0`. Propose a patch, minor or major bump with one line of why, or say that no bump is warranted and why. **Stop:** Robert approves the version. Tag the merge commit with `git tag <version>`. Do not push. End the wrap-up with the retro's In Plain Words and verdict. If `$0` is in an arc and was the last initiative in the arc-plan to merge, name the next step: `/gestalt:arc-close <arc-ID>` in a new session.

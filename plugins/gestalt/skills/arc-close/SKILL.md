---
name: arc-close
description: Close one arc by its tracker ID, in one session, after its last initiative has merged - a review of the seams between its initiatives, one fix commit for the picked findings, an arc retro, then moving the arc's docs, the merge and the tag. Run by hand.
disable-model-invocation: true
argument-hint: "<arc-ID>"
---

Close the arc `$0`. Mode: Arc close. The session ends when the close merge is tagged, or when Robert decides no tag is warranted. It does not push or delete the branch.

`$0` is an arc's tracker ID, such as `A.001`. Below, the arc folder is `docs/initiatives/arcs/$0-<arc-name>/` and the completed folder is `docs/initiatives/_completed/arcs/$0-<arc-name>/`.

A **stop** waits for Robert. Between stops, go on without asking.

1. **Read.** `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md` (File locations, Decision records) and `arcs.md`. Then the `$0` row in `docs/planned-work.md`, and the arc concept, arc-discovery and arc-plan in the arc folder, In Plain Words first. Then, for each initiative under the completed folder's `initiatives/`, the In Plain Words of its discovery doc and its retro. An initiative that closed before retros existed has none; read its plans' Decision Records instead. If `docs/architecture/` exists, read `architecture-overview.md` and the pages the arc touched.
2. **Checks.** If one fails, say which one and stop.
   - `main` is checked out.
   - `git status --porcelain` prints nothing.
   - The gate passes: the build and test command in the project's `CLAUDE.md`.
   - Every initiative in the arc-plan's initiative list has its merge on `main`. For each ID, this prints one line:
     ```sh
     git log --merges --first-parent --format='%h %s' main | grep -F ': <ID> '
     ```
     An initiative the arc dropped is noted as dropped in the arc-plan. If one is missing with no note, name it and stop.

   Note each initiative's merge commit. Then cut `feature/<arc-name>-close`.
3. **Review.** Start the arc review with the Agent tool: `subagent_type: general-purpose`, `run_in_background: true`. Its prompt tells it to read `${CLAUDE_PLUGIN_ROOT}/skills/arc-close/review-brief.md`, with the path written out in full, and follow it. Then it gives the arc folder, the completed folder, and one line per initiative with its ID and merge commit. Go on to step 4 while it runs.
4. **Retro.** Copy `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/retro.md` into the arc folder as `$0-<arc-name>-arc-retro.md`. If the file exists from an earlier run, continue from it. Fill it at the level of the arc: hold the arc against its concept and arc-plan, build on the initiative retros, and do not repeat them. Leave the Rework score for step 6.
5. **Pick.** Wait for the agent's findings. If there are none, say so and go to step 7. Otherwise show every finding, numbered, with its `file:line`, the initiatives it involves and its summary. **Stop:** Robert picks the findings to fix now. Ask with AskUserQuestion, multi-select; with more than four findings, add questions rather than drop any, and split the findings evenly so each question has at least two options. A finding too large for a fix commit, or one Robert does not pick but wants kept, goes into the retro's Follow-ups as a row.
6. **Fixes.** If Robert picked nothing, go to step 7. Otherwise, for each pick in turn: edit with Edit and Write only, then run the gate. Running this skill approves each pick, so do not wait for a go-ahead between fixes. If a fix turns into a design call, stop and ask. After the last pick, `git add -A` and make one commit for all the picks. Write its message file with the Write tool in the scratchpad: the subject `fix: address arc review findings`, a blank line, one bullet per pick that says what it fixes, then the session's attribution lines. Commit with `git commit -F <message file>`.
7. **Retro sign-off.** Fill the retro's Rework score. Show the retro's In Plain Words, each answer in short, the rating table and the verdict. **Stop:** Robert signs off, or says what to change; edit the retro until he signs off. Then, if Follow-ups has rows, **stop:** Robert picks the rows that go into the tracker, with AskUserQuestion multi-select split as in step 5.
8. **Close-out.**
   - If `docs/architecture/` exists, load `/gestalt:style-guide`, then graduate the arc-discovery's durable decisions into the matching pages' Key Decisions.
   - In `docs/planned-work.md`, remove the `$0` row and its write-up, and add the picked follow-up rows to the Backlog.
   - Move every file in the arc folder (the concept, arc-discovery, arc-plan and arc retro) with `git mv` into the completed folder, next to `initiatives/`. Remove the empty arc folder.

   Run the gate, `git add -A`, and commit with the subject `docs: close $0` and the session's attribution lines.
9. **Merge.** Write the merge message file with the Write tool in the scratchpad: the subject `chore: close $0 <arc name>`, with the arc name in plain lower-case words, a blank line, the retro's In Plain Words as the body, and the session's attribution lines. **Stop:** Robert approves the merge. Then:
   ```sh
   git checkout main && git merge --no-ff feature/<arc-name>-close -F <message file>
   ```
   If the merge conflicts, run `git merge --abort`, show the conflicting files and stop.
10. **Tag.** Find the current version with `git describe --tags --abbrev=0`. Propose a patch, minor or major bump with one line of why, or say that no bump is warranted and why. **Stop:** Robert approves the version. Tag the merge commit with `git tag <version>`. Do not push. End the wrap-up with the retro's In Plain Words and verdict.

---
name: effort-close
description: Close one effort of a multi-effort initiative by its work address, in one session - interim review, one fix commit for the picked findings, then the effort squash. Run by hand after the effort's last phase is committed.
disable-model-invocation: true
argument-hint: "<ID>.E<n>"
---

Close the effort `$0`. Mode: Effort close. The session ends when the squash is verified. It does not merge, push, or change the tracker or the Effort Summary.

`$0` is a work address `<ID>.E<n>` (`session-discipline.md`, File locations). Below, `<ID>` is `$0` up to its first `.E`, and `n` is the number after it. If `$0` names no effort, ask which one.

A **stop** waits for Robert. Between stops, go on without asking.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/efforts.md` (Interim Effort Review). Read the overview plan at `dev_journals/initiatives/implementation/<ID>-*-overview-plan.md` (under `dev_journals/<product>/` in a multi-product project): its In Plain Words, then the Effort Summary row for effort n, which gives the effort's name. Then read effort n's plan, `$0-*-plan.md` in the same folder, or the overview plan's Effort n section when the effort has no plan of its own. From its Decision Record, list by number every entry that leaves a gap open: a known fault that stays, or work sent to a later effort. Read its Look Here First section, if it has one.
2. **Checks.** If one fails, say which one and stop.
   - The feature branch is checked out, not `main`.
   - Effort n's Done box is ticked in the Effort Summary.
   - `git status --porcelain` prints nothing.
   - The gate passes: the build and test command in the project's `CLAUDE.md`.
3. **Base.** Every commit of effort n carries the scope `E<n>`, such as `feat(E2): ...` (git-and-delivery rules). The base is the commit just before the first of them. List them, oldest first:
   ```sh
   git log --reverse --format='%h %s' main..HEAD | grep -E '^[0-9a-f]+ [a-z]+\(E<n>\)!?:'
   ```
   The base is the parent of the first commit listed: `git rev-parse <first>^`. If nothing is listed, say so and ask Robert for the base. Then check that the effort is one unbroken run: `git log --format='%h %s' <base>..HEAD | grep -vE '^[0-9a-f]+ [a-z]+\(E<n>\)!?:'` prints nothing. If it prints commits, show them and stop; Robert decides where they belong.

   Show the base and `git log --oneline <base>..HEAD`. **Stop:** Robert confirms the base or names another one.
4. **Review.** `/code-review` with no target reviews `@{upstream}...HEAD`. Point the upstream at the base for the length of the review:
   ```sh
   git rev-parse --abbrev-ref @{upstream}   # the old upstream; an error means there is none
   git branch -f review/$0-base <base>
   git branch --set-upstream-to=review/$0-base
   ```
   If the old upstream is `review/$0-base`, an earlier run stopped mid-review and the real upstream was lost: ask Robert what it was. Run `/code-review high` with no target, through the Skill tool. It runs as a background agent: wait for its findings before you go on. Then put the upstream back with `git branch --set-upstream-to=<old upstream>`, or `git branch --unset-upstream` if there was none, and delete the temporary branch with `git branch -D review/$0-base`.
5. **Pick.** Hold the findings against the two lists from step 1. Mark each finding that a Decision Record entry already logs with the entry's number and where the entry sent it. For each Look Here First item that no finding covers, read the spot yourself; if something is wrong there, add it as a finding and mark it as the close session's own. Show every finding, numbered, with its `file:line` and summary. **Stop:** Robert picks the findings to fix. Ask with AskUserQuestion, multi-select; with more than four findings, add questions rather than drop any, and split the findings evenly so each question has at least two options.
6. **Fixes.** Note the effort head: `git rev-parse HEAD`. If Robert picked nothing, go to step 7. Otherwise, for each pick in turn: edit with Edit and Write only, then run the gate. Running this skill approves each pick, so do not wait for a go-ahead between fixes. If a fix changes what the effort's plan says, log it in that plan's Decision Record and fix the plan body. If a fix turns into a design call, stop and ask. After the last pick, give the wrap-up summary and short review, `git add -A`, and make one commit for all the picks. Write its message file with the Write tool in the scratchpad: the subject `fix(E<n>): address effort review findings`, a blank line, one bullet per pick that says what it fixes, then the session's attribution lines. Commit with `git commit -F <message file>`.
7. **Squash check.** Show the fix commit, if there is one: `git log --oneline <effort head>..HEAD`. Find whether the effort was pushed: `git branch -r --contains <first effort commit>`, where the first effort commit is the oldest in `git rev-list <base>..<effort head>`. Any output means it was pushed. **Stop:** Robert approves the squash. If the effort was pushed, say that the squash rewrites pushed history and needs a force-push.
8. **Squash.** Write the message file with the Write tool in the scratchpad: the subject `feat: <ID> effort <n> — <effort name>`, a blank line, one bullet per commit in `<base>..<effort head>` that sums it up, then the session's attribution lines. Then:
   ```sh
   git branch backup/$0-pre-squash HEAD &&
   tree=$(git rev-parse <effort head>^{tree}) &&
   squash=$(git commit-tree $tree -p <base> -F <message file>) &&
   git rebase --onto $squash <effort head> &&
   git log --oneline <base>..HEAD &&
   git diff --quiet backup/$0-pre-squash HEAD && echo "tree identical"
   ```
   Run it as one command; a failed step stops the rest. If `backup/$0-pre-squash` already exists from an earlier run, the first step fails: show that branch and stop, because Robert decides whether it still matters. The log shows the one `feat:` commit, with the fix commit on top if there is one. If any step fails, or `tree identical` is not printed, stop: the backup branch holds the state before the squash. Leave the backup branch for Robert to delete. If the effort was pushed, say that `git push --force-with-lease` is needed. Do not push. If this was the initiative's last effort, end by naming the next step: `/gestalt:initiative-close <ID>` in a new session.

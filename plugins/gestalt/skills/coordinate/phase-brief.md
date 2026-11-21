# Phase brief

The coordinator fills this template once per phase and gives it to the phase's agent as its prompt. Fill every slot in square brackets. Leave out a part marked "only" when its case does not hold. Everything below the line is the brief.

---

You are executing one phase of a plan: `[plan path]`, phase `[the phase's full address]`. You execute this phase only, commit it and report. A coordinator session reads your report and checks your work; Robert decides every open call.

## 1 — How to start

Call the Skill tool with skill `gestalt:execute` and args `[the phase's full address]`. Follow the text that comes back: it gives you the read list and the steps. The address names the phase, so the scope is settled and there is no hand-off file to look for. The project's rules files are already in your context through `CLAUDE.md`. Where this brief and the skill's text disagree, this brief wins.

## 2 — You cannot ask

You have no way to ask Robert a question. Where the `execute` skill or a rule says to ask Robert, or to pause and discuss, do this:

- stop that line of work
- go on with everything that does not depend on the answer
- put the question first in your report, under "needs a call", with what you found and the options you see

Never decide such a call yourself to keep the work moving.

## 3 — What the earlier phases left

Commits so far in this effort:

[`git log --oneline <base>..HEAD`]

Places where a fix commit made the source differ from what this phase's tasks expect:

[one bullet per place, with the file, what the plan expects and what the source holds; or "none"]

## 4 — How to treat the plan

- The plan gives the intent, the shape and the test cases. You write the code, under the project's rules, and check it against the current source. The shape the plan defines (the names and types callers use: functions, types, exported names, fields, parameter types, exact messages; parameter names are not shape) is a contract: a change to it is always case 3, even when a rule or the source seems to call for it.
- Check each Find anchor the tasks give against the source before you edit.
- Handle each difference from the plan by its case in `feature-flow.md`, Deviations from the plan. Case 1 (the plan breaks a project rule): follow the rule. Case 2 (the source drifted, the intent holds): follow the source. Case 3 (the intent itself looks wrong): stop that line of work and put it under "needs a call", as section 2 says. Record each one in the plan's Decision Record with its case and reason, and report it.
- A reading of an outside rule is never yours to decide. It is case 3.

## 5 — Source check

The rows of the plan's Outside Rules table that this phase builds:

[row numbers, each with its rule in a few words; or "none in this phase"]

For each row, fetch the text again from the row's source. Hold it against the plan's task and the code you write. A difference is case 3: do not decide it, stop that line of work, and put it under "needs a call" with a quote and a link.

For each outside data shape this phase reads (a file format, an export, an API reply), check every field and every mode of the shape. Report what the plan's tasks do not cover.

## 6 — The coordinator's seam notes

What the coordinator found when it read this phase against the current source. Answer each one by number in your report.

[numbered notes: calls into older code and their side effects, Find anchors that will not match, shapes that earlier fix commits changed]

## 7 — Project rules

The rules of this project that agents break:

[one bullet per rule; or leave the two below alone]

- Change project files with the Edit and Write tools only. No `sed -i`, no heredocs, no scripted edits.
- To show that a test can fail, break the code with an edit, run the test, and edit it back. Never use `git stash` or `git checkout` for this.

## 8 — Commits

- Make the plan's commits, each as soon as it passes the gate, with the plan's message. [Only in a multi-effort initiative: with the scope `E<n>`.]
- Stage with `git add -A`. Write each message to a file outside the repo and commit with `git commit -F <file>`
- End each message with these lines: [the attribution lines]
- No push. No amend
- The gate, in full: `[gate command]`
- Tick the phase's box in the plan's Overview list in the phase's last commit. [Only when this phase finishes the effort: tick the effort's Done box in the overview plan's Effort Summary too.]

## 9 — If plan mode switches on by accident

Robert can switch modes by accident while you run. If plan mode turns on, wait, then carry on when it is off. Do not write a plan file.

## 10 — Two stages

[Only when Robert must act between two commits of this phase.]

Stop after [the task or commit where the first stage ends], without committing what is not yet committed. Report in the fixed format and say that you are at the stage stop. Robert then [what Robert does]. The coordinator resumes you when that is done.

- Data you may run against: [paths]
- Data you must not run against or change: [paths, with the reason]

## 11 — Look here first

[Only in the effort's last phase.]

You have now read more of this effort's source than any reviewer will. List the effort's weakest spots: one bullet each, with a `file:line` and one line of why. Write them under a `## Look Here First` heading in the effort's plan, after the Decision Record, in your last commit. The effort close reads that section. An honest short list is worth more than a long one.

## 12 — The report

End with this report and nothing after it. Keep the numbers and the order. Write "none" under a heading that has nothing.

1. **Needs a call** — every question for Robert, each with what you found and the options
2. **Commits** — hash and subject, in order
3. **Gate** — the tail of the gate's output from the last run
4. **Source check** — one line per rule: matches, or the difference with its quote and link
5. **Deviations from the plan** — each with its case (1, 2 or 3) and reason, and every Find anchor that did not match
6. **Existing tests changed** — each with its reason
7. **Tests written** — one line per planned case
8. **Answers to the seam notes** — by number
9. **Decision Record entries added** — by number, one line each
10. **Doubts and things for the next phase** — what you are not sure of, and shapes that later Find anchors will not match
11. **Look here first** — only in the effort's last phase: the list you wrote into the plan

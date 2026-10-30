# Effort Close Skill — Implementation Plan

## In Plain Words

- **What:** a new hand-run skill, `/gestalt:effort-close <ID>.E<n>`, plus one line in six places that names it. The skill closes one effort of a multi-effort initiative in one session: interim review, `fix:` commits for the findings Robert picks, then the effort squash.
- **Why:** the process has these three steps at every effort boundary, but no skill runs them. Robert must remember the boundary, find the effort's base commit by hand, and put the steps together from three docs.
- **How it fits:** it is the fourth session entry point, after `/gestalt:discovery`, `/gestalt:plan` and `/gestalt:execute`. It runs between an effort's last Execution session and the next effort's Plan session. The pre-merge checklist still runs once for the branch.
- **One change from Discovery:** the review is scoped by pointing the branch's upstream at the effort's base for the length of the review, not by a soft reset. `/code-review` with no target reads the branch against its upstream or `main`, so the soft reset would also review earlier efforts.

## Context / Goal

One phase, one commit: write `plugins/gestalt/skills/effort-close/SKILL.md` and name it where the effort boundary is described.

- Discovery doc: [`F.002-effort-close-discovery.md`](../discovery/F.002-effort-close-discovery.md). Its decisions 1–5 and 7–9 stand. Decision 6 and Session Flow steps 3 and 4 are replaced by decisions 1 and 2 below.

## Decisions Ratified in Planning

1. **Scope the review by setting the upstream to a temporary branch at the base; HEAD does not move.** Replaces discovery decision 6 and Session Flow step 4. The local `/code-review` prompt, read from the Claude Code 2.1.314 binary, runs `git diff @{upstream}...HEAD` (or `main...HEAD` with no upstream) and adds `git diff HEAD` when there are uncommitted changes. In the soft-reset view, E1 is correct. For E2 and later with no upstream (this branch has none) or a stale upstream, the range part takes in the earlier efforts. With the upstream at the base, `@{upstream}...HEAD` is exactly the effort's commits. A crash mid-review leaves the branch untouched. Rejected: soft reset plus upstream (moves HEAD and changes config), a commit as the target (the local prompt promises only a PR, branch or path), and a separate review agent (we would own a review prompt).
2. **The `backup/` branch is made just before the squash, at the head after the fixes.** Replaces Session Flow step 3. The review no longer needs it, and a backup made before the fixes would not hold them.
3. **The skill waits for the review's findings.** Discovery assumption 2 holds: the Skill tool can start `/code-review`. At `high` it runs as a background agent, and its findings come back as a task notification in the same session.
4. **Squash subject: `feat: <ID> effort <n> — <effort name>`.** `<ID>` is the tracker ID. This matches `d0edcab feat: F.001 process plugin extraction`. The git-and-delivery rule says only `<initiative>`.
5. **No stash step.** Discovery decision 8 makes a clean tree a precondition, so the rule's "stash any WIP" has nothing to do.
6. **One commit.** The skill and the six lines that name it are one reviewable unit.

## Decision Record — Execution

## Shared Context

- **Gate:** `claude plugin validate .` from the repo root. gestalt has no build or tests.
- **Seeing the skill before a push:** `claude --plugin-dir plugins/gestalt`, then check that `/gestalt:effort-close` is listed. The rules edits are live in the next session in this checkout.
- **`$0`:** in a skill body it is the first argument. `${CLAUDE_PLUGIN_ROOT}` is the plugin folder. Both are used the same way in `plugins/gestalt/skills/execute/SKILL.md`.

## Out of Scope

- The pre-merge checklist. It still runs once for the branch.
- Pushing. A force-push after a squash stays Robert's act.
- The tracker and the Effort Summary. An effort close does not change either one.
- Editing the discovery doc. This plan's decisions 1 and 2 record what replaces its decision 6.

---

## Work Breakdown

**Overview**

- [ ] **Phase 1 — Effort close skill**
  - Commit 1 — `feat: add effort-close skill` (7 tasks)

### Phase 1 — Effort close skill

**In plain words:** add the `effort-close` skill and name it everywhere the effort boundary is described. When it lands, `/gestalt:effort-close F.00x.E2` runs a full effort boundary in one session.

#### Commit 1 — `feat: add effort-close skill`

##### Task 1 — `plugins/gestalt/skills/effort-close/SKILL.md`

`plugins/gestalt/skills/effort-close/SKILL.md` (new) — full contents:

````markdown
---
name: effort-close
description: Close one effort of a multi-effort initiative by its work address, in one session - interim review, fix commits for the picked findings, then the effort squash. Run by hand after the effort's last phase is committed.
disable-model-invocation: true
argument-hint: "<ID>.E<n>"
---

Close the effort `$0`. Mode: Effort close. The session ends when the squash is verified. It does not merge, push, or change the tracker or the Effort Summary.

`$0` is a work address `<ID>.E<n>` (`session-discipline.md`, File locations). Below, `<ID>` is `$0` up to its first `.E`, and `n` is the number after it. If `$0` names no effort, ask which one.

A **stop** waits for Robert. Between stops, go on without asking.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/efforts.md` (Interim Effort Review). Read the overview plan at `docs/initiatives/implementation/<ID>-*-overview-plan.md`: its In Plain Words, then the Effort Summary row for effort n, which gives the effort's name.
2. **Checks.** If one fails, say which one and stop.
   - The feature branch is checked out, not `main`.
   - Effort n's Done box is ticked in the Effort Summary.
   - `git status --porcelain` prints nothing.
   - The gate passes: the build and test command in the project's `CLAUDE.md`.
3. **Base.** The base is the commit just before effort n's first commit.
   - E1: `git merge-base main HEAD`.
   - A later effort: in `git log --format='%h %s' main..HEAD`, find the commit whose subject starts `feat: <ID> effort <n-1> —`. The `fix:` commits right after it belong to that effort too. The base is the last of them.

   Show the base and `git log --oneline <base>..HEAD`. **Stop:** Robert confirms the base or names another one.
4. **Review.** `/code-review` with no target reviews `@{upstream}...HEAD`. Point the upstream at the base for the length of the review:
   ```sh
   git rev-parse --abbrev-ref @{upstream}   # the old upstream; an error means there is none
   git branch review/$0-base <base>
   git branch --set-upstream-to=review/$0-base
   ```
   Run `/code-review high` with no target, through the Skill tool. It runs as a background agent: wait for its findings before you go on. Then put the upstream back with `git branch --set-upstream-to=<old upstream>`, or `git branch --unset-upstream` if there was none, and delete the temporary branch with `git branch -D review/$0-base`.
5. **Pick.** Show every finding, numbered, with its `file:line` and summary. **Stop:** Robert picks the findings to fix. Ask with AskUserQuestion, multi-select; with more than four findings, add questions rather than drop any.
6. **Fixes.** Note the effort head: `git rev-parse HEAD`. Then, for each pick in turn: edit with Edit and Write only, run the gate, give the wrap-up summary and short review, `git add -A`, and commit as its own `fix: <what it fixes>` commit. Running this skill approves each pick, so do not wait for a go-ahead between fixes. If a fix changes what the effort's plan says, log it in that plan's Decision Record and fix the plan body before the commit. If a fix turns into a design call, stop and ask.
7. **Squash check.** Show the `fix:` commits: `git log --oneline <effort head>..HEAD`. Find whether the effort was pushed: `git branch -r --contains <first effort commit>`, where the first effort commit is the oldest in `git rev-list <base>..<effort head>`. Any output means it was pushed. **Stop:** Robert approves the squash. If the effort was pushed, say that the squash rewrites pushed history and needs a force-push.
8. **Squash.** Write the message file with the Write tool in the scratchpad: the subject `feat: <ID> effort <n> — <effort name>`, a blank line, one bullet per commit in `<base>..<effort head>` that sums it up, then the session's attribution lines. Then:
   ```sh
   git branch backup/$0-pre-squash HEAD
   tree=$(git rev-parse <effort head>^{tree})
   squash=$(git commit-tree $tree -p <base> -F <message file>)
   git rebase --onto $squash <effort head>
   git diff --quiet backup/$0-pre-squash HEAD && echo "tree identical"
   git log --oneline <base>..HEAD
   ```
   The log shows the one `feat:` commit with the `fix:` commits on top. If the tree differs, stop: the backup branch holds the state before the squash. Leave the backup branch for Robert to delete. If the effort was pushed, say that `git push --force-with-lease` is needed. Do not push.
````

##### Task 2 — `plugins/gestalt/skills/session-modes/efforts.md`

In Interim Effort Review, name the skill that runs the boundary.

**Find:**
```markdown
The order at a boundary is: interim review → review `fix:` commits → effort squash (the fixes replay on top, kept separate; git-and-delivery rules) → next effort. The review runs in its own new session, not at the end of the execution session that closed the effort; that session ends once the last phase is committed.
```
**Replace with:**
```markdown
The order at a boundary is: interim review → review `fix:` commits → effort squash (the fixes replay on top, kept separate; git-and-delivery rules) → next effort. The review runs in its own new session, not at the end of the execution session that closed the effort; that session ends once the last phase is committed. Start that session with `/gestalt:effort-close <ID>.E<n>`; it runs the review, the fixes and the squash in order.
```

##### Task 3 — `plugins/gestalt/rules/git-and-delivery.md`

In Cadence on a feature branch, name the skill on the effort-squash rule.

**Find:**
```markdown
- At each effort boundary, squash that effort's commits into one `feat: <initiative> effort N — <name>` commit whose body bullets summarise the former commits. Make a `backup/` branch first, stash any WIP, `reset --soft` to the effort's base, commit, verify the tree is identical, pop. Ask before rewriting anything already pushed.
```
**Replace with:**
```markdown
- At each effort boundary, squash that effort's commits into one `feat: <initiative> effort N — <name>` commit whose body bullets summarise the former commits. Make a `backup/` branch first, stash any WIP, `reset --soft` to the effort's base, commit, verify the tree is identical, pop. Ask before rewriting anything already pushed. `/gestalt:effort-close <ID>.E<n>` runs the whole boundary: review, fixes, squash.
```

##### Task 4 — `plugins/gestalt/rules/code-and-docs.md`

In Session modes, name the skill in the starter line.

**Find:**
```markdown
Start a session with `/gestalt:discovery <ID>`, `/gestalt:plan <ID>` or `/gestalt:execute <ID>`. Plan and execute also take a work address that names an effort or phase, such as `F.001.E2.P3`.
```
**Replace with:**
```markdown
Start a session with `/gestalt:discovery <ID>`, `/gestalt:plan <ID>` or `/gestalt:execute <ID>`, and close an effort with `/gestalt:effort-close <ID>.E<n>`. Plan and execute also take a work address that names an effort or phase, such as `F.001.E2.P3`.
```

Then add a row to the Session table.

**Find:**
```markdown
| Execution | One phase is one session. The hand-off sets the scope; with no scope given, the scope is one phase. Once that scope is committed, the session is over. |
```
**Replace with:**
```markdown
| Execution | One phase is one session. The hand-off sets the scope; with no scope given, the scope is one phase. Once that scope is committed, the session is over. |
| Effort close | The effort is reviewed, the picked fixes are committed, and the squash is verified. |
```

##### Task 5 — `plugins/gestalt/skills/execute/SKILL.md`

In step 6, name the next command when a phase finishes an effort.

**Find:**
```markdown
if the phase finishes an effort, tick the effort's Done box in the overview plan's Effort Summary too. Stop at the end of the phase.
```
**Replace with:**
```markdown
if the phase finishes an effort, tick the effort's Done box in the overview plan's Effort Summary too, and end the wrap-up by naming the next step: `/gestalt:effort-close <ID>.E<n>` in a new session. Stop at the end of the phase.
```

##### Task 6 — `plugins/gestalt/skills/session-modes/templates/execution-handoff.md`

In the Ahead section's comment, name the skill for the boundary.

**Find:**
```markdown
<!-- One or two lines: the next phase, or the effort boundary (interim review, squash). -->
```
**Replace with:**
```markdown
<!-- One or two lines: the next phase, or the effort boundary: `/gestalt:effort-close <ID>.E<n>` (interim review, fixes, squash). -->
```

##### Task 7 — `README.md`

In The plugin, list the skill.

**Find:**
```markdown
the starters `discovery`, `plan`, `execute`;
```
**Replace with:**
```markdown
the starters `discovery`, `plan`, `execute`, `effort-close`;
```

##### Commit message

```
feat: add effort-close skill

- add /gestalt:effort-close <ID>.E<n>: checks, base commit, review scoped through a temporary upstream, picked fix: commits, effort squash with the fixes replayed on top
- name it in efforts.md, git-and-delivery.md, code-and-docs.md, execute step 6, the hand-off template and the README
```

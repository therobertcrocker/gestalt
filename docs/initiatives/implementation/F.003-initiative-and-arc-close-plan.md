# Initiative and Arc Close Skills — Implementation Plan

## In Plain Words

- **What:** two new hand-run skills and a retro template. `/gestalt:initiative-close <ID>` ends an initiative in one session: branch review, one fix commit, a retro, the pre-merge checklist, the merge and the tag. `/gestalt:arc-close <ID>` does the same for an arc after its last initiative merges, with a review of the seams between initiatives.
- **Why:** the pre-merge checklist has no skill, and an arc has no close step. Nothing asks whether the work did what it set out to do, or what it changed about the project.
- **How it fits:** they join `/gestalt:effort-close` as the close-out entry points. Every place that describes the pre-merge checklist or arc completion names the new skills.
- **One change from Discovery:** the merge subject's type follows the tracker's Type column (`feat`, `refactor`, `docs`, `fix`), not always `feat:` (decision 1).

## Context / Goal

One phase, two commits: the retro template and initiative close first, then arc close.

- Discovery doc: [`F.003-initiative-and-arc-close-discovery.md`](../discovery/F.003-initiative-and-arc-close-discovery.md). Its decisions 1–13 stand. Session Flow — Initiative Close step 9 changes per decision 1 below.
- Shape to follow: `plugins/gestalt/skills/effort-close/SKILL.md` and the F.002 plan.

## Decisions Ratified in Planning

1. **The merge subject's type follows the tracker's Type column:** feature → `feat`, refactor → `refactor`, docs → `docs`, bugfix → `fix`. Replaces the `feat:` in discovery Session Flow step 9. A refactor merged as `feat:` would misstate it.
2. **Initiative review scoping copies effort close.** A temporary `review/<ID>-base` branch at `git merge-base main HEAD` is the upstream for the length of `/code-review high`, with the same recovery after a crash. After a `push -u`, the upstream is the remote branch, so `/code-review` with no target would review only unpushed commits.
3. **The arc review is a background `general-purpose` agent on the session's model.** Its prompt points at `review-brief.md` in the skill folder and gives the arc folder, the completed folder and each initiative's merge commit. Its findings come back numbered with `file:line`, as `/code-review`'s do, so the pick step is the same in both skills.
4. **Follow-up rows are picked with AskUserQuestion multi-select**, split as effort close splits findings.
5. **A merge conflict aborts and stops.** The skill does not resolve conflicts.
6. **No findings skips the pick and the fixes; no bump ends the session with the reason.**
7. **Two commits.** The retro template and its entries in the style guide and the templates table describe both levels from Commit 1, so they name `/gestalt:arc-close` one commit before it exists. Splitting their text across the commits buys nothing.
8. **Initiative close defers the arc's artifacts to `arcs.md`, Arc completion.** Commit 2 then changes the arc rule in one place, not in the skill.
9. **`bugfix-flow.md` names the skill too.** Discovery decision 10 includes non-trivial bugfixes; Places That Change missed the file.
10. **The pre-merge checklist is always its own session.** `feature-flow.md` drops "(or part of the final execution session)"; the checklist now has a starter, like the other sessions.

## Decision Record — Execution

## Shared Context

- **Gate:** `claude plugin validate .` from the repo root. gestalt has no build or tests.
- **Seeing the skills before a push:** `claude --plugin-dir plugins/gestalt`, then check that `/gestalt:initiative-close` and `/gestalt:arc-close` are listed. Rule edits are live in the next session in this checkout.
- **`$0` and `${CLAUDE_PLUGIN_ROOT}`:** used the same way as in `plugins/gestalt/skills/effort-close/SKILL.md`.

## Out of Scope

- Pushing, and deleting merged branches. Both stay Robert's acts.
- Retros for work that has already shipped.
- Changing effort close beyond naming the next step.

---

## Work Breakdown

**Overview**

- [ ] **Phase 1 — Close skills**
  - Commit 1 — `feat: add the retro template and initiative-close skill` (16 tasks)
  - Commit 2 — `feat: add arc-close skill` (10 tasks)

### Phase 1 — Close skills

**In plain words:** add the retro template, `/gestalt:initiative-close` and `/gestalt:arc-close`, and name them wherever the process describes closing a branch or an arc. When it lands, both closes run as one command each.

#### Commit 1 — `feat: add the retro template and initiative-close skill`

##### Task 1 — `plugins/gestalt/skills/session-modes/templates/retro.md`

`plugins/gestalt/skills/session-modes/templates/retro.md` (new) — full contents:

````markdown
# [Initiative or Arc Name] — Retro

<!--
COPY THIS FILE TO:
  initiative — docs/initiatives/implementation/<ID>-<initiative-name>-retro.md
  arc        — docs/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-retro.md
It moves to _completed/ with the initiative's plans or with the arc's artifacts.

Written by /gestalt:initiative-close or /gestalt:arc-close while the review
runs. It is Claude's own view: honest and specific, with evidence from the
docs, the diff and the code. An arc retro reads every initiative retro and
works at the level of the arc; it does not repeat them.

Delete these comments before writing.
-->

## In Plain Words

<!--
REQUIRED. Under 15 lines. What changed, in everyday terms, for a reader who has
not read the plans: what works now that did not before, and what was removed
or reshaped. Not a diff walk. The same text is the merge commit body and the
chat wrap-up.
-->

## 1 — Did we do what we set out to do?

<!--
Hold the shipped work against the discovery doc's In Plain Words and Design
Summary (an arc: the arc concept and arc-plan). Name what landed, what was cut
or deferred, and what was added that was not planned.
-->

## 2 — Is there a better way we didn't see?

<!--
Knowing what we know now. Name the alternative, what it would have cost and
what it would have saved. If the chosen way still holds, say so and why. Do
not invent an alternative to fill the section.
-->

## 3 — Does it fit the project?

<!--
Hold it against the architecture pages' Key Decisions, the project's patterns,
and for an arc initiative the arc's decisions. Name each place it matches and
each place it diverges.
-->

## 4 — What does it change about the project?

<!--
What is now possible, harder or different for later work: new seams, new
constraints, new patterns others will copy, docs that are now out of date.
-->

## 5 — Rating

<!--
Each metric 1–5 (1 poor, 3 as expected, 5 excellent), with one line of
evidence.

  Delivered  — the shipped work vs the discovery's In Plain Words
  Plan held  — reversals in the Decision Record
  Rework     — fix commits on the branch and this close's review findings,
               relative to the size of the work; fill it after the fixes
  Fit        — matches the project's patterns and the arc's decisions
  Simplicity — the result is as simple as the problem allows
-->

| Metric | Score | Evidence |
|---|---|---|
| Delivered | | |
| Plan held | | |
| Rework | | |
| Fit | | |
| Simplicity | | |

**Verdict:** [one line]

**What surprised me:** [one line]

## Follow-ups

<!--
Work still worth doing, drafted as Backlog rows (lifecycle.md, Stage 1). Robert
picks which land in the tracker. Write "None." when there are none.
-->

| ID | Item | Trigger | Detail |
|---|---|---|---|
````

##### Task 2 — `plugins/gestalt/skills/initiative-close/SKILL.md`

`plugins/gestalt/skills/initiative-close/SKILL.md` (new) — full contents:

````markdown
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
10. **Tag.** Find the current version with `git describe --tags --abbrev=0`. Propose a patch, minor or major bump with one line of why, or say that no bump is warranted and why. **Stop:** Robert approves the version. Tag the merge commit with `git tag <version>`. Do not push. End the wrap-up with the retro's In Plain Words and verdict.
````

##### Task 3 — `plugins/gestalt/rules/git-and-delivery.md`

In Merging and tagging, name the skill and give the merge message its body.

**Find:**
```markdown
- Before merging a branch, in order:
```
**Replace with:**
```markdown
- `/gestalt:initiative-close <ID>` closes a branch in one session: the checklist below, a retro, the merge and the tag. Before merging a branch, in order:
```

**Find:**
```markdown
- Merge with `git merge --no-ff` and a message naming the initiative.
```
**Replace with:**
```markdown
- Merge with `git merge --no-ff` and a message whose subject names the initiative and whose body is the retro's plain-words summary.
```

##### Task 4 — `plugins/gestalt/rules/code-and-docs.md`

In Session modes, name initiative close and add its row.

**Find:**
```markdown
An effort close is not a mode: it runs at each effort boundary of a multi-effort initiative and produces commits, not an artifact.
```
**Replace with:**
```markdown
A close is not a mode. An effort close runs at each effort boundary of a multi-effort initiative and produces commits; an initiative close ends a branch with commits, a retro and the merge.
```

**Find:**
```markdown
and close an effort with `/gestalt:effort-close <ID>.E<n>`.
```
**Replace with:**
```markdown
close an effort with `/gestalt:effort-close <ID>.E<n>`, and close an initiative with `/gestalt:initiative-close <ID>`.
```

**Find:**
```markdown
| Effort close | The effort is reviewed, the picked fixes are committed, and the squash is verified. |
```
**Replace with:**
```markdown
| Effort close | The effort is reviewed, the picked fixes are committed, and the squash is verified. |
| Initiative close | The branch is reviewed, the picked fixes and the retro are committed, the branch is merged, and the tag is set or declined. |
```

##### Task 5 — `plugins/gestalt/skills/session-modes/feature-flow.md`

In Pre-Merge Checklist, name the skill and make the checklist its own session (decision 10).

**Find:**
```markdown
Before merging the feature branch, run the checklist from the git-and-delivery rules:
```
**Replace with:**
```markdown
Before merging the feature branch, run the checklist from the git-and-delivery rules. `/gestalt:initiative-close <ID>` runs it in one session, with a retro, the merge and the tag:
```

**Find:**
```markdown
The pre-merge checklist is itself a session (or part of the final execution session).
```
**Replace with:**
```markdown
The pre-merge checklist is its own session, started with `/gestalt:initiative-close <ID>`.
```

##### Task 6 — `plugins/gestalt/skills/session-modes/bugfix-flow.md`

**Find:**
```markdown
For non-trivial bugfixes, follow the full checklist as in Feature Flow.
```
**Replace with:**
```markdown
For non-trivial bugfixes, follow the full checklist as in Feature Flow, with `/gestalt:initiative-close <ID>`.
```

##### Task 7 — `plugins/gestalt/skills/session-modes/docs-chore-flow.md`

**Find:**
```markdown
Multi-effort docs initiatives run the standard checklist (feature-flow.md), minus the code review when no code changed.
```
**Replace with:**
```markdown
Multi-effort docs initiatives run the standard checklist with `/gestalt:initiative-close <ID>` (feature-flow.md), minus the code review when no code changed.
```

##### Task 8 — `plugins/gestalt/skills/session-modes/lifecycle.md`

In Stage 4, name the skill.

**Find:**
```markdown
When all execution phases land and the branch is merged:
```
**Replace with:**
```markdown
When all execution phases land, `/gestalt:initiative-close <ID>` runs the pre-merge checklist, merges the branch and does both steps below:
```

##### Task 9 — `plugins/gestalt/skills/session-modes/efforts.md`

**Find:**
```markdown
the checklist still runs once at branch level after the final effort.
```
**Replace with:**
```markdown
the checklist still runs once at branch level after the final effort, through `/gestalt:initiative-close <ID>`.
```

##### Task 10 — `plugins/gestalt/skills/session-modes/session-discipline.md`

In File locations, add the retro and move it with the plans.

**Find:**
```markdown
- **Execution hand-offs** — `docs/initiatives/implementation/<ID>[.E<n>]-<initiative-name>-handoff.md`
```
**Replace with:**
```markdown
- **Execution hand-offs** — `docs/initiatives/implementation/<ID>[.E<n>]-<initiative-name>-handoff.md`
- **Retros** — `docs/initiatives/implementation/<ID>-<initiative-name>-retro.md`, written by `/gestalt:initiative-close`
```

**Find:**
```markdown
its discovery doc and all its plans (single, overview, and effort plans) move into one folder.
```
**Replace with:**
```markdown
its discovery doc, all its plans (single, overview, and effort plans) and its retro move into one folder.
```

##### Task 11 — `plugins/gestalt/skills/session-modes/SKILL.md`

In Templates, add the retro row.

**Find:**
```markdown
| Arc concept | `arc-concept.md` | `docs/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-concept.md` |
```
**Replace with:**
```markdown
| Arc concept | `arc-concept.md` | `docs/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-concept.md` |
| Retro | `retro.md` | `docs/initiatives/implementation/<ID>-<initiative-name>-retro.md`; an arc's is `docs/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-retro.md` |
```

##### Task 12 — `plugins/gestalt/skills/session-modes/templates/execution-handoff.md`

**Find:**
```markdown
<!-- One or two lines: the next phase, or the effort boundary: `/gestalt:effort-close <ID>.E<n>` (interim review, fixes, squash). -->
```
**Replace with:**
```markdown
<!-- One or two lines: the next phase, the effort boundary: `/gestalt:effort-close <ID>.E<n>` (interim review, fixes, squash), or the branch close: `/gestalt:initiative-close <ID>` (review, retro, merge). -->
```

##### Task 13 — `plugins/gestalt/skills/execute/SKILL.md`

In step 6, name initiative close after a single-file plan's last phase.

**Find:**
```markdown
and end the wrap-up by naming the next step: `/gestalt:effort-close <ID>.E<n>` in a new session.
```
**Replace with:**
```markdown
and end the wrap-up by naming the next step: `/gestalt:effort-close <ID>.E<n>` in a new session. If the phase is the last of a single-file plan, end the wrap-up by naming `/gestalt:initiative-close <ID>` in a new session.
```

##### Task 14 — `plugins/gestalt/skills/effort-close/SKILL.md`

At the end of step 8, name initiative close after the last effort.

**Find:**
```markdown
If the effort was pushed, say that `git push --force-with-lease` is needed. Do not push.
```
**Replace with:**
```markdown
If the effort was pushed, say that `git push --force-with-lease` is needed. Do not push. If this was the initiative's last effort, end by naming the next step: `/gestalt:initiative-close <ID>` in a new session.
```

##### Task 15 — `plugins/gestalt/skills/style-guide/SKILL.md`

In Document types, add the retro after the implementation plan.

**Find:**
```markdown
Multi-effort docs initiatives use the docs-plan format instead (`templates/docs-plan.md` in the session-modes skill).
```
**Replace with:**
```markdown
Multi-effort docs initiatives use the docs-plan format instead (`templates/docs-plan.md` in the session-modes skill).

**Retro** (`docs/initiatives/implementation/<ID>-<name>-retro.md`) — written when an initiative or arc closes: what changed in plain words, five fixed questions, a rating table and follow-up rows. Template: `templates/retro.md` in the session-modes skill. Moves to `_completed/` with the plans; an arc's retro sits with the arc artifacts.
```

##### Task 16 — `README.md`

**Find:**
```markdown
the starters `discovery`, `plan`, `execute`, `effort-close`;
```
**Replace with:**
```markdown
the starters `discovery`, `plan`, `execute`; the close skills `effort-close`, `initiative-close`;
```

##### Commit message

```
feat: add the retro template and initiative-close skill

- Add templates/retro.md: plain-words summary, five fixed questions, rating table, follow-up rows
- Add /gestalt:initiative-close: branch review, one fix commit, retro, pre-merge checklist, merge and tag
- Name the skill in the rules, the flow files, lifecycle, efforts, session-discipline, the hand-off template, execute, effort-close, the style guide and the README
```

#### Commit 2 — `feat: add arc-close skill`

##### Task 1 — `plugins/gestalt/skills/arc-close/SKILL.md`

`plugins/gestalt/skills/arc-close/SKILL.md` (new) — full contents:

````markdown
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
````

##### Task 2 — `plugins/gestalt/skills/arc-close/review-brief.md`

`plugins/gestalt/skills/arc-close/review-brief.md` (new) — full contents:

````markdown
# Arc review brief

You are reviewing a finished arc: a set of initiatives that shipped one by one, each on its own branch, under shared design decisions. Each initiative was reviewed line by line before its merge. Do not repeat that review. Look for what shows only when the initiatives are seen together.

## Inputs

The prompt gives you:

- the arc folder, with the arc concept, arc-discovery and arc-plan
- the completed folder, with one folder per initiative under `initiatives/`: its discovery doc, its plans and, for most, a retro
- each initiative's ID and merge commit on `main`

Read the arc-discovery's decisions and the arc-plan's per-initiative boundaries first. See what each initiative changed with `git diff --stat <merge>^1 <merge>`, then read the current code of the files it touched. Review the code as it is on `main` now, not as each diff left it.

## What to look for

1. **Seams** — where one initiative's code calls or extends another's: names, shapes or error handling that do not match across the join; an interface one side widened and the other never used.
2. **Drift from the arc's decisions** — code that breaks an arc-discovery decision, or meets it in one initiative and not in another.
3. **The same thing built twice** — two initiatives that each solved one problem their own way: helpers, types, conventions.
4. **Leftovers** — scaffolding, shims, flags or TODOs that an early initiative added for a later one, which the later one made dead.
5. **Scope that slipped** — work the arc-plan lists as an out-of-arc deferral, or gives to a different initiative, found in the wrong place.

Skip style nits and anything one initiative's own review would have caught.

## What to send back

A numbered list, most severe first. Each finding gives its `file:line`, which of the five kinds it is, the initiatives it involves, a one-sentence summary and the fix you suggest. Say for each one whether the fix fits in one fix commit or needs its own initiative. If you find nothing, say so; do not pad the list.
````

##### Task 3 — `plugins/gestalt/skills/initiative-close/SKILL.md`

In step 10, name arc close after an arc's last initiative.

**Find:**
```markdown
End the wrap-up with the retro's In Plain Words and verdict.
```
**Replace with:**
```markdown
End the wrap-up with the retro's In Plain Words and verdict. If `$0` is in an arc and was the last initiative in the arc-plan to merge, name the next step: `/gestalt:arc-close <arc-ID>` in a new session.
```

##### Task 4 — `plugins/gestalt/skills/session-modes/arcs.md`

Rewrite Arc completion: the arc closes in its own session, and the arc's artifacts move then (discovery decisions 6 and 13).

**Find:**
```markdown
The arc is complete when its final initiative ships. There is no separate arc pre-merge checklist — each initiative runs its own per feature-flow.md or refactor-flow.md. The arc's row leaves Current Initiatives at that point (lifecycle.md). The final initiative's pre-merge step 4 also moves the arc artifacts (concept, arc-discovery, arc-plan) from `arcs/<ID>-<arc-name>/` into `_completed/arcs/<ID>-<arc-name>/`, next to the `initiatives/` folder, and removes the empty `arcs/` folder (session-discipline.md, File locations).
```
**Replace with:**
```markdown
Each initiative closes like any other, with `/gestalt:initiative-close <ID>`. The final one leaves the arc's own artifacts and the arc's row in place. Then a new session closes the arc with `/gestalt:arc-close <arc-ID>`: a review of the seams between the initiatives and of drift from the arc-discovery decisions, one fix commit on `feature/<arc-name>-close`, and an arc retro built on the initiative retros. Its close-out removes the arc's row from Current Initiatives (lifecycle.md), moves the arc artifacts (concept, arc-discovery, arc-plan, arc retro) from `arcs/<ID>-<arc-name>/` into `_completed/arcs/<ID>-<arc-name>/`, next to the `initiatives/` folder, and removes the empty arc folder (session-discipline.md, File locations). The arc is complete when the close branch merges.
```

##### Task 5 — `plugins/gestalt/skills/session-modes/lifecycle.md`

**Find:**
```markdown
The arc row is removed when the final initiative ships.
```
**Replace with:**
```markdown
The arc row is removed when the arc closes, after its final initiative ships (arcs.md, Arc completion).
```

##### Task 6 — `plugins/gestalt/skills/session-modes/session-discipline.md`

In File locations, add the arc retro and name arc close.

**Find:**
```markdown
holds `<ID>-<arc-name>-arc-concept.md`, `-arc-discovery.md`, and `-arc-plan.md` while the arc is active
```
**Replace with:**
```markdown
holds `<ID>-<arc-name>-arc-concept.md`, `-arc-discovery.md`, and `-arc-plan.md` while the arc is active, and `-arc-retro.md` once `/gestalt:arc-close` writes it
```

**Find:**
```markdown
  - Arc — when the arc completes, its artifacts move into
```
**Replace with:**
```markdown
  - Arc — when the arc closes, with `/gestalt:arc-close`, its artifacts move into
```

##### Task 7 — `plugins/gestalt/rules/git-and-delivery.md`

In the pre-merge checklist step 4, move the arc's artifacts to arc close.

**Find:**
```markdown
; when the arc's last initiative ships, the arc artifacts move into `_completed/arcs/<arc-ID>-<arc-name>/` too.
```
**Replace with:**
```markdown
. The arc's own artifacts move into `_completed/arcs/<arc-ID>-<arc-name>/` when the arc closes, with `/gestalt:arc-close <arc-ID>`.
```

##### Task 8 — `plugins/gestalt/rules/code-and-docs.md`

In Session modes, name arc close and add its row. The anchors are the text Commit 1 Task 4 wrote.

**Find:**
```markdown
an initiative close ends a branch with commits, a retro and the merge.
```
**Replace with:**
```markdown
an initiative close ends a branch with commits, a retro and the merge; an arc close does the same for an arc after its last initiative merges.
```

**Find:**
```markdown
and close an initiative with `/gestalt:initiative-close <ID>`.
```
**Replace with:**
```markdown
close an initiative with `/gestalt:initiative-close <ID>`, and close an arc with `/gestalt:arc-close <ID>`.
```

**Find:**
```markdown
| Initiative close | The branch is reviewed, the picked fixes and the retro are committed, the branch is merged, and the tag is set or declined. |
```
**Replace with:**
```markdown
| Initiative close | The branch is reviewed, the picked fixes and the retro are committed, the branch is merged, and the tag is set or declined. |
| Arc close | The arc's seams are reviewed, the picked fixes and the arc retro are committed, the close branch is merged, and the tag is set or declined. |
```

##### Task 9 — `plugins/gestalt/skills/style-guide/SKILL.md`

In Document types, add the arc retro to the arc artifacts and name arc close.

**Find:**
```markdown
the arc concept, arc-discovery and arc-plan, co-located in the arc's folder. They move to `docs/initiatives/_completed/arcs/<ID>-<arc-name>/` when the arc completes.
```
**Replace with:**
```markdown
the arc concept, arc-discovery, arc-plan and, at the end, the arc retro, co-located in the arc's folder. They move to `docs/initiatives/_completed/arcs/<ID>-<arc-name>/` when the arc closes, with `/gestalt:arc-close`.
```

##### Task 10 — `README.md`

**Find:**
```markdown
the close skills `effort-close`, `initiative-close`;
```
**Replace with:**
```markdown
the close skills `effort-close`, `initiative-close`, `arc-close`;
```

##### Commit message

```
feat: add arc-close skill

- Add /gestalt:arc-close: arc review agent, one fix commit, arc retro, close-out, merge and tag
- Add the arc review brief: seams, drift from arc decisions, duplicates, leftovers, slipped scope
- Move the arc's close-out from the last initiative's checklist to arc close in arcs.md, lifecycle, session-discipline, the rules and the style guide
- Name arc close in initiative close, code-and-docs and the README
```

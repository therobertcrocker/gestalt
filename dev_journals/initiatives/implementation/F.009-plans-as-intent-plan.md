# Plans as Intent — Implementation Plan

## In Plain Words

- **What** — rewrites the plugin's rules for plans and Execution: a plan says what to build, the shape others depend on and how to tell it works; the build session writes the code itself, under the project's rules, and reports where it departed from the plan.
- **Why** — today a plan holds the finished code and the build session copies it, so the plan's mistakes ship and the effort reviews catch them, 3 to 11 per effort (seed, Problem).
- **How it fits** — carries all four criteria of the Design Spec below. It is also the first trial of a lighter flow for this repo: seed, plan and execution in one session, with the retro written as findings for `F.004`.

## Design Spec

### What we are building

The plugin's plan rules (the feature flow, the plan template, the plan skill) ask for the shape of the work and its test cases, not its code, and the plugin's Execution rules (the execute skill, the coordinator's skill and phase brief, the hand-off template) tell the build session to write the code under the project's rules, check it against the source, and handle each difference from the plan in one of three named ways.

### Success Criteria

| # | Question | Success is |
|---|---|---|
| 1 | Does a plan written under the new rules hold the shape and leave out the bodies? | Yes. The flow, the template and the plan skill say what a task holds; a body is there only by a named exception |
| 2 | When the plan and the rules or source disagree, does Execution know what to do? | Yes. `execute`, the phase brief and the hand-off give the same three cases, and none of them says "copy" |
| 3 | Does every deviation reach Robert? | Yes. Each is logged in the Decision Record and named in the wrap-up or the agent's report |
| 4 | Does a phase still have a size rule that means something? | Yes. The flow, the template and Execution scope agree on the commit cap, and no file still names 1,500 lines |

## Context / Goal

- Seed (the Concept): [`F.009-plans-as-intent-seed.md`](../seeds/F.009-plans-as-intent-seed.md)
- No discovery doc (decision 9). The seed's six Open Questions are answered below
- Evidence: `_completed/F.008-skills-expansion/F.008-skills-expansion-retro.md`, section 2

## Decisions Ratified in Planning

1. **A task keeps the shape and the cases, not the body** — the file, what changes and why, the shape other code or Robert depends on (signatures, struct fields, exported names, exact messages and commands), and test cases in plain words. A full body only by named exception, with a one-line reason: a hard algorithm, the encoding of an outside rule, or text whose exact wording is the decision. Find anchors stay where the edit literally replaces existing text. Resolves seed question 1
2. **Three cases when the plan disagrees with the rules or the source** — (a) the plan breaks a project rule: follow the rule, log it; (b) the source has drifted and the plan's intent still holds: follow the source, log it; (c) the intent itself looks wrong (behaviour, design, the reading of an outside rule): stop that line and ask; under `coordinate` it is "needs a call". Every logged deviation is named in the wrap-up or report. Resolves seed question 2
3. **Every project** — the gm-toolkit evidence has a compiler and tests and shows the same fix rate; the plan writes the tests too. Resolves seed question 3
4. **The phase budget is the commit cap** — at most about 4 commits per phase; the 1,500-line figure goes; the 400-line front-matter budget stays. `C.003`'s row is rewritten at close. Resolves seed question 4
5. **Rules now, judged at first use** — the change lands in the plugin; the first gm-toolkit effort under it is compared with the baseline of 3 to 11 effort-review fixes. Resolves seed question 5
6. **This is the `F.004` trial** — the retro is written as findings for `F.004`; `F.004` stays its own row. Resolves seed question 6
7. **This plan is written in the new style** — the cheapest test of decision 1
8. **Promoted to Current Initiatives with no write-up** — Robert is weighing whether to retire the write-up step; no action on that here
9. **No discovery doc** — the Design Spec sits in this plan

## Decision Record — Execution

## Design Spec — Carried By

| Criterion | Carried by |
|---|---|
| 1 — plan holds the shape | Phase 1, Commit 1 |
| 2 — Execution knows the three cases | Phase 1, Commit 2 |
| 3 — every deviation reaches Robert | Phase 1, Commit 2 |
| 4 — the phase size rule | Phase 1, Commit 1 |

## Out of Scope

- Retiring the tracker write-up step (decision 8)
- `docs-plan.md`: its deliverables are already named docs, not literal edits
- A test of the new rules on gm-toolkit: judged at first use (decision 5)

---

## Work Breakdown

**Overview**

- [ ] **Phase 1 — Plans as intent**
  - Commit 1 — `feat: plans hold intent, not bodies` (3 tasks)
  - Commit 2 — `feat: execution writes the code and reports deviations` (4 tasks)

### Phase 1 — Plans as intent

**In plain words:** the plan rules stop asking for finished code, and the build rules stop asking the build session to copy; when it lands, every file that a plan or a build session reads says the same thing.

#### Commit 1 — `feat: plans hold intent, not bodies`

##### Task 1 — `plugins/gestalt/skills/session-modes/feature-flow.md`

- Work breakdown levels table: the Phase row's size rule becomes the commit cap alone (decision 4); the Task row's "Is" says one change, with what, why and the shape it fixes (decision 1).
- Plan, **Discipline**: rewrite the paragraph around decision 1. Keep: written in one pass, settle in conversation first, no padded commit splits. Drop: "code, not prose", "the literal edit", "an English summary is a failed task". Add the why in one sentence: a plan of finished code turns the build session into a copier, and its tests share the plan's blind spots.
- Execution, **Activities**: "Implement the tasks" becomes writing the code under the project's rules and checking it against the source.
- Execution: add a **Deviations from the plan** paragraph with decision 2's three cases. This is the one source; `execute`, the phase brief and the hand-off cite it.

##### Task 2 — `plugins/gestalt/skills/session-modes/templates/implementation-plan.md`

- SIZE comment: two budgets stay two (front matter about 400 lines; a phase at most about 4 commits). Drop the phase line count and "Spend lines on literal code in tasks". The two `awk` commands: keep the front-matter one; the phase one now counts commits.
- KEY RULE 2: a task is self-contained (no pointer to a section above; a shared structure defined by the first task that needs it, later tasks cite it), and holds decision 1's content, not literal code.
- The per-task format comment: replace the Find → Replace and full-file formats with decision 1's format: what and why, the shape, the test cases, an optional Find anchor where the edit literally replaces text, and a body only under a named exception with its reason.
- Shared Context comment: signatures and field lists still belong in the task that builds them; keep the rule, drop "formatter tables, dispatch flows" only if they read as bodies.

##### Task 3 — `plugins/gestalt/skills/plan/SKILL.md`

- Step 7: "the two line budgets" becomes the front-matter budget and the commit cap; tasks are written as `feature-flow.md`, Discipline, says.

**Checks for the commit:** `grep -rn '1,500\|literal' plugins/gestalt` finds nothing about plans except a named exception; `claude plugin validate .` passes.

##### Commit message

```
feat: plans hold intent, not bodies

- feature-flow: a task holds what, why, the shape and the test cases; a phase is sized by its commits; Execution writes the code and handles deviations in three named cases
- implementation-plan template: new size rule and task format; Find anchors only for literal replacements
- plan skill: step 7 checks the front-matter budget and the commit cap
```

#### Commit 2 — `feat: execution writes the code and reports deviations`

##### Task 1 — `plugins/gestalt/skills/execute/SKILL.md`

- Step 5: re-ground on the code each task touches; check the Find anchors the tasks have.
- Step 6: "run the commits": write each task's code under the project's rules, check it against the source, handle each difference by `feature-flow.md`, Deviations from the plan, and log it in the Decision Record before the commit. The wrap-up names each deviation (criterion 3).

##### Task 2 — `plugins/gestalt/skills/coordinate/phase-brief.md`

- Section 4: "Copy them" goes. The agent writes the code under the rules, checks it against the source, and handles differences by the three cases; case (c) goes under "needs a call", per section 2.
- Section 5: a difference between the fetched rule and the plan is case (c): stop that line of work and report it as "needs a call". Drop "build what the plan says".
- Section 12, report item 5: each deviation with its case and reason, and every Find anchor that did not match.

##### Task 3 — `plugins/gestalt/skills/coordinate/SKILL.md`

- Step 3.1, seam notes: Find anchors that will not match, where the tasks have them; otherwise, calls and shapes the tasks expect that the source no longer has.
- Step 3.4, the diff check: read against the plan's tasks and the project's rules, and against each deviation the report names.

##### Task 4 — `plugins/gestalt/skills/session-modes/templates/execution-handoff.md`

- Read first, item 1: "The tasks are the edits: literal Find/Replace and full files" becomes: the tasks give the shape and the cases; the session writes the code.
- How to run each commit: anchor check where tasks have anchors; add a bullet with the three cases, citing `feature-flow.md`.

**Checks for the commit:** no plugin file tells a build session to copy the plan's code; `claude plugin validate .` passes.

##### Commit message

```
feat: execution writes the code and reports deviations

- execute: write each task's code under the rules, check against the source, log and name each deviation
- phase brief: drop "copy them"; outside-rule differences are a call, not built as planned; report gives each deviation's case
- coordinate: seam notes and diff check fit plans without literal code
- hand-off template: tasks give shape and cases; the three cases cited
```

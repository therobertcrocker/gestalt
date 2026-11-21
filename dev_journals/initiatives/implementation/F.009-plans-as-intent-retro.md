# Plans as Intent — Retro

## In Plain Words

Plans no longer hold the finished code. A task now says what changes and why, the shape other code depends on (signatures, fields, exact messages) and its test cases in plain words; a function body is there only by a named exception. The build session writes the code itself, under the project's rules, checks it against the current source, and sorts every difference from the plan into one of three cases: the plan breaks a rule (follow the rule), the source moved (follow the source), or the intent looks wrong (stop and ask). Each one is logged and named in the wrap-up or report. A phase is now sized by its commits, at most about 4; the 1,500-line budget is gone. The feature flow, the plan template, the plan and execute skills, the coordinator, its phase brief and the hand-off template all say the same thing. All four criteria of the Design Spec are met.

It is also the first run of a lighter flow for this repo: seed, plan, execution and close in one session, on a branch, with no discovery doc.

## 1 — Did we do what we set out to do?

| Criterion | Met | Evidence |
|---|---|---|
| 1 — plan holds the shape | Met | `feature-flow.md` Discipline lists what a task carries and the three named exceptions; the template's per-task format has What and why, Shape, Cases, an optional Find and an exception-only Body; `plan/SKILL.md` step 7 points at it |
| 2 — Execution knows the three cases | Met | The cases live once, in `feature-flow.md`, Deviations from the plan; `execute` step 6, `phase-brief.md` section 4 and the hand-off template cite them. No plugin file says "copy" any more (grep at Commit 2) |
| 3 — every deviation reaches Robert | Met | Each is logged with its case in the Decision Record and named in the wrap-up (`execute` step 6) or in report item 5 (`phase-brief.md`); `coordinate` step 3.4 reads the diff for unlogged changes of shape |
| 4 — the phase size rule | Met | `feature-flow.md` table, the template's SIZE comment and `session-discipline.md` Execution scope all say at most about 4 commits; the phase `awk` now counts commits; no plugin file names 1,500 lines |

Landed as planned, in two commits. One addition: a third line in the hand-off template that still said "the plan's code", which the plan had missed (Decision Record entry 1, case 2). Cut: nothing. Deferred: the `C.003` row, rewritten at this close.

## 2 — Is there a better way we didn't see?

For the product, no. A softer change, keeping literal code and adding "check it against the rules" to `execute`, would have been one line. It leaves the copy as the default, and the gm-toolkit evidence shows sessions with the rules in context still wrote `rb` because the plan did.

For the process, the session was close to the right weight. The plan was 141 lines for 132 changed plugin lines, about 1 to 1, against F.008's 3 to 1. The one part that cost more than it gave was the stop sequence around the questions: two picker rounds where one would do, because the first round left out two of the seed's questions (section 6, finding 4).

## 3 — Does it fit the project?

It matches: the three cases are written once and cited, the way F.008 kept one Design Spec per piece of work. Phase sizing by commits was already what `session-discipline.md` said, so that file needed no edit. The Outside Rules table was kept, and its role grew: a difference from an outside rule is now always a call, where the phase brief used to build the plan's reading and report.

It diverges in one place on purpose: `F.009` was promoted with no write-up, against `lifecycle.md`, Stage 3 (Decision 8). Robert is weighing whether to retire that step.

## 4 — What does it change about the project?

- Every project's next plan is shorter and every build session does more work. The first gm-toolkit effort under the new rule is the real test: compare its effort-review fixes with the baseline of 3 to 11 per effort (2026-10-31 to 2026-11-20)
- The review's job shifts. When the plan held the code, the diff showed copy errors; now the diff shows the build session's choices, and the coordinator's diff check is the guard against a case 3 passed off as case 2
- Tests are now written by the build session from plain-words cases, not copied from the plan. That removes the shared blind spot, and adds the risk that tests get thinner
- `C.003` (phase budget review) loses its subject; its row is rewritten at this close
- F.008's completed plans are the old style; they stay as provenance and are not examples to copy

## 5 — Rating

| Metric | Score | Evidence |
|---|---|---|
| Delivered | 5 | All four criteria met, section 1 |
| Plan held | 5 | No reversals; one case 2 addition, logged |
| Rework | | |
| Fit | 4 | Matches the one-source pattern; the promotion with no write-up is a deliberate divergence |
| Simplicity | 4 | 76 lines added, 56 removed in the plugin; the three cases are one paragraph cited from three places |

**Verdict:** [after the review]

**What surprised me:** the new rule caught a gap in its own plan on the first commit that ran under it.

## 6 — Findings for `F.004`

This initiative was the first run of a lighter flow on gestalt's own process files. What it did, what held and what pinched.

**The shape that ran:**

```
seed (existing) -> plant -> plan (in-session, picker) -> sign-off
  -> 2 feat commits -> close (review, retro, merge) -- one session, one branch
```

| # | Finding | Evidence |
|---|---|---|
| 1 | One session from seed to merge was enough for a change of this size, about 130 plugin lines across 8 files | This session: 4 branch commits before the close |
| 2 | The seed did the Discovery's job. Its Open Questions became the plan's decisions, one picker round each; no discovery doc was missed | Decisions 1 to 6 each resolve a seed question |
| 3 | The stops that mattered were three: the plant proposal, the question picker, the plan sign-off. The close adds the finding pick, the retro and the merge | Robert answered each; none was a rubber stamp. Q1's answer changed the design (anchors kept) |
| 4 | The "context in one turn, picker in the next" rule cost an extra round, because the first picker held four of the nine questions. Every question in the context table should be in the picker | Q3, Q5, Q8 and Q9 needed a second picker |
| 5 | Unticked options in a multi-select are ambiguous: they read as a "no" but do not say what instead. Q8 and Q9 needed a follow-up to learn what Robert wanted | Second picker |
| 6 | The skills fight a one-session flow. `plan` and `execute` say "never use it to change modes in a session that is already running", so their steps were read and followed by hand rather than invoked; `seed plant` says "no branch is cut"; `session-discipline.md` says one mode per session. Each was set aside on Robert's word | This session |
| 7 | The plan written as intent was enough to build from, at about 1 line of plan per changed line, against F.008's 3 to 1 | 141-line plan, 132 changed plugin lines |
| 8 | The tracker write-up added nothing for a one-session initiative; promotion with no write-up worked | Decision 8 |
| 9 | Plan and execute in one session kept the context warm: no re-reading between sessions, which was most of F.008 effort 2's cost | F.008 retro, section 2; this session read each file once |

What the light path likely needs, as input for `F.004`'s own design: a skill, or a mode in the existing ones, that runs plant, plan, execute and close as stops of one session; the picker rule tightened (finding 4); and a call on the write-up step (finding 8).

## Follow-ups

| ID | Item | Trigger | Detail |
|---|---|---|---|
| `C.003` | Phase budget review | `when` the first gm-toolkit effort under F.009 closes | Rewritten row: the phase budget is now at most about 4 commits, with no line count (F.009). Watch whether a phase compacts mid-session or debugging runs past about 20 minutes; compare the effort's review fixes with the 3 to 11 per effort baseline from before F.009 |

# Feature flow

Feature work follows three modes in sequence: **Discovery → Plan → Execution.** Each mode is its own session (or several). Each produces a specific artifact. Boundaries between modes are strict — see session-discipline.md for the discipline.

## Discovery (1–2 sessions)

**Goal:** understand the problem space, survey relevant existing code, identify approach options, surface tradeoffs and open questions.

**Artifact:** `dev_journals/initiatives/discovery/<ID>-<initiative-name>-discovery.md` (naming: session-discipline.md, File locations) — see `templates/discovery.md` in this skill folder for required and optional sections.

**Discipline.** Scaffold the doc early: after the reflect-back and the first directional question, create it from the template at its real location and fill Problem, Design Summary and Open Questions with what is already known. Draft the Design Spec with them, and ratify its Success Criteria with Robert before any design point is settled; the design answers to them (session-discipline.md, Design Spec). As each design point settles in conversation, edit the section; the doc is the working surface, not an end-of-session transcript dump, and the final pass is polish. Open Questions are for genuine deferrals to Plan only: items where deferring has real branching cost and a principled reason (they depend on detail that only shows up in Plan or Execution). A design choice Discovery can settle is asked now and ratified in the doc as a decision.

**Session ends when:** the discovery doc is written and Robert has signed off. Do not begin planning in the same session.

## Plan (1–2 sessions)

**Goal:** turn the discovery doc into an executable plan — work broken into phases and commits, each phase sized for one execution session (session-discipline.md, Execution scope).

**Artifacts** — see `templates/implementation-plan.md` in this skill folder:

- **Top-level plan** — `dev_journals/initiatives/implementation/<ID>-<initiative-name>-plan.md`, or `<ID>-<initiative-name>-overview-plan.md` when the initiative splits into efforts. Always required.
- **Per-effort plans** — `dev_journals/initiatives/implementation/<ID>.E<n>-<initiative-name>-plan.md`. Used when the initiative splits into efforts — see efforts.md for when to split and how effort planning is paced.

**Work breakdown levels.** Each level has one job, one artifact and one size rule. The template holds the budgets and the commands that check them.

| Level | Is | Artifact | Size rule |
|---|---|---|---|
| Initiative | One branch, one discovery doc, one merge | Top-level plan. With efforts, its Work Breakdown lists the efforts. | None |
| Effort | One design surface; its boundary is a review point (efforts.md) | Effort plan: front matter plus phases. With one effort, the top-level plan is the effort plan. | Front matter about 400 lines; every phase session reads it again |
| Phase | One execution session | `### Phase` section | At most about 4 commits |
| Commit | One reviewable unit that builds green | `#### Commit` section | Split only at a real seam |
| Task | One change: what, why, and the shape it fixes | `##### Task` section | — |

**Work breakdown overview.** A plan with phases opens its Work Breakdown with an **Overview** list: each phase, each commit's conventional message, and each commit's task count. It gives the big picture without a scroll through the tasks. Each phase line starts with a checkbox, ticked in the phase's last commit. Keep it in sync with the body when execution changes the breakdown.

**Design Spec — carried by.** The plan gives each criterion of the Design Spec the work that carries it, in a table that cites the criterion by number and never restates it. An overview plan names the effort and where the criterion is checked; an effort or single-file plan names the phase and commit. A criterion that nothing carries is a gap to put to Robert before sign-off.

**Discipline.** Plans hold the intent and the shape, not the code. Every task carries:

- the file, what changes and why
- the shape that other code or Robert depends on: real signatures, struct fields, exported names, exact messages and commands
- its test cases in plain words: the input or situation, and what is expected

A task holds no function body, except by a named exception with a one-line reason: a hard algorithm, the encoding of an outside rule (Outside Rules), or text whose exact wording is the decision. Why: a plan of finished code turns the build session into a copier, so the plan's mistakes ship as written, and tests the plan also wrote share its blind spots. A task too vague to build from ("improve X") is still a failed task; the shape and the cases are what make it buildable. Where an edit literally replaces existing text, quote a Find anchor from the current source; don't replay or script-check the anchors afterwards, the execution session re-grounds. Plans are written in one pass: settle phases, commits and tasks in conversation first, then write the file. No padded commit splits: if a reviewer could hold two commits in their head as one unit, merge them.

**Session ends when:** the plan is written and Robert has signed off. Do not begin execution in the same session.

## Execution (N sessions)

**Goal:** implement the phase the hand-off names (session-discipline.md, Execution scope).

**Activities:**
- Read the implementation plan, focused on the tasks of the commits in scope
- Read the relevant current code (it may have shifted since the plan was written)
- Write the code for each task under the project's rules, and check it against the current source
- Handle each difference from the plan as Deviations from the plan, below, says
- Commit using conventional commit format (git-and-delivery rules); a plan-defined commit lands as soon as it passes the gate
- If the work surfaces a scope change, pause and discuss before proceeding

**Deviations from the plan.** The plan gives the intent; the build session writes the code, and holds it to the project's rules and the current source rather than to the plan's wording. A difference from the plan is one of three cases:

1. **The plan breaks a project rule** (a short name, a comment that restates code, a style rule): follow the rule and log it
2. **The source has drifted and the plan's intent still holds** (a moved function, a renamed field, an anchor that no longer matches): follow the source and log it
3. **The intent itself looks wrong** (a behaviour, a design choice, the reading of an outside rule): stop that line of work, go on with what does not depend on it, and ask Robert. A session that cannot ask, such as a phase agent under `/gestalt:coordinate`, reports it as "needs a call"

Log each one in the plan's Decision Record before the commit it rides, with its case and reason, and name each one in the commit's wrap-up or the agent's report. A case 1 or 2 entry needs no answer; it is there so the review sees it.

**Artifact:** code, committed per the git-and-delivery rules: at least one checkpoint commit per session, squashed per effort at the effort boundary, never squashed at merge.

**Session ends when:** the last commit in the session's scope lands.

## Pre-Merge Checklist

Before merging the feature branch, run the checklist from the git-and-delivery rules. `/gestalt:initiative-close <ID>` runs it in one session, with a retro, the merge and the tag:

1. Senior-engineer code review of the branch
2. Promote durable decisions: graduate architecturally-significant entries from the plan's Decision Record into the relevant architecture page's `Key Decisions` section (see session-discipline.md, Decision records)
3. Update `dev_journals/planned-work.md` (remove the initiative; capture deferred items that surfaced)
4. Move the initiative's discovery and plan docs into its `_completed/` folder (session-discipline.md, File locations)

The pre-merge checklist is its own session, started with `/gestalt:initiative-close <ID>`. It runs once per branch, after every initiative layered on that branch is complete; sub-initiatives and enabling refactors landed as commits mid-branch don't trigger it.

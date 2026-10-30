# Feature flow

Feature work follows three modes in sequence: **Discovery → Plan → Execution.** Each mode is its own session (or several). Each produces a specific artifact. Boundaries between modes are strict — see session-discipline.md for the discipline.

## Discovery (1–2 sessions)

**Goal:** understand the problem space, survey relevant existing code, identify approach options, surface tradeoffs and open questions.

**Artifact:** `docs/initiatives/discovery/<ID>-<initiative-name>-discovery.md` (naming: session-discipline.md, File locations) — see `templates/discovery.md` in this skill folder for required and optional sections.

**Discipline.** Scaffold the doc early: after the reflect-back and the first directional question, create it from the template at its real location and fill Problem, Design Summary and Open Questions with what is already known. As each design point settles in conversation, edit the section; the doc is the working surface, not an end-of-session transcript dump, and the final pass is polish. Open Questions are for genuine deferrals to Plan only: items where deferring has real branching cost and a principled reason (they depend on detail that only shows up in Plan or Execution). A design choice Discovery can settle is asked now and ratified in the doc as a decision.

**Session ends when:** the discovery doc is written and Robert has signed off. Do not begin planning in the same session.

## Plan (1–2 sessions)

**Goal:** turn the discovery doc into an executable plan — work broken into phases and commits, each phase sized for one execution session (session-discipline.md, Execution scope).

**Artifacts** — see `templates/implementation-plan.md` in this skill folder:

- **Top-level plan** — `docs/initiatives/implementation/<ID>-<initiative-name>-plan.md`, or `<ID>-<initiative-name>-overview-plan.md` when the initiative splits into efforts. Always required.
- **Per-effort plans** — `docs/initiatives/implementation/<ID>-<initiative-name>-effort-N-plan.md`. Used when the initiative splits into efforts — see efforts.md for when to split and how effort planning is paced.

**Work breakdown levels.** Each level has one job, one artifact and one size rule. The template holds the budgets and the commands that check them.

| Level | Is | Artifact | Size rule |
|---|---|---|---|
| Initiative | One branch, one discovery doc, one merge | Top-level plan. With efforts, its Work Breakdown lists the efforts. | None |
| Effort | One design surface; its boundary is a review point (efforts.md) | Effort plan: front matter plus phases. With one effort, the top-level plan is the effort plan. | Front matter about 400 lines; every phase session reads it again |
| Phase | One execution session | `### Phase` section | About 800 lines |
| Commit | One reviewable unit that builds green | `#### Commit` section | Split only at a real seam |
| Task | One edit, as literal code | `##### Task` section | — |

**Work breakdown overview.** A plan with phases opens its Work Breakdown with an **Overview** list: each phase, each commit's conventional message, and each commit's task count. It gives the big picture without a scroll through the tasks. Keep it in sync with the body when execution changes the breakdown.

**Discipline.** Plans are self-implementable specs: code, not prose. Every task carries the literal edit (real signatures, full struct fields, the function body, exact messages), so a human can implement from it with no further design derivation. A task written as an English summary ("implement X that does Y") is a failed task. Test descriptions in plain language are the only exception. Plans are written in one pass: settle phases, commits and tasks in conversation first, then write the file. Quote Find anchors from the current source as you write; don't replay or script-check the anchors afterwards, the execution session re-grounds and the compiler catches misses. No padded commit splits: if a reviewer could hold two commits in their head as one unit, merge them.

**Session ends when:** the plan is written and Robert has signed off. Do not begin execution in the same session.

## Execution (N sessions)

**Goal:** implement the phase the hand-off names (session-discipline.md, Execution scope).

**Activities:**
- Read the implementation plan, focused on the tasks of the commits in scope
- Read the relevant current code (it may have shifted since the plan was written)
- Implement the tasks
- Commit using conventional commit format (git-and-delivery rules); a plan-defined commit lands as soon as it passes the gate
- If the work surfaces a scope change, pause and discuss before proceeding

**Artifact:** code, committed per the git-and-delivery rules: at least one checkpoint commit per session, squashed per effort at the effort boundary, never squashed at merge.

**Session ends when:** the last commit in the session's scope lands.

## Pre-Merge Checklist

Before merging the feature branch, run the checklist from the git-and-delivery rules:

1. Senior-engineer code review of the branch
2. Promote durable decisions: graduate architecturally-significant entries from the plan's Decision Record into the relevant architecture page's `Key Decisions` section (see session-discipline.md, Decision records)
3. Update `docs/planned-work.md` (remove the initiative; capture deferred items that surfaced)
4. Move the initiative's discovery and plan docs into its `completed/` folder (session-discipline.md, File locations)

The pre-merge checklist is itself a session (or part of the final execution session). It runs once per branch, after every initiative layered on that branch is complete; sub-initiatives and enabling refactors landed as commits mid-branch don't trigger it.

# Initiative and Arc Close Skills — Discovery

## In Plain Words

- **What:** two new hand-run skills. `/gestalt:initiative-close <ID>` ends an initiative: code review, one fix commit, a plain-words summary of what changed, a retro, then the rest of the pre-merge checklist, the merge and the tag. `/gestalt:arc-close <ID>` does the same for a whole arc, after its last initiative merges.
- **Why:** the pre-merge checklist has no skill, and an arc has no close step at all. Nothing asks whether the work did what it set out to do, or what it changed about the project.
- **How it fits:** they join `/gestalt:effort-close` as the close-out entry points. Effort close ends an effort; initiative close ends a branch; arc close ends an arc.

## Problem

The process has three boundaries. Only one has a skill.

- **Effort boundary** — `/gestalt:effort-close` (F.002) runs review, fix commit and squash.
- **Initiative boundary** — the pre-merge checklist (`plugins/gestalt/rules/git-and-delivery.md`, Merging and tagging; `plugins/gestalt/skills/session-modes/feature-flow.md`, Pre-Merge Checklist): a senior-engineer review, promote durable decisions, update the tracker, move the docs to `_completed/`, merge `--no-ff`, assess a tag. Robert runs it from memory. The review step has the same scoping problem F.002 solved: `/code-review` with no target diffs against `@{upstream}`, which after a `push -u` is the remote branch, not `main`.
- **Arc boundary** — none. `plugins/gestalt/skills/session-modes/arcs.md`, Arc completion: "There is no separate arc pre-merge checklist". The final initiative's checklist moves the arc artifacts and nothing more.

No step at any boundary looks back. Each review checks the code; none asks whether the initiative met its discovery doc, whether a better approach was missed, or how the project changed.

## Architecture Context

gestalt has no architecture wiki. The binding context is the process docs:

- `plugins/gestalt/rules/git-and-delivery.md`, Merging and tagging — the checklist's four steps, `--no-ff` merge, tag after every merge.
- `plugins/gestalt/skills/session-modes/feature-flow.md`, Pre-Merge Checklist — the checklist is its own session; `bugfix-flow.md` and `docs-chore-flow.md` point to it with lighter rules for small work.
- `plugins/gestalt/skills/session-modes/arcs.md`, Arc completion — what happens when an arc's last initiative ships.
- `plugins/gestalt/skills/effort-close/SKILL.md` and the F.002 plan's decisions — the shape to follow: hand-run, numbered steps, **stop** points, the upstream trick that scopes `/code-review`, one review-fix commit.
- Existing history — merges are `--no-ff` with the subject `feat: <ID> <initiative name>` and no body (`d0edcab`, `3e0a94b`); tags are lightweight, on the merge commit (`v0.1.0`, `v0.2.0`).

## Design Summary

- **Initiative close is the pre-merge checklist.** One skill runs every step of it, then the merge and the tag, so there is one review per branch, not two.
- **The retro runs while the review runs.** `/code-review high` runs as a background agent (F.002 plan, decision 3); the main session writes the retro in that wait.
- **The retro is a file** with five fixed questions and a fixed rating table. It moves to `_completed/` with the initiative's other docs. Arc close reads every initiative's retro and builds on them.
- **One summary, three places.** The plain-words summary of the changes is written once: the retro's In Plain Words, the merge commit body and the chat wrap-up.
- **Arc close runs after the arc, on its own branch.** Its review is an agent with an arc brief that looks at the joins between initiatives and at drift from the arc-discovery decisions, not at every line again.

## Decisions

| # | Decision | Rationale |
|---|---|---|
| 1 | Initiative close runs the whole pre-merge checklist | A separate review skill would review the branch a second time |
| 2 | The arc review targets seams between initiatives and drift from arc-discovery decisions | Each initiative close already reviewed its code line by line; a whole-arc diff is too large to review again |
| 3 | Retro answers go in a file that moves to `_completed/` | Chat is lost at session end; discovery docs are frozen after ship. Arc close reads the files |
| 4 | The retro is written in the main session while `/code-review` runs in the background | The wait is free time |
| 5 | Ratings use a fixed metric set defined in the retro template | Ratings made up per run cannot be compared across initiatives |
| 6 | Arc close runs after the arc's last initiative merges, on `feature/<arc-name>-close`, merged back `--no-ff` | Fixes can't land on `main`. Folding it into the last initiative's close would mix the arc's merged work with an open branch |
| 7 | The arc review is an agent with a brief kept in the skill folder | `/code-review` over the arc range takes in unrelated merges and cannot check code against the arc's decisions. Unlike F.002's effort review, no stock tool fits |
| 8 | Metrics: Delivered, Plan held, Rework, Fit, Simplicity; each 1–5 with one line of evidence, then a verdict line and a "what surprised me" line | Covers outcome, process and result; small enough to fill honestly |
| 9 | The plain-words summary is the retro's In Plain Words, the merge commit body and the chat wrap-up | Written once; the merge commit carries it in history |
| 10 | Initiative close is for initiatives with a branch and a plan: features, refactors, multi-effort docs, non-trivial bugfixes | Trivial bugfixes, chores and single-session docs keep their light path |
| 11 | The skills merge and tag, each behind a **stop**. They never push | Both are local and reversible before a push; pushing stays Robert's act |
| 12 | Retro follow-ups that are still worth doing are drafted as Backlog rows; Robert picks which land in the tracker | Fits the checklist's tracker step, which already captures deferred items |
| 13 | Arc artifacts move to `_completed/` at arc close, not in the last initiative's checklist; the arc row stays in Current Initiatives until then | The arc is not done until it is closed |

## Retro

One template, `templates/retro.md` in the session-modes skill, serves both levels.

- **File** — `<ID>-<initiative-name>-retro.md`, written in `docs/initiatives/implementation/` and moved with the plans. An arc's is `<ID>-<arc-name>-arc-retro.md`, written in the arc folder and moved with the arc artifacts.
- **In Plain Words** — the summary of what changed, in everyday terms (decision 9).
- **The five questions**, in this order:
  1. Did we do what we set out to do?
  2. Knowing what we know now, is there a better way to have done this that we didn't see at the time?
  3. Does this fit with the project as a whole?
  4. What does this change about the project as a whole?
  5. Rating (decision 8).
- **Follow-ups** — draft Backlog rows (decision 12).

Sources: the tracker write-up, the discovery doc, every plan and its Decision Record, the diff, the architecture pages, and for an arc initiative the arc docs. Arc close reads the initiative retros as well. The Rework rating counts this close's review findings, so it is filled after the fixes.

## Session Flow — Initiative Close

A **stop** waits for Robert.

1. **Read** — the session-modes files for the type, the tracker write-up, the discovery doc and plans (In Plain Words first), the arc docs if the initiative is in an arc.
2. **Checks** — on the feature branch; every phase box ticked; in a multi-effort initiative, every effort closed (no `E<n>`-scoped commits left in `main..HEAD` except `fix(E<n>):`); clean tree; gate passes. On a failure, say which and stop.
3. **Review** — the base is `git merge-base main HEAD`. Point the upstream at it, as effort close does, and start `/code-review high`. A `D.` initiative with no code changed skips the review.
4. **Retro** — written while the review runs.
5. **Pick** — show every finding. **Stop:** Robert picks.
6. **Fixes** — one commit, `fix: address initiative review findings`. Then fill the Rework rating.
7. **Retro sign-off** — show the summary, the answers and the ratings. **Stop:** Robert signs off and picks the follow-up rows.
8. **Close-out** — promote durable decisions to the architecture wiki, if the project has one; update the tracker; move the discovery doc, plans and retro to `_completed/`. One commit, `docs: close <ID>`.
9. **Merge** — **stop:** Robert approves. `--no-ff` into `main`, subject `feat: <ID> <initiative name>`, body the summary.
10. **Tag** — assess the bump from `git describe --tags --abbrev=0`. **Stop:** Robert approves the version. If this was the arc's last initiative, name `/gestalt:arc-close <arc-ID>` as the next session.

## Session Flow — Arc Close

1. **Read** — the arc concept, arc-discovery and arc-plan (In Plain Words first), and every initiative retro.
2. **Checks** — on `main`; clean tree; gate passes; every initiative in the arc-plan has its merge on `main`. Then cut `feature/<arc-name>-close`.
3. **Review** — start the arc review agent in the background with the brief: seams between initiatives, drift from arc-discovery decisions, the same thing built twice, leftover scaffolding, out-of-arc deferrals that slipped in.
4. **Retro** — the arc retro, written while the review runs.
5. **Pick** — **stop:** Robert picks. A finding too large for a fix becomes a follow-up row.
6. **Fixes** — one commit, `fix: address arc review findings`.
7. **Retro sign-off** — **stop**, as for an initiative.
8. **Close-out** — promote durable arc decisions; remove the arc row and write-up and add the picked rows; move the arc artifacts and retro to `_completed/arcs/<ID>-<arc-name>/`. One commit, `docs: close <ID>`.
9. **Merge** — **stop**, `--no-ff` into `main`, subject `chore: close <ID> <arc name>`, body the arc summary.
10. **Tag** — **stop**, as for an initiative.

## Places That Change

- **New:** `skills/initiative-close/SKILL.md`, `skills/arc-close/SKILL.md`, `skills/arc-close/review-brief.md`, `skills/session-modes/templates/retro.md`.
- **Rules:** `git-and-delivery.md` (Merging and tagging), `code-and-docs.md` (Session modes paragraph and table).
- **Session modes:** `feature-flow.md`, `docs-chore-flow.md`, `arcs.md`, `lifecycle.md`, `efforts.md`, `session-discipline.md` (File locations), `SKILL.md` (templates table), the hand-off template's Ahead line.
- **Starters:** `execute` names initiative close after a single-effort plan's last phase; `effort-close` names it after the last effort.
- **Other:** `style-guide` (Retro document type), `README.md` (skills list).

## Out of Scope

- Pushing, and deleting the merged branch. Both stay Robert's acts.
- Retros for work that has already shipped.
- Changing effort close beyond naming the next step.

## Open Questions

None.

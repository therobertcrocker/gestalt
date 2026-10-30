# Effort Close Skill — Discovery

## In Plain Words

- **What:** a new hand-run skill, `/gestalt:effort-close <ID>.E<n>`. It closes one effort of a multi-effort initiative in one session: interim review, `fix:` commits for the findings Robert selects, then the effort squash.
- **Why:** the process describes these three steps, but no skill runs them. Today Robert must remember the boundary, find the effort's base commit by hand, and put the steps together from `efforts.md` and the git-and-delivery rules.
- **How it fits:** it is the fourth session entry point, after `/gestalt:discovery`, `/gestalt:plan` and `/gestalt:execute`. It runs between an effort's last Execution session and the next effort's Plan session. It does not replace the pre-merge checklist, which still runs once for the branch.

## Problem

An effort boundary has three steps in a fixed order (`plugins/gestalt/skills/session-modes/efforts.md`, Interim Effort Review):

1. Interim review: a senior-engineer `/code-review` of only that effort's work, the diff since the effort's first commit.
2. `fix:` commits for the review's findings.
3. Effort squash: one `feat: <initiative> effort N — <name>` commit, with the `fix:` commits replayed on top and kept separate (`plugins/gestalt/rules/git-and-delivery.md`, Cadence on a feature branch).

The review runs in its own new session, on Opus. No skill starts that session:

- `/gestalt:execute` step 6 ticks the effort's Done box in the overview plan's Effort Summary, then stops at the end of the phase. It does not name the next step.
- The execution hand-off template's "Ahead" line can name the boundary ("interim review, squash"). That reminder exists only when a hand-off was written.
- With no target, `/code-review` reviews the working tree, which is empty after a commit. A branch target probably diffs against `main`, which includes every earlier effort. Robert must find the effort's base commit and pass a range himself.
- The squash procedure (backup branch, stash, `reset --soft`, commit, tree check, pop, replay of `fix:` commits with `commit-tree` and `rebase --onto`) is written as one dense rule. It is easy to do out of order by hand.

## Architecture Context

gestalt has no architecture wiki. The binding context is the process docs this skill must follow:

- `plugins/gestalt/skills/session-modes/efforts.md`, Interim Effort Review — the step order, its own session, review only (no merge, no tracker update), Opus.
- `plugins/gestalt/rules/git-and-delivery.md`, Cadence on a feature branch — the squash procedure, the separate `fix:` commits, and "ask before rewriting anything already pushed".
- `plugins/gestalt/skills/session-modes/session-discipline.md`, File locations — the `<ID>.E<n>` work-address form.
- `plugins/gestalt/skills/execute/SKILL.md` — the shape the new skill follows (hand-run, `disable-model-invocation: true`, an `argument-hint`, numbered steps).

## Design Summary

- A hand-run skill at `plugins/gestalt/skills/effort-close/SKILL.md`, invoked as `/gestalt:effort-close <ID>.E<n>`.
- One guided session runs the three steps in the fixed order: review, fixes, squash. It stops for Robert to confirm the base commit, to pick the fixes, and to approve the squash (Session Flow). The session ends when the squash is verified.
- The skill finds the effort's base commit itself and scopes the review to the effort's commits only.

## Decisions

| # | Decision | Rationale |
|---|---|---|
| 1 | Guided session: stop after the review, after the fixes, and before the squash | The squash rewrites history; Robert sees each step before the next one starts |
| 2 | Robert picks which findings get a `fix:` commit | A review finding can be a design call, and design is Robert's |
| 3 | Running `effort-close` approves each selected fix; each lands as its own `fix:` commit when the gate passes | The fixes must stay separate commits anyway, so the ad-hoc "wait to bundle" rule has nothing to bundle |
| 4 | If the effort's commits are pushed, ask; on a yes, squash and tell Robert a force-push is needed. The skill does not push | git-and-delivery: ask before rewriting anything already pushed. The push stays Robert's act |
| 5 | Derive the base commit: for E1, where the branch left `main`; for a later effort, the previous effort's squash commit plus the `fix:` commits right after it. Show the base and the commit list; Robert confirms before the review | No new record to keep. The confirm stop catches an odd history |
| 6 | Review through a soft-reset view: make the `backup/` branch, `reset --soft` to the base, run `/code-review` with no target, then reset back to the original head | The current diff is the documented `/code-review` mode. A range passed as the target is free text, and nothing confirms the review honors it |
| 7 | The interim review always runs at level `high` | The same depth at every boundary, without the cost of `max` |
| 8 | Before it starts, the skill checks: the feature branch is checked out, effort n's Done box is ticked, the working tree is clean, the gate is green | A dirty tree would mix into the soft-reset view. A green gate gives the fixes a known baseline |
| 9 | Six places name the skill: `efforts.md` (Interim Effort Review), `git-and-delivery.md` (the effort-squash rule), `code-and-docs.md` (the "Start a session with…" line and the Session table), `/gestalt:execute` step 6, the hand-off template's "Ahead" line, and the README skills list | The reminder reaches every session through the rules, and the execute session names the next command at the moment the effort finishes |

## Session Flow

The steps of one `effort-close` session, in order. A **stop** waits for Robert.

1. **Checks** — feature branch, Done box, clean tree, green gate (decision 8). On a failure, say which check failed and stop.
2. **Base** — derive the base commit and list the effort's commits (decision 5). **Stop:** Robert confirms the base.
3. **Backup** — make the `backup/` branch at the current head. The review and the squash share it.
4. **Review** — `reset --soft` to the base, run `/code-review high` with no target, then reset back to the original head (decisions 6 and 7). Confirm the tree matches the backup.
5. **Pick** — show every finding. **Stop:** Robert picks the ones to fix (decision 2).
6. **Fixes** — for each pick: edit, gate, commit as its own `fix:` commit (decision 3).
7. **Squash check** — show the `fix:` commits and say whether the effort's commits are on the remote. **Stop:** Robert approves the squash (decisions 1 and 4).
8. **Squash** — squash the effort's commits into `feat: <initiative> effort N — <name>`, replay the `fix:` commits on top, and confirm the final tree matches the tree before the squash. If the commits were pushed, say that a force-push is needed.

The session ends after step 8. It does not merge, push or change the tracker.

## Out of Scope

- The pre-merge checklist. It still runs once for the branch, after the last effort.
- Pushing. A force-push after a squash stays Robert's act.
- The tracker and the Effort Summary. An effort close does not change either one.

## Assumptions to Verify in Plan

- `/code-review` with no target reviews staged changes, not only unstaged ones. The soft-reset view leaves the effort's work staged. If it reviews only unstaged changes, step 4 adds a `reset --mixed` instead.
- A skill can call `/code-review` through the Skill tool and get its findings back in the same session.

## Open Questions

None.

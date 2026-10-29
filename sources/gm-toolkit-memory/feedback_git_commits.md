---
name: git-commit-cadence-on-feature-branches
description: "Preserve history on merge — use --no-ff merge commits to consolidate, never squash"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 0888a97f-f344-4722-ae02-9e233143c5d1
  modified: 2026-10-21T03:55:11.350Z
---

On feature branches, commit at the end of each implementation layer/effort with a meaningful conventional-commit message (per-layer `wip:` is fine for mid-session checkpoints, but the recent practice is clean per-effort conventional commits — `refactor:`/`fix:`/`docs:` etc.).

**Within a multi-effort branch (Robert, 2026-10-11):** commit once per execution session as usual (checkpoints), then at each effort boundary squash that effort's commits into one `feat: <initiative> effort N — <name>` commit (body bullets summarise the former commits). Robert asked for this on s-flag Effort 1 — all 8 commits incl. plan/process docs folded in. Branch is local-only, so rewrite is safe; make a `backup/` branch first, stash WIP, `reset --soft` to the effort's base, commit, verify tree identical, pop. Ask before rewriting anything already pushed.

**Follow-up fixes stay separate from the effort squash (Robert, 2026-10-11):** a fix found after an effort's squash (e.g. s-flag `be4295e`, reactors checking asset active) lands as its own `fix:` commit beside the effort commit — "I want to see these fixes." Don't fold it into the effort commit. Same for review-fix commits made *before* the squash (A.001.6 Effort 1, 2026-10-21): squash the effort's commits only, then replay the `fix:`/later `docs:` commits on top (`commit-tree` + `rebase --onto`).

**At merge: do NOT squash.** Robert wants the historical record kept — every squash loses provenance he values. Consolidate with a `--no-ff` merge commit that marks the initiative boundary, leaving all sub-commits reachable underneath. (This reverses the earlier "squash to one commit on merge" guidance, which he explicitly retired 2026-06-18.)

**Why:** Squashing discards the E1/E2/fix/docs story that the branch commits tell; a merge node consolidates without destroying that history.

**How to apply:** Branch → one clean conventional commit per layer/effort. Merge → `git merge --no-ff` with a summary message naming the initiative (e.g. the A.001.1 boundary). Matches repo precedent like `eb772d4`. Fast-forward is acceptable when there's no boundary worth marking, but never `--squash`.

**Never commit initiative work on `main`** — including Plan-session docs. Before the first commit of a new initiative, create `feature/<initiative-name>` (e.g. `feature/s-flag-effect-registry`) if on `main`. **Why:** Claude once committed the s-flag Effort 1 plan on main (2026-10-11) and Robert corrected it — `main` only receives `--no-ff` merges.

Update the dev journal and planned-work ON THE FEATURE BRANCH before merging, so doc updates land with the work. (Execution-time decisions go in the plan's Decision Record per [[feedback_decisions_log_scope]], graduated to arch pages at pre-merge per [[feedback_branch_initiative_layering]].)

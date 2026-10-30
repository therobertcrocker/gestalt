# Git and delivery

## Branches

- Never commit initiative work on `main`. Cut `feature/<initiative-name>` when work on the initiative starts, before the first Discovery session writes anything. Every session of the initiative runs on the branch: Discovery, the overview plan, effort plans and Execution alike. `main` receives `--no-ff` merges only.
- Sub-initiatives and enabling refactors on a feature branch are sequential commits on that branch, not sub-branches. They aren't independently shippable, so there is nothing to review or merge at. The pre-merge checklist runs once, at branch level, when the top-level work is complete.

## Commits

- Conventional commits: `type: description` with `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`. Imperative mood, concise.
- Stage with `git add -A`, every time. Don't check status first and don't hand-pick files; gitignored files stay ignored, and anything unexpected is caught at review.
- All changes are committed, even ones unrelated to the work at hand. Lost work is unacceptable. If unsure whether a change belongs, ask. The one exception: session hand-off files are never committed.
- A multi-line commit message goes through `git commit -F <file>`, the file written with the Write tool in the scratchpad. Never chain a heredoc with `&& \`; it runs the message as shell commands.
- Planned execution: when a plan defines the commits, make each commit as soon as it passes the gate (build, vet, test) with the plan's message, then start the next one. Don't stop to ask; the plan already fixed the commit shape.
- Ad-hoc work (a bugfix session, a batch of fixes): don't commit until Robert says so. He bundles related changes into one commit.
- Before any commit, log execution-time decisions and reversals of planned decisions in the plan's Decision Record. Append and reconcile: when execution overrides a planned decision, record the reversal with its reason and fix the plan body so it doesn't lie.
- Wrap-up before a commit: the end-of-session report includes a plain-language summary (what changed and why, in everyday terms, not a diff walk) and a short review for risks, gaps and drift from the plan. Fold it into the normal wrap-up; no separate "want a summary?" question.

## Cadence on a feature branch

- Every execution session ends with at least one commit as its checkpoint; a plan-defined scope lands as the plan's commits. `wip:` is acceptable mid-session; a clean conventional commit is preferred.
- At each effort boundary, squash that effort's commits into one `feat: <initiative> effort N — <name>` commit whose body bullets summarise the former commits. Make a `backup/` branch first, stash any WIP, `reset --soft` to the effort's base, commit, verify the tree is identical, pop. Ask before rewriting anything already pushed.
- Fixes found after an effort's squash, and review-fix commits made before it, stay as their own `fix:` commits beside the effort commit. Robert wants to see them. Replay them on top (`commit-tree` plus `rebase --onto`); never fold them in.

## Merging and tagging

- Before merging a branch, in order:
  1. A code review as if a senior engineer were reviewing a junior's PR, with `/code-review`. Critical but constructive; suggest specific improvements, don't only point at issues.
  2. Promote durable decisions: graduate architecturally significant entries from the plan's Decision Record into the relevant architecture page's Key Decisions, if the project has an architecture wiki. Micro-decisions stay in the plan as provenance.
  3. Update `docs/planned-work.md`: remove the finished initiative, add any new features or deferred items that surfaced.
  4. Move the initiative's discovery and plan docs into `docs/initiatives/_completed/<ID>-<initiative-name>/`. An arc initiative goes under `docs/initiatives/_completed/arcs/<arc-ID>-<arc-name>/initiatives/<ID>-<initiative-name>/`; when the arc's last initiative ships, the arc artifacts move into `_completed/arcs/<arc-ID>-<arc-name>/` too.
- Update the tracker and docs on the feature branch before merging, so they land with the work.
- Merge with `git merge --no-ff` and a message naming the initiative. Never `--squash` at merge: the branch commits are the historical record. A fast-forward is acceptable only when there is no boundary worth marking.
- After every merge, assess whether the work warrants a patch, minor or major bump and tag accordingly. Check the current version with `git describe --tags --abbrev=0` first.

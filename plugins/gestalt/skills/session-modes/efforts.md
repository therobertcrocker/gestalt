# Efforts

An **effort** is the scaling mechanism for initiatives too large to be contained in one coherent Plan. It is not a work type — any type can split into efforts when its plan exceeds what one plan can coherently hold; features, refactors and docs initiatives have all done it.

## The multi-effort flow

**Discovery → Overview Plan → per effort: (Plan as needed) → Execution.**

- **One Discovery, shared.** The initiative's discovery doc designs across all efforts; efforts do not get their own Discovery.
- **One overview plan, always.** The first Plan session produces the top-level plan (`<ID>-<initiative-name>-overview-plan.md`): shared decisions, the effort slicing, and the dependency DAG between efforts. Small efforts are specified fully here and execute straight from it.
- **Per-effort Plan sessions, as needed.** A large or design-heavy effort gets its own lightweight Plan session producing `<ID>.E<n>-<initiative-name>-plan.md`. The overview plan names which efforts need one. Each per-effort Plan session is its own session, subject to the usual mode boundaries.
- **Execution per effort.** Each effort's work runs as normal execution sessions for the initiative's type (per-phase for features and refactors, per-doc for docs). The commit that finishes an effort ticks its Done box in the overview plan's Effort Summary.
- **Branch timing.** The feature branch is cut when Discovery starts (git-and-delivery rules). The overview plan and every effort session, the per-effort Plan sessions included, run on the branch. At the start of any effort session, confirm the branch is checked out before writing anything.
- **The single Discovery owns the whole design surface.** Later efforts' design (their flows, modals, data) is settled in that one Discovery, not pushed into their own discovery passes or into execution-time decisions. At Plan time expect an overview plus N effort plans, not one monolithic plan.

## Interim Effort Review

Every effort boundary gets an interim code review: after an effort's last phase is committed, before the next effort's Plan session. It is a senior-engineer `/code-review` of just that effort's work (the diff since the effort's first commit), catching structural issues while the next effort is still cheap to redirect.

The order at a boundary is: interim review → review `fix:` commits → effort squash (the fixes replay on top, kept separate; git-and-delivery rules) → next effort. The review runs in its own new session, not at the end of the execution session that closed the effort; that session ends once the last phase is committed. Start that session with `/gestalt:effort-close <ID>.E<n>`; it runs the review, the fixes and the squash in order.

It is **distinct from the Pre-Merge Checklist**: the checklist still runs once at branch level after the final effort. An interim review does not trigger a merge or a tracker update — it is review only. Like all reviews, it runs on Opus (session-discipline.md, Model selection).

## Effort vs. arc

If the slices are independently shippable initiatives (each with its own branch, merge, and lifecycle entry), it's an arc (arcs.md), not a multi-effort initiative. Efforts share one branch, one Discovery, and one pre-merge checklist; arc initiatives don't.

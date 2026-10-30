# Bugfix flow

Bugfix work is **tiered** — most bugfixes skip Discovery and Plan entirely. The tier is determined by what's known going in.

## Trivial Bugfix (single Execution session)

Use when:
- The root cause is known or trivially diagnosable
- The fix is describable in one sentence
- One file, or a few obviously related files
- One reasonable fix approach

Flow: **Backlog → Execution → Done.** No discovery, no plan. Single session: diagnose (if needed), fix, commit (`fix: <description>`), update tests.

## Non-Trivial Bugfix (lightweight plan + Execution)

Use when:
- Root cause needs investigation before a fix can be chosen
- Multiple plausible fix approaches with meaningful tradeoffs
- The fix touches several files or crosses package boundaries
- Risk of regression is non-trivial

Flow: **Backlog → Plan → Execution → Done.**

The plan is **lightweight** — typically a single section in `docs/initiatives/implementation/<ID>-<bugfix-name>-plan.md` covering:

- **Root cause** — what's actually wrong
- **Fix approach** — the chosen approach, with brief rationale if alternatives existed
- **Test plan** — how the fix is verified, and what regression coverage is added

No separate Discovery session. If diagnosis is the hard part, that's the first half of the Plan session, not its own mode.

Execution is typically a single session, occasionally split if the fix is genuinely multi-commit.

## Promoting a bugfix to a refactor or feature

If investigation reveals the bug is symptomatic of a structural problem, the right fix may not be a bugfix at all. In that case: stop, change the `Type` field on the planned-work entry from `bugfix` to `refactor` or `feature`, and re-route through the appropriate flow. Mis-routing is recoverable (see lifecycle.md, Routing by type).

## Pre-Merge Checklist

For trivial bugfixes the pre-merge checklist may be lightweight or skipped (single-commit fixes don't need a senior-engineer code review pass). For non-trivial bugfixes, follow the full checklist as in Feature Flow.

# [Initiative Name] — Implementation Plan

<!--
COPY THIS FILE TO: dev_journals/initiatives/implementation/<ID>-<initiative-name>-plan.md
  (<ID> is the planned-work ID as written, e.g. A.001.4-goals-tags-core-plan.md;
  an overview plan is <ID>-<initiative-name>-overview-plan.md)

LEVELS (feature-flow.md, Work breakdown levels):
  Initiative → Effort → Phase → Commit → Task. One phase = one execution
  session.

This template covers three file shapes:

  1. Single-file plan (one effort): every section below, with phases in
     Work Breakdown. The overview and the effort plan are the same file.

  2. Overview plan (multi-effort):
         dev_journals/initiatives/implementation/<ID>-<initiative-name>-overview-plan.md
     Every section above Work Breakdown, plus
     the Effort Summary. Work Breakdown holds one "### Effort N" section per
     effort: its scope, and whether it gets its own Plan session. Effort
     pacing is defined in efforts.md.

  3. Effort plan (multi-effort):
         dev_journals/initiatives/implementation/<ID>.E<n>-<initiative-name>-plan.md
     Same sections as a single-file plan, scoped to the effort: its own
     In Plain Words, Decisions Ratified, Decision Record, Design Spec —
     Carried By, Look Here First
     (written by the last phase under /gestalt:coordinate), Shared Context,
     Outside Rules, Out of Scope, then phases in Work Breakdown. It cites
     the overview's decisions and Outside Rules rows; it does not repeat
     them.

SIZE: two budgets, for single-file and effort plans. The overview has none.
  - Front matter (every line above Work Breakdown): about 400. Every phase
    session reads it again. Past it, the effort carries too many decisions:
    split the effort.
  - Each phase: about 1,500 lines, from the phase heading to the next one,
    and at most about 4 commits. Past either, split the phase.
Spend lines on literal code in tasks, not on prose. Commits have no line
budget; split them only at real seams (KEY RULE 1). Past a budget, split, or
record why not in one line under Decisions Ratified in Planning.

  awk '/^## Work Breakdown/{print NR-1, "front matter"; exit}' <plan-file>
  awk '/^### Phase/{if(h)print n,h;h=$0;n=0;next} h{n++} END{print n,h}' <plan-file>

Multi-effort DOCS initiatives use templates/docs-plan.md instead — generative
docs discover-at-write and don't fit the Phase/Commit/Task structure.

Delete these comments before writing.
-->

## In Plain Words

<!--
REQUIRED. Three lines, under 15 lines in all. Plain words for a reader who has
not read the rest of this plan: none of the project's vocabulary unless it is
defined in the same sentence. They say what this plan handles; the Design Spec
says what the whole work builds.

  - What: what this plan delivers, in plain words.
  - Why: a pointer to the Design Spec, or the problem the work solves.
  - How it fits: the criteria of the Design Spec this plan carries, and where
    it sits: the initiative, the effort, the arc. A plan that holds the spec
    points up, to the arc's spec or to the project.

Every execution session reads this section first (session-discipline.md,
Re-grounding). If execution changes the what, why or fit, fix it here too.
-->

- **What** — [what this plan delivers]
- **Why** — [the pointer to the Design Spec, or the problem]
- **How it fits** — [the criteria this plan carries, and where it sits]

## Design Spec

<!--
Only when this plan is the work's first doc: a non-trivial bugfix, or a
refactor that goes straight to Plan (session-discipline.md, Design Spec).
Otherwise leave the section out; the spec is in the discovery doc or the
audit, and this plan cites it.

Two parts. Ratify the criteria with Robert before the phases are written.
Robert's rule: a criterion is a question he can ask of the finished work, with
the answer that means success. Not a count or a limit.
-->

### What we are building

[One paragraph: the thing, in plain words, as a commitment the criteria can test.]

### Success Criteria

| # | Question | Success is |
|---|---|---|
| 1 | [question] | [the answer that means success] |

## Context / Goal

<!--
REQUIRED. What this plan accomplishes. Brief — link back to the discovery doc for
the full design rationale.

  - Discovery doc: [link]
  - Related plans: [links if applicable]
-->

## Decisions Ratified in Planning

<!--
REQUIRED. Design decisions made *during* the plan session, not in Discovery.

Each decision: what was decided, brief rationale, and which open question (from
Discovery) it resolves if applicable. Architecturally-durable decisions graduate
to the relevant architecture page's Key Decisions at pre-merge.
-->

1. **[Decision]** — [rationale]
2. **[Decision]** — [rationale]

## Decision Record — Execution

<!--
REQUIRED once execution begins (empty at plan time). Execution-time decisions
and reversals of planned decisions land here, logged before the commit they
ride (git-and-delivery rules).

Contract: append AND reconcile — when execution overrides a planned decision,
log the reversal with rationale here and fix the plan body so it doesn't lie.
At pre-merge, architecturally-durable entries graduate to the relevant
architecture page's Key Decisions section; the rest stay here as provenance
when the plan ships to _completed/.
-->

## Design Spec — Carried By

<!--
REQUIRED. One row per criterion of the Design Spec this plan carries. Cite
each by number and a short name; never restate it (session-discipline.md,
Design Spec).

  - Overview plan: every criterion. Carried by names the effort. Add a
    "Checked at" column: the initiative close, or a first real use.
  - Effort plan: the criteria the overview gives this effort. Carried by
    names the phase and commit.
  - Single-file plan: every criterion. Carried by names the phase and commit.

A criterion that nothing carries is a gap: put it to Robert before sign-off.
-->

| Criterion | Carried by |
|---|---|
| 1 — [short name] | [Phase 1, Commit 2] |

## Look Here First

<!--
Only for an effort that runs under /gestalt:coordinate. Leave the heading out
at plan time. The last phase's agent writes it in that phase's last commit:
the effort's weakest spots, one bullet each, with a file:line and one line of
why. /gestalt:effort-close finds the section by this heading.
-->

---

<!--
OPTIONAL SECTIONS BELOW. Include only the ones relevant to this initiative.
Shared Context is the catch-all for context that doesn't justify its own
top-level section (model discipline, pre-merge additions, naming conventions,
test harness setup, etc.).
-->

## Open Questions — To Ratify at Implementation Time

<!--
Questions deliberately deferred to Execution. Each should name when it will be
resolved (which phase, which commit, or "first use").
-->

## Effort Summary

<!--
Use only when the initiative is split into multiple efforts. One-line scope per
effort in a table, with a link to each per-effort plan file.

Done is a checkbox. The commit that finishes the effort's last phase ticks it
([x]). In a table cell it shows as text, not as a rendered box.
-->

| Done | # | Effort | Scope | File |
|------|---|--------|-------|------|
| [ ] | 1 | [name] | [one-line scope] | [`<ID>.E1-…-plan.md`](./<ID>.E1-<initiative-name>-plan.md) |

## Shared Context

<!--
Cross-cutting context with no single natural home: naming conventions, test
harness setup, model discipline per phase, initiative-specific pre-merge
checklist additions, package conventions.

NOT for per-file implementation detail. Signatures, struct definitions, field
lists, formatter tables, dispatch flows — all belong in the task that builds
them (see Work Breakdown), never here. Hoisting detail up and referencing it
back down splits one spec across two locations; the execution session reading a
task loses locality and has to reassemble the spec. If a section here is named
after a single commit ("Adapter contract changes (Commit 4)"), it is in the
wrong place — move it into that commit's task.
-->

## Outside Rules

<!--
REQUIRED when the plan builds a rule that lives outside the repo: a game rule,
a file format, an API, a tool's behaviour. Leave the section out when there is
none.

One row per rule. The quote and the link are fetched in the Plan session. A
rule written from memory is not a source: the code it leads to copies the
mistake faithfully. If the text cannot be fetched, the row says so and the rule
goes to Open Questions. A task that builds a rule cites its row ("Outside
Rules, row 3").

An overview plan holds the rules that more than one effort builds. An effort
plan cites those rows by number and adds its own.
-->

| # | Rule the plan builds | Quote | Source |
|---|---|---|---|
| 1 | [the rule, in plain words] | "[the text, word for word]" | [link and section], fetched [date] |

## Out of Scope

<!--
Explicit non-goals. Things that look related but won't be addressed by this plan.
Deferred items belong in dev_journals/planned-work.md as separate Backlog entries.
-->

---

## Work Breakdown

<!--
REQUIRED. The actual sequence of work, structured at whichever granularity fits.

GRANULARITY GUIDE:
  - Small refactor or bugfix:    Steps only.
  - Single-file or effort plan:  Phases → Commits → Tasks. Work that fits one
                                 session is one phase; keep the phase heading.
  - Overview plan:               "### Effort N" sections (file shape 2 above).

KEY RULE 1: Each phase = one execution session. Size each phase to the phase
budget above, typically 2–3 commits, at most about 4. Split phases and commits
only at real seams:
a green-build point, a type-system or cross-package boundary, or a behavior
change. Title each commit with its conventional commit message so the execution
session knows the deliverable shape going in. In an effort plan or an overview
plan's Effort section, the message carries the effort scope: `feat(E2): ...`
(git-and-delivery rules).

KEY RULE 2: Every task is self-contained and executable on its own — it IS the
edit, not a description of one (see the per-task format below). The full
implementation detail lives in the task as literal code: real signatures, struct
definitions with field lists, per-kind tables — never a pointer back to a section
above, never pseudocode the executor must flesh out. When a structure is
genuinely shared across commits, the FIRST task that needs it defines it in full;
later tasks cite that task precisely ("uses turn.Model, defined in Commit 5
Task 1") rather than redefining it or referencing a floating section. The only
back-reference allowed is a task-to-task citation.
-->

**Overview**

<!--
REQUIRED when the breakdown has phases. The work breakdown at one glance: one
line per phase, one nested line per commit with its conventional message and
its task count. Plain text, no anchor links. A bold label, not a heading, so
`###` stays the phase level.

Not for steps-only plans (they are short) or overview plans (the Effort Summary
does this job).

Keep it in sync: when execution adds, splits, or moves a commit or task, update
this list in the same edit that changes the plan body.

Each phase line starts with a checkbox. The execution session ticks it ([x]) in
the phase's last commit, so the tick lands with the work.
-->

- [ ] **Phase 1 — [Title]**
  - Commit 1 — `feat: [conventional commit message]` (N tasks)
  - Commit 2 — `refactor: [conventional commit message]` (N tasks)
- [ ] **Phase 2 — [Title]**
  - Commit 3 — `[type]: [conventional commit message]` (N tasks)

### Phase 1 — [Title]

**In plain words:** [what this phase changes, and what is true when it lands.]

<!--
REQUIRED per phase. One or two sentences, no more: what this phase does and
what is true when it lands, the plan's In Plain Words at its smallest. Plain
words for a reader who has not read the rest of this plan: none of the
project's vocabulary unless it is defined in the same sentence. A bold label, not a heading, so `####` stays the commit level.
One phase = one execution session.

The execution session reads it after the plan's In Plain Words
(session-discipline.md, Re-grounding). If execution changes the phase's scope, fix it here too.
-->

#### Commit 1 — `feat: [conventional commit message]`

##### Task 1 — `path/to/file.go`

<!--
A task is the EDIT, not a description of it. The executor (human or Claude)
applies it without interpreting prose back into code and without reading
anything above the task. Pick the format by edit size:

SURGICAL EDIT to an existing file — Find → Replace. Pull the anchor verbatim
from the current source so it locates the spot exactly:

  In `FuncName`, <one line of why this changes>.

  **Find:**
  ```go
  <verbatim current lines, enough to be unique>
  ```
  **Replace with:**
  ```go
  <exact new lines>
  ```

NEW OR REWRITTEN file — full content. No anchor needed; there's nothing to
locate. Give the complete file body in one block:

  `path/to/file.go` (new) — full contents:
  ```go
  <the entire file>
  ```

Either way the code is literal: real signatures, real struct field lists, real
per-kind tables — never "see Shared Context," never pseudocode the executor must
flesh out. If this task defines a structure later tasks reuse, define it in full
here; later tasks cite it by task ("uses turn.Model, defined in Commit N Task M").
-->

##### Task 2 — `path/to/other_file.go`

<!-- ... -->

##### Commit message

<!--
REQUIRED per commit. The fenced conventional-commit message the execution
session will use, so the deliverable shape is fixed going in:

```
type(scope): summary line

- bullet per material change
```
-->

#### Commit 2 — `refactor: [conventional commit message]`

<!-- ... -->

### Phase 2 — [Title]

<!-- ... -->

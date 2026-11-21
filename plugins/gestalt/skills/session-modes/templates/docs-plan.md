# [Initiative Name] — Implementation Plan

<!--
COPY THIS FILE TO: dev_journals/initiatives/implementation/<ID>-<initiative-name>-overview-plan.md

This is the plan format for MULTI-EFFORT DOCS INITIATIVES
(docs-chore-flow.md). Single-session docs work needs no plan at all — if you're reaching
for this template for one doc, stop and just write the doc.

How this format differs from implementation-plan.md, and why:

  - NO Phase → Commit → Task breakdown. Generative docs discover-at-write —
    the act of writing a doc IS the act of exploring its subject, so per-file
    edits cannot be pre-specified the way code tasks can.
  - Deliverables are NAMED DOCS with scope statements, not literal edits.
  - There is usually NO discovery doc; design rationale is worked out in the
    Plan session and recorded under "Decisions Ratified in Planning."

Delete these comments before writing.
-->

## In Plain Words

<!--
REQUIRED. Three lines, under 15 lines in all. Plain words for a reader who has
not read the rest of this plan: none of the project's vocabulary unless it is
defined in the same sentence. They say what this plan handles; the Design Spec
below says what the initiative builds.

  - What: what this plan delivers in the doc set, in plain words.
  - Why: a pointer to the Design Spec, or the problem it solves for the reader.
  - How it fits: this plan holds the spec, so it points up, to the project.
    Name what the work unblocks.

Every execution session reads this section first, then the Design Spec
(session-discipline.md, Re-grounding).
-->

- **What** — [what this plan delivers]
- **Why** — [the pointer to the Design Spec, or the problem]
- **How it fits** — [the project, and what this unblocks]

## Design Spec

<!--
REQUIRED. A docs initiative has no discovery doc, so this plan is its first
doc and holds its Design Spec (session-discipline.md, Design Spec). Two parts.
Ratify the criteria with Robert before the efforts are written.

Robert's rule: a criterion is a question he can ask of the finished work, with
the answer that means success. Not a count or a limit.
-->

### What we are building

[One paragraph: the doc set, in plain words, as a commitment the criteria can test.]

### Success Criteria

| # | Question | Success is |
|---|---|---|
| 1 | [question] | [the answer that means success] |

## Context / Goal

<!--
REQUIRED. What's wrong with the current doc set, what this initiative builds,
and why the work is multi-effort. If the work splits into tracks (e.g. meta
decisions vs. generative writing), name them here.
-->

## Decisions Ratified in Planning

<!--
REQUIRED. The doc-set design decisions made in the Plan session: structure,
formats, retrieval/maintenance rules, tooling constraints. For a docs
initiative this section carries the weight Discovery would normally carry —
be generous with rationale.
-->

1. **[Decision]** — [rationale]
2. **[Decision]** — [rationale]

## Open Questions — To Ratify at Execution Time

<!--
OPTIONAL. Questions deliberately deferred, each routed to the effort that
resolves it ("Effort 2: exact template set", "Effort 3: the seeded page list").
-->

## Effort Summary

<!--
REQUIRED. One row per effort. "Carries" names the Design Spec criteria the
effort delivers, by number; every criterion has an effort. "Depends on" makes
the DAG scannable. Note here
which efforts get their own lightweight Plan session and which execute straight
from this file (efforts.md).

Done is a checkbox. The commit that finishes the effort's last deliverable
ticks it ([x]). In a table cell it shows as text, not as a rendered box.
-->

| Done | # | Effort | Scope | Carries | Depends on |
|------|---|--------|-------|---------|------------|
| [ ] | 1 | [name] | [one-line scope] | [criteria, by number] | — |

## Per-Effort Breakdown

<!--
REQUIRED. For each effort: Scope (what it touches), Deliverables (the named
docs/edits it produces — specific enough that "done" is checkable), and
Dependencies (what gates it, what it feeds). Deferred tails that ride a later
effort are called out explicitly.
-->

### Effort 1 — [Name]

**Scope:**

**Deliverables:**

**Dependencies:**

## Sequencing / DAG

<!--
OPTIONAL but recommended for 3+ efforts. An ASCII DAG plus the recommended
linear order if not parallelizing.
-->

## Decision Record — Execution

<!--
REQUIRED once execution begins (empty at plan time). Execution-time decisions
and reversals land here per commit (git-and-delivery rules). Contract:
append AND reconcile — if execution overrides a planned decision, log the
reversal with rationale and fix the plan body above so it doesn't lie.
-->

## Out of Scope

<!--
OPTIONAL. Explicit non-goals — especially future doc tooling (site generators,
viewers) and docs owned by unbuilt features.
-->

# [Initiative Name] — Discovery

<!--
COPY THIS FILE TO: dev_journals/initiatives/discovery/<ID>-<initiative-name>-discovery.md
  (<ID> is the planned-work ID as written, e.g. A.001.4-goals-tags-core-discovery.md)

A discovery doc captures the design for an initiative before implementation begins.
The shape varies by what's being designed. Required sections are always present;
optional sections are included when relevant. A refactor has no discovery doc: its
Audit uses templates/exploration.md (refactor-flow.md).

Delete these comments before writing.
-->

## In Plain Words

<!--
REQUIRED. Three lines, under 15 lines in all. Plain words for a reader who has
not read the rest of this doc: none of the project's vocabulary unless it is
defined in the same sentence. They say what this doc handles; the Design Spec
below says what the initiative builds.

  - What: the output of this doc. The design and the decisions the plan is
    written from. It builds nothing.
  - Why: a pointer to the Design Spec, or the problem the work solves.
  - How it fits: this doc holds the spec, so it points up: to the arc's spec
    and the criteria the arc-plan gives this initiative, or to the project.
    Name what the work unblocks.

Every session on this initiative reads this section first, then the Design
Spec (session-discipline.md, Re-grounding).
-->

- **What** — [the output of this doc]
- **Why** — [the pointer to the Design Spec, or the problem]
- **How it fits** — [the arc's spec or the project, and what this unblocks]

## Design Spec

<!--
REQUIRED. What the initiative builds, and how Robert will know it is built.
Two parts (session-discipline.md, Design Spec).

Start from the criteria the seed proposes, if any, and in an arc from the
criteria the arc-plan gives this initiative. Ratify the criteria with Robert
before the design below is written; the design answers to them.

Robert's rule: a criterion is a question he can ask of the finished work, with
the answer that means success. Not a count or a limit.

The plan gives each criterion the work that carries it, and the initiative
close holds the work against every one. Neither restates a criterion; each
cites it by number.
-->

### What we are building

[One paragraph: the thing, in plain words, as a commitment the criteria can test.]

### Success Criteria

| # | Question | Success is |
|---|---|---|
| 1 | [question] | [the answer that means success] |

## Problem

<!--
REQUIRED. What is broken, missing, limiting, or worth investigating?

Name the gap or pain point. Be richer than the planned-work blurb.

Reference specific code paths, files, and line numbers where helpful.
-->

## Architecture Context

<!--
REQUIRED. List the architecture page(s) read for this initiative
(docs/architecture/ — start at docs/architecture/architecture-overview.md)
and pull out the Key Decisions that constrain this design. This is the push half of the push-not-pull decision system
(session-discipline.md): the binding rationale lives on the page this
section forces you to open.

If no page covers the relevant subsystem yet, say so — that's a signal the
wiki needs a page; note it in dev_journals/planned-work.md. If the project has no
architecture wiki, say that and name the binding context instead.
-->

## Design Summary

<!--
REQUIRED.

Name the chosen approach in a few paragraphs, with rationale.

This is the section a reader skims to understand "what are we doing about it."
-->

## Open Questions

<!--
REQUIRED. Anything unresolved that the Plan session needs to decide.

If there are no open questions, write "None." Don't omit the section.
-->

---

<!--
OPTIONAL SECTIONS BELOW. Include the ones relevant to this work; delete the rest
along with this comment. Add new sections freely — discovery docs are not
template-bound, and the work itself dictates what's needed.
-->

## Domain Model Changes

<!--
New types, field changes, struct shape decisions. One subsection per type or area.
Show signatures or struct definitions where the shape is non-obvious.
-->

## Per-Area Design Details

<!--
One section per major component, flow, or sub-feature being touched. Use
descriptive names (e.g. "Login Flow", "Config Loading", "Cache Invalidation"),
not "Area 1 / Area 2".
-->

## Mutation Surface

<!--
For state-changing work. New, changed and removed mutations or state transitions,
with brief rationale per item.
-->

## State Storage

<!--
What gets persisted where. Schema additions, stored-type field changes,
on-disk file additions.
-->

## User-Facing Impact

<!--
UI changes, CLI changes, output changes. What does the user see differently?
-->

## Replaces / Retires

<!--
What existing code, types, patterns, or behaviors get removed or superseded.
-->

## Out of Scope

<!--
Explicit non-goals. Things that look like they're in scope but aren't. Deferred
work that should be filed in dev_journals/planned-work.md as a separate Backlog entry.
-->

## Reference Exemplars

<!--
Prior art, Key Decisions from related architecture pages, similar patterns
elsewhere in the codebase.
-->

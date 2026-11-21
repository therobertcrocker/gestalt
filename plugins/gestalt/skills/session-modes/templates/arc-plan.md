# [Arc Name] — Arc Plan

<!--
COPY THIS FILE TO: dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-plan.md

Started with /gestalt:arc-plan. The flow is arcs.md in the session-modes
skill. This doc cuts the arc into initiatives, sets their order and
boundaries, and gives every open question an owner. It holds no design for any
one initiative; each one runs its own Discovery.

The session ends behind two stops: Robert signs off this doc and the tracker
rows, which are then written and committed; then he approves the merge of
feature/<arc-name> into main.

Number the decisions AP-1, AP-2, so an initiative can cite them with no clash.
Cite the arc-discovery's parts by number (SC-2, ACD-4); do not restate them.

Delete these comments before writing.
-->

> **Status:** [in progress | signed off YYYY-MM-DD], on `feature/[arc-name]`. This doc cuts the arc into initiatives; it holds no design for any one of them.
>
> **Inputs:** the [seed](../../seeds/[ID]-[arc-name]-seed.md) and the [arc-discovery]([ID]-[arc-name]-arc-discovery.md) (SC-1 to SC-[n], ACD-1 to ACD-[n])

## In Plain Words

<!--
REQUIRED. Three lines, under 15 lines in all. Plain words for a reader who has
not read the rest of this doc: none of the project's vocabulary unless it is
defined in the same sentence.

  - What: the initiatives and their order, in plain words.
  - Why: the arc-discovery set the rules every initiative follows and left
    open who builds what, and when.
  - How it fits: the last arc-level doc. It gives each success criterion of
    the arc-discovery's Design Spec the initiative that carries it. After it,
    each initiative runs its own flow.

The text of this section is also the body of the arc branch's merge commit.
-->

- **What** — [the initiatives and their order]
- **Why** — [what the arc-discovery left open]
- **How it fits** — [the criteria this doc hands out, and what runs next]

## Design Spec — Carried By

<!--
REQUIRED. One row for every success criterion of the arc-discovery's Design
Spec. Cite the criterion by number and a short name; never restate it.
"Checked at" is the arc close, unless one initiative's close or a first real
use can check it sooner.
-->

| Criterion | Carried by | Checked at |
|---|---|---|
| SC-1 — [short name] | [initiative ID] | [the arc close] |

## Decisions Ratified in Arc-Plan

<!--
REQUIRED. Decisions made in this session. Rejected alternatives go in
Rationale.
-->

| # | Decision | Rationale |
|---|---|---|
| AP-1 | [decision] | [why; rejected: ...] |

## Initiative List

<!--
REQUIRED. In run order, with the dependencies. A DAG, not always a line: some
initiatives can run side by side.

IDs: a new initiative takes <arc-ID>.<n> in run order (A.001.2, A.001.3). One
that existed before the arc keeps its ID.

Branches: each initiative cuts its own branch from main, after the arc branch
has merged.
-->

| Order | ID | Initiative | Type | Depends on | Ships |
|---|---|---|---|---|---|
| 1 | [ID] | [name] | [type] | — | [what it ships, in one line] |

```
[a text diagram of the dependencies]
```

- **Hard edges** — [what each initiative needs merged before it starts]
- **Soft edges** — [an order chosen, not forced, and what changes if it moves]

## Per-Initiative Boundary

<!--
REQUIRED. One ### per initiative.
-->

### `[ID]` — [Initiative]

- **In** — [what this initiative builds]
- **Fixed by the arc** — [the ACD-n it must meet]
- **Pushed out** — [to which initiative, or out of the arc]

## Open Question Routing

<!--
REQUIRED. Every question in the arc-discovery's Open Questions:
  - sent to Arc-Plan: answered here, with the AP-n that answers it;
  - routed to an initiative: its owner confirmed, or moved with the reason.
Then any question new in this session, with its owner.
-->

| Question | Answer or owner |
|---|---|
| [question] | [answer (AP-n), or the initiative and its session] |

## Cross-Arc Dependencies

<!--
REQUIRED. Anything outside the arc that gates an initiative: prerequisites in
other layers, data, tooling. If there are none, write "None."
-->

| Dependency | Gates | State |
|---|---|---|
| [dependency] | [initiative] | [exists, or what is missing] |

## Out-of-Arc Deferrals

<!--
REQUIRED. The arc-discovery's Out of Scope, carried over, then what this
session pushed out of the arc, with its Backlog row if it gets one.
-->

## Tracker Rows

<!--
REQUIRED. The rows this session writes to the tracker at Robert's sign-off,
each in the Backlog or Up Next table he chooses. Each Detail ends with a link
to this doc.

The arc's own row and write-up are not edited: they are frozen between
promotion and close (lifecycle.md, Stage 3).
-->

| ID | Item | Type | Table | Trigger | Detail |
|---|---|---|---|---|---|
| [ID] | [Item] | [type] | [Backlog or Up Next] | [trigger] | [one line, then the link to this doc] |

## What Comes Next

<!--
REQUIRED. The merge of feature/<arc-name> into main, then the next sessions
in order. Each step is Robert's call.
-->

1. Merge `feature/[arc-name]` into `main` (this session's second stop)
2. [the next session, such as promoting the first initiative, then `/gestalt:discovery [ID]`]

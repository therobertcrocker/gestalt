# [Name] — Seed

<!--
COPY THIS FILE TO: dev_journals/initiatives/seeds/<name>-seed.md
  (<name> is kebab-case. `/gestalt:seed plant` renames the file
  <ID>-<name>-seed.md when the seed gets its tracker row.)

A seed records work that is coming, thought through at the concept level,
before it enters the lifecycle. It does two jobs: it hands a conversation over
to the session that picks the work up, and it tells every session today that
something is coming and what not to build against.

A seed proposes; it ratifies nothing. Only Robert's rulings go in "Decisions
already made". Claude's proposals stay in the body.

The type of the work need not be known when the seed is written; it is set at
planting.

Every section is required unless it is marked arc-only. The frame comes first
(header to "If planted"), then the body.

Delete these comments before writing.
-->

> **Type:** [feature | refactor | docs | arc, if known; set at planting]
> **Status of the work it describes:** Concept. Not scheduled, not promoted.
> **Source:** [the conversation of the session that wrote it | a claude.ai chat draft of YYYY-MM-DD]
> **Written:** [YYYY-MM-DD], against `[branch]` @ `[short commit]`
> **Tracker row:** [empty until planting]

## What a seed is

A seed sits before the initiative lifecycle. It records a piece of work that has been thought through at the concept level. A seed carries no commitment: it may change shape or never be planted. Whether it enters the lifecycle is Robert's call. When it is planted, it is the Concept of its work, and the tracker write-up points at it.

## Read this first

<!--
REQUIRED. Write this part from the code read in the session that writes the
seed, not from the conversation. Name the commit the repo facts are a
snapshot of.
-->

This file exists so that sessions in this repo know [the work] is coming and do not build against it. It is **awareness, not authorization.**

- **Do not start the work.** [What that means here: no moves, no new files, ...]
- **Do not promote the row.** Promotion is Robert's call.
- **Re-ground before relying on any repo fact below.** The facts are a snapshot at `[short commit]`.

*Practical effect today:*

<!--
REQUIRED. What a session working near this area does differently now, one
bullet per change in behaviour. If nothing changes today, say so.
-->

- [What a nearby session does differently]

## Decisions already made

<!--
Robert's rulings only. If there are none, write "None yet."
-->

| # | Decision | Who and when |
|---|---|---|
| 1 | [decision] | Robert, [YYYY-MM-DD] |

## Open questions

Not to be answered now. The first session of the work picks them up.

| # | Question | Notes |
|---|---|---|
| 1 | [question] | [what is known] |

## If planted

<!--
The proposed Backlog row, in the tracker's columns. The ID is left for the
plant job; `/gestalt:seed plant` proposes it and Robert confirms.
-->

| Item | Trigger | Detail |
|---|---|---|
| [Item] | [When the work should start] | [One or two lines] |

Next steps, each Robert's call:

1. Plant the seed: `/gestalt:seed plant [name]`
2. [Promote the row when ready, then the first session of its flow]

## In Plain Words

<!--
REQUIRED. Under 15 lines. Plain words for a reader who has not read the rest of
this doc: none of the project's vocabulary unless it is defined in the same
sentence.

  - What: the work that is coming.
  - Why: the problem it answers.
  - How it fits: where the work would sit in the project.

A seed carries no Design Spec. The first doc of the work after it (the
discovery doc, the arc-discovery, the audit, or the plan) holds one.
-->

- **What** — [the work that is coming]
- **Why** — [the problem it answers]
- **How it fits** — [where it would sit in the project]

## Problem

<!--
REQUIRED. What is missing or wrong today. Reference specific files where
helpful.
-->

## What is coming

<!--
REQUIRED. What the work would change and where it touches the repo, with file
paths. A snapshot at the commit in the header.
-->

## Vision

<!--
ARC-ONLY. Leave this section out unless the work may be an arc. A seed planted
as an arc must have Vision, Why an Arc and Candidate Initiatives filled,
because arc-discovery reads them.

The greater whole: what the project looks like when the arc is complete, in a
paragraph or two.
-->

## Why an Arc

<!--
ARC-ONLY (see Vision). Why this is several shippable initiatives rather than
one multi-effort initiative: the cross-cutting decisions that must bind all of
them, and why shipping order is itself a design question. If this section is
hard to write, it probably is not an arc (arcs.md).
-->

## Candidate Initiatives

<!--
ARC-ONLY (see Vision). A rough, non-binding list of the initiatives the arc
might contain. Arc-Plan does the real slicing.
-->

- [candidate] — [one line]

## Success Criteria

<!--
ARC-ONLY and OPTIONAL. A proposal: arc-discovery ratifies the criteria.

Robert's rule: a criterion is a question he can ask of the finished work, with
the answer that means success. Not a count or a limit.
-->

Proposed; arc-discovery ratifies them.

| # | Question | The answer that means success |
|---|---|---|
| 1 | [question] | [answer] |

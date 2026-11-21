# [Name] — [Exploration | Audit]

<!--
COPY THIS FILE TO: dev_journals/initiatives/explorations/<E.ID>-<name>-exploration.md
  or, for a refactor's audit, dev_journals/initiatives/explorations/<R.ID>-<name>-audit.md
  (<name> is kebab-case.)

One template for both. The flow is exploration-flow.md in the session-modes
skill: one session, seven steps, three stops. Leave out the sections marked
AUDIT-ONLY from an exploration, and the sections marked EXPLORATION-ONLY from
an audit.

Delete these comments before writing.
-->

> **Initiative:** `[E.ID]`, or for an audit `[R.ID]`, the refactor it serves
> **Feeds:** [the docs or rows that wait on the answer; "none" if none]
> **Status:** [in progress | written, waiting on review | complete]. One session, on `[branch]`
> **Source snapshot:** [OPTIONAL, for an outside source: the repo and its commit]

## In Plain Words

<!--
REQUIRED. Four lines, under 15 lines in all. Plain words for a reader who has
not read the rest of this doc: none of the project's vocabulary unless it is
defined in the same sentence.

Drafted after the audit, rewritten last.

  - What: what this looks into.
  - Short answer: the answer, in a few sentences.
  - Why: the problem behind the question.
  - How it fits: where the answer lands. For an exploration, the follow-on
    rows; for an audit, the refactor's Plan.
-->

- **What** — [what this looks into]
- **Short answer** — [the answer]
- **Why** — [the problem behind the question]
- **How it fits** — [the follow-on rows, or the refactor's Plan]

## Design Spec

<!--
AUDIT-ONLY. An exploration carries no Design Spec; the first doc of each
follow-on row holds that row's spec.

Drafted after the audit and the number check. Ratified at the second stop,
Robert's review of the audit, before any option is written. The options are
weighed against it.

Robert's rule: a criterion is a question he can ask of the finished work, with
the answer that means success. Not a count or a limit.
-->

### What we are building

[The target, in plain words, as a commitment the criteria can test.]

### Success Criteria

| # | Question | The answer that means success |
|---|---|---|
| 1 | [question] | [answer] |

## Questions

<!--
REQUIRED. Robert's prompt in his words, the deciding criterion (asked before
the audit), then the numbered questions. A question Robert adds at the second
stop is marked "(added after the audit)".
-->

> [Robert's prompt, in his words]

**Deciding criterion:** [what makes one option better than another here]

1. [question]

## Current State

<!--
REQUIRED. The audit: what is there now, with `file:line` citations. One `###`
per topic. Every count, "every" and "only" is checked against the source
before the second stop.

"Findings from the audit" is OPTIONAL: what the audit found that no question
asked.
-->

### [Topic]

### Findings from the audit

## Existing Patterns

<!--
REQUIRED. What the code already does that an option can build on.
-->

## Options

<!--
REQUIRED. Written after the second stop.

Terms is OPTIONAL: add it on top when a naming trap shows.

One `###` per question, one `####` per option. Number each option with a
letter for its question (`T-0`, `T-1`); the `-0` option is the baseline,
today's shape. A precondition every option of a question shares is stated once,
above the options. An option Robert proposes is added beside the others, not
in place of them. For a call made of many small items, a "lean" table: item,
lean, reason.

Facts found while the options are written go into Current State, the options
and the rows. They get no section of their own.
-->

### Terms

### Question 1 — [question]

#### [X]-0 — [today's shape]

#### [X]-1 — [option]

## Recommendation

<!--
REQUIRED. The answer in a paragraph. Then:

  - How it lands: the next mode for each follow-on row. For an audit, the
    refactor's Plan.
  - Calls made: Robert's, with the date. Or Calls to carry: the ones still
    open.
-->

[The answer]

### How it lands

### Calls made (Robert, [YYYY-MM-DD])

## Follow-on Rows

<!--
EXPLORATION-ONLY. An audit files nothing.

New rows, changed rows and closed rows, in the tracker's columns. Each row is
"proposed" until Robert's sign-off at the third stop, then "filed". The IDs
are proposed at the third stop: the next free number per prefix, from the
tracker and every file and folder name under `dev_journals/initiatives/`.
A new `E.` row goes into the Explorations table; every other new row goes
into the Backlog.

A fed row in the Backlog or Up Next takes the answer in its Detail. A fed
Current Initiative gets one line in its write-up, "Answered by `<E.ID>`:
link", never the answer.
-->

| ID | Item | Type | Trigger | Detail | Filed |
|---|---|---|---|---|---|
| [ID] | [Item] | [type] | [trigger] | [one or two lines] | proposed |

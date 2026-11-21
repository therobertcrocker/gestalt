# Skills Expansion, Effort 3 — Explorations and Audit — Implementation Plan

## In Plain Words

- **What** — this plan delivers two ways to look before building. An exploration answers a question that has no tracker row yet and files the work that follows. An audit inventories a refactor's current code before its target shape is chosen. One written flow and one template serve both, with a thin skill to start each. The refactor flow changes from Discovery, Plan, Execution to Audit, Plan, Execution.
- **Why** — the discovery doc's Design Spec asks for criterion 4: an exploration and a refactor's audit run the same way each time. Today four explorations exist, each written with no template and no skill, and the rules call their process "not defined yet".
- **How it fits** — this is the third of F.008's five efforts, and the `F.006` work that F.008 took in. It carries criterion 4, the exploration and audit share of criterion 1, and the audit's share of criterion 9. Phase 1 builds the flow, the template and the two skills; Phase 2 makes the rest of the process agree with them. Per the overview plan's Decision Record, entry 2, this plan, its execution and `/gestalt:effort-close F.008.E3` run in one session.

## Context / Goal

Build the Explorations front of F.008: decisions 6 to 9, 22 to 28, and decision 39 for `explorations/`.

- Discovery doc: [`F.008-skills-expansion-discovery.md`](../discovery/F.008-skills-expansion-discovery.md), the Explorations part of Design Summary and Exploration Findings
- Overview plan: [`F.008-skills-expansion-overview-plan.md`](./F.008-skills-expansion-overview-plan.md). Its decisions 35 to 44 and 62 to 63, Shared Context and Outside rules bind this plan and are not repeated here
- Effort 2 plan: [`F.008.E2-skills-expansion-plan.md`](./F.008.E2-skills-expansion-plan.md), for decisions 69 and 70, which the `explore` skill copies
- Explorations that exist, read as models for the template and the flow: gestalt `dev_journals/initiatives/explorations/E.001-openspec-comparison-exploration.md`; gm-toolkit `E.002`, `E.004` and `R.029` under `dev_journals/faction-manager/initiatives/explorations/`, and the `D.009` findings log under `dev_journals/faction-manager/initiatives/discovery/` (read-only)

## Decisions Ratified in Planning

2026-11-21. The numbers continue from the effort 2 plan's 72. Decisions 73 to 76 and 84 are Robert's answers in the Plan session. Decisions 77 to 83 are Claude's proposals in this draft; Robert's sign-off of the plan ratifies them.

73. **`/gestalt:discovery` given an `R.` ID stops and names the way** — it says a refactor has no Discovery, names `/gestalt:audit` when the target shape needs an audit and `/gestalt:plan` when it can be stated in a paragraph, and stops. Rejected: discovery hands over to the audit skill itself, and Discovery stays open to refactors. Settles the overview plan's "For its Plan session" item.
74. **An exploration's In Plain Words is decision 61's three lines plus a Short answer** — What, Short answer, Why, How it fits. The answer is the doc's output, so it gets its own line; How it fits names the follow-on rows. An audit uses the same four lines. Rejected: the strict three lines with the answer inside What, and the four lines of the real docs (What, Short answer, Why it matters, How it lands).
75. **An audit's Design Spec is ratified at the first stop** — drafted after the audit and the number check, and ratified at Robert's review of the audit, before Options are written. The options are weighed against it. Holds decision 57. Rejected: at the second stop with the Recommendation, and a draft before the audit.
76. **An exploration and an audit each make one commit, at the end** — one unscoped `docs:` commit after Robert's sign-off, with the doc and, for an exploration, the tracker changes. Rejected: a commit at each stop, and a commit only when Robert says.
77. **Two phases, five commits** — Phase 1 is the flow, the template and the two skills. Phase 2 is the process text around them, in three commits: the refactor flow, the session-modes skill and the style guide, then the rules and the session skills. The same split as effort 2.
78. **`explore` cuts no branch; `audit` cuts the refactor's branch** — `explore` commits on the branch the session stands on, `main` included (decision 6). `audit` is the refactor's first session, so on `main` it cuts `feature/<initiative-name>` before it writes, as `discovery` does (decision 26).
79. **`explore` checks the tree and the effort as `seed` does** — its one commit uses `git add -A` on any branch, so it stops on a dirty tree and warns inside an effort in progress (decisions 69 and 70). `audit` runs on its own branch and needs neither.
80. **`plan` reads the exploration a refactor row names** — a refactor that an exploration sent straight to Plan (`E.004` to `R.028`) has no audit; its plan reads the exploration instead. With neither, the plan opens with the refactor's Design Spec (overview plan, decision 63 table).
81. **`explore` proposes the follow-on IDs, as `seed plant` does** — the next free number per prefix, from the tracker and every depth of `_completed/`. Robert confirms the rows and their IDs at the second stop.
82. **The Explorations table is named wherever the tracker's shape is** — `lifecycle.md` gains it (overview plan), so `code-and-docs.md`, Project layout, and the tracker `adopt` creates name it too. gestalt's own tracker has it already.
83. **The exploration is a row in the routing tables and the session table** — `session-modes/SKILL.md` gets an `exploration` row in both routing tables, and `code-and-docs.md` gets an "Exploration or audit" row in its session table. Each is a kind of work with its own flow and its own end.

Added after the draft, from a side agent's note, by Robert's answer:

84. **A fed Current Initiative gets one pointer line, not the answer** — `lifecycle.md` freezes a row and its write-up between promotion and close. When an exploration feeds work that is already a Current Initiative (gm-toolkit's `E.002` fed `A.001.4`), `explore` adds one line to that write-up: "Answered by `<E.ID>`: link". The answer stays in the exploration, and `discovery` finds it from the line. `lifecycle.md` names this as the second exception beside `Blocked`. A fed row in the Backlog or Up Next is not frozen, and takes the answer in its Detail. Rejected: the fed work set `Blocked` while the exploration runs, the answer in the exploration doc only, and the answer itself in the frozen row.

## Decision Record — Execution

---

## Design Spec — Carried By

Decision 59, for this effort. The criteria are in the discovery doc, Design Spec.

| Criterion | Carried by |
|---|---|
| 1 — each kind of work starts from a skill (the question and the refactor rows) | Phase 1, Commit 2 |
| 4 — an exploration and an audit run the same way | Phase 1, Commits 1 and 2 |
| 9 — the first doc of any work opens with a Design Spec (the audit's share) | Phase 1, Commit 1; Phase 2, Commit 3 for a refactor with no audit |

Phase 2 otherwise makes the process files agree with what Phase 1 built.

## Shared Context

### Task format

Decision 34: an exact edit to a file that exists is a literal task with a Find anchor. A new file is a named deliverable: its path, its scope, the decisions it carries out and a numbered list of what it must hold. The Execution session writes the file, then checks it against the list, item by item. `refactor-flow.md` is rewritten, so its task gives the full file.

### Gate and sessions

- **Gate** — `claude plugin validate .` from the repo root, before every commit
- **One session** — this plan, both phases and the effort close run in the session that writes the plan (overview plan, Decision Record, entry 2). Robert signs off this plan before any file is edited
- **Loading the style guide** — every commit edits or writes a doc; the style guide is loaded before the first edit

### Paths in the process text

Every new line names the single-product path, `dev_journals/initiatives/explorations/`. Each file it lands in already says how paths read in a multi-product project, so the lines do not repeat it.

### Names used below

- **Exploration** — `explorations/<E.ID>-<name>-exploration.md`, started with `/gestalt:explore`
- **Audit** — `explorations/<R.ID>-<name>-audit.md`, started with `/gestalt:audit` (decision 27)
- **The seven steps and two stops** — the flow in the discovery doc, Design Summary, Explorations; written once, in `exploration-flow.md`

## Outside Rules

No new rule. The two skills use what effort 1 and the overview plan already sourced: the hand-only flag stays off (overview plan, row 1), `$0` is the first argument (overview plan, row 7), and a description is cut past 1,536 characters and shows angle brackets as entities (E1 plan, row 13 and its note). The new descriptions are short and use no angle brackets.

## Out of Scope

- **Reshaping the explorations that exist** — `E.001`, and the gm-toolkit docs (discovery doc, Out of Scope). gestalt's `E.001` row stays as it is
- **gm-toolkit's `D.009` row** — its job is done here; the row is gm-toolkit's to close (discovery doc, Replaces / Retires)
- **The Design Spec in the templates that exist** — effort 5. The exploration template and the rewritten refactor flow carry it from the start (decision 63)
- **The arc concept lines** — effort 4 (decision 43)

---

## Work Breakdown

**Overview**

- [x] **Phase 1 — The exploration and the audit**
  - Commit 1 — `feat(E3): add the exploration flow and template` (2 tasks)
  - Commit 2 — `feat(E3): add the explore and audit skills` (2 tasks)
- [x] **Phase 2 — Explorations and audits in the process**
  - Commit 3 — `docs(E3): rewrite the refactor flow as Audit, Plan, Execution` (3 tasks)
  - Commit 4 — `docs(E3): define the exploration and the audit in the session-modes skill and the style guide` (4 tasks)
  - Commit 5 — `docs(E3): name explorations and audits in the rules and the session skills` (6 tasks)

### Phase 1 — The exploration and the audit

**In plain words:** the shared flow, the template and the two skills that start an exploration and an audit are written. After this phase a question or a refactor can be looked into from one command, the same way each time.

#### Commit 1 — `feat(E3): add the exploration flow and template`

##### Task 1 — `plugins/gestalt/skills/session-modes/exploration-flow.md` (new, named deliverable)

**Carries out:** decisions 6, 7, 8, 22, 23, 25, 26, 27, 56 (an audit holds a Design Spec, an exploration none), 74, 75, 76 and 78.

A flow file in the register of `refactor-flow.md`: a title, an opening paragraph, then `##` sections. It must hold, in this order:

1. **Title and opening** — `# Exploration flow`. An exploration looks at a part of the system, or at something outside it, weighs options and files each follow-on as its own row. It answers "which way?"; a Discovery answers "what exactly?". It does not replace a Discovery (decision 23). A refactor's audit runs the same way: this file is the shared middle of `/gestalt:explore` and `/gestalt:audit`, as `session-discipline.md` is for the session skills
2. **Exploration or audit** — which came first decides (decision 25). The two-line text diagram of the discovery doc (a question with no row yet, an existing refactor row), and the edges table of decision 26: Start, Branch, Middle, End per skill
3. **The doc** — one template, `templates/exploration.md`. The two paths and what happens at the close, as a table (decisions 7 and 27): an exploration stays in `explorations/`; an audit moves to `_completed/<R.ID>-<name>/` with the refactor's plan and retro. An audit holds the refactor's Design Spec; an exploration holds none (decision 56)
4. **One session, two stops** — decision 8. The seven steps, numbered, each stop in bold:
   1. Ask Robert for the deciding criterion, before the audit. With a vague row, ask what prompted it
   2. Audit: write Current State and Existing Patterns, with `file:line` citations. Send a short update between audit steps; long silent stretches were the log's most common complaint
   3. Check every number in the doc against the source
   4. **Stop:** Robert reviews the audit. For an audit, the Design Spec is drafted before this stop and ratified at it, before any option is written (decision 75). A question Robert adds here goes into Questions, marked as added after the audit
   5. Write Options and the Recommendation. Facts found while the options are written go into Current State, Options and the rows, with no section of their own (decision 22). An option Robert proposes is added beside the others, not in place of them. Rows are marked "proposed"
   6. **Stop:** a spot check of what was left out, every item put to Robert, then his sign-off of the doc, the rows and their IDs
   7. File the follow-on rows (an exploration only; an audit files nothing and names the refactor's Plan). A doc the exploration feeds is not edited. A fed row in the Backlog or Up Next takes the answer in its Detail; a fed Current Initiative's write-up gets one pointer line, "Answered by `<E.ID>`: link", never the answer (decision 84)
5. **The doc while it runs** — the header's Status moves from in progress, to written and waiting on review, to complete. In Plain Words is drafted after the audit and rewritten last (decision 22), in four lines (decision 74). The Terms block is optional, added when a naming trap shows (decision 22)
6. **What comes after** — decision 23. The follow-on row's own flow decides. The exploration counts as the audit: a Discovery that follows reads it first and skips the audit and the choice of direction, lighter but never skeletal; a refactor whose target is chosen goes straight to Plan, which reads it. The Recommendation's "How it lands" names the next mode for each follow-on row
7. **Branch and commit** — an exploration is exempt from the branch rule and runs on the branch the session stands on, `main` included (decisions 6 and 78). An audit runs on the refactor's branch. Each makes one unscoped `docs:` commit, after Robert's sign-off (decision 76)

##### Task 2 — `plugins/gestalt/skills/session-modes/templates/exploration.md` (new, named deliverable)

**Carries out:** decisions 22, 27, 56, 57, 61 and 74, per decision 63.

A template in the style of `templates/seed.md`: guidance in HTML comments, slots in square brackets, REQUIRED marked. It must hold, in this order:

1. **The opening comment** — copy to `dev_journals/initiatives/explorations/<E.ID>-<name>-exploration.md`, or `<R.ID>-<name>-audit.md` for a refactor's audit. One template for both; the flow is `exploration-flow.md`. Sections marked AUDIT-ONLY or EXPLORATION-ONLY are left out of the other. Delete the comments before writing
2. **Title** — `# [Name] — Exploration`, or `— Audit`
3. **Header** — a blockquote: Initiative (the ID, and for an audit the refactor it serves), Feeds (the docs or rows that wait on the answer; "none" if none), Status (in progress, written and waiting on review, or complete; the branch), and an optional Source snapshot for an outside source (a repo and its commit)
4. **In Plain Words** — REQUIRED, four lines (decisions 61 and 74): What (what this looks into, with none of the project's vocabulary), Short answer, Why (the problem behind the question), How it fits (where the answer lands: the follow-on rows, or for an audit the refactor's Plan). The comment says it is drafted after the audit and rewritten last (decision 22)
5. **Design Spec** — AUDIT-ONLY (decision 56). The two parts of decision 57: What we are building, then Success Criteria as a table of questions, each with the answer that means success. The comment carries Robert's rule (a question he can ask of the finished work, not a count or a limit) and says the spec is drafted after the audit and ratified at the first stop (decision 75). An exploration carries none
6. **Questions** — REQUIRED. Robert's prompt in his words, the deciding criterion, then the numbered questions. A question added at the first stop is marked as added after the audit
7. **Current State** — REQUIRED. The audit, with `file:line` citations, in sub-sections by topic. An optional "Findings from the audit" sub-section for what the audit found that no question asked
8. **Existing Patterns** — REQUIRED. What the code already does that an option can build on
9. **Options** — REQUIRED. An optional Terms block on top (decision 22). One `###` per question, one `####` per option, numbered with a letter per question (`T-0`, `T-1`); the `-0` option is the baseline, today's shape. A precondition all options of a question share is stated once above them. A "lean" table for a call made of many small items
10. **Recommendation** — REQUIRED. The answer in a paragraph, then "How it lands" (the next mode for each follow-on row; for an audit, the Plan) and "Calls made" (Robert's, with the date) or "Calls to carry" (the ones still open)
11. **Follow-on Rows** — EXPLORATION-ONLY. A table: ID, Item, Type, Trigger, Detail, Filed. New rows, changed rows and closed rows. "Proposed" until Robert's sign-off, then filed

##### Commit message

```
feat(E3): add the exploration flow and template

- exploration-flow.md: exploration or audit by which came first, one
  session with seven steps and two stops, what comes after, one commit
- templates/exploration.md: one template for both, with a Design Spec
  for an audit and Follow-on Rows for an exploration
```

#### Commit 2 — `feat(E3): add the explore and audit skills`

##### Task 1 — `plugins/gestalt/skills/explore/SKILL.md` (new, named deliverable)

**Carries out:** decisions 6, 7, 9, 26, 28, 76, 78, 79 and 81.

The frontmatter, literal. No `disable-model-invocation` (decision 28):

```
---
name: explore
description: Run an exploration for one row of the Explorations table, by its E. ID - a question looked into, options weighed and follow-on rows filed, in one session with two stops. Use when Robert asks to explore a question or to run an exploration. For a refactor's audit, use the audit skill.
argument-hint: "[E.ID]"
---
```

The body is written in the register of `seed/SKILL.md`: an opening paragraph, the sentence that defines a **stop**, then numbered steps. It must hold:

1. **The address** — `$0` is an `E.` ID. An `R.` ID: name `/gestalt:audit $0` and stop. Any other: say so and stop. In a multi-product project, every `dev_journals/` path reads `dev_journals/<product>/`
2. **Read** — `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `lifecycle.md` and `exploration-flow.md` in the same folder, and the template `templates/exploration.md`
3. **The row** — `$0` in the Explorations table of `dev_journals/planned-work.md`. No row: say so and stop; a new row is Robert's call. Read each doc or row the row says the answer feeds
4. **Checks** — the two checks of `seed/SKILL.md` step 4, worded for this skill: a dirty tree is a stop, an effort in progress is a warning (decision 79)
5. **Branch** — no branch is cut; the commit lands on the branch the session stands on, `main` included (decisions 6 and 78)
6. **The doc** — if `dev_journals/initiatives/explorations/$0-*-exploration.md` exists, read it and continue from its state. Otherwise copy the template to `$0-<kebab-name>-exploration.md`, the name from the row's Item, and leave out the AUDIT-ONLY section
7. **The middle** — run the seven steps and two stops of `exploration-flow.md`. At the second stop, propose an ID for each new row: the next free number for its prefix, from the tracker and the folder names at every depth under `dev_journals/initiatives/_completed/` (decision 81). Robert confirms the rows and their IDs with his sign-off
8. **File** — the flow's step 7: add each new row to the Backlog table for its type, apply each row change, remove each closed row. For each piece of work the exploration feeds: a Backlog or Up Next row takes the answer in its Detail; a Current Initiative's write-up gets one line, "Answered by `$0`: link to the doc", and nothing more (decision 84). Mark each row Filed in the doc, set the header's Status to complete, and remove the `$0` row from the Explorations table (decision 7)
9. **Commit** — `git add -A`, then one commit with the subject `docs: $0 <name in plain lower-case words> exploration` and the session's attribution lines (decision 76)
10. **The end** — name the next mode for each follow-on row, from "How it lands". Do not promote any row

##### Task 2 — `plugins/gestalt/skills/audit/SKILL.md` (new, named deliverable)

**Carries out:** decisions 23, 25, 26, 27, 28, 75, 76 and 78.

The frontmatter, literal:

```
---
name: audit
description: Run the audit of one refactor, by its R. ID - the current code inventoried, target shapes weighed and one chosen, in one session with two stops; the refactor's Plan comes next. Use when Robert asks to audit a refactor, or to start a refactor whose target shape is not known yet.
argument-hint: "[R.ID]"
---
```

The body in the same register as `explore`. It must hold:

1. **The address** — `$0` is an `R.` ID. An `E.` ID: name `/gestalt:explore $0` and stop. Any other: say so and stop. Multi-product paths as in `explore`
2. **Read** — `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `refactor-flow.md` and `exploration-flow.md`, and the template `templates/exploration.md`. If `docs/architecture/` exists, `architecture-overview.md` and the page that covers the area; their Key Decisions are binding
3. **The row** — `$0` in Current Initiatives. No row, or not there: say so and stop; promotion is Robert's call. Read the write-up, and the seed if it points at one. If the row names an exploration that already chose the target, the exploration counts as the audit (decision 23): say so, name `/gestalt:plan $0` and stop
4. **Branch** — on `main`, cut `feature/<initiative-name>` before writing anything; every session of the refactor runs on it (decision 78)
5. **The doc** — if `dev_journals/initiatives/explorations/$0-*-audit.md` exists, read it and continue from its state. Otherwise copy the template to `$0-<kebab-name>-audit.md` and leave out the EXPLORATION-ONLY section
6. **The middle** — run the seven steps and two stops of `exploration-flow.md`. Before the first stop, draft the Design Spec; Robert ratifies it there, before any option is written (decision 75). At the flow's step 7, file nothing (decision 26)
7. **Commit** — `git add -A`, then one commit with the subject `docs: $0 audit` and the session's attribution lines (decision 76)
8. **The end** — name the next step: `/gestalt:plan $0`, in a new session. Do not promote or edit any row

##### Commit message

```
feat(E3): add the explore and audit skills

- /gestalt:explore: an E. row looked into on any branch; files the
  follow-on rows, removes its own row, one docs commit
- /gestalt:audit: a refactor in progress audited on its branch, its
  Design Spec ratified at the first stop; names the Plan, files nothing
```

The phase's box in the Overview list is ticked in this commit.

### Phase 2 — Explorations and audits in the process

**In plain words:** the refactor flow, the lifecycle, the file rules, the style guide, the branch rule and the session skills learn the exploration and the audit. After this phase a refactor has no Discovery, and every process file says where an exploration and an audit live and what comes after them.

#### Commit 3 — `docs(E3): rewrite the refactor flow as Audit, Plan, Execution`

##### Task 1 — `plugins/gestalt/skills/session-modes/refactor-flow.md`

Rewritten for decision 24; the Plan section gains decisions 63 and 80. Full contents:

```markdown
# Refactor flow

Refactor work runs in three modes: **Audit, Plan, Execution.** The Audit takes the place of Discovery; a refactor has no Discovery. The deltas from the feature flow exist because of one structural asymmetry:

> **Feature artifacts invent future structure.** They are *authoritative* — code is changed to match the doc.
>
> **Refactor artifacts describe existing structure.** They are *descriptive* — the doc is a snapshot of code that may have shifted since it was written.

This asymmetry drives every difference below. It also sets the stance for every refactor session: treat the upstream artifact as a hypothesis, not an authority, and spot-check its claims against current source before building on them. In the Audit, walk every purported instance of a pattern through end to end in source before naming it; method-name similarity is not pattern similarity. In Plan, when a rule appears like "only X may do Y" or "this file is exempt from convention Z", challenge it in the same turn: an exception rule is evidence the convention is broken. In Execution, before a phase, walk the diff mentally and ask of each new or changed function whether it takes what it needs and no more.

## Audit (0–1 sessions; often skippable)

Refactors usually start with a known target shape — "convert every handler to the registry pattern," "replace the string field with a struct," "rename one package." If the target shape is describable in a paragraph, **skip the Audit** and go straight to Plan.

An Audit runs only when:
- The target pattern itself needs investigation (e.g. "what should the sub-packages look like?")
- An inventory of the current state is needed before any target can be chosen
- Multiple incompatible target shapes are on the table

The Audit is run the way an exploration is run: the same template, the same seven steps and the same two stops (`exploration-flow.md`). Start it with `/gestalt:audit <R.ID>` once the row is in progress; it runs on the refactor's branch. It inventories the current state, weighs the candidate targets as options and chooses one. Its doc, `dev_journals/initiatives/explorations/<R.ID>-<name>-audit.md`, emphasizes *findings* (what's there now) over *invention* (what should be). It holds the refactor's Design Spec, ratified at its first stop. It files no rows; its next step is the refactor's Plan.

When an exploration came first and chose the target, the exploration counts as the Audit: the refactor goes straight to Plan.

## Plan (1 session)

The plan reads the Audit, or the exploration that chose the target, where a feature plan reads the discovery doc. A refactor that goes straight to Plan with neither opens its plan with the refactor's Design Spec.

The refactor plan describes the **target pattern** and lists the **units** to convert (one handler, one package, one struct, etc.). It does not write a step-by-step recipe per unit.

Why: recipes drift. Each unit's current state is slightly different and changes as the work progresses. A pattern is stable; a recipe rots.

Phases are scoped smaller than feature phases — typically one unit per phase. This keeps each execution session focused on a single conversion, with the re-grounding step (below) bounded to that unit's code.

## Execution (N sessions, mandatory re-grounding per unit)

Scope follows session-discipline.md, Execution scope: one phase, which is typically one unit. Every unit opens with a **re-grounding step:**

1. Read the current state of the unit being converted
2. Verify it still matches what the plan assumed
3. If it has drifted, update the plan before coding

Skipping re-grounding is the most common refactor failure mode. The plan was written against a snapshot; the snapshot decays; coding against the stale snapshot produces broken or out-of-date conversions.

After re-grounding:
- Apply the target pattern to the unit
- Commit with conventional commit format (typically `refactor:`)
- If the conversion surfaces a structural problem the plan didn't anticipate, pause and discuss before proceeding

## Deferred Refactors

Sometimes a refactor is scoped but not executed immediately — for example, when new code is added during a feature initiative that "should" follow the target pattern but the refactor hasn't shipped yet. In that case, **new code matches the existing (imperfect) pattern, not the target.** Mixed state is worse than uniform pre-refactor state. The refactor will later catch the new code along with everything else.

## Pre-Merge Checklist

Same as Feature Flow — see feature-flow.md. `/gestalt:initiative-close` moves the Audit into `_completed/` with the plan and the retro.
```

##### Task 2 — `plugins/gestalt/skills/session-modes/templates/discovery.md`

The refactor wording and the Audit Findings section go (decision 24). Four edits.

**Find:**
```
The shape varies by what's being designed — feature work and refactor work call for
different sections. Required sections are always present; optional sections are
included when relevant.
```
**Replace with:**
```
The shape varies by what's being designed. Required sections are always present;
optional sections are included when relevant. A refactor has no discovery doc: its
Audit uses templates/exploration.md (refactor-flow.md).
```

**Find:**
```
For feature work: name the gap or pain point. Be richer than the planned-work blurb.
For refactor work: name the structural issue and what it costs (e.g. drift between
sibling packages, friction in the abstraction).
```
**Replace with:**
```
Name the gap or pain point. Be richer than the planned-work blurb.
```

**Find:**
```
For feature work: name the chosen approach in a few paragraphs, with rationale.
For refactor work: name the target pattern (or, if Discovery is figuring out the
target, this section becomes "Audit Findings" — see optional sections below).
```
**Replace with:**
```
Name the chosen approach in a few paragraphs, with rationale.
```

**Find:**
```
## Audit Findings

<!--
Common in REFACTOR discovery. Inventory the current state of what's being refactored,
classify divergences from the target pattern, identify reference exemplars.

Subsections often include: Inventory, Cross-axis comparison, Reference exemplar.
-->

## Domain Model Changes
```
**Replace with:**
```
## Domain Model Changes
```

##### Task 3 — `plugins/gestalt/skills/discovery/SKILL.md`

A refactor has no Discovery (decision 73). After the opening paragraph:

**Find:**
```
Start a Discovery session for initiative `$0`. Mode: Discovery. The session ends when the discovery doc is written and Robert has signed off; do not begin planning.
```
**Replace with:**
```
Start a Discovery session for initiative `$0`. Mode: Discovery. The session ends when the discovery doc is written and Robert has signed off; do not begin planning.

If `$0` is a refactor (`R.`), say that a refactor has no Discovery and stop. Name `/gestalt:audit $0` when the target shape needs an audit, or `/gestalt:plan $0` when it can be stated in a paragraph (`refactor-flow.md`).
```

##### Commit message

```
docs(E3): rewrite the refactor flow as Audit, Plan, Execution

- refactor-flow: the Audit, run as an exploration, takes Discovery's
  place; a refactor with no audit opens its plan with its Design Spec
- discovery template: the refactor wording and Audit Findings go
- /gestalt:discovery stops on an R. ID and names audit or plan
```

#### Commit 4 — `docs(E3): define the exploration and the audit in the session-modes skill and the style guide`

##### Task 1 — `plugins/gestalt/skills/session-modes/lifecycle.md`

Three edits. The pointer line as the freeze's second exception (decision 84):

**Find:**
```
Between promotion and close, no session edits the row or the write-up, except to set or clear `Blocked`.
```
**Replace with:**
```
Between promotion and close, no session edits the row or the write-up, except to set or clear `Blocked`, or for `/gestalt:explore` to add one line to the write-up of work it feeds: "Answered by `<E.ID>`: link". The answer itself stays in the exploration.
```

The `E.` prefix:

**Find:**
```
- **ID** — stable identifier; the prefix encodes the type: `A.` arc, `F.` feature, `R.` refactor, `B.` bugfix, `D.` docs, `C.` chore
```
**Replace with:**
```
- **ID** — stable identifier; the prefix encodes the type: `A.` arc, `F.` feature, `R.` refactor, `B.` bugfix, `D.` docs, `C.` chore. An exploration's `E.` row sits in a table of its own (Explorations, below)
```

The Explorations table, before Minor items:

**Find:**
```
## Minor items
```
**Replace with:**
```
## Explorations

An exploration (`E.`) answers a question that has no row yet, and does not pass through the stages. Its row sits in the tracker's **Explorations** table, between Up Next and Backlog, with the columns ID / Item / Trigger / Detail and the Backlog's trigger values. It has no write-up and no promotion step: `/gestalt:explore <E.ID>` runs from the row. When it files its follow-on rows, it removes its own row; the doc stays in `explorations/` (`exploration-flow.md`). A refactor's audit has no row of its own: it runs under the refactor's `R.` ID.

## Minor items
```

##### Task 2 — `plugins/gestalt/skills/session-modes/session-discipline.md`

Two edits in File locations. The explorations half of "not defined yet":

**Find:**
```
- **Explorations** — `dev_journals/initiatives/explorations/`. Their process is not defined yet
```
**Replace with:**
```
- **Explorations and audits** — `dev_journals/initiatives/explorations/<E.ID>-<name>-exploration.md`, which stays there when its row leaves the tracker; a refactor's audit is `<R.ID>-<name>-audit.md` in the same folder. Run with `/gestalt:explore` and `/gestalt:audit`, from `templates/exploration.md` (`exploration-flow.md`)
```

The audit among the files a close moves (decision 27):

**Find:**
```
- **Completed artifacts** — when an initiative ships, its seed, its discovery doc, all its plans (single, overview, and effort plans) and its retro move into one folder.
```
**Replace with:**
```
- **Completed artifacts** — when an initiative ships, its seed, its discovery doc or audit, all its plans (single, overview, and effort plans) and its retro move into one folder.
```

##### Task 3 — `plugins/gestalt/skills/session-modes/SKILL.md`

Six edits. The description:

**Find:**
```
the flow per work type (arc, feature, refactor, bugfix, docs, chore), efforts,
```
**Replace with:**
```
the flow per work type (arc, feature, refactor, bugfix, docs, chore) and for explorations, efforts,
```

The which-file row (decision 83):

**Find:**
```
| A refactor (`R.`) | `refactor-flow.md` |
```
**Replace with:**
```
| A refactor (`R.`) | `refactor-flow.md` |
| An exploration (`E.`) or a refactor's audit | `exploration-flow.md` |
```

The first routing table:

**Find:**
```
| `chore` | `docs-chore-flow.md` | Mechanical maintenance. No design decisions. |
```
**Replace with:**
```
| `chore` | `docs-chore-flow.md` | Mechanical maintenance. No design decisions. |
| `exploration` | `exploration-flow.md` | A question with no row yet: look into it, weigh options, file the follow-on rows. Its row sits in the Explorations table. |
```

The second routing table, the refactor row (decision 24):

**Find:**
```
| **Refactor** | Tracker write-up, or its seed | Often skipped; audit-first when it fires | Pattern plus unit list | One phase, typically one unit, per session; re-grounding per unit |
```
**Replace with:**
```
| **Refactor** | Tracker write-up, or its seed | Never; an Audit, run as an exploration, when the target needs one | Pattern plus unit list | One phase, typically one unit, per session; re-grounding per unit |
```

And the exploration row:

**Find:**
```
| **Chore** | Backlog row only | Never | Never | Single session |
```
**Replace with:**
```
| **Chore** | Backlog row only | Never | Never | Single session |
| **Exploration** | Its row in the Explorations table | Never; it is its own audit | Never | One session with two stops; files the follow-on rows |
```

The templates table:

**Find:**
```
| Discovery doc | `discovery.md` | `dev_journals/initiatives/discovery/<ID>-<initiative-name>-discovery.md` |
```
**Replace with:**
```
| Discovery doc | `discovery.md` | `dev_journals/initiatives/discovery/<ID>-<initiative-name>-discovery.md` |
| Exploration or audit | `exploration.md` | `dev_journals/initiatives/explorations/<E.ID>-<name>-exploration.md`, or `<R.ID>-<name>-audit.md` for a refactor's audit |
```

##### Task 4 — `plugins/gestalt/skills/style-guide/SKILL.md`

The exploration and the audit as document types, after the discovery doc.

**Find:**
```
**Implementation Plan** (`dev_journals/initiatives/implementation/<ID>-<name>-plan.md`)
```
**Replace with:**
```
**Exploration** (`dev_journals/initiatives/explorations/<E.ID>-<name>-exploration.md`) — answers a question that has no row yet: the current state, the options, a recommendation and the follow-on rows. Run with `/gestalt:explore`; flow `exploration-flow.md` and template `templates/exploration.md` in the session-modes skill. Carries no Design Spec. Stays in `explorations/` when its row leaves the tracker.

**Audit** (`dev_journals/initiatives/explorations/<R.ID>-<name>-audit.md`) — a refactor's first doc, run the way an exploration is run, from the same template. Holds the refactor's Design Spec. Run with `/gestalt:audit`. Moves to `_completed/` with the refactor's plan and retro.

**Implementation Plan** (`dev_journals/initiatives/implementation/<ID>-<name>-plan.md`)
```

##### Commit message

```
docs(E3): define the exploration and the audit in the session-modes skill and the style guide

- lifecycle: the E. prefix and the Explorations table; no write-up, no
  promotion; a fed Current Initiative gets one pointer line
- session-discipline: where an exploration and an audit live, and the
  audit among the files a close moves
- session-modes SKILL.md: exploration rows in the which-file and routing
  tables, a refactor has no Discovery, the template row
- style guide: the exploration and the audit as document types
```

#### Commit 5 — `docs(E3): name explorations and audits in the rules and the session skills`

##### Task 1 — `plugins/gestalt/rules/code-and-docs.md`

Four edits. The tracker's shape (decision 82):

**Find:**
```
- `dev_journals/planned-work.md`: the tracker. Current Initiatives, Up Next, Backlog, then the initiative write-ups.
```
**Replace with:**
```
- `dev_journals/planned-work.md`: the tracker. Current Initiatives, Up Next, Explorations, Backlog, then the initiative write-ups.
```

The explorations half of "not defined yet":

**Find:**
```
- `dev_journals/initiatives/explorations/`: exploration docs. Their process is not defined yet.
```
**Replace with:**
```
- `dev_journals/initiatives/explorations/`: explorations, which answer a question before any row exists, and refactor audits. `/gestalt:explore` and `/gestalt:audit` run them; the session-modes skill holds the rest.
```

In Session modes, name the skills:

**Find:**
```
a seed is not a mode, so either job may run inside any session.
```
**Replace with:**
```
a seed is not a mode, so either job may run inside any session. Run an exploration with `/gestalt:explore <E.ID>` and a refactor's audit with `/gestalt:audit <R.ID>`; each is one session with two stops.
```

The session table (decision 83):

**Find:**
```
| Discovery | The discovery doc is complete and the next steps are clear. |
```
**Replace with:**
```
| Discovery | The discovery doc is complete and the next steps are clear. |
| Exploration or audit | The doc is signed off and committed; an exploration's follow-on rows are filed. |
```

##### Task 2 — `plugins/gestalt/rules/git-and-delivery.md`

The exploration's exemption from the branch rule (decisions 6, 76 and 78).

**Find:**
```
- A seed is exempt from the branch rule. `/gestalt:seed` makes one unscoped `docs:` commit per job on the branch the session stands on, `main` included.
```
**Replace with:**
```
- A seed is exempt from the branch rule. `/gestalt:seed` makes one unscoped `docs:` commit per job on the branch the session stands on, `main` included.
- An exploration is exempt too. `/gestalt:explore` makes one unscoped `docs:` commit, at the end, on the branch the session stands on, `main` included. A refactor's audit is not exempt: it is the refactor's first session and runs on its branch.
```

##### Task 3 — `plugins/gestalt/skills/discovery/SKILL.md`

A Discovery that follows an exploration reads it first (decision 23). At the end of step 2:

**Find:**
```
In Plain Words first, then the rest. It is the initiative's Concept.
```
**Replace with:**
```
In Plain Words first, then the rest. It is the initiative's Concept. If the row or the write-up names an exploration, read it, `dev_journals/initiatives/explorations/<E.ID>-*-exploration.md`: In Plain Words, the Recommendation, then the rest. It counts as the audit: the Discovery starts from it and does not redo the audit or the choice of direction. Lighter, never skeletal.
```

##### Task 4 — `plugins/gestalt/skills/plan/SKILL.md`

The audit, or the exploration, where the discovery doc is read (decisions 27 and 80).

**Find:**
```
Then the discovery doc's In Plain Words, then the rest of it.
```
**Replace with:**
```
Then the discovery doc's In Plain Words, then the rest of it. A refactor has no discovery doc: read its audit, `dev_journals/initiatives/explorations/<ID>-*-audit.md`, the same way, or the exploration its row names. With neither, the plan opens with the refactor's Design Spec (`refactor-flow.md`).
```

##### Task 5 — `plugins/gestalt/skills/initiative-close/SKILL.md`

Two edits (decision 27). Step 1 reads the audit:

**Find:**
```
Then the discovery doc and every plan: In Plain Words first,
```
**Replace with:**
```
Then the discovery doc (for a refactor, its audit, if it has one) and every plan: In Plain Words first,
```

Step 8 moves it:

**Find:**
```
   - Move the seed (`dev_journals/initiatives/seeds/$0-*-seed.md`, if there is one), the discovery doc, every plan and the retro with `git mv` into the completed folder
```
**Replace with:**
```
   - Move the seed (`dev_journals/initiatives/seeds/$0-*-seed.md`, if there is one), the discovery doc or the audit (`dev_journals/initiatives/explorations/$0-*-audit.md`), every plan and the retro with `git mv` into the completed folder
```

##### Task 6 — `plugins/gestalt/skills/adopt/SKILL.md` and the overview plan

`explorations/` and the Explorations table in step 4 (decisions 39 and 82). Three edits in `adopt/SKILL.md`.

**Find:**
```
`dev_journals/initiatives/{discovery,implementation,arcs,seeds,_completed}/`
```
**Replace with:**
```
`dev_journals/initiatives/{discovery,implementation,arcs,seeds,explorations,_completed}/`
```

**Find:**
```
create the tracker with the Current Initiatives, Up Next and Backlog tables
```
**Replace with:**
```
create the tracker with the Current Initiatives, Up Next, Explorations and Backlog tables
```

**Find:**
```
and the five `initiatives/` folders with a `.gitkeep` each.
```
**Replace with:**
```
and the six `initiatives/` folders with a `.gitkeep` each.
```

In `dev_journals/initiatives/implementation/F.008-skills-expansion-overview-plan.md`, tick effort 3's Done box in the Effort Summary.

**Find:**
```
| [ ] | 3 | Explorations and audit |
```
**Replace with:**
```
| [x] | 3 | Explorations and audit |
```

##### Commit message

```
docs(E3): name explorations and audits in the rules and the session skills

- code-and-docs: the Explorations table in the tracker, explorations/
  in the layout, /gestalt:explore and /gestalt:audit in Session modes
- git-and-delivery: an exploration is exempt from the branch rule
- discovery reads an exploration first; plan reads the audit or the
  exploration
- initiative-close reads the audit and moves it to _completed/
- adopt creates explorations/ and the Explorations table
- overview plan: effort 3 is done
```

The phase's box in the Overview list is ticked in this commit. The wrap-up names the next step: `/gestalt:effort-close F.008.E3`, in this same session (overview plan, Decision Record, entry 2).

# Skills Expansion, Effort 5 — Design Spec — Implementation Plan

## In Plain Words

- **What** — this plan makes every piece of work say, in its first doc, what it builds and how Robert will know it is built, and makes the close check the work against that. It also makes the three-line summary at the top of every doc say only what that doc does. The rule is written once, the templates get the new sections, and the skills read, carry and check it.
- **Why** — the discovery doc's Design Spec asks for criterion 9 (the first doc of any work opens with a Design Spec, and the close holds the work against it) and criterion 10 (each doc's In Plain Words says what that doc handles). Efforts 2 to 4 built their new templates this way; the templates and skills that were there before still do not.
- **How it fits** — the last of F.008's five efforts. It carries criteria 9 and 10 for the files that existed before F.008. Phase 1 writes the rule, the flows and the templates; Phase 2 teaches the skills. Per the overview plan's Decision Record, entry 2, this plan, its execution and `/gestalt:effort-close F.008.E5` run in one session. After it, `/gestalt:initiative-close F.008` is the first real use of the new close.

## Context / Goal

Build the Design spec front of F.008: decisions 55 to 61 in the files that exist (overview plan, Effort 5).

- Discovery doc: [`F.008-skills-expansion-discovery.md`](./F.008-skills-expansion-discovery.md), Design Spec, Design Summary's "Design spec" part, and decisions 55 to 61
- Overview plan: [`F.008-skills-expansion-overview-plan.md`](./F.008-skills-expansion-overview-plan.md). Its decisions 35 to 44 and 62 to 63, Shared Context and Outside rules bind this plan and are not repeated here
- Effort 4 plan: [`F.008.E4-skills-expansion-plan.md`](./F.008.E4-skills-expansion-plan.md), whose `arc-discovery.md` template is the model for the Design Spec section, and whose "Design Spec — Carried By" section is the model for the plan template's

## Decisions Ratified in Planning

2026-11-21. The numbers continue from the effort 4 plan's 95. Decisions 96 to 100 are Robert's answers in the Plan session. Decisions 101 to 107 are Claude's proposals in this draft; Robert's sign-off of the plan ratifies them.

96. **"What we are building" is one paragraph** — the thing, in plain words, worded as a commitment the criteria can test. What the work does not build stays in Out of Scope. Settles the overview plan's first "For its Plan session" item. Rejected: a list of deliverables (drifts toward a task list), and a paragraph plus a "not building" line (repeats Out of Scope).
97. **Work with no doc gets nothing** — a trivial bugfix, a chore and a single-session docs item have no doc to hold a spec; the row's one line says what done means. Settles the overview plan's second item. Rejected: a success line in every tracker row.
98. **A multi-effort docs plan opens with the Design Spec** — it is the initiative's first doc, so decision 56 puts the spec at its top. Its Effort Summary gains a "Carries" column, the docs plan's form of decision 59. The overview plan listed only the comment for `docs-plan.md`. Rejected: the comment only.
99. **The retro keeps its free paragraph** — its In Plain Words is also the merge commit body, so it stays a paragraph of what changed, and it names the criteria that were met. The check by criterion lives in question 1 and the Delivered score (decision 60). Rejected: decision 61's three lines, and no change.
100. **Two phases, three commits** — Phase 1: the rule and the flows, then the templates. Phase 2: the skills. The same split as efforts 2 to 4.
101. **`arcs.md` and `arc-close` need no edit** — effort 4 already did the work the overview plan lists for them. `arcs.md`, Success criteria, names the chain as "an arc's Design Spec"; `arc-close` step 4 holds the arc against each success criterion, and step 7 shows each one met or not met.
102. **The rule lives in `session-discipline.md`** — its In Plain Words section is rewritten, and a new Design Spec section follows it. `session-modes/SKILL.md`, the flows, the style guide and the templates point at it and do not restate it.
103. **"Design Spec — Carried By" is one section in the plan template** — after the Decision Record, as in the E4 plan. An overview plan names the effort and adds "Checked at", as the F.008 overview plan does; an effort or single-file plan names the phase and commit.
104. **`docs-chore-flow.md` gets one sentence** — that a multi-effort docs plan opens with the Design Spec (decision 98). Not in the overview plan's list.
105. **`execute` reads the criteria its phase carries** — the rows of "Design Spec — Carried By" that name the phase, and the text of those criteria in the work's first doc. The plan cites the criteria and does not restate them (decision 58), so the text is read at its source.
106. **The retro falls back for older work** — question 1 holds work with no Design Spec against the discovery doc's In Plain Words and Design Summary, as today. Initiatives that started before effort 5 lands, in any project, have no spec.
107. **`execution-handoff.md` and `arch-page.md` stay as they are** — neither defines In Plain Words. The hand-off already sends the session to the plan's In Plain Words; `execute` adds the Design Spec read.

## Decision Record — Execution

1. **A refactor with no audit holds its spec in its plan** — Robert, 2026-11-21, at the effort close (review finding 1). An exploration holds no Design Spec, so a refactor whose target an exploration chose has no doc with a spec before its plan. `plan`, `refactor-flow.md`, the Design Spec table in `session-discipline.md` and the plan template now say the plan opens with the spec whenever there is no audit. This changes the wording that Commit 1 Task 1, Commit 2 Task 2 and Commit 3 Task 2 wrote; the shipped text is the source.
2. **Only an arc's seed proposes criteria** — Robert, 2026-11-21, at the effort close (review finding 6). `seed.md` keeps Success Criteria arc-only, so `templates/discovery.md`, `discovery` step 6 and `session-discipline.md` no longer tell a feature's Discovery to start from its seed's criteria. This changes the wording that Commit 1 Task 1, Commit 2 Task 1 and Commit 3 Task 1 wrote.
3. **Five fixes in files of earlier efforts** — Robert, 2026-11-21, at the effort close (review findings 2, 3, 4, 5 and 7). `coordinate` takes its base from the effort's first scoped commit, as `effort-close` does. `initiative-close` names the retro from the discovery doc, the audit or the plan. `audit` stops on a dirty tree or a wrong branch. `seed` and `explore` treat an effort as closed when its squash commit is on the branch with only `fix(E<n>)` commits after it. `arc-plan` stops, and writes no rows, when its branch is already merged.

---

## Design Spec — Carried By

Decision 59, for this effort. The criteria are in the discovery doc, Design Spec.

| Criterion | Carried by |
|---|---|
| 9 — the first doc of any work opens with a Design Spec, and the close holds the work against it | Phase 1, Commits 1 and 2; Phase 2, Commit 3 |
| 10 — In Plain Words says what its own doc handles | Phase 1, Commits 1 and 2 |

## Shared Context

### Task format

Decision 34: every edit here is to a file that exists, so every task is a literal Find and Replace. The Find anchors are quoted from the branch at `a656392`.

### Gate and sessions

- **Gate** — `claude plugin validate .` from the repo root, before every commit
- **One session** — this plan, the two phases and the effort close run in the session that writes the plan (overview plan, Decision Record, entry 2). Robert signs off this plan before any file is edited
- **Loading the style guide** — every commit edits a doc; the style guide is loaded before the first edit

## Out of Scope

- **Docs that exist** — no discovery doc, plan or retro in any project is reshaped. F.008's own docs were brought to the new shape by hand on 2026-11-20 (overview plan, Effort 5)
- **Work with no doc** — decision 97
- **`arcs.md`, `arc-close`, `execution-handoff.md`, `arch-page.md`** — decisions 101 and 107
- **The catalogue** — this effort adds no skill, flow file or template, so the catalogue does not change (E4 plan, decision 95)

---

## Work Breakdown

**Overview**

- [x] **Phase 1 — The rule, the flows and the templates**
  - Commit 1 — `docs(E5): define the Design Spec and reframe In Plain Words` (6 tasks)
  - Commit 2 — `docs(E5): put the Design Spec in the templates` (4 tasks)
- [x] **Phase 2 — The skills**
  - Commit 3 — `docs(E5): read, carry and check the Design Spec in the skills` (4 tasks)

### Phase 1 — The rule, the flows and the templates

**In plain words:** the process files say what a Design Spec is, where it sits and who uses it, and what In Plain Words is for. Then the discovery, plan, docs-plan and retro templates get the sections that carry it.

#### Commit 1 — `docs(E5): define the Design Spec and reframe In Plain Words`

##### Task 1 — `plugins/gestalt/skills/session-modes/session-discipline.md`

Two edits. The re-grounding step reads the Design Spec after In Plain Words (decision 102):

**Find:**
```
- **Every session** — read the **In Plain Words** section of the doc in scope first, then that of each layer above it (overview plan, arc), so the detail is read against what, why and how it fits. An Execution session also reads the **In plain words** line of each phase in scope.
```
**Replace with:**
```
- **Every session** — read the **In Plain Words** section of the doc in scope first, then that of each layer above it (overview plan, arc), so the detail is read against what, why and how it fits. Then read the work's **Design Spec** in its first doc, and in a plan the rows of Design Spec — Carried By that name the scope at hand (Design Spec, below). An Execution session also reads the **In plain words** line of each phase in scope.
```

The In Plain Words section is rewritten for decision 61, and the Design Spec section follows it (decisions 55 to 60, 96, 97, 99):

**Find:**
```
## In Plain Words

Every layer of initiative artifact opens with a required **In Plain Words** section: what, why and how it fits, in plain words, under 15 lines. The layers are the seed, arc-discovery, arc-plan, discovery doc, overview plan, effort plan and docs-initiative plan. Each one is scoped to its own layer. Inside a single-file or effort plan, each phase also opens with a required **In plain words** line: one or two sentences, with the same rules, scoped to that phase.
```
**Replace with:**
```
## In Plain Words

Every initiative artifact opens with a required **In Plain Words** section. It is where Robert and Claude agree on what this layer of work does, outside the project's vocabulary, its context and its code. It makes sure Robert understands what he signs off, and it keeps Claude from talking itself onto a strange path.

Three lines, under 15 lines in all, about the doc's own layer and no other:

- **What** — what this layer does and the output it produces, in plain words with none of the project's vocabulary
- **Why** — the reason the work is needed: a pointer to the Design Spec, or the problem it solves
- **How it fits** — points at the Design Spec and names the part of it this layer delivers. In the doc that holds the spec, it points up: to the arc's spec, or to the project

The layers are the seed, the exploration or audit, the arc-discovery, the arc-plan, the discovery doc, the overview plan, the effort plan, the single-file plan and the docs-initiative plan. A seed comes before any spec, so its lines name the work that is coming and its problem. An exploration or audit adds a fourth line, Short answer (`exploration-flow.md`). A retro keeps a free paragraph of what changed, because it is also the merge commit body, and names the criteria that were met. Inside a single-file or effort plan, each phase also opens with a required **In plain words** line: one or two sentences, the same check at its smallest, scoped to that phase.

## Design Spec

The **Design Spec** says what a piece of work builds and how Robert will know it is built. It is written once, in the first doc of the work, right after In Plain Words:

| Work starts with | The Design Spec is in |
|---|---|
| A Discovery | The discovery doc |
| An arc-discovery | The arc-discovery doc |
| A refactor's audit | The audit |
| A plan with no doc before it: a non-trivial bugfix, a refactor that goes straight to Plan, a multi-effort docs initiative | The top of that plan |

A seed and an exploration carry none; a seed may propose criteria, and the first doc after it ratifies them. Work with no doc (a trivial bugfix, a chore, a single-session docs item) has none.

It has two parts. **What we are building** is one paragraph: the thing, in plain words, worded as a commitment the criteria can test. What the work does not build goes in Out of Scope. **Success Criteria** is a table `# | Question | Success is`. A criterion is a question Robert can ask of the finished work, with the answer that means success; never a count or a limit. The criteria are ratified with Robert before the design below them is written. An arc numbers them `SC-1`, `SC-2` (arcs.md, Success criteria).

It is one source. No plan and no retro restates it; each cites a criterion by number:

| Where | What it does with the spec |
|---|---|
| Plan | Its Design Spec — Carried By table gives each criterion the effort, phase or commit that carries it |
| In Plain Words of each layer | How it fits names the part of the spec this layer delivers |
| Close | The retro's first question and its Delivered score hold the work against the criteria, one by one |
```

##### Task 2 — `plugins/gestalt/skills/session-modes/SKILL.md`

The last paragraph points at the rule (decision 102):

**Find:**
```
Every initiative artifact opens with a required **In Plain Words** section: what, why and how it fits, in plain words, under 15 lines, scoped to its own layer. Inside a plan, each phase opens with a required one-or-two-sentence **In plain words** line. Templates are living documents: update one when a real doc shows a missing or unused section.
```
**Replace with:**
```
Every initiative artifact opens with a required **In Plain Words** section: what this layer does, why, and how it fits, in plain words, under 15 lines, about its own layer. The first doc of a piece of work follows it with the **Design Spec**: what the work builds, and the success criteria that show it is built. Inside a plan, each phase opens with a required one-or-two-sentence **In plain words** line. `session-discipline.md` holds both rules. Templates are living documents: update one when a real doc shows a missing or unused section.
```

##### Task 3 — `plugins/gestalt/skills/session-modes/feature-flow.md`

Two edits. Discovery ratifies the criteria before the design (decision 57):

**Find:**
```
create it from the template at its real location and fill Problem, Design Summary and Open Questions with what is already known.
```
**Replace with:**
```
create it from the template at its real location and fill Problem, Design Summary and Open Questions with what is already known. Draft the Design Spec with them, and ratify its Success Criteria with Robert before any design point is settled; the design answers to them (session-discipline.md, Design Spec).
```

The Plan gives each criterion its carrier (decision 59). A new paragraph before Discipline:

**Find:**
```
**Discipline.** Plans are self-implementable specs: code, not prose.
```
**Replace with:**
```
**Design Spec — carried by.** The plan gives each criterion of the Design Spec the work that carries it, in a table that cites the criterion by number and never restates it. An overview plan names the effort and where the criterion is checked; an effort or single-file plan names the phase and commit. A criterion that nothing carries is a gap to put to Robert before sign-off.

**Discipline.** Plans are self-implementable specs: code, not prose.
```

##### Task 4 — `plugins/gestalt/skills/session-modes/bugfix-flow.md`

The light plan opens with a Design Spec (decision 56). The trivial tier is unchanged (decision 97).

**Find:**
```
- **Root cause** — what's actually wrong
```
**Replace with:**
```
- **Design Spec** — at the top: what the fix delivers, and the success criteria that show the bug is gone (session-discipline.md, Design Spec)
- **Root cause** — what's actually wrong
```

##### Task 5 — `plugins/gestalt/skills/session-modes/docs-chore-flow.md`

A multi-effort docs plan opens with the Design Spec (decisions 98 and 104):

**Find:**
```
Design rationale is worked out in the Plan session and recorded in the plan's "Decisions Ratified in Planning."
```
**Replace with:**
```
Design rationale is worked out in the Plan session and recorded in the plan's "Decisions Ratified in Planning." The plan is the initiative's first doc, so it opens with the Design Spec (session-discipline.md, Design Spec).
```

##### Task 6 — `plugins/gestalt/skills/style-guide/SKILL.md`

Three edits: the document types that carry the spec, cite it, or check it.

**Find:**
```
Covers the problem, the design, decisions and open questions.
```
**Replace with:**
```
Opens with the work's Design Spec, after In Plain Words. Covers the problem, the design, decisions and open questions.
```

**Find:**
```
Carries the Decision Record for execution-time decisions (append and reconcile).
```
**Replace with:**
```
Gives each criterion of the Design Spec the work that carries it, and opens with the Design Spec itself when no doc came before it. Carries the Decision Record for execution-time decisions (append and reconcile).
```

**Find:**
```
what changed in plain words, five fixed questions, a rating table and follow-up rows.
```
**Replace with:**
```
what changed in plain words, five fixed questions (the first held against the Design Spec, criterion by criterion), a rating table and follow-up rows.
```

##### Commit message

```
docs(E5): define the Design Spec and reframe In Plain Words

- session-discipline.md: In Plain Words says what its own layer does;
  a new Design Spec section says where the spec sits, its two parts,
  and how plans, layers and closes use it; re-grounding reads it
- session-modes/SKILL.md: points at both rules
- feature-flow.md: Discovery ratifies the criteria before the design;
  the plan gives each one its carrier
- bugfix-flow.md, docs-chore-flow.md: a plan-first piece of work opens
  with the Design Spec
- style-guide: the discovery doc, the plan and the retro carry, cite
  or check the spec
```

#### Commit 2 — `docs(E5): put the Design Spec in the templates`

##### Task 1 — `plugins/gestalt/skills/session-modes/templates/discovery.md`

The In Plain Words comment for decision 61, the three slot lines, and a required Design Spec section after it (decisions 56, 57, 96). Model: `arc-discovery.md`.

**Find:**
```
## In Plain Words

<!--
REQUIRED. Under 15 lines. Plain words for a reader who has not read the rest of
this doc: no project shorthand unless it is defined in the same sentence.

  - What: what this initiative does.
  - Why: the problem it solves, for the user or for the codebase.
  - How it fits: where it sits in the arc and the project, and what it unblocks.

Every session on this initiative reads this section first
(session-discipline.md, Re-grounding).
-->
```
**Replace with:**
```
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
```

##### Task 2 — `plugins/gestalt/skills/session-modes/templates/implementation-plan.md`

Five edits. The effort plan's section list in the opening comment (decision 103):

**Find:**
```
     In Plain Words, Decisions Ratified, Decision Record, Look Here First
```
**Replace with:**
```
     In Plain Words, Decisions Ratified, Decision Record, Design Spec —
     Carried By, Look Here First
```

The In Plain Words comment for decision 61, with the slot lines:

**Find:**
```
REQUIRED. Under 15 lines. Plain words for a reader who has not read the rest of
this plan: no project shorthand unless it is defined in the same sentence.

  - What: what this plan builds.
  - Why: the problem it solves, for the user or for the codebase.
  - How it fits: where it sits in the initiative, the arc and the project.

Every execution session reads this section first (session-discipline.md,
Re-grounding). If execution changes the what, why or fit, fix it here too.
-->
```
**Replace with:**
```
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
```

The "carried by" section, before Look Here First (decisions 59 and 103):

**Find:**
```
## Look Here First

<!--
Only for an effort that runs under /gestalt:coordinate.
```
**Replace with:**
```
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
Only for an effort that runs under /gestalt:coordinate.
```

The phase line's comment (decision 61, at its smallest):

**Find:**
```
REQUIRED per phase. One or two sentences, no more. Plain words for a reader who
has not read the rest of this plan: no project shorthand unless it is defined in
the same sentence.
```
**Replace with:**
```
REQUIRED per phase. One or two sentences, no more: what this phase does and
what is true when it lands, the plan's In Plain Words at its smallest. Plain
words for a reader who has not read the rest of this plan: none of the
project's vocabulary unless it is defined in the same sentence.
```

##### Task 3 — `plugins/gestalt/skills/session-modes/templates/docs-plan.md`

Two edits. The In Plain Words comment for decision 61, the slot lines, and the Design Spec at the top (decision 98):

**Find:**
```
REQUIRED. Under 15 lines. Plain words for a reader who has not read the rest of
this plan: no project shorthand unless it is defined in the same sentence.

  - What: what this initiative changes in the doc set.
  - Why: the problem it solves for the reader.
  - How it fits: where it sits in the project, and what it unblocks.

Every execution session reads this section first (session-discipline.md,
Re-grounding).
-->
```
**Replace with:**
```
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
```

The Effort Summary names what each effort carries (decision 98):

**Find:**
```
REQUIRED. One row per effort. "Depends on" makes the DAG scannable.
```
**Replace with:**
```
REQUIRED. One row per effort. "Carries" names the Design Spec criteria the
effort delivers, by number; every criterion has an effort. "Depends on" makes
the DAG scannable.
```

**Find:**
```
| Done | # | Effort | Scope | Depends on |
|------|---|--------|-------|------------|
| [ ] | 1 | [name] | [one-line scope] | — |
```
**Replace with:**
```
| Done | # | Effort | Scope | Carries | Depends on |
|------|---|--------|-------|---------|------------|
| [ ] | 1 | [name] | [one-line scope] | [criteria, by number] | — |
```

##### Task 4 — `plugins/gestalt/skills/session-modes/templates/retro.md`

Three edits. In Plain Words names the criteria met (decision 99):

**Find:**
```
not read the plans: what works now that did not before, and what was removed
or reshaped. Not a diff walk. The same text is the merge commit body and the
chat wrap-up.
```
**Replace with:**
```
not read the plans: what works now that did not before, what was removed or
reshaped, and which criteria of the Design Spec were met. Not a diff walk. The
same text is the merge commit body and the chat wrap-up.
```

Question 1 holds the work against the spec, by criterion (decisions 60 and 106):

**Find:**
```
Hold the shipped work against the discovery doc's In Plain Words and Design
Summary (an arc: each success criterion of the arc-discovery's Design Spec,
one by one, and the arc-plan). Name what landed, what was cut or deferred, and
what was added that was not planned.
-->
```
**Replace with:**
```
Hold the shipped work against each success criterion of the Design Spec, one
by one: met or not met, with one line of evidence. The spec is in the work's
first doc (session-discipline.md, Design Spec); an arc's is in the
arc-discovery, and the arc-plan says which initiative carried each one. Cite
a criterion by number; do not restate it. Then name what landed, what was cut
or deferred, and what was added that was not planned.

Work from before the Design Spec has none: hold it against the discovery doc's
In Plain Words and Design Summary.
-->
```

The Delivered score:

**Find:**
```
  Delivered  — the shipped work vs the discovery's In Plain Words
```
**Replace with:**
```
  Delivered  — the shipped work vs the Design Spec, by criterion (section 1)
```

##### Commit message

```
docs(E5): put the Design Spec in the templates

- discovery.md: In Plain Words says what this doc handles; a required
  Design Spec follows it, its criteria ratified before the design
- implementation-plan.md: In Plain Words and the phase line reframed;
  a Design Spec for a plan-first piece of work; a Design Spec —
  Carried By section for every plan shape
- docs-plan.md: a Design Spec at the top, and a Carries column in the
  Effort Summary
- retro.md: In Plain Words names the criteria met; question 1 and the
  Delivered score are held against the spec by criterion
```

### Phase 2 — The skills

**In plain words:** the skills that start a Discovery, a Plan and an Execution draft, read and carry the Design Spec, and the initiative close checks the work against it. After this phase the effort is done.

#### Commit 3 — `docs(E5): read, carry and check the Design Spec in the skills`

##### Task 1 — `plugins/gestalt/skills/discovery/SKILL.md`

Two edits. Step 6 drafts the spec (decision 57):

**Find:**
```
and fill Problem, Design Summary and Open Questions with what the tracker, the seed and the arc already say.
```
**Replace with:**
```
and fill Problem, Design Summary and Open Questions with what the tracker, the seed and the arc already say. Draft the Design Spec from the criteria the seed proposes and, in an arc, the criteria the arc-plan gives this initiative (`session-discipline.md`, Design Spec).
```

Step 7 ratifies it first:

**Find:**
```
Then ask one directional question. Do not propose designs yet.
```
**Replace with:**
```
Then ask one directional question. Do not propose designs yet. Ratify the Design Spec's Success Criteria with Robert before any design point is settled; the design answers to them.
```

##### Task 2 — `plugins/gestalt/skills/plan/SKILL.md`

Four edits. Step 3 reads the spec, and names the other plan-first cases (decisions 56 and 98):

**Find:**
```
Then the discovery doc's In Plain Words, then the rest of it.
```
**Replace with:**
```
Then the discovery doc's In Plain Words and Design Spec, then the rest of it.
```

**Find:**
```
With neither, the plan opens with the refactor's Design Spec (`refactor-flow.md`). For an effort plan, read the overview plan's In Plain Words and decisions first.
```
**Replace with:**
```
With neither, the plan opens with the refactor's Design Spec (`refactor-flow.md`). A non-trivial bugfix and a multi-effort docs initiative have no doc before the plan either; their plan opens with the Design Spec too (`bugfix-flow.md`, `docs-chore-flow.md`). For an effort plan, read the overview plan's In Plain Words, its decisions and its Design Spec — Carried By rows for this effort first.
```

Step 6 ratifies a plan-held spec first, and settles the carriers (decision 59):

**Find:**
```
Then settle phases, commits and tasks in conversation.
```
**Replace with:**
```
When the plan holds the Design Spec, ratify its Success Criteria with Robert first. Then settle phases, commits and tasks in conversation, and which of them carries each criterion.
```

Step 7 checks the table before sign-off:

**Find:**
```
Check the two line budgets with the template's `awk` commands before sign-off.
```
**Replace with:**
```
Before sign-off, check the two line budgets with the template's `awk` commands, and check that Design Spec — Carried By gives every criterion the work that carries it.
```

##### Task 3 — `plugins/gestalt/skills/execute/SKILL.md`

Step 4 reads the criteria the phase carries (decision 105):

**Find:**
```
4. Read the plan's In Plain Words, the In plain words line of the phase in scope, Decisions Ratified in Planning,
```
**Replace with:**
```
4. Read the plan's In Plain Words, the In plain words line of the phase in scope, the rows of Design Spec — Carried By that name the phase and the text of those criteria in the work's first doc, Decisions Ratified in Planning,
```

##### Task 4 — `plugins/gestalt/skills/initiative-close/SKILL.md` and the overview plan

Three edits to the skill (decisions 60 and 106). Step 1 reads the spec:

**Find:**
```
and every plan: In Plain Words first, then the decisions and the Decision Record.
```
**Replace with:**
```
and every plan: In Plain Words first, then the Design Spec, the decisions and the Decision Record.
```

Step 4 holds the work against it:

**Find:**
```
Fill every section from what step 1 read, `git diff <base>..HEAD` and the changed code.
```
**Replace with:**
```
Fill every section from what step 1 read, `git diff <base>..HEAD` and the changed code. Section 1 holds the work against each criterion of the Design Spec, in the discovery doc, the audit or the top of the plan.
```

Step 7 shows each criterion at sign-off, as `arc-close` does:

**Find:**
```
Show the retro's In Plain Words, each answer in short, the rating table and the verdict.
```
**Replace with:**
```
Show the retro's In Plain Words, each answer in short, every success criterion marked met or not met with one line of evidence, the rating table and the verdict.
```

In `dev_journals/initiatives/implementation/F.008-skills-expansion-overview-plan.md`, tick effort 5:

**Find:**
```
| [ ] | 5 | Design spec |
```
**Replace with:**
```
| [x] | 5 | Design spec |
```

##### Commit message

```
docs(E5): read, carry and check the Design Spec in the skills

- discovery: drafts the Design Spec and ratifies its criteria before
  the design
- plan: reads the spec, opens a plan-first piece of work with it, and
  checks that every criterion has a carrier
- execute: reads the criteria its phase carries
- initiative-close: reads the spec and holds the retro against it,
  criterion by criterion
- overview plan: effort 5 done
```

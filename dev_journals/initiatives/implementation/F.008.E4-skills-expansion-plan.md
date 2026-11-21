# Skills Expansion, Effort 4 — Arc Stages and Catalogue — Implementation Plan

## In Plain Words

- **What** — this plan delivers the two arc-level sessions as skills, each with its own template: arc-discovery, which sets an arc's success criteria and the decisions that bind every initiative in it, and arc-plan, which cuts the arc into initiatives. The arc's seed takes the place of the arc concept doc in every file that names it. Last comes one file that lists every skill gestalt has and the holes it still has.
- **Why** — the discovery doc's Design Spec asks for criterion 5 (`one-claude` can run as an arc on skills made for arcs) and criterion 8 (a process review sees the skills and the holes in one file). Today an arc borrows the feature templates and folders, and no list of the skills exists.
- **How it fits** — this is the fourth of F.008's five efforts. It carries criteria 5 and 8, the arc share of criterion 1, and the arc-discovery's share of criteria 9 and 10. Phase 1 builds the templates and skills, Phase 2 makes the rest of the process agree with them, and Phase 3 writes the catalogue. Per the overview plan's Decision Record, entry 2, this plan, its execution and `/gestalt:effort-close F.008.E4` run in one session.

## Context / Goal

Build the Arc stages and Catalogue fronts of F.008: decisions 4, 10 to 12, 18 (the arc's half), 29 to 31 and 43, and the overview plan's Decision Record, entry 4.

- Discovery doc: [`F.008-skills-expansion-discovery.md`](../discovery/F.008-skills-expansion-discovery.md), the Arc stages and Catalogue parts of Design Summary, Arc Findings and Catalogue Findings
- Overview plan: [`F.008-skills-expansion-overview-plan.md`](./F.008-skills-expansion-overview-plan.md). Its decisions 35 to 44 and 62 to 63, Shared Context and Outside rules bind this plan and are not repeated here
- Effort 3 plan: [`F.008.E3-skills-expansion-plan.md`](./F.008.E3-skills-expansion-plan.md), the register the new skills copy
- Arc docs that exist, read as models for the two templates: gm-toolkit `dev_journals/campaigns/initiatives/arcs/A.004-encounter-lab/` (arc-discovery and arc-plan) and `dev_journals/faction-manager/initiatives/_completed/arcs/A.001-data-driven-rulebook/` (read-only)

## Decisions Ratified in Planning

2026-11-21. The numbers continue from the effort 3 plan's 84. Decisions 85 and 86 are Robert's answers in the Plan session. Decisions 87 to 95 are Claude's proposals in this draft; Robert's sign-off of the plan ratifies them.

85. **The arc branch stays as decision 29 has it** — arc-discovery and arc-plan run on `feature/<arc-name>`, cut by `arc-discovery` and merged by `arc-plan` with `--no-ff` at sign-off, with no review and no tag. Settles the overview plan's "For its Plan session" item. Rejected: arc docs committed straight to `main`, exempt from the branch rule as seeds and explorations are.
86. **An arc from before seeds falls back to its concept doc** — every skill that reads the arc's seed reads the arc folder's `-arc-concept.md` when there is no seed. gm-toolkit's `A.004` has a concept doc and no seed. `arc-close` moves every file in the arc folder, so an old concept doc moves with no change. Rejected: no fallback.
87. **Three phases, five commits** — Phase 1: the two templates, then the two skills. Phase 2: the flow text (`arcs.md` rewritten, lifecycle, file locations, the session-modes skill, the style guide), then the rules and the skills that read an arc. Phase 3: the catalogue (decision 36). The same split as efforts 2 and 3.
88. **The arc docs number their parts with prefixes** — `SC-n` for a success criterion, `ACD-n` for an arc decision, `AP-n` for an arc-plan decision, as the `A.004` docs do. An initiative inside the arc cites "ACD-4" or "SC-2" with no clash with its own decision numbers.
89. **The arc-discovery's Design Spec follows In Plain Words** — decisions 57, 60 and 63. Its Success Criteria are the spec's second part, ratified before the arc decisions are written. The discovery doc's earlier sketch put them "before the arc decisions", lower in the doc; decision 57 moved them up.
90. **The arc-plan cites the criteria and does not restate them** — its "Design Spec — Carried By" table gives each `SC-n` the initiative that carries it (decisions 58 and 59). The `A.004` arc-plan restated the criteria in full; the template does not.
91. **`arc-discovery` needs a promoted arc row and a seed** — the row in Current Initiatives, as `discovery` checks. With no seed and no old concept doc, it names `/gestalt:seed write` and stops (decision 4).
92. **`arc-plan` adds rows and does not edit the arc's own row** — `lifecycle.md` freezes a row and its write-up between promotion and close. The new initiatives' rows link the arc-plan; the arc's row stays as it is. The `A.004` arc-plan edited the arc row's Detail.
93. **One commit per arc session, at sign-off** — `docs: <A.ID> arc-discovery` and `docs: <A.ID> arc-plan` on `feature/<arc-name>`. The merge subject is `docs: <A.ID> <arc name> arc docs`, with the arc-plan's In Plain Words as its body.
94. **`code-and-docs.md` gets an "Arc-discovery or arc-plan" row in its session table** — each is a session with its own end, as decision 83 gave the exploration a row.
95. **The catalogue says when it is updated** — in the same commit that adds or removes a skill, a flow file or a template, or changes who starts a skill. Without that line it goes stale with the next skill.

## Decision Record — Execution

1. **The tracker-moves hole is narrowed, not dropped** — 2026-11-21, Phase 3. Checked against the source, all five known holes still hold. Since the discovery doc's snapshot, `seed plant`, `explore` and `arc-plan` have come to write new rows, so the catalogue says no skill promotes a row or drafts a write-up, and names the three that add rows.

---

## Design Spec — Carried By

Decision 59, for this effort. The criteria are in the discovery doc, Design Spec.

| Criterion | Carried by |
|---|---|
| 1 — each kind of work starts from a skill (the arc row) | Phase 1, Commit 2 |
| 5 — `one-claude` can run as an arc | Phase 1, Commits 1 and 2; Phase 2, Commits 3 and 4 |
| 8 — a process review sees the skills and the holes | Phase 3, Commit 5 |
| 9 — the first doc of any work opens with a Design Spec (the arc-discovery's share) | Phase 1, Commit 1 |
| 10 — In Plain Words says what its own doc handles (the two new templates) | Phase 1, Commit 1 |

The overview plan's Decision Record, entry 4 (`arc-close` moves the arc's seed) lands in Phase 2, Commit 4.

## Shared Context

### Task format

Decision 34: an exact edit to a file that exists is a literal task with a Find anchor. A new file is a named deliverable: its path, its scope, the decisions it carries out and a numbered list of what it must hold. The Execution session writes the file, then checks it against the list, item by item. `arcs.md` is rewritten, so its task gives the full file.

### Gate and sessions

- **Gate** — `claude plugin validate .` from the repo root, before every commit
- **One session** — this plan, the three phases and the effort close run in the session that writes the plan (overview plan, Decision Record, entry 2). Robert signs off this plan before any file is edited
- **Loading the style guide** — every commit edits or writes a doc; the style guide is loaded before the first edit

### Names used below

- **Bare arc ID** — `A.` and three digits, such as `A.001`. An initiative inside an arc has a fourth part, `A.001.4`, and runs the normal skills
- **The arc's seed** — `dev_journals/initiatives/seeds/<arc-ID>-<arc-name>-seed.md`. The glob `<arc-ID>-*-seed.md` does not match an arc initiative's own seed (`A.001.4-…`), because a hyphen must follow the arc ID
- **The concept fallback** (decision 86) — the clause "an arc from before seeds has its concept doc, `-arc-concept.md`, in the arc folder in place of the seed"

## Outside Rules

No new rule. The two skills use what effort 1 and the overview plan already sourced: the hand-only flag stays off (overview plan, row 1), `$0` is the first argument (overview plan, row 7), and a description is cut past 1,536 characters and shows angle brackets as entities (E1 plan, row 13 and its note). The new descriptions are short and use no angle brackets.

## Out of Scope

- **Reshaping arc docs that exist** — gm-toolkit's `A.004` and `A.001` stay as they are; decision 86 keeps them readable
- **The `one-claude` seed** — it is the likely first real use; this effort does not plant or reshape it
- **The Design Spec in the templates that exist, and the Delivered score in `retro.md`** — effort 5. This effort changes only the arc half of `retro.md` question 1
- **Filling the known holes** — the catalogue lists them (decisions 10 and 12)

---

## Work Breakdown

**Overview**

- [x] **Phase 1 — The arc templates and skills**
  - Commit 1 — `feat(E4): add the arc-discovery and arc-plan templates` (2 tasks)
  - Commit 2 — `feat(E4): add the arc-discovery and arc-plan skills` (2 tasks)
- [x] **Phase 2 — The seed as the arc's concept**
  - Commit 3 — `docs(E4): put the seed in place of the arc concept in the arc flow` (5 tasks)
  - Commit 4 — `docs(E4): name the arc stages in the rules and the skills that read an arc` (8 tasks)
- [x] **Phase 3 — The catalogue**
  - Commit 5 — `feat(E4): add the skills catalogue` (3 tasks)

### Phase 1 — The arc templates and skills

**In plain words:** the two arc templates and the two skills that start an arc's Discovery and its Plan are written. After this phase an arc can be designed and sliced from its seed, on its own branch, with no feature template.

#### Commit 1 — `feat(E4): add the arc-discovery and arc-plan templates`

##### Task 1 — `plugins/gestalt/skills/session-modes/templates/arc-discovery.md` (new, named deliverable)

**Carries out:** decisions 29, 30, 57, 60, 61, 88 and 89, per decision 63.

A template in the style of `templates/exploration.md`: guidance in HTML comments, slots in square brackets, REQUIRED marked. Model: the `A.004` arc-discovery. It must hold, in this order:

1. **The opening comment** — copy to `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-discovery.md`. Started with `/gestalt:arc-discovery`; the flow is `arcs.md`. It reads the arc's seed, sets the success criteria and the decisions that bind every initiative, and does not slice the arc into initiatives (Arc-Plan's job). Delete the comments before writing
2. **Title** — `# [Arc Name] — Arc Discovery`
3. **Header** — a blockquote: Status (in progress, written for sign-off, or signed off; the branch `feature/<arc-name>`), and Inputs (the seed with a link, and any other doc read)
4. **In Plain Words** — REQUIRED, three lines as decision 61 frames them. What: the output, the decisions that bind every initiative and the Design Spec; it slices nothing. Why: points at the Design Spec, or names the problem. How it fits: the first arc-level doc after the seed, arc-plan next; it holds the arc's spec, so it points up to the project
5. **Design Spec** — REQUIRED (decisions 57, 60 and 89). What we are building, in plain words, as a commitment the criteria can test. Then Success Criteria, a table `# | Question | Success is`, numbered `SC-1`, `SC-2` (decision 88). The comment carries Robert's rule (a question he can ask of the finished work, with the answer that means success; not a count or a limit), says the seed's proposed criteria are the starting point, and says the criteria are ratified before the arc decisions are written. The arc-plan gives each one an initiative; the arc close checks every one
6. **Problem** — REQUIRED. The gap the arc closes, richer than the seed
7. **Architecture Context** — REQUIRED. The pages read and the Key Decisions that bind every initiative; if the project has no wiki, say so and name the binding context
8. **Design Summary** — REQUIRED. The chosen shape of the arc in a few paragraphs, a diagram if it helps
9. **The arc decisions** — REQUIRED. A table `# | Decision | Rationale | Tag`, numbered `ACD-1` (decision 88). Tag is "Carried in" (settled before the session, not re-opened) or "Ratified here". Rejected alternatives go in Rationale
10. **The arc's own design** — an optional comment only: free sections for what the arc needs, such as the reading of an earlier doc's decisions or what one initiative now holds
11. **Open Questions — routed** — REQUIRED. A table `Question | Goes to`, each to Arc-Plan or to a named initiative's Discovery or Plan. "None." if none
12. **Out of Scope** — REQUIRED
13. **Reconciliation Items** — optional. Doc drift found in the session, each with what corrects it and when

##### Task 2 — `plugins/gestalt/skills/session-modes/templates/arc-plan.md` (new, named deliverable)

**Carries out:** decisions 30, 31, 58, 59, 61, 88, 90, 92 and 93, per decision 63.

Same style. Model: the `A.004` arc-plan. It must hold, in this order:

1. **The opening comment** — copy to `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-plan.md`. Started with `/gestalt:arc-plan`. It cuts the arc into initiatives, sets their order and boundaries, and gives every open question an owner; it holds no design for any one initiative. The session ends with the tracker rows written and `feature/<arc-name>` merged into `main`. Delete the comments before writing
2. **Title** — `# [Arc Name] — Arc Plan`
3. **Header** — a blockquote: Status and Inputs (the seed and the arc-discovery, with links and the decision range, such as `ACD-1` to `ACD-10`)
4. **In Plain Words** — REQUIRED, decision 61's three lines. What: the initiatives and their order, in plain words. Why: the arc-discovery left open who builds what and when. How it fits: the last arc-level doc; it gives each criterion of the arc-discovery's Design Spec its initiative; each initiative runs its own flow after it
5. **Design Spec — Carried By** — REQUIRED (decisions 58, 59 and 90). A table `Criterion | Carried by | Checked at`. Every `SC-n` of the arc-discovery has a row; a criterion is cited by number and a short name, never restated
6. **Decisions Ratified in Arc-Plan** — REQUIRED. A table `# | Decision | Rationale`, numbered `AP-1` (decision 88), rejected alternatives in Rationale
7. **Initiative List** — REQUIRED. A table `Order | ID | Initiative | Type | Depends on | Ships`, a text diagram of the dependencies (a DAG, not always a line), and a note per edge kind (hard, soft). The comment gives the ID rule: a new initiative takes `<arc-ID>.<n>` in run order; one that existed before the arc keeps its ID. Each initiative cuts its own branch from `main` after the arc branch merges
8. **Per-Initiative Boundary** — REQUIRED. One `###` per initiative: In, Fixed by the arc (the `ACD-n` it must meet), Pushed out (to which initiative, or out of the arc)
9. **Open Question Routing** — REQUIRED. Each question the arc-discovery sent to Arc-Plan, with its answer and the `AP-n`; each it routed to an initiative, with the owner confirmed; then new questions with their owner
10. **Cross-Arc Dependencies** — REQUIRED. A table `Dependency | Gates | State`, or "None."
11. **Out-of-Arc Deferrals** — REQUIRED. The arc-discovery's Out of Scope carried over, then what this session pushed out
12. **Tracker Rows** — REQUIRED. A table `ID | Item | Type | Table | Trigger | Detail`, with Table as Backlog or Up Next. Each Detail ends with a link to this doc. The comment says the rows are written at sign-off, and the arc's own row is not edited (decision 92)
13. **What Comes Next** — REQUIRED. The merge of `feature/<arc-name>`, then the next sessions in order, each Robert's call

##### Commit message

```
feat(E4): add the arc-discovery and arc-plan templates

- templates/arc-discovery.md: a Design Spec after In Plain Words, its
  SC-n criteria ratified before the ACD-n arc decisions; open questions
  routed to Arc-Plan or an initiative
- templates/arc-plan.md: each criterion's carrying initiative, AP-n
  decisions, the initiative list and boundaries, the tracker rows
```

#### Commit 2 — `feat(E4): add the arc-discovery and arc-plan skills`

##### Task 1 — `plugins/gestalt/skills/arc-discovery/SKILL.md` (new, named deliverable)

**Carries out:** decisions 4, 28, 29, 30, 57, 85, 86, 89, 91 and 93.

The frontmatter, literal. No `disable-model-invocation` (decision 28):

```
---
name: arc-discovery
description: Start the Arc-Discovery session of one arc, by its A. ID - the arc's success criteria and the decisions that bind every initiative in it, read from the arc's seed and written on the arc's own branch. Use when Robert asks for an arc's Discovery. Never use it to change modes in a session that is already running.
argument-hint: "[A.ID]"
---
```

The body in the register of `audit/SKILL.md`: an opening paragraph, the sentence that defines a **stop**, then numbered steps. It must hold:

1. **Opening** — Mode: Arc-Discovery. The session ends when the arc-discovery doc is signed off and committed; do not begin Arc-Plan. It runs on Fable (model rule)
2. **The address** — `$0` is a bare arc ID. An arc initiative (`A.001.4`): name `/gestalt:discovery $0` and stop. Any other ID: say so and stop. In a multi-product project, every `dev_journals/` path reads `dev_journals/<product>/`
3. **Read** — `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `lifecycle.md` and `arcs.md`, and the template `templates/arc-discovery.md`
4. **The row** — `$0` in Current Initiatives. No row, or not there: say so and stop; promotion is Robert's call
5. **The seed** — `dev_journals/initiatives/seeds/$0-*-seed.md`: In Plain Words, Vision, Problem, Why an Arc, Candidate Initiatives and any proposed Success Criteria, then the rest. With no seed, the concept fallback (decision 86). With neither, say that an arc starts from its seed, name `/gestalt:seed write <arc-name>` then `/gestalt:seed plant`, and stop (decision 91)
6. **Branch** — on `main`, cut `feature/<arc-name>` before anything is written. On `feature/<arc-name>`, go on. On any other branch, say so and stop (decision 85)
7. **Architecture** — if `docs/architecture/` exists, `architecture-overview.md` and the pages the arc touches; their Key Decisions are binding
8. **The doc** — if `dev_journals/initiatives/arcs/$0-<arc-name>/$0-<arc-name>-arc-discovery.md` exists, read it and continue from its state. Otherwise scaffold it from the template and fill Problem, Design Summary and the Design Spec's first draft from the seed
9. **Start** — reflect back in plain words: what the arc is, what the seed already says, what is open. Then ask one directional question. The Success Criteria are ratified with Robert before any arc decision is written (decisions 57 and 89)
10. **Sign-off** — **stop:** Robert signs off the doc. Then `git add -A` and one commit, `docs: $0 arc-discovery`, with the session's attribution lines (decision 93)
11. **The end** — name `/gestalt:arc-plan $0`, in a new session

##### Task 2 — `plugins/gestalt/skills/arc-plan/SKILL.md` (new, named deliverable)

**Carries out:** decisions 28, 29, 30, 31, 59, 85, 86, 88, 90, 92 and 93.

The frontmatter, literal:

```
---
name: arc-plan
description: Start the Arc-Plan session of one arc, by its A. ID - the arc cut into initiatives with their order and boundaries, then the tracker rows written and the arc's branch merged into main, behind two stops. Use when Robert asks for an arc's plan. Never use it to change modes in a session that is already running.
argument-hint: "[A.ID]"
---
```

The body in the same register. It must hold:

1. **Opening** — Mode: Arc-Plan. The session ends when the tracker rows are committed and `feature/<arc-name>` is merged into `main`, or when Robert declines the merge. It runs on Fable (model rule). It is the one starter that merges (decision 31)
2. **The address** — as `arc-discovery`, step 2; an arc initiative names `/gestalt:plan $0`
3. **Read** — `SKILL.md`, `session-discipline.md`, `lifecycle.md`, `arcs.md`, and the template `templates/arc-plan.md`
4. **Inputs** — the `$0` row in Current Initiatives (no row: stop); the seed, or the concept fallback; the arc-discovery, `dev_journals/initiatives/arcs/$0-*/$0-*-arc-discovery.md`, In Plain Words, the Design Spec, the arc decisions and the routed questions. No signed-off arc-discovery: name `/gestalt:arc-discovery $0` and stop
5. **Branch** — `git status --porcelain` prints nothing, or stop. On `feature/<arc-name>`, go on. On `main`: check out `feature/<arc-name>` if it exists, or cut it if it does not (an arc-discovery from before decision 29 is already on `main`). On any other branch, say so and stop
6. **Architecture** — as `arc-discovery`, step 7
7. **The doc** — continue from an existing `-arc-plan.md`, or scaffold it from the template in the arc folder
8. **Settle** — with Robert, one call at a time: the initiatives, their order and dependencies, the boundaries, the routing of every open question, the initiative that carries each `SC-n`, and the tracker rows. Propose each ID: a new initiative takes `<arc-ID>.<n>` in run order; one that existed keeps its ID
9. **Stop 1** — Robert signs off the doc and approves the tracker rows, with their tables and triggers. Then add each row to its table (`lifecycle.md`), with the link to the arc-plan at the end of Detail. Do not edit the `$0` row or its write-up (decision 92). Run the gate, `git add -A`, and one commit, `docs: $0 arc-plan`, with the session's attribution lines
10. **Stop 2** — write the merge message file with the Write tool in the scratchpad: the subject `docs: $0 <arc name in plain lower-case words> arc docs`, a blank line, the arc-plan's In Plain Words, then the session's attribution lines (decision 93). Robert approves the merge. Then `git checkout main && git merge --no-ff feature/<arc-name> -F <message file>`. If it conflicts, `git merge --abort`, show the files and stop. No code review and no tag (decision 29). Do not push or delete the branch
11. **The end** — name the first initiative's next step from What Comes Next. Do not promote any row

##### Commit message

```
feat(E4): add the arc-discovery and arc-plan skills

- /gestalt:arc-discovery: reads the arc's seed (or an old concept doc),
  cuts feature/<arc-name>, ratifies the success criteria before the
  arc decisions, one docs commit at sign-off
- /gestalt:arc-plan: slices the arc, writes the initiative rows behind
  one stop and merges the arc branch into main behind a second
```

The phase's box in the Overview list is ticked in this commit.

### Phase 2 — The seed as the arc's concept

**In plain words:** every process file that named the arc concept now names the seed, and the arc flow, the rules and the closes learn the arc branch, the success criteria and the two new skills. After this phase no file points at the removed arc-concept template.

#### Commit 3 — `docs(E4): put the seed in place of the arc concept in the arc flow`

##### Task 1 — `plugins/gestalt/skills/session-modes/arcs.md`

Rewritten for decisions 4, 18, 29, 30, 31, 85, 86, 88, 92 and 93. Full contents:

```markdown
# Arc-level flow

Some work spans multiple initiatives that share a common architecture — for example, a TUI rebuild that ships as a series of layered initiatives, each adding features against the same engine boundary. These are **arcs.** An arc is a Type in the tracker (`A.` prefix, see lifecycle.md), but unlike the other types it is a *container*: it ships nothing directly. The standard Discovery and Plan modes apply at two levels — once for the arc, once for each initiative within it.

**When to use:**
- The work clearly requires multiple shippable initiatives (not a single multi-phase initiative).
- Cross-cutting architectural decisions need to be ratified once and bind every initiative in the arc.
- The order in which the initiatives ship is itself a design question worth deliberation.

If the work fits in one initiative — even a multi-effort one — use the Feature or Refactor Flow directly. Arcs add overhead that only pays off when cross-initiative coordination is real.

**Arc artifacts live together:** while the arc is active, the arc-discovery and the arc-plan sit in `dev_journals/initiatives/arcs/<ID>-<arc-name>/`, and the arc's seed stays in `dev_journals/initiatives/seeds/<ID>-<arc-name>-seed.md`. Per-initiative artifacts stay in the standard `discovery/` and `implementation/` locations until the initiative ships. Then they move into the arc's `_completed/` folder (session-discipline.md, File locations).

## The seed

An arc's Concept is its seed (`templates/seed.md`, written and planted with `/gestalt:seed`), planted as an arc: Vision, Why an Arc and Candidate Initiatives are filled, and it may propose Success Criteria. Before promotion, an arc waits in the Backlog's Arcs subsection as a normal row; once promoted, its write-up is a pointer to the seed, plus Trigger and Status (lifecycle.md). An arc cannot start without a seed: arc-discovery has nothing else to read.

An arc from before seeds has an arc concept doc, `<ID>-<arc-name>-arc-concept.md`, in its arc folder in place of the seed. The arc sessions and closes read it where they would read the seed.

## The arc branch

Arc-discovery and arc-plan run on `feature/<arc-name>`, which `/gestalt:arc-discovery` cuts from `main`. The arc's decisions bind every initiative in it, and each initiative cuts its own branch from `main`, so those decisions must be on `main` before the first initiative starts. `/gestalt:arc-plan` merges the branch into `main` with `--no-ff` once the arc-plan is signed off. The branch changes docs only, so the merge has no code review and no tag. The arc close has a branch of its own, `feature/<arc-name>-close`.

## Success criteria

An arc's Design Spec runs as a chain through its docs:

| Doc | Its job |
|---|---|
| Seed | May propose criteria |
| Arc-discovery | Ratifies them in its Design Spec, before the arc decisions are written |
| Arc-plan | Gives each criterion the initiative that carries it |
| Arc close | Checks every criterion; the arc retro's first question is held against them |

A criterion is a question Robert can ask of the finished work, with the answer that means success; not a count or a limit. Criteria are numbered `SC-1`, `SC-2`. The arc-plan and the retro cite a criterion by number and do not restate it.

## Arc-Discovery (1–2 sessions)

**Goal:** ratify the arc's success criteria, then the cross-cutting architectural decisions that will constrain *every* initiative in the arc — framework, boundaries, conventions, extensibility patterns. Do not slice into initiatives yet; that is Arc-Plan's job.

**Start:** `/gestalt:arc-discovery <A.ID>`, once the arc's row is in Current Initiatives.

**Artifact:** `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-discovery.md`, from `templates/arc-discovery.md`. It opens with the arc's Design Spec. Its decisions (`ACD-1`, `ACD-2`) apply to the whole arc, each tagged as carried in or ratified here, and its Open Questions are routed to Arc-Plan or to a specific initiative.

**Session ends when:** the arc-discovery doc is written, Robert has signed off, and it is committed on `feature/<arc-name>`. Do not begin Arc-Plan in the same session.

## Arc-Plan (1 session)

**Goal:** define the initiatives that make up the arc, in what order, with what boundaries.

**Start:** `/gestalt:arc-plan <A.ID>`, once the arc-discovery is signed off.

**Artifact:** `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-plan.md`, from `templates/arc-plan.md`. Contains:

- **Design Spec — carried by** — each success criterion, cited by number, and the initiative that carries it.
- **Decisions ratified in Arc-Plan** — numbered `AP-1`, `AP-2`, with the rejected alternatives.
- **Initiative list** — ordered, with dependencies surfaced (a DAG, not necessarily a flat sequence — some entries can parallelize). A new initiative takes `<arc-ID>.<n>` in run order; one that existed before the arc keeps its ID.
- **Per-initiative boundary** — what is in scope for each initiative, what is punted to a later entry.
- **Open Question routing** — each open question from Arc-Discovery assigned to a specific initiative.
- **Cross-arc dependencies** — anything outside the arc that gates an initiative: prerequisites in other layers, data, tooling.
- **Out-of-arc deferrals** — explicit list of work the arc does not address.
- **Tracker rows** — the rows the session writes, and **What comes next**.

**Session ends when:** two stops have passed. At the first, Robert signs off the arc-plan and approves the tracker rows; the skill adds each initiative as a Backlog or Up Next row that links the arc-plan, and commits. The arc's own row is not edited (lifecycle.md, Stage 3). At the second, Robert approves the merge, and the skill merges `feature/<arc-name>` into `main`. Arc-plan is the one session starter that merges.

## Initiatives within the arc

Each initiative listed in the Arc-Plan goes through the standard lifecycle from lifecycle.md and the per-Type flow from lifecycle.md, Routing by type.

The arc-level artifacts make per-initiative Discovery and Plan *lighter*, not absent. Per-initiative Discovery does not re-litigate decisions already ratified at the arc level — it focuses on initiative-specific decisions (scope, internal slicing, the open questions Arc-Plan routed to this initiative, the success criteria it carries). Per-initiative Plan inherits the arc's boundary for the initiative. "Lighter" never means short or skeletal: the per-initiative discovery doc is written to full Discovery quality, substantive enough that the Plan can be derived from it, and skips only the sections the arc-discovery already covers.

## Arc completion

Each initiative closes like any other, with `/gestalt:initiative-close <ID>`. The final one leaves the arc's own artifacts and the arc's row in place. Then a new session closes the arc with `/gestalt:arc-close <arc-ID>`: a review of the seams between the initiatives and of drift from the arc-discovery decisions, one fix commit on `feature/<arc-name>-close`, and an arc retro built on the initiative retros that checks every success criterion. Its close-out removes the arc's row from Current Initiatives (lifecycle.md), moves the arc's seed from `seeds/` and the arc artifacts (arc-discovery, arc-plan, arc retro, and an old arc's concept doc) from `arcs/<ID>-<arc-name>/` into `_completed/arcs/<ID>-<arc-name>/`, next to the `initiatives/` folder, and removes the empty arc folder (session-discipline.md, File locations). The arc is complete when the close branch merges.
```

##### Task 2 — `plugins/gestalt/skills/session-modes/lifecycle.md`

Two edits (decisions 4 and 86). The arc's Concept:

**Find:**
```
**Arcs are the exception:** an arc's Concept is a standalone doc at `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-concept.md` (template in `templates/`), because it outlives the planned-work entry and anchors the arc's folder. The arc's planned-work write-up reduces to a pointer at that doc.
```
**Replace with:**
```
**Arcs:** an arc's Concept is always its seed, planted as an arc (arcs.md, The seed); an arc cannot start without one. Its write-up is the pointer above. An arc from before seeds keeps its concept doc in its arc folder.
```

**Find:**
```
The write-up (or arc concept doc) is drafted at promotion time, not in advance.
```
**Replace with:**
```
The write-up is drafted at promotion time, not in advance; for seeded work it is the pointer to the seed.
```

##### Task 3 — `plugins/gestalt/skills/session-modes/session-discipline.md`

Three edits. The arc folder (decision 86):

**Find:**
```
- **Arc artifacts** — `dev_journals/initiatives/arcs/<ID>-<arc-name>/` holds `<ID>-<arc-name>-arc-concept.md`, `-arc-discovery.md`, and `-arc-plan.md` while the arc is active, and `-arc-retro.md` once `/gestalt:arc-close` writes it
```
**Replace with:**
```
- **Arc artifacts** — `dev_journals/initiatives/arcs/<ID>-<arc-name>/` holds `<ID>-<arc-name>-arc-discovery.md` and `-arc-plan.md` while the arc is active, and `-arc-retro.md` once `/gestalt:arc-close` writes it. The arc's seed stays in `seeds/`. An arc from before seeds has `-arc-concept.md` in the folder in place of the seed
```

The arc's seed among the files the arc close moves (decision 18):

**Find:**
```
  - Arc — when the arc closes, with `/gestalt:arc-close`, its artifacts move into
```
**Replace with:**
```
  - Arc — when the arc closes, with `/gestalt:arc-close`, its seed and its artifacts move into
```

The In Plain Words layers (the swap only; effort 5 rewrites the section):

**Find:**
```
The layers are the arc concept, arc-discovery, arc-plan,
```
**Replace with:**
```
The layers are the seed, arc-discovery, arc-plan,
```

##### Task 4 — `plugins/gestalt/skills/session-modes/SKILL.md` and the arc-concept template

Two edits, and one file removed. The arc row of the second routing table (decisions 4 and 29):

**Find:**
```
| **Arc** | Standalone doc in `dev_journals/initiatives/arcs/<ID>-<arc-name>/` | Arc-Discovery, always | Arc-Plan: initiative slicing and DAG | N initiatives, each running its own flow |
```
**Replace with:**
```
| **Arc** | Its seed, planted as an arc | Arc-Discovery, always, on `feature/<arc-name>` | Arc-Plan: initiative slicing and DAG; merges the arc branch | N initiatives, each running its own flow |
```

The templates table:

**Find:**
```
| Arc concept | `arc-concept.md` | `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-concept.md` |
```
**Replace with:**
```
| Arc-discovery | `arc-discovery.md` | `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-discovery.md` |
| Arc-plan | `arc-plan.md` | `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-plan.md` |
```

Remove the template (discovery doc, Replaces / Retires):

```sh
git rm plugins/gestalt/skills/session-modes/templates/arc-concept.md
```

##### Task 5 — `plugins/gestalt/skills/style-guide/SKILL.md`

The arc artifacts as document types.

**Find:**
```
**Arc Artifacts** (`dev_journals/initiatives/arcs/<ID>-<arc-name>/`) — the arc concept, arc-discovery, arc-plan and, at the end, the arc retro, co-located in the arc's folder. They move to `dev_journals/initiatives/_completed/arcs/<ID>-<arc-name>/` when the arc closes, with `/gestalt:arc-close`.
```
**Replace with:**
```
**Arc Artifacts** (`dev_journals/initiatives/arcs/<ID>-<arc-name>/`) — the arc-discovery, arc-plan and, at the end, the arc retro, co-located in the arc's folder. Run with `/gestalt:arc-discovery` and `/gestalt:arc-plan`; templates `templates/arc-discovery.md` and `templates/arc-plan.md` in the session-modes skill. The arc-discovery holds the arc's Design Spec. The arc's seed, its Concept, stays in `seeds/`. All of them move to `dev_journals/initiatives/_completed/arcs/<ID>-<arc-name>/` when the arc closes, with `/gestalt:arc-close`.
```

##### Commit message

```
docs(E4): put the seed in place of the arc concept in the arc flow

- arcs.md: the seed as the arc's Concept, the arc branch, the success
  criteria chain, the two new skills and their templates
- lifecycle, session-discipline: the seed in place of the concept doc,
  with the old concept doc kept for arcs from before seeds
- session-modes SKILL.md: the arc routing row and the two template rows
- templates/arc-concept.md removed
- style guide: the arc artifacts and their skills
```

#### Commit 4 — `docs(E4): name the arc stages in the rules and the skills that read an arc`

##### Task 1 — `plugins/gestalt/rules/code-and-docs.md`

Two edits. In Session modes, name the skills:

**Find:**
```
each is one session with three stops.
```
**Replace with:**
```
each is one session with three stops. Start an arc with `/gestalt:arc-discovery <A.ID>`, then `/gestalt:arc-plan <A.ID>`, which merges the arc's branch.
```

The session table (decision 94):

**Find:**
```
| Exploration or audit | The doc is signed off and committed; an exploration's follow-on rows are filed. |
```
**Replace with:**
```
| Exploration or audit | The doc is signed off and committed; an exploration's follow-on rows are filed. |
| Arc-discovery or arc-plan | The doc is signed off and committed on `feature/<arc-name>`; an arc-plan's tracker rows are written and the branch is merged. |
```

##### Task 2 — `plugins/gestalt/rules/git-and-delivery.md`

The arc branch (decisions 29 and 85).

**Find:**
```
- An exploration is exempt too. `/gestalt:explore` makes one unscoped `docs:` commit, at the end, on the branch the session stands on, `main` included. A refactor's audit is not exempt: it is the refactor's first session and runs on its branch.
```
**Replace with:**
```
- An exploration is exempt too. `/gestalt:explore` makes one unscoped `docs:` commit, at the end, on the branch the session stands on, `main` included. A refactor's audit is not exempt: it is the refactor's first session and runs on its branch.
- An arc's own sessions run on `feature/<arc-name>`, which `/gestalt:arc-discovery` cuts. `/gestalt:arc-plan` merges it into `main` with `--no-ff` once the arc-plan is signed off, with no code review and no tag, so the arc's decisions are on `main` before any of its initiatives cuts a branch.
```

##### Task 3 — `plugins/gestalt/skills/discovery/SKILL.md`

Two edits. A bare arc ID names the arc skill:

**Find:**
```
or `/gestalt:plan $0` when it can be stated in a paragraph (`refactor-flow.md`).
```
**Replace with:**
```
or `/gestalt:plan $0` when it can be stated in a paragraph (`refactor-flow.md`).

If `$0` is a bare arc ID (`A.` and three digits, such as `A.001`), say that an arc's Discovery is its arc-discovery, name `/gestalt:arc-discovery $0` and stop. An initiative inside an arc (`A.001.4`) runs here as usual.
```

Step 4 reads the arc's seed (decision 86):

**Find:**
```
4. If the initiative is inside an arc, read the arc's concept, arc-discovery and arc-plan under `dev_journals/initiatives/arcs/`: In Plain Words first, then the decisions and the open questions routed to this initiative.
```
**Replace with:**
```
4. If the initiative is inside an arc, read the arc's seed, `dev_journals/initiatives/seeds/<arc-ID>-*-seed.md`, and its arc-discovery and arc-plan under `dev_journals/initiatives/arcs/` (an arc from before seeds has its concept doc there in place of the seed): In Plain Words first, then the decisions, the success criteria the arc-plan gives this initiative, and the open questions routed to it.
```

##### Task 4 — `plugins/gestalt/skills/plan/SKILL.md`

A bare arc ID names the arc skill.

**Find:**
```
With `.E<n>`, the session writes `$0-<initiative-name>-plan.md`.
```
**Replace with:**
```
With `.E<n>`, the session writes `$0-<initiative-name>-plan.md`. If `<ID>` is a bare arc ID (`A.` and three digits, such as `A.001`), name `/gestalt:arc-plan <ID>` and stop.
```

##### Task 5 — `plugins/gestalt/skills/initiative-close/SKILL.md`

Step 1 reads the arc's seed (decision 86).

**Find:**
```
For an arc initiative, read the arc concept, arc-discovery and arc-plan under `dev_journals/initiatives/arcs/`.
```
**Replace with:**
```
For an arc initiative, read the arc's seed (`dev_journals/initiatives/seeds/<arc-ID>-*-seed.md`; an arc from before seeds has its concept doc in the arc folder instead), and the arc-discovery and arc-plan under `dev_journals/initiatives/arcs/`.
```

##### Task 6 — `plugins/gestalt/skills/arc-close/SKILL.md`

Five edits. Step 1 reads the seed (decision 86):

**Find:**
```
and the arc concept, arc-discovery and arc-plan in the arc folder, In Plain Words first.
```
**Replace with:**
```
the arc's seed, `dev_journals/initiatives/seeds/$0-*-seed.md` (an arc from before seeds has its concept doc in the arc folder instead), and the arc-discovery and arc-plan in the arc folder, In Plain Words first.
```

Step 3 gives the reviewer the seed:

**Find:**
```
Then it gives the arc folder, the completed folder, and one line per initiative
```
**Replace with:**
```
Then it gives the arc's seed, the arc folder, the completed folder, and one line per initiative
```

Step 4 holds the arc against its criteria (decision 30):

**Find:**
```
hold the arc against its concept and arc-plan,
```
**Replace with:**
```
hold the arc against each success criterion of the arc-discovery's Design Spec and against the arc-plan,
```

Step 7 checks the whole list (decision 30):

**Find:**
```
Show the retro's In Plain Words, each answer in short, the rating table and the verdict.
```
**Replace with:**
```
Show the retro's In Plain Words, each answer in short, every success criterion marked met or not met with one line of evidence, the rating table and the verdict.
```

Step 8 moves the seed (overview plan, Decision Record, entry 4):

**Find:**
```
   - Move every file in the arc folder (the concept, arc-discovery, arc-plan and arc retro) with `git mv` into the completed folder, next to `initiatives/`. Remove the empty arc folder.
```
**Replace with:**
```
   - Move the arc's seed, `dev_journals/initiatives/seeds/$0-*-seed.md`, and every file in the arc folder (the arc-discovery, arc-plan and arc retro, and an old arc's concept doc) with `git mv` into the completed folder, next to `initiatives/`. Remove the empty arc folder.
```

##### Task 7 — `plugins/gestalt/skills/arc-close/review-brief.md`

**Find:**
```
- the arc folder, with the arc concept, arc-discovery and arc-plan
```
**Replace with:**
```
- the arc's seed, and the arc folder with the arc-discovery and arc-plan (an arc from before seeds has its concept doc there in place of the seed)
```

##### Task 8 — `plugins/gestalt/skills/session-modes/templates/retro.md` and the overview plan

Question 1 of an arc retro (decision 30; effort 5 does the rest of the retro):

**Find:**
```
Hold the shipped work against the discovery doc's In Plain Words and Design
Summary (an arc: the arc concept and arc-plan). Name what landed, what was cut
or deferred, and what was added that was not planned.
```
**Replace with:**
```
Hold the shipped work against the discovery doc's In Plain Words and Design
Summary (an arc: each success criterion of the arc-discovery's Design Spec,
one by one, and the arc-plan). Name what landed, what was cut or deferred, and
what was added that was not planned.
```

In `dev_journals/initiatives/implementation/F.008-skills-expansion-overview-plan.md`, mark the Decision Record's entry 4 as landed.

**Find:**
```
it makes `arc-close` move `seeds/<arc-ID>-*-seed.md` with the arc's files.
```
**Replace with:**
```
it makes `arc-close` move `seeds/<arc-ID>-*-seed.md` with the arc's files. Landed in the E4 plan, Commit 4.
```

##### Commit message

```
docs(E4): name the arc stages in the rules and the skills that read an arc

- code-and-docs: /gestalt:arc-discovery and /gestalt:arc-plan in
  Session modes and the session table
- git-and-delivery: the arc branch, merged at arc-plan sign-off
- discovery and plan stop on a bare arc ID and name the arc skill
- discovery, initiative-close, arc-close and the review brief read the
  arc's seed, or an old arc's concept doc
- arc-close moves the arc's seed and checks every success criterion;
  the retro's question 1 holds an arc against them
```

The phase's box in the Overview list is ticked in this commit.

### Phase 3 — The catalogue

**In plain words:** one file lists every skill, flow file, template and hook gestalt has, which kind of work each one serves, and the holes still open. After this phase a process review reads one file to see what exists and what is missing.

#### Commit 5 — `feat(E4): add the skills catalogue`

##### Task 1 — `plugins/gestalt/skills/session-modes/catalogue.md` (new, named deliverable)

**Carries out:** decisions 10, 11, 12 and 95.

A reference file in the register of `session-discipline.md`. Every row is read from `plugins/gestalt/` as it stands in this commit, not carried from the discovery doc's Catalogue Findings. It must hold, in this order:

1. **Title and opening** — `# Catalogue`. What gestalt has and the holes it still has. Read in a process review, or before a new skill is designed; no session loads it by default (decision 11). It is updated in the same commit that adds or removes a skill, a flow file or a template, or changes who starts a skill (decision 95)
2. **Skills** — a table, one row per skill under `skills/`: Skill, Group (Starter, Close, Upkeep or Reference), Started by (Claude or Robert, or Robert only, from the `disable-model-invocation` flag), Command, and what it does in one line. Eighteen rows, from `adopt` to `style-guide`
3. **Around the skills** — the flow files and the templates in `skills/session-modes/`, the SessionStart hooks in `hooks/hooks.json` with their scripts, and the briefs beside a skill (`arc-close/review-brief.md`, and the coordinator's brief). One line each
4. **Coverage** — a table `Work | Written process | Template | Skill`, one row per kind of work: seed, exploration, refactor audit, arc-discovery, arc-plan, arc close, feature, refactor, non-trivial bugfix, trivial bugfix or chore or single-session docs, multi-effort docs, an effort's phases under a coordinator, effort close, execution hand-off, tracker moves
5. **Known holes** — each hole marked `(planned)`, with what the source shows (decisions 10 and 12): the hand-off writer, `execute` for a docs plan, the light bugfix plan, the refactor plan shape, tracker moves. Each one is checked against the source first; a hole that is filled is left out and named in the commit message. A hole gets a tracker row only on the day Robert chooses to fill it

##### Task 2 — `plugins/gestalt/skills/session-modes/SKILL.md`

The which-file row (decision 11).

**Find:**
```
| An arc (`A.`) or an initiative inside one | `arcs.md` |
```
**Replace with:**
```
| An arc (`A.`) or an initiative inside one | `arcs.md` |
| A process review, or a new skill: what gestalt has and its holes | `catalogue.md` |
```

##### Task 3 — `dev_journals/initiatives/implementation/F.008-skills-expansion-overview-plan.md`

Tick effort 4's Done box in the Effort Summary.

**Find:**
```
| [ ] | 4 | Arc stages and catalogue |
```
**Replace with:**
```
| [x] | 4 | Arc stages and catalogue |
```

##### Commit message

```
feat(E4): add the skills catalogue

- session-modes/catalogue.md: every skill with who starts it, the flow
  files, templates, hooks and briefs, the coverage by kind of work, and
  the known holes marked (planned)
- session-modes SKILL.md: the catalogue in "Which file to read"
- overview plan: effort 4 is done
```

The phase's box in the Overview list is ticked in this commit. The wrap-up names the next step: `/gestalt:effort-close F.008.E4`, in this same session (overview plan, Decision Record, entry 2).

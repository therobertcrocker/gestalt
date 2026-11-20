# Skills Expansion — Discovery

## In Plain Words

- **What** — gestalt gets skills and written process for the kinds of work that have none today: seeds (a first idea on paper), explorations (a look at options before any commitment) and the two early arc stages (arc-discovery and arc-plan). A refactor now starts with an audit, which is an exploration under the refactor's own ID. gestalt also gets a coordinator skill that runs the phases of an effort in sub-agents, and a catalogue of the skills it has and still needs.
- **Why** — seeds and explorations exist in two projects but the rules say their process is "not defined yet". The session skills scaffold feature templates, which is wrong for an arc. A Claude session cannot start the session skills itself, so it cannot hand a phase to a sub-agent through them.
- **How it fits** — one multi-effort feature on `feature/skills-expansion`, with this one discovery doc for all fronts. It takes in `F.006`. When it ships, every stage of work from a first idea to an arc close starts from a skill, and `one-claude` can run as an arc on skills made for arcs.

## Problem

From the tracker write-up (2026-11-20). The claims about the plugin are checked against `plugins/gestalt/` (Catalogue Findings below). The claims about the seeds, the explorations and the experiment are checked as each front is worked.

- **Seeds and explorations** — the rules name both as "process not defined yet". Four seeds and four explorations exist across gestalt and gm-toolkit, each written with no template and no skill.
- **Arc stages** — an arc has a close skill only. `/gestalt:discovery` and `/gestalt:plan` scaffold the feature templates in the feature folders, which is wrong for an arc. Arc-discovery and arc-plan have no templates.
- **Sub-agents** — the session and close skills can be started only by a command Robert types. A Claude session cannot hand a phase to a sub-agent through them. The gm-toolkit coordinator experiment (`F.041.E4`, 2026-11-19 to 2026-11-20) worked around this with hand-written briefs and scored 20 of 25.
- **Catalogue** — no list shows which skills exist and which are missing.

## Architecture Context

gestalt has no architecture wiki. The binding context is:

- The three rules files in `plugins/gestalt/rules/`
- The session-modes skill in `plugins/gestalt/skills/session-modes/`
- The nine decisions in "Decisions Made Before Discovery" below

## Design Summary

One multi-effort initiative with five fronts. The Plan session slices them into efforts. Each front has a sub-section below; the decisions are numbered in the two decision tables after them.

What F.008 adds:

| Kind | New |
|---|---|
| Skills | `seed`, `explore`, `audit`, `arc-discovery`, `arc-plan`, `coordinate` |
| Flow files | `exploration-flow.md`, `catalogue.md` |
| Templates | `seed.md`, `exploration.md`, `arc-discovery.md`, `arc-plan.md`, and the coordinator's brief |
| Hooks | A SessionStart hook that lists the seeds |

What F.008 changes:

- **The refactor flow** — Audit, Plan, Execution; a refactor has no Discovery
- **The arc flow** — the seed takes the place of the arc concept; arc-level sessions get a branch and success criteria
- **Who starts a skill** — starters are open to Claude; closes and upkeep skills stay hand-only
- **Existing skills** — `discovery`, `plan` and `execute` lose the hand-only flag and learn the seed, the audit and the arc case; the three closes learn to move a seed and an audit; `effort-close` and `arc-close` gain review inputs
- **The plan template** — a source check for every outside rule a plan builds
- **The rules files** — the "not defined yet" line, the branch rule's exemptions and the model rule

How a piece of work now starts, by kind:

```
an idea             /gestalt:seed write    -> seed
                    /gestalt:seed plant    -> tracker row
a question          /gestalt:explore       -> exploration -> follow-on rows
a refactor          /gestalt:audit         -> audit -> plan -> execution
an arc              /gestalt:arc-discovery -> /gestalt:arc-plan -> initiatives
a feature           /gestalt:discovery     -> plan -> execution   (as today)
an effort's phases  /gestalt:coordinate    -> one sub-agent per phase
```

### Catalogue

The catalogue is one file in the plugin, `skills/session-modes/catalogue.md`, so every project on gestalt gets it. It holds the skill inventory and the coverage table from Catalogue Findings, brought up to date with what the other fronts add, and the known holes marked `(planned)`. `session-modes/SKILL.md` points to it from "Which file to read"; no session loads it by default.

### Seeds

A seed has two jobs (decision 13). It hands a conversation over to the session that picks the work up. It is also a standing notice: it tells the sessions that run before the work starts what is coming and what not to build against. Every seed carries the notice, so the template has a "Read this first" block with the practical effect on today's work.

A SessionStart hook gives the notice its reach (decision 14). It lists the seeds by name in every session, the same way the existing hook lists the architecture pages, so an Execution session hears of a seed although it never opens the tracker. The session opens the seed that matches its work. The hook finds seeds in both layouts, single-product and multi-product.

One template serves every seed (decision 15). It has two parts:

- **Frame** — the header (type if known, status, source, date and commit written against, the tracker row once planted), what a seed is, "Read this first", decisions already made, open questions, and what to do if the seed is planted
- **Body** — In Plain Words, Problem, what is coming and where it touches the repo, for every seed; Vision, Why an Arc and Candidate Initiatives, for an arc only. An arc's seed may also propose Success Criteria (decision 30)

The type is chosen at planting, not at writing. A seed planted as an arc must have the three arc-only sections filled, because arc-discovery reads them in place of the arc concept (decision 4); the plant job checks this.

A seed is the Concept of the work it describes (decision 16). `lifecycle.md` already lets an arc's write-up shrink to a pointer at its concept doc; that rule widens to every seeded initiative. The write-up of seeded work holds the pointer, Trigger and Status, which are queue facts that change while the seed does not. Work with no seed keeps the full write-up. `discovery` and `plan` read the seed where they read the write-up today.

An unplanted seed has no ID, so its file is `<name>-seed.md`. Planting gives the work an ID, and the plant job renames the file to `<ID>-<name>-seed.md` with `git mv` (decision 17). From then on the file-name rule in `session-discipline.md` holds for seeds with no exception, and the hook's list shows which seeds are planted. The plant job searches the repo for the old name and fixes each link in the same edit.

The life of a seed:

```
written          <name>-seed.md in seeds/; the hook lists it
planted          renamed <ID>-<name>-seed.md; still in seeds/, beside its row
promoted         the write-up points at it; Discovery reads it
work runs        still listed, so sessions on other work hear of it
closed           moved to _completed/ with the initiative; the notice stops
```

The close moves the seed (decision 18). `initiative-close` adds it to the files it moves, found by ID. `arc-close` moves an arc's seed where it moves the arc concept today. The hook lists only what is in `seeds/`, so the notice stops at the merge with no rule of its own. A seed that is never planted is deleted by hand; it has no process.

The write job has two sources (decision 19): the conversation of the session it runs in, or a draft written in claude.ai chat and handed to the session. Chat has no skill and cannot see the repo, so a chat draft is raw material. The session reads the draft, reads the code the idea touches, and writes the parts only a session can: "Read this first" with the practical effect on today's work, and the commit the seed is written against. If the `one-claude` arc later lets chat read the template from the live source, this is looked at again there.

The skill is `/gestalt:seed`, with the job as its first argument: `write <name>` and `plant <name>` (decisions 2 and 20). Claude can start it, so "seed this" in plain words works in the middle of a session. The plant job stops for Robert, who gives the type and the ID; it cannot finish without them. Its steps: check the arc-only sections if the type is an arc, add the Backlog row with a link to the seed, rename the file, fix the links, and put the row in the seed's header.

Seeds are exempt from the branch rule, as explorations are (decisions 6 and 21). Each job commits on the branch the session stands on, `main` included, in one `docs:` commit of its own, as soon as Robert approves the result; a seed that waits is swept into the next feature commit by `git add -A`. Two effects are accepted:

- A seed written on a feature branch is heard only on that branch until the merge
- An unscoped seed commit in the middle of an effort trips the unbroken-run check in `effort-close` step 3, which stops and shows it; Robert says it stays

### Explorations

An exploration looks at a part of the system, or at something outside it, weighs options and files each follow-on as its own row. Decisions 6 to 9 fix its frame: always an `E.` ID, one session with two stops, exempt from the branch rule, and a doc that stays in `explorations/` while its row leaves the tracker once the follow-on rows are filed.

The template takes the shape all four docs share: Header, In Plain Words, Questions, Current State, Existing Patterns, Options, Recommendation, Follow-on Rows (Exploration Findings, Doc shape). Its details (decision 22): In Plain Words is drafted after the audit and rewritten last; the Terms block is optional; facts found while the options are written have no section of their own.

The flow of the one session, from what the findings log says worked:

1. Ask Robert for the deciding criterion, before the audit
2. Audit: write Current State and Existing Patterns, with a short update between audit steps
3. Check every number in the doc against the source
4. **Stop:** Robert reviews the audit
5. Write Options and the Recommendation; the doc says its rows are proposed
6. **Stop:** a spot check of what was left out, with every item put to Robert, then his sign-off
7. File the follow-on rows in the tracker and remove the exploration's row; a doc that waits on the answer is not edited, its tracker row carries the answer

An exploration does not replace a Discovery (decision 23). It answers "which way?"; a Discovery answers "what exactly?". What comes after is decided by the flow of each follow-on row: a feature gets its Discovery, and a refactor whose target shape is now chosen goes straight to Plan, as `refactor-flow.md` already allows. A Discovery that follows an exploration reads it first and skips the audit and the choice of direction, the way an arc initiative's Discovery skips what the arc-discovery settled: lighter, never skeletal. "How it lands" in the Recommendation names the next mode for each follow-on row.

The refactor flow changes shape (decision 24). Today `refactor-flow.md` reads Discovery, Plan, Execution, with a Discovery that is "often skippable" and audit-first when it fires. It becomes Audit, Plan, Execution, and the Audit is an exploration: the same template, the same session and the same two stops. A refactor has no Discovery. The routing table in `session-modes/SKILL.md` and the audit-first wording in `refactor-flow.md` change with it, and the Audit Findings section of `templates/discovery.md` loses its user.

Which came first decides the name and the ID (decision 25):

```
a question, no row yet    -> exploration, its own E. row -> files follow-on rows
                             (a refactor may be one of them: E.004 -> R.028)
an existing refactor row  -> Audit, under the R. ID      -> that refactor's Plan
                             (R.029)
```

The two run the same way: the same template, the same seven steps, the same two stops. They differ in the ID and in what comes after.

Two skills start them (decision 26), so neither has to ask which one it is:

| Edge | `/gestalt:explore <E.ID>` | `/gestalt:audit <R.ID>` |
|---|---|---|
| Start | An `E.` row in the Explorations table | A refactor row that is in progress |
| Branch | Exempt; may run on `main` (decision 6) | The refactor's branch, cut when its work starts |
| Middle | The shared flow file and template | The same |
| End | Files the follow-on rows and removes its own row | Files nothing; names the refactor's Plan as the next step |

The shared middle sits in one flow file in `skills/session-modes/`, the way `discovery`, `plan` and `execute` share `session-discipline.md`.

The two docs sit in one folder and end in different places (decisions 7 and 27):

| Doc | File | At the close |
|---|---|---|
| Exploration | `explorations/<E.ID>-<name>-exploration.md` | Stays in `explorations/` |
| Audit | `explorations/<R.ID>-<name>-audit.md` | `initiative-close` moves it to `_completed/<R.ID>-<name>/` with the plan and the retro |

`plan` reads the audit where it reads the discovery doc for a feature. The audit's folder is a "for now" call; Robert may move it.

Claude can start both skills (decision 28). Each has two stops that need Robert, so the hand-only flag would guard nothing more. With decision 5 this gives the plugin one rule:

| Group | Skills | Started by |
|---|---|---|
| Starters | `discovery`, `plan`, `execute`, `explore`, `audit`, `seed`, `arc-discovery`, `arc-plan`, `coordinate` | Claude or Robert |
| Closes | `effort-close`, `initiative-close`, `arc-close` | Robert only |
| Upkeep | `adopt`, `graduate` | Robert only |

What follows from the decisions above, with no choice left in it:

- The shared middle is a new flow file, `skills/session-modes/exploration-flow.md`
- The template is `skills/session-modes/templates/exploration.md`
- `lifecycle.md` gains the `E.` prefix and the Explorations table that gestalt's tracker already has
- `refactor-flow.md` is rewritten as Audit, Plan, Execution
- An exploration has no write-up and no promotion step; its row in the Explorations table is enough
- The two "not defined yet" lines, in `rules/code-and-docs.md` and `session-discipline.md`, are replaced by pointers to the seed and exploration process

### Arc stages

Two new skills, `/gestalt:arc-discovery <A.ID>` and `/gestalt:arc-plan <A.ID>`, named like `arc-close`. Claude can start both (decision 28). Each has its own template, taken from the shape the `A.001` and `A.004` docs share (Arc Findings).

What follows from earlier decisions:

- The seed is the arc's concept (decision 4). `arc-discovery` reads it, and stops and names `/gestalt:seed write` when there is none
- `templates/arc-concept.md` is removed, and the eleven files that name the arc concept are changed to name the seed
- `discovery` and `plan`, given a bare arc ID, name the arc skill and stop

Both arc sessions run on `feature/<arc-name>` (decision 29). A seed and an exploration bind nobody, so they may land where the session stands. An arc-discovery binds every initiative in the arc, and each of those cuts its branch from `main`; the arc's decisions must be on `main` before the first one starts. The branch merges with `--no-ff` once the arc-plan is signed off. It changes docs only, so the merge has no code review and no tag. `arc-close` keeps its own branch, `feature/<arc-name>-close`.

Success criteria run as a chain through the arc's docs (decision 30):

| Doc | Its job |
|---|---|
| Seed | May propose criteria; an arc-only section, not required |
| Arc-discovery | Ratifies them, in a required Success Criteria section, before the cross-cutting decisions are written |
| Arc-plan | Gives each criterion the initiative that carries it |
| `arc-close` | Checks the whole list, and the arc retro's first question is held against it |

The templates carry Robert's rule: a criterion is a question he can ask of the finished work, with the answer that means success; not a count or a limit.

The two templates:

- **Arc-discovery** — header (status, inputs), In Plain Words, Problem, Architecture Context, Success Criteria, Design Summary, the arc decisions (a numbered table, each tagged "carried in" or "ratified here"), free sections for the arc's own design, Open Questions (each routed to Arc-Plan or to an initiative), Out of Scope, and Reconciliation Items when the session found doc drift
- **Arc-plan** — header, In Plain Words, Success Criteria with a "carried by" column, Decisions Ratified in Arc-Plan, Initiative List with its dependency diagram, Per-Initiative Boundary, Open Question Routing, Cross-Arc Dependencies, Out-of-Arc Deferrals, Tracker Rows, What Comes Next

The arc-plan session ends with three acts, each Robert's call, behind two stops (decision 31):

1. **Stop:** Robert signs off the arc-plan and approves the tracker rows for the arc's initiatives; the skill writes the rows and commits
2. **Stop:** Robert approves the merge; the skill merges `feature/<arc-name>` into `main` with `--no-ff`

`arc-plan` is the one starter that merges. A merge left for Robert to remember would, when forgotten, leave the arc's decisions off `main`, which is the failure the branch exists to prevent.

### Sub-agents

A coordinator skill runs the phases of one effort in sub-agents, with the loop the experiment used (Coordinator Findings, The run). The hand-only flag comes off `discovery`, `plan` and `execute` (decision 5), which the docs say is what lets a sub-agent call them; their descriptions are reworded, because Claude can then start them too.

F.008 takes eight of the retro's follow-ups (decision 32). Where each one lands:

| # | Follow-up | Lands in |
|---|---|---|
| 1 | Source check: every outside rule a plan builds carries a quote and a link, fetched in the Plan session | `templates/implementation-plan.md` and the `plan` skill |
| 2 | The coordinator skill | A new skill |
| 3 | The fixed, numbered report | The coordinator's brief; a normal Execution session does not get it |
| 4 | "Look here first": the last phase's agent lists the effort's weakest spots | The coordinator's brief for the last phase, and a line in `effort-close` that reads the list |
| 6 | Rules for the coordinator: no edit to a doc an agent is editing; nothing written to disk while an agent runs; a quote before a conclusion | The coordinator skill |
| 7 | A two-stage phase: the agent stops without committing when Robert must act, and is resumed after | One sentence in the coordinator skill |
| 9 | The Decision Record's known-gap entries, by number, in the reviewer's prompt | The review step of `effort-close` |
| 10 | The coordinator's own commits land before the effort's first commit or after its close | The coordinator skill |

Follow-ups 4 and 9 are the only changes F.008 makes to `effort-close`. Follow-up 5, the checks as a script, is left: the skill lists the commands and the coordinator runs them.

Fable coordinates and Opus executes (decision 33), the one set-up with a run behind it. The model rule gains a line for the coordinator. Every spawn names the agent's model, and the coordinator confirms it after the run.

What follows from the experiment and the decisions above, with no choice left in it:

- **Name** — `/gestalt:coordinate <ID>.E<n>`, or `<ID>` for a single-effort plan. It is a starter, so Claude or Robert can start it (decision 28)
- **Scope** — one run is one effort. The effort boundary is already a new session, `/gestalt:effort-close`
- **The loop** — as the experiment ran it. The review comes after the agent's commits, and the fixes are one commit per phase with the effort's scope, because Robert wants review fixes to stay visible
- **The agent** — one agent per phase; the same agent, resumed, makes the fix
- **The brief** — a template file beside the skill, as `arc-close` keeps its review brief. It starts from Appendix B of the retro, with the Phase 6 additions. Where the brief repeats what `execute` already says, it tells the agent to run `/gestalt:execute <address>` in place of the repeated text, if the trial in Open Questions shows a sub-agent can
- **"Look here first"** — the last phase's agent writes the list into the effort's plan, in that phase's last commit, so `effort-close` finds it on disk in its own later session
- **After a compaction** — the coordinator rebuilds "what the earlier phases left" from `git log` and the plan's Decision Record, not from its summary

## Decisions Made Before Discovery

Robert, 2026-11-20, from the tracker write-up.

| # | Question | Decision |
|---|---|---|
| 1 | Container | One initiative with one discovery doc and the fronts as efforts; `F.006` folds in |
| 2 | Seed skill | Two jobs: write a seed, and plant it as a tracker row |
| 3 | Seed and row | The seed stays beside its row after planting |
| 4 | Arc concept | The seed replaces the arc concept; arc-discovery reads the seed |
| 5 | Sub-agents | A coordinator skill, and the hand-only flag comes off `discovery`, `plan` and `execute`; the three close skills stay hand-only |
| 6 | Exploration branch | Exempt from the branch rule; an exploration may commit on `main` |
| 7 | Exploration close-out | The doc stays in `explorations/`; the tracker row is removed once the follow-on rows are filed |
| 8 | Exploration sessions | One session with two stops: a review after the audit, and a spot check before sign-off |
| 9 | Exploration ID | Always an `E.` ID, also when the exploration serves one initiative |

## Decisions Made in Discovery

Numbers continue from the table above.

| # | Question | Decision |
|---|---|---|
| 10 | Catalogue scope | The catalogue lists the gaps outside the five fronts as known holes, next to the skills the fronts add; F.008 does not fill them |
| 11 | Catalogue home | A new file, `plugins/gestalt/skills/session-modes/catalogue.md`, with a row in the "Which file to read" table of `session-modes/SKILL.md`; a session reads it only when it needs it |
| 12 | Holes and the tracker | A hole lives in the catalogue only, marked `(planned)`; it gets a tracker row on the day Robert chooses to fill it |
| 13 | What a seed is for | Two jobs, both part of every seed: it hands a conversation over to a later session, and it is a standing notice that tells the repo something is coming |
| 14 | How sessions hear of seeds | A SessionStart hook lists the seeds by name, with one line that says to read a seed's "Read this first" before work that touches its area; it does not print the seed's content |
| 15 | Seed template | One template: a frame for every seed, then a body in which Vision, Why an Arc and Candidate Initiatives are marked arc-only; a seed need not know its type when it is written |
| 16 | Seed and write-up | When a promoted initiative has a seed, its tracker write-up is a pointer to the seed plus Trigger and Status; with no seed, the full write-up stays as `lifecycle.md` has it |
| 17 | Seed file name | `<name>-seed.md` until planting; the plant job renames it to `<ID>-<name>-seed.md` and fixes every link to the old name |
| 18 | Seed at the close | The close moves the seed into `_completed/` with the initiative's other files; `arc-close` moves an arc's seed where it moves the concept today. The notice stops at the merge, not at promotion |
| 19 | Seeds from chat | The write job takes two sources: the conversation of the session it runs in, or a draft handed in from claude.ai chat. A chat draft becomes a seed when a session has shaped it into the template. No copy of the template is kept for chat |
| 20 | Who starts the seed skill | Claude or Robert; the skill is not hand-only. The plant job has a stop where Robert gives the type and the ID, so the tracker move stays his call |
| 21 | Seed commits | A seed is exempt from the branch rule. The write job and the plant job each make one unscoped `docs:` commit on the branch the session stands on, `main` allowed, as soon as Robert approves the result |
| 22 | Exploration template details | In Plain Words is drafted after the audit and rewritten last; the Terms block is optional, added when a naming trap shows; facts found while the options are written go into Current State, Options and the rows, with no section of their own |
| 23 | After an exploration | The follow-on row's own flow decides what comes next, as it does today. The exploration counts as the audit: a Discovery that follows starts from it and does not redo it. The Recommendation's "How it lands" names the next mode for each follow-on row |
| 24 | Refactor flow | The refactor flow is reframed as Audit, Plan, Execution. The Audit is the exploration; a refactor has no Discovery |
| 25 | Exploration or audit | Which came first decides. A question with no row yet is an exploration and gets its own `E.` row. Work that starts on an existing refactor row begins with an Audit under that row's `R.` ID, run the way an exploration is run. This amends decision 9: "always an `E.` ID" holds for explorations, and an Audit is not one |
| 26 | Exploration and audit skills | Two thin skills, `/gestalt:explore <E.ID>` and `/gestalt:audit <R.ID>`, over one shared flow file and one template. Each skill holds its own start and end; the middle is written once |
| 27 | Audit doc | For now it lives in `explorations/` as `<R.ID>-<name>-audit.md`, and `initiative-close` moves it into `_completed/` with the refactor's plan and retro |
| 28 | Who starts `explore` and `audit` | Claude or Robert, as for the other session starters. The rule for the whole plugin: starters are open, closes and upkeep skills are hand-only |
| 29 | Arc branch | Arc-discovery and arc-plan run on `feature/<arc-name>`, cut by `arc-discovery`. It merges into `main` with `--no-ff` once the arc-plan is signed off, with no code review and no tag. Robert agrees with the reason and does not like a docs-only branch; open to a better way |
| 30 | Arc success criteria | A chain: the seed may propose them, arc-discovery ratifies them, arc-plan gives each one an initiative that carries it, and `arc-close` checks the list. A criterion is the answer to a question, not a count or a limit |
| 31 | End of arc-plan | `arc-plan` does the three closing acts itself, behind two stops: Robert signs off the doc and approves the tracker rows, then approves the merge of `feature/<arc-name>` into `main`. It is the one starter that merges |
| 32 | The retro's follow-ups | F.008 takes eight: 1 (source check in the Plan session), 2 (the coordinator skill), 3 (the fixed report, in the coordinator's brief only), 4 ("look here first", read by `effort-close`), 6 (rules for the coordinator), 7 (a two-stage phase, as one sentence), 9 (the known gaps given to the `effort-close` reviewer) and 10 (the coordinator's commits kept out of the effort range). 5 (checks as a script) is left. 8 was done before this session |
| 33 | Coordinator models | Fable coordinates and Opus executes, as in the experiment. The model rule in `code-and-docs.md` and `session-discipline.md` gains a line for it. Every spawn sets the agent's model, and the coordinator confirms it after the run |
| 34 | Plan format for F.008 | Per task, by kind, in the implementation-plan template. An exact edit to an existing file is a literal task. A new template, skill or flow file is a named deliverable: its path, its scope, and the decisions of this doc it must carry out, by number. This is a stated exception, for this initiative, to "every task is the literal edit" |

## Catalogue Findings

Read from `plugins/gestalt/` on 2026-11-20, at commit `8e2d112`.

### Inventory

Twelve skills. Eight carry `disable-model-invocation: true`, so only Robert can start them.

| Group | Skills | Started by |
|---|---|---|
| Session starters | `discovery`, `plan`, `execute` | Robert only |
| Closes | `effort-close`, `initiative-close`, `arc-close` | Robert only |
| Plugin upkeep | `adopt`, `graduate` | Robert only |
| Reference | `session-modes`, `style-guide`, `diagram-kit`, `go` | Claude or Robert |

Around the skills:

- **Flow files** in `skills/session-modes/` — `lifecycle.md`, `session-discipline.md`, `feature-flow.md`, `refactor-flow.md`, `bugfix-flow.md`, `docs-chore-flow.md`, `efforts.md`, `arcs.md`
- **Templates** in `skills/session-modes/templates/` — `discovery.md`, `implementation-plan.md`, `docs-plan.md`, `execution-handoff.md`, `arc-concept.md`, `retro.md`, `arch-page.md`
- **Hook** — one SessionStart hook that lists the architecture pages
- **Brief** — `skills/arc-close/review-brief.md`, which `arc-close` gives to a background agent

### Coverage

| Work | Written process | Template | Skill |
|---|---|---|---|
| Seed | None | None | None |
| Exploration | None | None | None |
| Arc concept | `arcs.md` | `arc-concept.md` | None |
| Arc-discovery | `arcs.md` | None | `discovery`, which scaffolds the feature template in `discovery/` |
| Arc-plan | `arcs.md` | None | `plan`, which writes an implementation plan in `implementation/` |
| Arc close | `arcs.md` | `retro.md` | `arc-close` |
| Feature | `feature-flow.md` | `discovery.md`, `implementation-plan.md` | `discovery`, `plan`, `execute`, the closes |
| Refactor | `refactor-flow.md` | `implementation-plan.md`, "Steps only" | `discovery`, `plan`, `execute`, the closes |
| Bugfix, non-trivial | `bugfix-flow.md` | `implementation-plan.md`, "Steps only" | `plan`, `execute`, `initiative-close` |
| Bugfix, trivial; chore; single-session docs | `bugfix-flow.md`, `docs-chore-flow.md` | Not needed | None |
| Docs, multi-effort | `docs-chore-flow.md` | `docs-plan.md` | `plan`, `initiative-close`; `execute` does not fit |
| Execution hand-off | A comment in the template | `execution-handoff.md` | None writes it |
| Tracker moves | `lifecycle.md` | Not needed | None |

### Notes for the fronts

- **Seeds and explorations** — "Their process is not defined yet" stands in two places: `rules/code-and-docs.md` and `skills/session-modes/session-discipline.md`
- **Explorations** — `lifecycle.md` has no `E.` prefix in its ID list and no Explorations table; gestalt's tracker has both. The `F.006` row that F.008 takes in asked for the `E.` flow and template in `session-modes`: sessions, doc place at close, branch and merge
- **Arc stages** — `discovery` and `plan` have no arc case: `discovery` step 6 always copies `templates/discovery.md` into `initiatives/discovery/`, and `plan` step 6 always writes an implementation plan. Eleven plugin files name the arc concept, so decision 4 touches each: `arcs.md`, `lifecycle.md`, `session-discipline.md`, `session-modes/SKILL.md`, `style-guide/SKILL.md`, `discovery/SKILL.md`, `initiative-close/SKILL.md`, `arc-close/SKILL.md`, `arc-close/review-brief.md`, `templates/retro.md` and `templates/arc-concept.md` itself
- **Sub-agents** — `arc-close` already starts a background agent and points it at a brief file beside the skill. Decision 5 does not name `adopt` and `graduate`; they stay hand-only

### Known holes

Gaps outside the five fronts. The catalogue lists them (decision 10); F.008 does not fill them.

| Hole | What the source shows |
|---|---|
| Hand-off writer | `execution-handoff.md` says to write a hand-off at the end of a session; no skill does it, and `execute` step 6 does not name it |
| `execute` for a docs plan | `execute` finds its scope by phase and ticked phase box; `docs-plan.md` has efforts and no phases |
| Light bugfix plan | `bugfix-flow.md` names three parts (root cause, fix approach, test plan); `implementation-plan.md` gives a small bugfix one line, "Steps only" |
| Refactor plan | `refactor-flow.md` asks for a target pattern and a unit list; `implementation-plan.md` gives a small refactor the same one line |
| Tracker moves | `lifecycle.md` gives the rules for a new row, a promotion and a write-up; no skill does them |

## Seed Findings

The four seeds, read whole on 2026-11-20.

### The seeds

| Seed | Project | Came from | Planted | Would become |
|---|---|---|---|---|
| `one-claude-seed.md` | gestalt | Two claude.ai chats | No row | An arc |
| `repo-layout-seed.md` | gm-toolkit, campaigns | A talk inside a Claude Code session | `R.037`, in the Backlog; the row links the seed | A refactor |
| `codex-assistant-seed.md` | gm-toolkit, codex | Brainstorms in a claude.ai Project | No row; the tracker's header and `project-planning.md` link the seed | A feature, "likely an arc" |
| `living-spec-migration-seed.md` | gm-toolkit, faction-manager | Exploration `E.001` | `D.012` | A multi-effort docs initiative |

### Two shapes

The three gm-toolkit seeds share one shape. `one-claude` has another.

| Part | gm-toolkit seeds | `one-claude` |
|---|---|---|
| Header | Type, status of the work, source, date and commit written against; the tracker row once planted | What the file is, where it goes, a link to the chat's board |
| What a seed is | A fixed paragraph: a seed sits before the lifecycle and carries no commitment | One sentence in the header |
| Read this first | "Awareness, not authorization": do not start, do not promote, re-ground, then "Practical effect today" | None |
| Body | Free: what is coming, why, the rules, where it touches the repo | The arc-concept headings: In Plain Words, Vision, Problem, Why an Arc, Candidate Initiatives, Trigger |
| Decisions | "Decisions already made", in two of three | "Decided so far", with dates |
| Open questions | Yes, marked "not to be answered now" | Yes |
| If planted | A ready row for the tracker, in two of three | "For the session that picks this up": the next steps, each Robert's call |
| Other | Mini-glossary, in two of three | Success criteria; "What Claude did not verify" |

### What the seeds do

- **Hand-over** — a seed carries a conversation into a later session. All four do this
- **Standing notice** — a seed tells today's sessions what not to build against. Only the three gm-toolkit seeds do this, with "Practical effect today". No rule or hook loads a seed; a session finds one only through a link in a tracker

### Notes for the design

- **Names** — no seed carries an ID in its file name, planted or not. `one-claude` says its place is `A.001-one-claude-seed.md`. `session-discipline.md` says initiative file names start with the ID
- **The arc concept** — `templates/arc-concept.md` requires In Plain Words, Vision, Problem, Why an Arc, Candidate Initiatives and Trigger. The gm-toolkit shape has none of them by name; `one-claude` has all six. Decision 4 puts the seed in the concept's place
- **The write-up** — `lifecycle.md` makes the tracker write-up the Concept of a feature, drafted at promotion. Decision 3 keeps the seed beside its row, so a planted seed and a write-up cover the same ground
- **Chat** — `one-claude` was written in chat with no skill and no template, and borrowed the arc-concept headings to stand in for one (settled by decision 19)
- **Branches** — two of the gm-toolkit seeds exist only on `feature/pf2e-encounter-simulator`: `repo-layout` (commit `3f2d0d6`) and `living-spec-migration` (`1f824ee`), each an unscoped `docs:` commit made while that branch was the one checked out. gm-toolkit's `main` holds one seed, `codex-assistant`. `one-claude` came to gestalt's `main` inside the commit that promoted F.008
- **Other files** — gm-toolkit's campaigns `seeds/` folder also holds `second_fight/`, five scripts and patches with no seed doc

## Exploration Findings

Read on 2026-11-20: gm-toolkit's `D.009` findings log, whole; the header, In Plain Words and headings of `E.002`, `E.004` and `R.029`; and the header, In Plain Words, Questions, Recommendation and Follow-on Rows of gestalt's `E.001`. The bodies of the four docs (Current State, Existing Patterns, Options) were not read.

### The runs

| Doc | Sessions | Branch | Fed |
|---|---|---|---|
| `E.002` | Two: audit, then options | `exploration/<name>`, merged `--no-ff` | A paused discovery, through its tracker row |
| `E.004` | One | None; ran on `main` | A refactor that went straight to Plan |
| `R.029` | One | The branch of the initiative it amends | Its own plan; filed under the refactor's ID, with no `E.` row |
| `E.001` | Two | `exploration/openspec`, merged `--no-ff` | Four tracker rows |

### Doc shape

All four docs have the same sections in the same order.

| Section | What it holds |
|---|---|
| Header | Initiative, Feeds (what waits on the answer), Status; `E.001` adds a source snapshot |
| In Plain Words | What, Short answer, Why it matters, How it lands; an answer, not a problem statement |
| Questions | Robert's prompt in his words, and the deciding criteria |
| Current State | The audit, with `file:line` citations |
| Existing Patterns | What the code already does that an option can build on |
| Options | Numbered per question (`T-1`, `G-1`), with a baseline option; a Terms block on top in the three gm-toolkit docs |
| Recommendation | The answer, then "How it lands" and the calls that are Robert's |
| Follow-on Rows | A table in tracker columns: new rows, changed rows and closed rows |

### What the log says worked

- **The criterion first** — the deciding criterion was asked before the audit in `E.004` and `R.029`, and it steered what the audit looked at
- **A review after the audit** — in `E.004` Robert's review of Current State produced the winning option; in `R.029` it added a question and closed a larger idea. Decision 8 makes it a stop
- **A spot check before the close** — in `E.004` it found seven left-out items and a wrong claim. Decision 8 makes it a stop
- **A number check before review** — in `R.029` a count found nine where the doc said six
- **Writing the options finds facts** — in all three logged runs; the facts went into Current State and Options, and into rows
- **Rows are filed after review** — the doc says "proposed" until Robert has reviewed it, then a separate step files the rows
- **The fed doc is not edited** — the answer for a paused discovery went into its tracker row
- **Long silent stretches** — the audit ran long between messages in `E.004` and `R.029`

### Still open in the log

Decisions 6 to 9 settle the log's three conflicts (branch, close-out, ID) and its session question. These are left:

- When In Plain Words is written: last, or drafted after the audit and rewritten last
- Whether the Terms block is required
- Whether "Findings during options" earns a section
- What comes after an exploration, and whether a Discovery that follows one needs less
- Whether a refactor's audit-first Discovery is an exploration under another name

## Arc Findings

Read on 2026-11-20: `arcs.md` and `templates/arc-concept.md` in the plugin; gm-toolkit's `A.004` arc-discovery and arc-plan, whole; the headings of the `A.001` arc-discovery and arc-plan. The `A.001` bodies and the two arc concepts were not read.

### Arc-discovery, as written twice

`arcs.md` says only that the doc is "structurally similar to a per-initiative discovery doc". The two real docs share this shape:

| Section | `A.004` | `A.001` |
|---|---|---|
| Header: status and inputs | Yes | Not read |
| In Plain Words | Yes | No heading; it predates the rule |
| Problem | Yes | Yes |
| Architecture Context | Yes | Yes |
| Design Summary | Yes | No |
| The arc decisions: a numbered table, each tagged "carried in" or "ratified here" | Yes, `ACD-1` to `ACD-10` | Yes, "The cross-cutting decisions" |
| Sections for the arc's own design | Two | Five |
| Open Questions, each routed to Arc-Plan or to an initiative | Yes | Yes |
| Out of Scope | Yes | Yes |
| Reconciliation Items: doc drift found in the session | Yes | Yes |

### Arc-plan, as written twice

`arcs.md` lists five parts: the initiative list, the per-initiative boundary, open question routing, cross-arc dependencies and out-of-arc deferrals. Both docs have all five. `A.004` adds four more:

- **Success Criteria** — a table of what Robert can do when the arc is done, how to tell, and which initiative carries each line; "the arc close checks the whole list". Added after sign-off
- **Decisions Ratified in Arc-Plan** — a numbered table, `AP-1` to `AP-10`, with rejected alternatives. `A.001` has a Decision Record in the same role
- **Tracker Rows** — the rows the session wrote to the tracker
- **What Comes Next** — the next sessions, in order

### Notes for the design

- **Branch** — the git rules name no branch for arc-level sessions. `A.004`'s arc docs were committed on `feature/pf2e-encounter-simulator`, the branch of its first initiative, and are not on gm-toolkit's `main`. The arc-plan says each later initiative "cuts its own branch from `main`"
- **Success criteria** — they appear in three places: the `one-claude` seed (proposed, with Robert's rule that a criterion is the answer to a question), the `A.004` arc-plan, and the arc close that is to check them. No template names them
- **Initiative IDs** — an arc's new initiatives take `<arc-ID>.<n>` in run order (`A.004.2`); an initiative that existed before the arc keeps its ID (`F.041`)
- **The seed as concept** — with decision 4, an arc cannot start without a seed: arc-discovery has nothing else to read

## Coordinator Findings

The experiment retro, read whole on 2026-11-20. It is the coordinator session's own account; the transcript it points to was not read.

### The run

One long session on Fable, the coordinator, ran effort `F.041.E4` of gm-toolkit: six phases, 13 planned commits. It did no phase work. For each phase it ran this loop:

```
coordinator reads the phase against the current source
coordinator writes the brief
one Opus agent executes the phase and commits the planned commits
agent reports in a fixed, numbered format
coordinator verifies: model, gate, clean tree, commit messages, the diff
coordinator gives Robert the review, with a recommendation per call
Robert answers
the same agent, resumed, makes one fix commit
coordinator verifies the fix commit
Robert signs off
```

The result: 13 planned commits, six fix commits (one per phase), and an effort close that found five nits and no blocking bug. The retro scores it 20 of 25.

### What the retro found

- **The agents copied the plan faithfully.** In every phase the code matched the plan. Every real finding was a place where the plan was wrong, most often an outside rule written from memory
- **The coordinator's diff reads confirmed; they did not discover.** No finding came from the coordinator spotting a coding error. Two nits that were in a phase's diff passed its read and were found at the close
- **Findings came from three sources:** fetched rules text held against the planned code, the agent's own "needs a call" flags, and the last agent's "look here first" list
- **The brief grew phase by phase,** from about 8,000 to about 19,000 characters, and each addition traces to a problem in the phase before. Appendix B holds the template as it stood at Phase 5, in ten parts
- **The same agent makes the fix,** resumed with its context, so the fix brief is short
- **The coordinator session is long.** It ran out of context once and was compacted; its notes were less exact after that
- **Two writers on one plan.** The fix was a rule: the coordinator does not touch the plan while an agent runs, and writes nothing to disk that the agent's `git add -A` would sweep up
- **Unscoped commits inside the effort's range** stopped the unbroken-run check of `effort-close` twice
- **Robert corrected the coordinator about six times.** The common cause: it stated a conclusion about a source it had read only in part

### The hand-only flag, from the docs

A docs lookup by a separate agent on 2026-11-20, from `code.claude.com/docs/en/skills`, `/sub-agents` and `/plugins/components`. The quotes are as the agent reported them; this session did not open the pages, and no trial was run.

| Point | What the docs say |
|---|---|
| The flag itself | With `disable-model-invocation: true`, "Claude can't invoke the skill on its own", and its description is not in context; Robert can still run it with `/name` |
| The flag and sub-agents | It "also prevents the skill from being preloaded into subagents" |
| Sub-agents and skills in general | A sub-agent "can still discover and invoke project, user, and plugin skills through the Skill tool during execution", unless the Skill tool is removed from it |
| A sub-agent's start | It has "a fresh, isolated context window" and does not see "the skills you've already invoked" |
| Other tools the docs name | `context: fork` runs a skill's body as a sub-agent's prompt; a plugin can ship agents in an `agents/` folder, with a `skills` field that preloads skills |

What this gives the design:

- The write-up's claim holds: with the flag on, a coordinator cannot hand `execute` to a sub-agent, by a Skill call or by preload
- With the flag off (decision 5), the docs say a sub-agent can call the skill itself
- With the flag off, the skill's description enters every session's context, and Claude may start the skill when it judges the moment fits. The three descriptions say "Run by hand" today and must be reworded

What the docs do not say: whether a built-in agent type such as `general-purpose` gets the skill listing; and whether `$0` and `${CLAUDE_PLUGIN_ROOT}` are filled in when a skill is preloaded and not invoked.

### The ten follow-ups

| # | Proposal | In short |
|---|---|---|
| 1 | A source check in the Plan session | Every outside rule a plan builds carries a quote and a link, fetched in that session; the retro calls it the largest saving, and it needs no coordinator |
| 2 | A coordinator skill | One command that runs an effort's phases as sub-agents, with the loop above and the brief template |
| 3 | A fixed execution report | The numbered report, useful in a normal Execution session too |
| 4 | "Look here first" at the end of an effort | The last phase's agent lists the weakest spots; the effort close reads the list |
| 5 | Mechanical checks as a script | Model count, gate, clean tree and commit list need no model |
| 6 | Rules for the coordinator | No edit to a doc an agent is editing; nothing written to disk while an agent runs; a quote before a conclusion |
| 7 | A two-stage phase | A phase where Robert acts in the middle: the agent stops without committing and is resumed |
| 8 | Score the experiment | Done on 2026-11-20 |
| 9 | Give the effort-close reviewer the known gaps | The review prompt lists the Decision Record's known-gap entries, so a long record does not hide one |
| 10 | Keep the coordinator's commits out of the effort range | Ad-hoc commits land before the effort's first commit or after its close |

## Open Questions

One deferral. It needs a trial, which is Execution's work, and the design holds either way: if the answer is no, the brief names the `SKILL.md` path for the agent to read, as `arc-close` does with its review brief.

| # | Question | Notes |
|---|---|---|
| 1 | Can a `general-purpose` sub-agent call `/gestalt:execute` through the Skill tool once the flag is off? | The docs say a sub-agent can call skills, and are silent on the built-in agent types (Coordinator Findings). Only a trial answers it |

## Replaces / Retires

- **`templates/arc-concept.md`** — removed; the seed takes its place (decision 4)
- **The refactor's Discovery** — removed from `refactor-flow.md`; the Audit takes its place (decision 24). The Audit Findings section of `templates/discovery.md` goes with it
- **`disable-model-invocation: true`** — removed from `discovery`, `plan` and `execute` (decision 5)
- **"Their process is not defined yet"** — removed from `rules/code-and-docs.md` and `session-discipline.md`
- **The full write-up for seeded work** — a pointer, Trigger and Status take its place (decision 16)
- **gm-toolkit's `D.009`** — its job, to define the `E.` type, is done here. Its row is gm-toolkit's to close

## Out of Scope

- **The five known holes** — the hand-off writer, `execute` for a docs plan, the light bugfix plan, the refactor plan shape and a skill for tracker moves. The catalogue lists them (decisions 10 and 12)
- **The seeds and explorations that exist** — F.008 does not reshape them. `one-claude` gets its "Read this first" block when it is planted; the gm-toolkit docs are that repo's business
- **Seeds written in chat, on the chat side** — no template is kept for claude.ai (decision 19)
- **The fixed report in a normal Execution session** — it stays in the coordinator's brief (decision 32)
- **Mechanical checks as a script** — follow-up 5, left (decision 32)
- **`adopt` and `graduate`** — still hand-only. `adopt` step 4 creates four `initiatives/` folders and names neither `seeds/` nor `explorations/`; whether it creates them is for Plan to settle with Robert
- **The effort slicing** — the Plan session's work

## Notes for Plan

Notes, not decisions. This Discovery designed process files, not code, and the doc bent to fit: it is long, and most of it is a ledger of rulings with the evidence behind them. These notes are here so the Plan session does not have to find the same things again.

### How to read this doc

- **Binding** — In Plain Words, Design Summary and the two decision tables, about 280 lines. A Plan session reads these
- **Evidence** — the five findings sections, about 260 lines. Read one only when a decision is in doubt, or when a template is written from the docs it describes
- **Re-ground on the plugin, not on the findings.** Catalogue Findings is a snapshot at `8e2d112`; the plan is written against `plugins/gestalt/` as it stands

### Which files each front touches

A file that several fronts touch is a seam. The effort slicing decides who edits it first.

| File | Catalogue | Seeds | Explorations | Arc stages | Sub-agents |
|---|---|---|---|---|---|
| `rules/code-and-docs.md` | | x | x | | x |
| `rules/git-and-delivery.md` | | x | x | x | |
| `session-modes/SKILL.md` | x | x | x | x | |
| `session-modes/session-discipline.md` | | x | x | x | x |
| `session-modes/lifecycle.md` | | x | x | x | |
| `session-modes/arcs.md` | | x | | x | |
| `session-modes/refactor-flow.md` | | | x | | |
| `templates/discovery.md` | | | x | | |
| `templates/implementation-plan.md` | | | | | x |
| `templates/arc-concept.md`, `templates/retro.md` | | | | x | |
| `style-guide/SKILL.md` | | x | x | x | |
| `discovery/SKILL.md` | | x | x | x | x |
| `plan/SKILL.md` | | x | x | x | x |
| `execute/SKILL.md` | | | | | x |
| `effort-close/SKILL.md` | | | | | x |
| `initiative-close/SKILL.md` | | x | x | x | |
| `arc-close/SKILL.md`, `arc-close/review-brief.md` | | x | | x | |
| `hooks/hooks.json`, `scripts/` | | x | | | |
| New files | 1 | 3 | 4 | 4 | 2 |

What the table suggests for the order:

- **Seeds before Arc stages** — arc-discovery reads the seed, and both fronts rewrite the same "arc concept" lines
- **Catalogue last** — it lists what the other fronts add
- **The sub-agent trial first in its effort** — it decides how the brief hands a phase to an agent (Open Questions)
- **`discovery/SKILL.md` and `plan/SKILL.md` are touched by four fronts** — the largest seams; one effort that owns both may be cleaner than four that each edit them

### Where the plan template may pinch

- **Literal tasks** — settled by decision 34. `feature-flow.md` wants every task as the literal edit. That fits the exact changes here: a flag removed, a line replaced, a row added. It does not fit a new template or a new skill, because writing it is the design work, and a plan that held each one in full would do Execution's work. So the plan has two task shapes: a literal task for an exact edit, and a named deliverable for a new file, such as "write `templates/seed.md` per decisions 13, 15 and 30". The decision numbers make a deliverable checkable. The plan records the exception under Decisions Ratified in Planning
- **The phase budget** — it counts lines of plan, sized for code. A phase here is better sized by the number of files and seams it touches
- **The gate** — the project's only check is `claude plugin validate .`, which shows that the plugin loads. Whether a skill behaves is shown by running it. An effort can end with a named trial run of each skill it adds
- **Trial inputs that exist** — `one-claude-seed.md` is a real, unplanted arc seed in the old shape: an input for `seed plant` and for `arc-discovery`. gm-toolkit's `R.037` is a refactor row waiting on an audit
- **This checkout** — a rules edit on the branch is live in gestalt's next session, while skills come from the installed copy. A rule that names a new skill is ahead of the skill until the branch is pushed; sessions that test a skill start with `claude --plugin-dir plugins/gestalt`
- **The effort review** — `/code-review` reads these files as prose. What a review of a skill file should look for is not written anywhere

`F.004` (a lighter change flow for gestalt) takes this run as evidence; its tracker row says so.

## Inputs

- **Coordinator experiment retro** — `/workspaces/gm-toolkit/dev_journals/gestalt-outbox/2026-11-20-phase-coordinator-experiment-retro.md`
- **Exploration findings log** — `/workspaces/gm-toolkit/dev_journals/faction-manager/initiatives/discovery/D.009-exploration-type-findings.md`
- **Explorations** — gestalt `E.001`; gm-toolkit `E.002`, `E.004` and `R.029` under `dev_journals/faction-manager/initiatives/explorations/`
- **Seeds** — gestalt `dev_journals/initiatives/seeds/one-claude-seed.md`; gm-toolkit `repo-layout-seed.md` (campaigns), `codex-assistant-seed.md` (codex) and `living-spec-migration-seed.md` (faction-manager)

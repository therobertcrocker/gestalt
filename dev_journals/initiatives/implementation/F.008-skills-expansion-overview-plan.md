# Skills Expansion — Overview Plan

## In Plain Words

- **What** — this file cuts F.008 into five efforts and puts them in order: Sub-agents, Seeds, Explorations and audit, Arc stages, Design spec. Its output is that order, the scope of each effort, the decisions that bind all five, and which effort carries which success criterion. It holds no tasks.
- **Why** — the efforts change many of the same small files, so tasks written today for a late effort would quote lines an early effort changes. Each effort gets a short Plan session of its own just before it runs, and this file tells that session what is its to build and what the earlier efforts left behind.
- **How it fits** — the discovery doc's Design Spec says what F.008 builds, in ten criteria. This file delivers none of them; it gives each one to an effort ("Design Spec — carried by" below). One branch, `feature/skills-expansion`. Each effort ends with `/gestalt:effort-close`; after the fifth, `/gestalt:initiative-close F.008` merges the branch.

## Context / Goal

Turn the discovery doc's six fronts into five efforts that can each be planned, built, tried and closed without the next one. The sixth front and the fifth effort were added on 2026-11-20, after this plan was signed off (decisions 62 and 63).

- Discovery doc: [`F.008-skills-expansion-discovery.md`](../discovery/F.008-skills-expansion-discovery.md). Its In Plain Words, Design Spec, Design Summary and three decision tables (decisions 1 to 34 and 55 to 61) are binding. Its findings sections are evidence, read when a template is written from the docs they describe
- Effort plans: linked from the Effort Summary as each is written

## Decisions Ratified in Planning

Robert, 2026-11-20. The numbers continue from the discovery doc's tables, so an effort plan can cite "decision 37" with no clash.

35. **Effort order: Sub-agents, Seeds, Explorations and audit, Arc stages** — Sub-agents shares the fewest lines with the other fronts. First, it answers the sub-agent trial early, puts the source check into the plan template before the other effort plans are written, and makes the coordinator ready for a later effort if Robert chooses to run one under it. Seeds comes before Arc stages because arc-discovery reads the seed. Rejected: Sub-agents fourth (the discovery doc's order), and Sub-agents after Seeds.
36. **The catalogue is a phase, not an effort** — it is one new file and one table row, too small for an effort close of its own. It is the last phase of effort 4, so it lists the skills as that effort left them. Rejected: a fifth effort, and a plain commit before the initiative close.
37. **Each effort gets its own Plan session, just before it runs** — later efforts edit files that earlier efforts change, so a Find anchor quoted today would be stale. This file holds scope and decisions only. Rejected: the first effort in full here, and all efforts in full here.
38. **A shared file is edited by each effort in turn** — `discovery/SKILL.md`, `plan/SKILL.md` and the other files in "Shared files" below get each effort's own lines when that effort runs, so a skill change lands with the thing it serves. Rejected: one effort that owns both skills.
39. **`adopt` creates `seeds/` and `explorations/`** — settles the question the discovery doc left for Plan (Out of Scope). Effort 2 adds `seeds/` to `adopt` step 4, effort 3 adds `explorations/`.
40. **Each effort ends with a trial phase** — the gate shows only that the plugin loads. In the trial phase Robert runs each new or changed skill on a real input, in a session started with `claude --plugin-dir plugins/gestalt`. What the trial finds is fixed in that phase, in commits with the effort's scope, before the effort closes. Rejected: one trial before the initiative close, and no trial before the merge. **Reversed on 2026-11-20** (Decision Record, entry 1): no effort has a trial phase.
41. **The effort close runs as it is** — no checklist for the review of a skill file is written now. What `/code-review` catches and misses on process files is evidence for `F.004`.
42. **A phase is sized by files and seams, not by plan lines** — the phase budget of about 1,500 lines counts literal code. Here a phase holds one coherent set of files: a new skill with its template, or one pass over the shared files. The cap of about 4 commits per phase stays. This is the one-line reason the template asks for when a budget is not applied.
43. **The arc concept becomes the seed in one pass, in effort 4** — the eleven files that name the arc concept are changed once, with the rest of the arc flow. Effort 2 does not edit `arcs.md`, `arc-close/SKILL.md` or `arc-close/review-brief.md`. This moves two marks from the Seeds column of the discovery doc's file table, which is a note and not a decision. Until effort 4 lands, the branch has a seed process and still names the arc concept; that state never reaches `main`.
44. **The discovery doc's sub-agent quotes are checked against the live docs** — follow-up 1 (the source check) applied to this plan. The quotes and links are in "Outside rules" below. All four quotes of the discovery doc hold.

Added on 2026-11-20, after sign-off, with the discovery doc's decisions 55 to 61. The effort 1 plan holds decisions 45 to 54, so these start at 62. Both are Claude's proposals; Robert ratifies or changes them.

62. **The design spec is a fifth effort, the last** — it changes the rule for In Plain Words, the templates and flow files that exist, and the two closes. Efforts 3 and 4 rewrite several of those files first, so effort 5 edits each one once, in its final shape. The effort numbers of 1 to 4 stay, and so does the signed-off effort 1 plan. Rejected: a new effort 2 with the others moved down by one, and the work added to effort 3, which is already the largest.
63. **Efforts 2 to 4 write their new files in the new shape from the start** — decisions 55 to 61 bind every effort. A new template of efforts 2 to 4 defines In Plain Words as decision 61 frames it, and carries a Design Spec where decision 56 asks for one. Effort 5 then does not have to edit a file that F.008 itself added. Until effort 5 lands, the branch has new templates in the new shape beside old ones in the old shape; that state never reaches `main`.

## Decision Record — Execution

Decisions that span efforts land here; a decision inside one effort lands in that effort's plan.

1. **No effort has a trial phase** — Robert, 2026-11-20, after effort 1's two build phases. Reverses decision 40. The trial of effort 1 asked for a six-phase run in another repo and held the effort open until it ended. A fault in a skill's design shows in its first real use and is fixed then. The gate stays the one check before a commit. Nothing of F.008 reaches `main` before the initiative close, so a fix found in use still lands on the branch. The criteria that were checked at a trial are now checked at first real use ("Design Spec — Carried By"). The sub-agent trial of open question 1 is not a trial phase; it ran, and its answer stands.

---

## Open Questions — To Ratify at Implementation Time

| # | Question | Resolved in |
|---|---|---|
| 1 | Can a `general-purpose` sub-agent call `/gestalt:execute` through the Skill tool once the hand-only flag is off? If not, the brief names the `SKILL.md` path for the agent to read, as `arc-close` does with its review brief | Yes, by a trial on 2026-11-20 (E1 plan, Decision Record) |

The live docs made a yes likely and did not settle it (Outside rules, rows 3 to 5); the trial did.

## Effort Summary

| Done | # | Effort | Scope | File |
|------|---|--------|-------|------|
| [x] | 1 | Sub-agents | The `coordinate` skill and its brief; the hand-only flag off `discovery`, `plan` and `execute`; the source check in the plan template; two review inputs for `effort-close` | [`F.008.E1-skills-expansion-plan.md`](./F.008.E1-skills-expansion-plan.md) |
| [ ] | 2 | Seeds | The `seed` skill, its template and the SessionStart hook; the seed as the Concept of the work it describes | [`F.008.E2-skills-expansion-plan.md`](./F.008.E2-skills-expansion-plan.md) |
| [ ] | 3 | Explorations and audit | The `explore` and `audit` skills over one flow file and one template; the refactor flow as Audit, Plan, Execution | [`F.008.E3-skills-expansion-plan.md`](./F.008.E3-skills-expansion-plan.md) |
| [ ] | 4 | Arc stages and catalogue | The `arc-discovery` and `arc-plan` skills and templates; the seed in place of the arc concept; the arc branch and success criteria; the catalogue | [`F.008.E4-skills-expansion-plan.md`](./F.008.E4-skills-expansion-plan.md) |
| [ ] | 5 | Design spec | The Design Spec in the first doc of every piece of work; In Plain Words reframed in every doc; "carried by" in the plans; the check at the close | [`F.008.E5-skills-expansion-plan.md`](./F.008.E5-skills-expansion-plan.md) |

The order is the dependency:

```
E1 Sub-agents --> E2 Seeds --> E3 Explorations and audit --> E4 Arc stages --> E5 Design spec
                     |                                          ^
                     +---- arc-discovery reads the seed --------+
```

Only the E2 to E4 edge is a hard dependency. The rest of the order is decisions 35 and 62.

## Design Spec — Carried By

Decision 59: a plan gives each criterion of the Design Spec the effort that carries it. The criteria are in the discovery doc, Design Spec, and are not restated here. An effort plan names its criteria and gives each one a phase.

| Criterion | Carried by | Checked at |
|---|---|---|
| 1 — each kind of work starts from a skill | Efforts 1 to 4, each for its own starters | The initiative close; it holds only when all four have landed |
| 2 — a session hears of a seed | Effort 2 | First real use |
| 3 — a seed is planted with one command | Effort 2 | First real use |
| 4 — an exploration and an audit run the same way | Effort 3 | First real use |
| 5 — `one-claude` can run as an arc | Effort 4 | First real use |
| 6 — a session runs an effort's phases in sub-agents | Effort 1 | First real use |
| 7 — every outside rule comes with its source | Effort 1 | The first plan written after effort 1 lands |
| 8 — a process review sees the skills and the holes | Effort 4, the catalogue phase | The initiative close |
| 9 — the first doc of any work opens with a Design Spec | Effort 5; efforts 3 and 4 for the audit and the arc-discovery | First real use |
| 10 — In Plain Words says what its own doc handles | Effort 5; efforts 2 to 4 for their new templates | First real use |

## Shared Context

### Task format

Decision 34 holds in every effort plan. An exact edit to an existing file is a literal task with a Find anchor. A new template, skill or flow file is a named deliverable: its path, its scope, and the decisions it must carry out, by number. An effort plan lists the decision numbers per deliverable; the Execution session checks the written file against them.

### Commits

- Every commit of effort n carries the scope `E<n>`: `feat(E1): ...` for a new skill, template, hook or flow file, `docs(E1): ...` for an edit to a rule or flow text, `fix(E1): ...` for a fix
- An effort's plan doc is committed with its scope, `docs(E<n>): ...`. This overview plan is unscoped
- No unscoped commit lands between an effort's first commit and its close; the unbroken-run check in `effort-close` step 3 stops on one

### Gate

- **Gate** — `claude plugin validate .` from the repo root. It shows that the plugin loads, nothing more
- **No trial phase** — Decision Record, entry 1. A new or changed skill is tried by its first real use, and what that finds is fixed then

### Which copy of the plugin a session sees

From the project's `CLAUDE.md`: this checkout loads the rules by relative path, so a rules edit on the branch is live in the next gestalt session. Skills and hooks come from the installed copy, which does not have the branch's edits. So from effort 1's first commit on, a rule on the branch can name a skill the installed copy lacks.

A session that must see the branch's skills starts with `claude --plugin-dir plugins/gestalt`. That is every effort Plan session after effort 1 lands, because effort 1 changes the `plan` skill and the plan template.

### Shared files

Files that more than one effort edits. Each effort edits its own lines only (decision 38). An effort's Plan session reads the file as the earlier efforts left it.

| File | E1 Sub-agents | E2 Seeds | E3 Explorations | E4 Arc stages |
|---|---|---|---|---|
| `rules/code-and-docs.md` | Model rule; `coordinate` in Session modes | Seeds half of the "not defined yet" line; `seed` in Session modes | Explorations half of that line; `explore` and `audit` in Session modes | `arc-discovery` and `arc-plan` in Session modes |
| `rules/git-and-delivery.md` | | Seed exemption from the branch rule | Exploration exemption | Arc branch; `arc-plan` merges |
| `session-modes/SKILL.md` | | Templates row; Concept column | Which-file row; refactor routing; templates row | Arc routing; templates rows; catalogue row |
| `session-modes/session-discipline.md` | Model rule | Seed file locations; "not defined yet" | Exploration and audit file locations | Arc artifacts; In Plain Words layers |
| `session-modes/lifecycle.md` | | Planting; the write-up as a pointer | `E.` prefix; Explorations table | Arc concept lines |
| `style-guide/SKILL.md` | | Seed doc type | Exploration and audit doc types | Arc Artifacts |
| `discovery/SKILL.md` | Flag off; description | Reads the seed | An `R.` ID; reads an exploration first | Arc concept line; a bare arc ID |
| `plan/SKILL.md` | Flag off; description; source check | Reads the seed | Reads the audit | A bare arc ID |
| `initiative-close/SKILL.md` | | Reads and moves the seed | Reads and moves the audit | Arc concept line |
| `adopt/SKILL.md` | | `seeds/` | `explorations/` | |

Effort 5 edits `session-modes/SKILL.md`, `session-modes/session-discipline.md`, `style-guide/SKILL.md`, `discovery/SKILL.md`, `plan/SKILL.md` and `initiative-close/SKILL.md` from this table, each after the efforts above have left it. Its full list is in its section of Work Breakdown.

### Outside rules

The source check of follow-up 1, for the Claude Code behaviour this initiative builds on. Fetched on 2026-11-20 from `https://code.claude.com/docs/en/skills.md` and `https://code.claude.com/docs/en/sub-agents.md`.

| # | Rule the design leans on | Quote | Source |
|---|---|---|---|
| 1 | With the flag on, Claude cannot start the skill and does not see its description | "`disable-model-invocation: true`: Claude can't invoke the skill on its own"; table row: "Description not in context, full skill loads when invoked" | `skills.md`, Control who invokes a skill |
| 2 | With the flag on, the skill cannot be preloaded into a sub-agent | "You can't preload skills that set `disable-model-invocation: true`, since preloading draws from the same set of skills Claude can invoke" | `sub-agents.md`, Preload skills into subagents |
| 3 | A sub-agent can call a plugin skill through the Skill tool | "without it, the subagent can still discover and invoke project, user, and plugin skills through the Skill tool during execution" | `sub-agents.md`, Preload skills into subagents |
| 4 | A background sub-agent keeps the Skill tool | "It also keeps `Read`, `Grep`, `Glob`, `LSP`, `Bash`, `PowerShell`, `Edit`, `Write`, `NotebookEdit`, `WebFetch`, `WebSearch`, `TodoWrite`, `Skill`, ..." | `sub-agents.md`, Available tools |
| 5 | A built-in agent type gets no skill by preload | "Built-in agents don't preload skills" | `sub-agents.md`, What loads at startup |
| 6 | A sub-agent starts with none of the coordinator's context, and does load the rules | "Each subagent starts with a fresh, isolated context window. It doesn't see your conversation history, the skills you've already invoked, or the files Claude has already read"; its initial context holds "every level of the CLAUDE.md hierarchy the main conversation loads" | `sub-agents.md`, What loads at startup |
| 7 | `$0` and `${CLAUDE_PLUGIN_ROOT}` are filled in when a plugin skill is invoked | "`$N`: Shorthand for `$ARGUMENTS[N]`, such as `$0` for the first argument"; "`${CLAUDE_PLUGIN_ROOT}`: The plugin's installation directory. Substituted only in plugin skills" | `skills.md`, Available string substitutions |

Row 6 matters for the brief: the three gestalt rules files reach a sub-agent through this project's `CLAUDE.md` imports, so the brief does not repeat them. The discovery doc asked whether `$0` is filled in on preload; no design here preloads a skill, so the point is closed.

## Out of Scope

- **What the discovery doc excludes** — the five known holes, the seeds and explorations that exist, a seed template for claude.ai chat, the fixed report in a normal Execution session, and the checks as a script (discovery doc, Out of Scope)
- **A review checklist for skill files** — decision 41
- **Running an effort of F.008 under the coordinator** — possible from effort 2 on; whether to do it is Robert's call at the start of that effort, not a part of this plan
- **Tasks** — every phase, commit and task is the work of the effort's own Plan session (decision 37)

---

## Work Breakdown

Each effort gets its own Plan session, started with `/gestalt:plan F.008.E<n>`. "Carries out" lists the discovery doc's decisions the effort must meet. "For its Plan session" lists what the discovery doc leaves open at the level of that effort; none is decided here.

### Effort 1 — Sub-agents

**In plain words:** a Claude session can start the three session skills, and a coordinator skill runs each phase of an effort in its own sub-agent, reviews the result and puts the calls to Robert. The plan template gains the source check that would have caught most of the experiment's findings.

**Own Plan session:** yes.

**Carries out:** decisions 5, 28 (the starters named here), 32 and 33.

**Second phase, first act:** the trial for open question 1. Its answer decides how the brief hands a phase to an agent, so it runs before the brief is written. It cannot run in the first phase: a session sees the branch's skills only when it starts with `--plugin-dir`, so the session that removes the hand-only flag cannot be relied on to see its own edit (E1 plan, decision 46).

**New files (named deliverables):**

| File | Scope | Decisions |
|---|---|---|
| `skills/coordinate/SKILL.md` | `/gestalt:coordinate <ID>.E<n>`, or `<ID>` for a single-effort plan. One run is one effort. The loop of the experiment (discovery doc, Coordinator Findings, The run); the coordinator's rules; the two-stage phase; where the coordinator's own commits land; the rebuild from `git log` and the Decision Record after a compaction | 5, 28, 32 (follow-ups 2, 6, 7, 10), 33 |
| The phase brief, a file beside the skill | Starts from Appendix B of the experiment retro with the Phase 6 additions; the fixed, numbered report; "look here first" for the last phase, written into the effort's plan in that phase's last commit | 32 (follow-ups 3, 4) |

**Edits to existing files:**

- `discovery/SKILL.md`, `plan/SKILL.md`, `execute/SKILL.md` — remove `disable-model-invocation: true`; reword each description, which says "Run by hand" today and will be in every session's context once the flag is off
- `templates/implementation-plan.md` and `plan/SKILL.md` — the source check: every outside rule a plan builds carries a quote and a link, fetched in the Plan session (follow-up 1)
- `effort-close/SKILL.md` — the review step gives the reviewer the Decision Record's known-gap entries by number (follow-up 9), and reads the "look here first" list from the effort's plan (follow-up 4). No other change to this skill
- `rules/code-and-docs.md` and `session-modes/session-discipline.md` — the model rule gains a line: Fable coordinates, Opus executes
- `rules/code-and-docs.md`, Session modes — names `/gestalt:coordinate`

**Trial:** the sub-agent trial above ran. The run of `/gestalt:coordinate` on a real effort was dropped (Decision Record, entry 1).

**For its Plan session:**

- The name of the brief file
- Whether `efforts.md` names the coordinator as a way to run an effort; the discovery doc's file table does not list `efforts.md`

### Effort 2 — Seeds

**In plain words:** an idea gets a seed from one template with one skill, every session hears which seeds exist, and a planted seed stands in for the tracker write-up of its work.

**Own Plan session:** yes.

**Carries out:** decisions 2, 3, 13 to 21, the seed's part of decision 30 (an arc's seed may propose Success Criteria), and decision 39 for `seeds/`.

**New files (named deliverables):**

| File | Scope | Decisions |
|---|---|---|
| `skills/session-modes/templates/seed.md` | The frame and the body, with Vision, Why an Arc, Candidate Initiatives and the optional Success Criteria marked arc-only; "Read this first" with the practical effect on today's work | 13, 15, 30 |
| `skills/seed/SKILL.md` | `/gestalt:seed write <name>` and `/gestalt:seed plant <name>`. Two sources for the write job. The plant job's stop for the type and the ID, its check of the arc-only sections, the Backlog row, the rename, the link fixes and the row in the seed's header. One unscoped `docs:` commit per job | 2, 3, 17, 19, 20, 21 |
| A seed index script in `scripts/`, and its entry in `hooks/hooks.json` | Lists the seeds by name at session start, in the single-product and the multi-product layout, with one line that says to read a seed's "Read this first" before work that touches its area. Prints no seed content | 14 |

**Edits to existing files:**

- `session-modes/lifecycle.md` — planting as the way a seed gets a row; for seeded work the write-up is a pointer to the seed plus Trigger and Status (decision 16)
- `session-modes/session-discipline.md` — the seed's file name before and after planting, and the seed among the files a close moves; the seeds half of "not defined yet"
- `session-modes/SKILL.md` — the templates table and the Concept column of the routing table
- `rules/code-and-docs.md` — the seeds half of the "not defined yet" line; `/gestalt:seed` in Session modes
- `rules/git-and-delivery.md` — a seed is exempt from the branch rule (decision 21)
- `style-guide/SKILL.md` — the seed as a document type
- `discovery/SKILL.md`, `plan/SKILL.md` — read the seed where they read the write-up
- `initiative-close/SKILL.md` — reads the seed, and moves it into `_completed/` by ID (decision 18, the initiative's half)
- `adopt/SKILL.md` — `seeds/` in step 4
- `hooks/hooks.json` — the description, which names the architecture index only

**Not here:** `arcs.md`, `arc-close/SKILL.md` and `arc-close/review-brief.md` (decision 43).

**Trial:** none (Decision Record, entry 1). `dev_journals/initiatives/seeds/one-claude-seed.md` is a real, unplanted arc seed in the old shape, and a likely first real use.

**For its Plan session:**

- The script's name, and how it finds `seeds/` under `dev_journals/<product>/`

### Effort 3 — Explorations and audit

**In plain words:** a question with no row yet runs as an exploration, and a refactor starts with an audit; both use one flow and one template. The refactor flow has no Discovery any more.

**Own Plan session:** yes.

**Carries out:** decisions 6 to 9, 22 to 28, and decision 39 for `explorations/`. This is the `F.006` work that F.008 took in.

**New files (named deliverables):**

| File | Scope | Decisions |
|---|---|---|
| `skills/session-modes/exploration-flow.md` | The shared middle: the seven steps and the two stops; what an exploration is and is not; exploration or audit by which came first | 8, 23, 25 |
| `skills/session-modes/templates/exploration.md` | The eight sections the four real docs share (discovery doc, Exploration Findings, Doc shape) | 22 |
| `skills/explore/SKILL.md` | `/gestalt:explore <E.ID>`: starts from an `E.` row, may run on `main`, files the follow-on rows and removes its own row | 6, 7, 9, 26, 28 |
| `skills/audit/SKILL.md` | `/gestalt:audit <R.ID>`: starts from a refactor row in progress, runs on the refactor's branch, files nothing and names the refactor's Plan as the next step | 25, 26, 27, 28 |

**Edits to existing files:**

- `session-modes/refactor-flow.md` — rewritten as Audit, Plan, Execution (decision 24)
- `session-modes/lifecycle.md` — the `E.` prefix and the Explorations table; an exploration has no write-up and no promotion step
- `session-modes/SKILL.md` — the which-file row for `exploration-flow.md`, the refactor rows of the two routing tables, the templates table
- `session-modes/templates/discovery.md` — the Audit Findings section and the refactor wording go
- `session-modes/session-discipline.md` — file locations for the exploration and the audit; the audit among the files a close moves; the explorations half of "not defined yet"
- `rules/code-and-docs.md` — the explorations half of the "not defined yet" line; `/gestalt:explore` and `/gestalt:audit` in Session modes
- `rules/git-and-delivery.md` — an exploration is exempt from the branch rule (decision 6)
- `style-guide/SKILL.md` — the exploration and the audit as document types
- `discovery/SKILL.md` — a Discovery that follows an exploration reads it first (decision 23)
- `plan/SKILL.md` — reads the audit where it reads the discovery doc (decision 27)
- `initiative-close/SKILL.md` — reads the audit, and moves it into `_completed/` (decision 27)
- `adopt/SKILL.md` — `explorations/` in step 4

**Trial:** none (Decision Record, entry 1). gm-toolkit's `R.037` waits on an audit, and is a likely first real use.

**For its Plan session:**

- What `/gestalt:discovery` does when it is given an `R.` ID, now that a refactor has no Discovery

### Effort 4 — Arc stages and catalogue

**In plain words:** an arc starts from its seed with skills and templates made for arcs, on a branch of its own, with success criteria that run from the seed to the arc close. Then the catalogue lists every skill gestalt has and the holes it still has.

**Own Plan session:** yes.

**Carries out:** decisions 4, 10 to 12, 18 (the arc's half), 29 to 31, and 43.

**New files (named deliverables):**

| File | Scope | Decisions |
|---|---|---|
| `skills/session-modes/templates/arc-discovery.md` | The sections of the discovery doc's "The two templates" list, with a required Success Criteria section before the arc decisions | 30 |
| `skills/session-modes/templates/arc-plan.md` | The sections of the same list, with a "carried by" column on Success Criteria | 30 |
| `skills/arc-discovery/SKILL.md` | `/gestalt:arc-discovery <A.ID>`: reads the seed, and stops and names `/gestalt:seed write` when there is none; cuts `feature/<arc-name>` | 4, 28, 29, 30 |
| `skills/arc-plan/SKILL.md` | `/gestalt:arc-plan <A.ID>`: the three closing acts behind two stops; the one starter that merges | 28, 29, 31 |
| `skills/session-modes/catalogue.md` | The skill inventory and the coverage table, brought up to date with what efforts 1 to 4 added, and the five known holes marked `(planned)` | 10, 11, 12 |

**Removed:** `skills/session-modes/templates/arc-concept.md`.

**Edits to existing files:**

- The other ten files that name the arc concept, changed to name the seed: `session-modes/arcs.md`, `session-modes/lifecycle.md`, `session-modes/session-discipline.md`, `session-modes/SKILL.md`, `style-guide/SKILL.md`, `discovery/SKILL.md`, `initiative-close/SKILL.md`, `arc-close/SKILL.md`, `arc-close/review-brief.md`, `session-modes/templates/retro.md`
- `session-modes/arcs.md` — beyond the swap: the arc branch, the success criteria chain, the two templates, and the end of arc-plan
- `arc-close/SKILL.md` — moves the arc's seed where it moves the concept today (decision 18); checks the list of success criteria (decision 30)
- `session-modes/templates/retro.md` — an arc retro's first question is held against the success criteria (decision 30)
- `discovery/SKILL.md`, `plan/SKILL.md` — given a bare arc ID, name the arc skill and stop
- `rules/git-and-delivery.md` — arc-discovery and arc-plan run on `feature/<arc-name>`, which merges with `--no-ff`, no code review and no tag, once the arc-plan is signed off (decision 29)
- `rules/code-and-docs.md`, Session modes — names `/gestalt:arc-discovery` and `/gestalt:arc-plan`
- `session-modes/SKILL.md` — the row for `catalogue.md` in "Which file to read" (decision 11)

**Phase order:** the arc work, then the catalogue as the last phase (decision 36).

**Trial:** none (Decision Record, entry 1). The `one-claude` arc is a likely first real use.

**For its Plan session:**

- Decision 29 records that Robert does not like a docs-only branch and is open to a better way. If one shows by then, it is settled before the effort's tasks are written

### Effort 5 — Design spec

Added on 2026-11-20 (decision 62).

**In plain words:** the first doc of any piece of work says what is being built and how Robert will know it is built, and the close holds the work against that. In Plain Words in every doc says only what that doc itself handles.

**Own Plan session:** yes.

**Carries out:** decisions 55 to 61 in the files that exist. Criteria 9 and 10.

**What efforts 2 to 4 have done by then** (decision 63): `seed.md`, `exploration.md`, `arc-discovery.md` and `arc-plan.md` are already in the new shape. The effort 2, 3 and 4 Plan sessions add decisions 55 to 61 to the decisions of each new template:

| Effort | New file | From decisions 55 to 61 |
|---|---|---|
| 2 | `templates/seed.md` | In Plain Words as decision 61 frames it; no Design Spec; the optional Success Criteria stay a proposal (decisions 30 and 56) |
| 3 | `templates/exploration.md` | In Plain Words as decision 61 frames it; a Design Spec section, marked for an audit only (decision 56) |
| 3 | `session-modes/refactor-flow.md`, rewritten | The audit holds the refactor's Design Spec; a refactor that goes straight to Plan holds it at the top of the plan |
| 4 | `templates/arc-discovery.md` | The required Success Criteria section is the second part of a Design Spec (decision 60) |
| 4 | `templates/arc-plan.md` | Its "carried by" column is decision 59 for an arc |

**Edits to existing files:**

- `session-modes/session-discipline.md` — the In Plain Words section is rewritten for decision 61, with what the section is for; a new part names the Design Spec, who carries it and that it is one source; the re-grounding step reads the Design Spec after In Plain Words
- `session-modes/SKILL.md` — the last paragraph, which defines In Plain Words for every artifact
- `session-modes/templates/discovery.md` — a required Design Spec section after In Plain Words; the In Plain Words comment
- `session-modes/templates/implementation-plan.md` — the In Plain Words comment for a plan and for a phase; a Design Spec section for work that starts at a plan; the "carried by" table for an overview plan and for an effort or single-file plan
- `session-modes/templates/docs-plan.md`, `templates/retro.md` and any other template that defines In Plain Words — the comment; in `retro.md` also question 1 and the Delivered score, held against the Design Spec by criterion (decision 60)
- `session-modes/feature-flow.md` — Discovery ratifies the criteria before the design; the Plan gives each one a phase
- `session-modes/bugfix-flow.md` — the light plan opens with a Design Spec, beside root cause, fix approach and test plan
- `session-modes/arcs.md` — the success criteria chain is named as the arc's case of the Design Spec, if effort 4 did not already word it so
- `discovery/SKILL.md`, `plan/SKILL.md`, `execute/SKILL.md` — what each scaffolds and what each reads first
- `initiative-close/SKILL.md`, `arc-close/SKILL.md` — the retro step holds the work against the Design Spec
- `style-guide/SKILL.md` — the Design Spec in the document types that carry one

**Not here:** the docs that exist in any project. F.008's own three docs were brought to the new shape by hand on 2026-11-20; no other doc is reshaped.

**Trial:** none (Decision Record, entry 1). F.008's own initiative close is a first real use of the close: its discovery doc has ten criteria.

**For its Plan session:**

- The exact shape of "What we are building", the first part of the Design Spec. Decision 57 says plain words and a commitment the criteria can test; the discovery doc's own Design Spec is the one example
- Whether a trivial bugfix or a chore, which have no doc, need anything. Decision 56 covers only work that has a doc or a plan
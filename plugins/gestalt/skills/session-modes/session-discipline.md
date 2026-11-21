# Session discipline

The flows in the flow files work because of a small set of cross-cutting rules. These rules apply to every session regardless of which flow it serves.

## One mode per session

Discovery, Plan, and Execution are separate sessions. A session does not change modes mid-flight. Even when the inputs to the next mode are ready, the next mode starts in a new session.

The most-violated boundary is **Plan → Execution.** When the current session's deliverable is an implementation plan, stop after the plan is written, approved, or handed off. Do not write code, edit source files, or stage edits. If pushed to keep going, suggest opening a new session.

This applies to refactor and bugfix Plan sessions as well, even when the plan is short.

## Execution scope

One phase is one execution session (feature-flow.md, Work breakdown levels). The Plan session sizes each phase to the phase budget in `templates/implementation-plan.md` (in this skill folder) and splits phases only at real seams: a green-build point, a type-system or cross-package boundary, or a behavior change. A phase typically holds 2–3 commits and at most about 4.

The hand-off names the phase (for example, "Phase 2, Commits 3–4"). It can override the default with a different scope. When the hand-off names no scope, the session covers one phase. The phase is the boundary, not the commit: if the next commit is in the same phase, keep going, even when the hand-off scoped only one commit. Inside a multi-commit session, each commit is still its own unit: re-ground, log decisions, give the wrap-up summary and review, commit when the gate passes, then start the next commit without asking (git-and-delivery rules).

## Plan mode is a strong signal

When plan mode is active and the stated deliverable is a file (a discovery doc or implementation plan), **that file is the entire session output.** Exiting plan mode is not a handoff into implementation — it is the end of the session. Do not queue file edits, Bash commands, or follow-up work to run after exit. End the turn after the file is written.

## Re-grounding before action

Every Plan session and every Execution session must verify its inputs against the current state of the code before acting:

- **Every session** — read the **In Plain Words** section of the doc in scope first, then that of each layer above it (overview plan, arc), so the detail is read against what, why and how it fits. Then read the work's **Design Spec** in its first doc, and in a plan the rows of Design Spec — Carried By that name the scope at hand (Design Spec, below). An Execution session also reads the **In plain words** line of each phase in scope.
- **Discovery and Plan sessions** — read the relevant architecture page(s) under `docs/architecture/` before designing (start at `docs/architecture/architecture-overview.md`); their `Key Decisions` sections are binding context. This is the push half of the push-not-pull decision system (see Decision records below). The plugin's SessionStart hook lists the pages when the project has a wiki; treat that list as a prompt to open the page that matches the work, not as an acknowledgement that it exists. The same applies mid-execution: a judgement call about system shape opens the page first. Architecture pages reflect source; a load-bearing claim on one is verified against source in the session that writes it, never carried from a plan's source map or another doc, and no hard count ("five instances") is asserted without enumerating it in code.
- **Plan sessions** — re-read the relevant code. The discovery doc is a snapshot; the snapshot may have decayed. Verify the plan's assumptions against the current source, not against what the discovery doc said.
- **Execution sessions** — re-read the current code for the unit being touched. The plan was written against a snapshot that may have shifted, especially for refactors where prior phases have already changed the surrounding code. `// deliberate:` fence-signs encountered in that code are binding unless explicitly revisited with Robert. A hand-off starts the session: read it, then delete it during the session; it is never committed, and `dev_journals/initiatives/implementation/*-handoff.md` is gitignored so `git add -A` stays safe.

Re-grounding is most load-bearing for refactors (see refactor-flow.md) but applies to all flows. Reasoning from a stale doc instead of the current code is the most common drift failure.

## Model selection

Opus by default. Fable for Arc-Discovery, Arc-Plan and process-redesign sessions — structure-setting sessions whose output constrains many later sessions. Under `/gestalt:coordinate`, Fable coordinates and Opus executes: the coordinator session runs on Fable, and every phase agent it starts runs on Opus.

## Promotion is manual

Movement between lifecycle stages (Backlog → Up Next → Current Initiative → Done) is always Robert's explicit call. Claude may suggest a promotion but does not execute it without confirmation. See lifecycle.md.

## File locations

**File names start with the initiative ID.** `<ID>` is the `dev_journals/planned-work.md` ID exactly as written (`A.001.4`, `F.026`, `B.013`), followed by a hyphen and the initiative name in kebab-case: `A.001.4-goals-tags-core-discovery.md`. Arcs carry the ID on the folder and on each file. No underscores anywhere in initiative file or folder names. A project's docs from before it adopted this rule keep their names. An unplanted seed is the one exception: it has no ID yet, so its file is `<name>-seed.md` until it is planted.

**Work addresses.** A skill argument can point below the initiative with lettered segments after the ID: `.E<n>` for an effort, `.P<n>` for a phase. `F.001.P3` is phase 3 of a single-effort plan, `F.001.E2.P3` is phase 3 of effort 2, `A.001.7.E2` is effort 2 of arc initiative `A.001.7`. Phase numbers restart in each effort plan, so in a multi-effort initiative a phase needs its effort. An effort's files start with its address (`A.001.7.E2-…`), so the overview plan sorts first and the effort files follow in order. Phases have no files, and the tracker keeps the bare ID.

Every path below sits under `dev_journals/`, or under `dev_journals/<product>/` in a multi-product project (code-and-docs rules, Project layout).

- **Discovery docs** — `dev_journals/initiatives/discovery/<ID>-<initiative-name>-discovery.md`
- **Implementation plans** — `dev_journals/initiatives/implementation/<ID>-<initiative-name>-plan.md` for a single-effort initiative. A multi-effort initiative has an overview plan at `<ID>-<initiative-name>-overview-plan.md`, plus per-effort plans at `<ID>.E<n>-<initiative-name>-plan.md` when needed
- **Execution hand-offs** — `dev_journals/initiatives/implementation/<ID>[.E<n>]-<initiative-name>-handoff.md`
- **Retros** — `dev_journals/initiatives/implementation/<ID>-<initiative-name>-retro.md`, written by `/gestalt:initiative-close`
- **Arc artifacts** — `dev_journals/initiatives/arcs/<ID>-<arc-name>/` holds `<ID>-<arc-name>-arc-discovery.md` and `-arc-plan.md` while the arc is active, and `-arc-retro.md` once `/gestalt:arc-close` writes it. The arc's seed stays in `seeds/`. An arc from before seeds has `-arc-concept.md` in the folder in place of the seed
- **Seeds** — `dev_journals/initiatives/seeds/<name>-seed.md`, renamed `<ID>-<name>-seed.md` when it is planted. Written and planted with `/gestalt:seed`, from `templates/seed.md`
- **Explorations and audits** — `dev_journals/initiatives/explorations/<E.ID>-<name>-exploration.md`, which stays there when its row leaves the tracker; a refactor's audit is `<R.ID>-<name>-audit.md` in the same folder. Run with `/gestalt:explore` and `/gestalt:audit`, from `templates/exploration.md` (`exploration-flow.md`)
- **Completed artifacts** — when an initiative ships, its seed, its discovery doc or audit, all its plans (single, overview, and effort plans) and its retro move into one folder. The folder name is the ID, a hyphen, and the kebab-case name. The files keep their names.
  - Standalone initiative — `dev_journals/initiatives/_completed/<ID>-<initiative-name>/`
  - Arc initiative — `dev_journals/initiatives/_completed/arcs/<arc-ID>-<arc-name>/initiatives/<ID>-<initiative-name>/`. The arc folder is created when the arc's first initiative ships.
  - Arc — when the arc closes, with `/gestalt:arc-close`, its seed and its artifacts move into `dev_journals/initiatives/_completed/arcs/<arc-ID>-<arc-name>/`, next to `initiatives/`
- **Archive** — a project may keep `dev_journals/initiatives/_completed/_archive/` for docs completed before it adopted the per-initiative folders. It is frozen; do not reorganize it or add to it.

Plans never live in `~/.claude/plans/` or other harness defaults — they are repo-tracked artifacts.

## Decision records

Decisions are recorded where they are made and *read* where they cannot be skipped — push, not pull. A decisions log organized by branch and time fails because nobody retrieves on that axis; a project that has one keeps it as a frozen archive and never appends to it.

**Where decisions are written:**

- Discovery decisions live in the discovery doc
- Plan decisions live in the plan's "Decisions Ratified in Planning" section
- Execution-time decisions (and reversals of planned decisions) land in the plan's **Decision Record** section

**Where decisions are read (the push surfaces):**

1. **Architecture pages (primary).** Each subsystem page under `docs/architecture/` carries a `Key Decisions` section — the durable "why this subsystem is shaped this way," organized by the axis people actually query on. Reading the relevant page is a required re-grounding step (above), so the rationale sits in the doc every Discovery is forced to open.
2. **Code fence-signs.** A one-line `// deliberate: X, not Y, because <reason>` at the fence itself, surfaced during execution and refactor re-grounding (convention defined in the code-and-docs rules).
3. **Completed plan docs (provenance).** Each initiative's plan ships to `_completed/` carrying its Decision Record — source material, not a routine read surface.

**Promotion.** The pre-merge checklist (feature-flow.md, step 2) graduates architecturally-durable decisions from the plan's Decision Record into the relevant architecture page's `Key Decisions`. Micro-decisions (naming, a test strategy) stay behind as plan-doc provenance or fence-signs — only architecturally-significant "why" graduates.

**Mutability contract.** The plan's Decision Record is *mutable*: append **and reconcile**. When execution overrides a planned decision, log the reversal with rationale and fix the plan body so it doesn't lie. Discovery docs are the opposite: never updated after the initiative ships; post-implementation decisions belong in the Decision Record.

## Deferred refactor — match existing pattern

When a refactor is scoped but not yet executed, new code added in the meantime matches the existing (imperfect) pattern, not the target. Mixed state is worse than uniform pre-refactor state. See refactor-flow.md.

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
| A plan with no doc before it: a non-trivial bugfix, a refactor with no audit (an exploration may have chosen its target), a multi-effort docs initiative | The top of that plan |

A seed and an exploration carry none; an arc's seed may propose criteria, and the arc-discovery ratifies them. Work with no doc (a trivial bugfix, a chore, a single-session docs item) has none.

It has two parts. **What we are building** is one paragraph: the thing, in plain words, worded as a commitment the criteria can test. What the work does not build goes in Out of Scope. **Success Criteria** is a table `# | Question | Success is`. A criterion is a question Robert can ask of the finished work, with the answer that means success; never a count or a limit. The criteria are ratified with Robert before the design below them is written. An arc numbers them `SC-1`, `SC-2` (arcs.md, Success criteria).

It is one source. No plan and no retro restates it; each cites a criterion by number:

| Where | What it does with the spec |
|---|---|
| Plan | Its Design Spec — Carried By table gives each criterion the effort, phase or commit that carries it |
| In Plain Words of each layer | How it fits names the part of the spec this layer delivers |
| Close | The retro's first question and its Delivered score hold the work against the criteria, one by one |

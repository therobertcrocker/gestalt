---
name: session-modes
description: How work moves from idea to shipped in Robert's projects. The Discovery, Plan and Execution modes, the initiative lifecycle in dev_journals/planned-work.md, the flow per work type (arc, feature, refactor, bugfix, docs, chore), efforts, session discipline and the doc templates. Load before starting a new initiative or session, before any tracker move, and when a question is about the process itself.
---

# Session modes

Work moves through three modes, each its own session. **Discovery** produces a discovery doc. **Plan** produces an implementation plan. **Execution** implements one phase. A session ends at its deliverable; the next mode starts in a new session. The flows weight the three modes differently per work type.

## Which file to read

Read this file, then only the files for the work at hand. The files sit beside this one in `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/`. After compaction this file comes back on its own; re-read the flow file for the work type.

| Working on | Read |
|---|---|
| Any session | `session-discipline.md`: one mode per session, execution scope, re-grounding, file locations, decision records |
| A tracker move, a new Backlog row, or routing a new item | `lifecycle.md` |
| A feature (`F.`) | `feature-flow.md` |
| A refactor (`R.`) | `refactor-flow.md` |
| A bugfix (`B.`) | `bugfix-flow.md` |
| Docs (`D.`) or a chore (`C.`) | `docs-chore-flow.md` |
| An initiative split into efforts | `efforts.md` |
| An arc (`A.`) or an initiative inside one | `arcs.md` |

## Routing by type

The ID prefix of a Backlog row names its type, and the type names the flow. Set it when the row lands; change it only if the nature of the work changes.

| Type | Flow | When to use |
|------|------|-------------|
| `arc` | `arcs.md` | A collection of connected initiatives contributing to a greater whole. Cross-cutting decisions ratified once bind every initiative in it. |
| `feature` | `feature-flow.md` | New capability, new domain concept, new user-visible behaviour. Default when in doubt. |
| `refactor` | `refactor-flow.md` | Restructuring existing code without changing behaviour. |
| `bugfix` | `bugfix-flow.md` | Existing behaviour is wrong. Tiered by what is known going in. |
| `docs` | `docs-chore-flow.md` | Documentation work. Tiered: single-session or multi-effort. |
| `chore` | `docs-chore-flow.md` | Mechanical maintenance. No design decisions. |

Every flow is a different weighting of the same three artifacts (Concept, Discovery, Plan) followed by Execution:

| Type | Concept | Discovery | Plan | Execution |
|------|---------|-----------|------|-----------|
| **Arc** | Standalone doc in `dev_journals/initiatives/arcs/<ID>-<arc-name>/` | Arc-Discovery, always | Arc-Plan: initiative slicing and DAG | N initiatives, each running its own flow |
| **Feature** | Tracker write-up | Always, 1–2 sessions | Overview plan; per-effort plans as needed | Hand-off sets scope; default one phase per session |
| **Refactor** | Tracker write-up | Often skipped; audit-first when it fires | Pattern plus unit list | One phase, typically one unit, per session; re-grounding per unit |
| **Bugfix** | Backlog row only | Never; diagnosis is the first half of Plan | Skipped (trivial) or lightweight | Single session |
| **Docs** | Backlog row, or write-up if initiative-sized | Skipped; generative docs discover at write time | Skipped (single session) or docs-initiative plan | One session per effort or doc |
| **Chore** | Backlog row only | Never | Never | Single session |

## Templates

The templates sit in `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/`. In a multi-product project, every `dev_journals/` path below reads `dev_journals/<product>/`. Copy, fill in, and delete the guidance comments before writing. Required sections are marked REQUIRED; the rest are included only when relevant.

| Artifact | Template | Copy to |
|---|---|---|
| Discovery doc | `discovery.md` | `dev_journals/initiatives/discovery/<ID>-<initiative-name>-discovery.md` |
| Implementation plan | `implementation-plan.md` | `dev_journals/initiatives/implementation/<ID>-<initiative-name>-plan.md`, or `<ID>-<initiative-name>-overview-plan.md` plus `<ID>.E<n>-<initiative-name>-plan.md` files |
| Docs-initiative plan | `docs-plan.md` | `dev_journals/initiatives/implementation/<ID>-<initiative-name>-overview-plan.md` |
| Execution hand-off | `execution-handoff.md` | `dev_journals/initiatives/implementation/<ID>[.E<n>]-<initiative-name>-handoff.md`. Never committed; the session that uses it deletes it |
| Arc concept | `arc-concept.md` | `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-concept.md` |
| Retro | `retro.md` | `dev_journals/initiatives/implementation/<ID>-<initiative-name>-retro.md`; an arc's is `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-retro.md` |
| Architecture page | `arch-page.md` | `docs/architecture/<subsystem>.md`, or a subfolder per side of the system if the project has sides |

Every initiative artifact opens with a required **In Plain Words** section: what, why and how it fits, in plain words, under 15 lines, scoped to its own layer. Inside a plan, each phase opens with a required one-or-two-sentence **In plain words** line. Templates are living documents: update one when a real doc shows a missing or unused section.

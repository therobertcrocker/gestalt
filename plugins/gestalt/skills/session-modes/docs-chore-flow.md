# Docs and chore flow

## Docs

Documentation work — new docs, restructures, or doc-only refactors of existing content. Conventional commit prefix: `docs:`. The flow is **tiered**; a docs initiative never reroutes to `feature` or `refactor` just because it grows — it stays `docs` and scales up within this flow.

**Single-session docs (default).** Flow: **Backlog → Execution → Done.** No Discovery, no Plan. Most docs work lands here.

**Multi-effort docs initiative.** Use when the work has structural decisions about the doc set and clearly exceeds one session. Flow: **Backlog → Concept write-up → Plan → Execution per effort → Done.**

- **No Discovery doc.** Generative docs *discover-at-write* — the act of writing an architecture page is the act of exploring that subsystem, so per-doc design cannot be usefully pre-specified. Design rationale is worked out in the Plan session and recorded in the plan's "Decisions Ratified in Planning."
- **The plan uses the docs-initiative format** (`templates/docs-plan.md` in this skill folder): a per-effort breakdown (Scope / Deliverables / Dependencies) plus a sequencing DAG, instead of the code-oriented Phase → Commit → Task structure — per-file edits can't be pre-specified for discover-at-write work.
- **Effort pacing follows efforts.md:** small efforts execute straight from the overview plan; large or design-heavy efforts get their own lightweight Plan session.

## Chore

Mechanical maintenance — dependency bumps, tooling config, formatting passes, cleanup. No design decisions. Single execution session. Flow: **Backlog → Execution → Done.** Conventional commit prefix: `chore:`.

If a chore turns out to require design (e.g. "bump this dep" reveals an API change that needs a refactor), stop and reroute, same as bugfix promotion (see bugfix-flow.md).

## Pre-Merge Checklist

Minimal for single-session docs and chores: no senior-engineer code review pass for docs-only changes; remove the entry from `dev_journals/planned-work.md`, and if the row was planted from a seed, move `seeds/<ID>-*-seed.md` with `git mv` into `dev_journals/initiatives/_completed/<ID>-<name>/`. Multi-effort docs initiatives run the standard checklist with `/gestalt:initiative-close <ID>` (feature-flow.md), minus the code review when no code changed.

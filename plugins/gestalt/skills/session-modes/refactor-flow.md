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

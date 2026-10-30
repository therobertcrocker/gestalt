# Refactor flow

## 5 — Refactor Flow

Refactor work uses the same three modes as feature work, but with significant deltas. The deltas exist because of one structural asymmetry:

> **Feature artifacts invent future structure.** They are *authoritative* — code is changed to match the doc.
>
> **Refactor artifacts describe existing structure.** They are *descriptive* — the doc is a snapshot of code that may have shifted since it was written.

This asymmetry drives every difference below. It also sets the stance for every refactor session: treat the upstream artifact as a hypothesis, not an authority, and spot-check its claims against current source before building on them. In Discovery, walk every purported instance of a pattern through end to end in source before naming it; method-name similarity is not pattern similarity. In Plan, when a rule appears like "only X may do Y" or "this file is exempt from convention Z", challenge it in the same turn: an exception rule is evidence the convention is broken. In Execution, before a phase, walk the diff mentally and ask of each new or changed function whether it takes what it needs and no more.

### Discovery (0–1 sessions; often skippable)

Refactors usually start with a known target shape — "convert every handler to the registry pattern," "replace the string field with a struct," "rename one package." If the target shape is describable in a paragraph, **skip Discovery entirely** and go straight to Plan.

Discovery fires for a refactor only when:
- The target pattern itself needs investigation (e.g. "what should the sub-packages look like?")
- An audit is needed before any target can be chosen
- Multiple incompatible target shapes are on the table

When Discovery does fire for a refactor, it's audit-first rather than design-first: inventory the current state, classify divergences from the candidate target(s), then decide on the target. The discovery doc emphasizes *findings* (what's there now) over *invention* (what should be).

### Plan (1 session)

The refactor plan describes the **target pattern** and lists the **units** to convert (one sub-engine, one package, one struct, etc.). It does not write a step-by-step recipe per unit.

Why: recipes drift. Each unit's current state is slightly different and changes as the work progresses. A pattern is stable; a recipe rots.

Phases are scoped smaller than feature phases — typically one unit per phase. This keeps each execution session focused on a single conversion, with the re-grounding step (below) bounded to that unit's code.

### Execution (N sessions, mandatory re-grounding per unit)

Scope follows session-discipline.md, Execution scope: one phase, which is typically one unit. Every unit opens with a **re-grounding step:**

1. Read the current state of the unit being converted
2. Verify it still matches what the plan assumed
3. If it has drifted, update the plan before coding

Skipping re-grounding is the most common refactor failure mode. The plan was written against a snapshot; the snapshot decays; coding against the stale snapshot produces broken or out-of-date conversions.

After re-grounding:
- Apply the target pattern to the unit
- Commit with conventional commit format (typically `refactor:`)
- If the conversion surfaces a structural problem the plan didn't anticipate, pause and discuss before proceeding

### Deferred Refactors

Sometimes a refactor is scoped but not executed immediately — for example, when new code is added during a feature initiative that "should" follow the target pattern but the refactor hasn't shipped yet. In that case, **new code matches the existing (imperfect) pattern, not the target.** Mixed state is worse than uniform pre-refactor state. The refactor will later catch the new code along with everything else.

### Pre-Merge Checklist

Same as Feature Flow — see feature-flow.md.

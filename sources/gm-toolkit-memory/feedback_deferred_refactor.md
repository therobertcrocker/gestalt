---
name: feedback-deferred-refactor
description: "when a structural refactor is deferred, new code introduced in the meantime should match the existing imperfect pattern, not the target pattern"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 7a38e5f5-fe6f-47f0-9159-18876bd83dba
---

When a structural refactor is deferred (e.g., the sub-engine alignment work scheduled after the asset movement redesign), new code introduced in the meantime should match the **existing** pattern, not the **target** pattern. Pre-positioning new code in the target structure while existing code stays unchanged creates a mixed state that is strictly worse than uniform-with-the-current-state.

**Why:** Surfaced during the asset-movement sub-engine shape note in `docs/implementation/asset-movement-redesign-effort-2-plan.md`. Initial impulse was to place the new `transportStepHandler` in the target `ability/steps/` sibling package, anticipating the alignment refactor. Realized this would leave `factionTestStepHandler` inline and `transportStepHandler` external — a mixed inline/sibling state worse than the current uniform-inline asymmetry. The deferred refactor will move all remaining handlers as a single unit, which is cleaner.

**How to apply:** Whenever a planning doc or shape catalog points at a target structure but the migration is staged for later, default to keeping new code structurally uniform with the current state. The catalog informs *what we're aiming for*; the right action *during* the deferral is to keep the asymmetry small. Pre-staging is only correct if the refactor lands together with the new code, not before or after. See [[feedback-yagni]] and [[feedback_session_modes]].

---
name: feedback-refactor-reground
description: "For refactor work, each session must verify the prior artifact's claims against current source code before building on them; the description may have drifted"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d0011d8b-d7c5-4611-9e18-eb1b882b32df
---

For refactor work, the discovery/plan/execution phasing carries a hidden risk that doesn't exist in feature work: every artifact describes **existing code**, and the description can drift from reality. Each downstream session reads the artifact, not the source, and compounds any drift.

**Why:** On the sub-engine alignment refactor, the discovery labeled `action` and `hooks` together as "Shape 2 open-ended" based on a shared method name; a side-by-side read of `action/action.go` and `hooks/registry.go` would have shown they share nothing else mechanically. The plan inherited that label, extended action's bootstrap pattern (which takes `*engine.Engine` for good reason) to tag/goal/ability (which don't need it), and codified "only `foo/foos/register.go` may import engine" as a convention. Phase 1.1 of execution landed under that convention. The smell wasn't caught until Phase 2.1 — *because Robert was the one in contact with the code at that point, not the plan*. The pattern: features sessions can trust upstream artifacts because the reality doesn't yet exist to drift from; refactor sessions cannot.

**How to apply:**
- When the work is a refactor (not a new feature), at the start of each Discovery/Plan/Execution session, treat the upstream artifact as a *hypothesis*, not authority. Spot-check its claims against current source before building on them.
- Discovery sessions on refactors: before naming a shape, pattern, or category, walk every purported instance through end-to-end in source. Method-name similarity is not pattern similarity.
- Plan sessions on refactors: when a rule appears like "only X may do Y" or "this file is exempt from convention Z," challenge it in the same turn. Exception rules are evidence the convention is broken, not a principled accommodation.
- Execution sessions on refactors: before starting a phase, walk the proposed diff mentally — for each new or modified function, ask "does it take what it needs and no more?" This is a cheap pre-phase check (~5 min).
- See related: [[feedback-verify-before-suggesting]] (read code before suggesting), [[feedback-implementation-efficiency]] (read less when writing from a clear spec — the refactor caveat lives there).

This memory is specifically about **refactors**, not features. Feature work's discovery → plan → execution discipline doesn't have this failure mode because the reality the artifact describes doesn't yet exist.

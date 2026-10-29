---
name: avoid-type-aliases
description: Robert generally avoids Go type aliases as a cycle-breaking or re-export tool; prefer real package boundaries instead
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 3d60ef12-97fc-469c-9ea3-de8ec194d17d
---

When facing an import cycle or a need to re-export a type at the parent package, prefer creating a real sibling/types package over Go type aliases (`type X = pkg.X`).

**Why:** Robert stated this preference explicitly during the Phase 3.2 design of the goal sub-engine refactor when choosing between Option 1a (real types package, callers reference `locks.GoalLock` directly) and Option 1b (types package with alias `type GoalLock = locks.GoalLock` so callers keep saying `goal.GoalLock`). He went with 1a despite the larger blast radius across external callers. Aliases hide the real layering and make tooling/refactors harder to reason about.

**How to apply:** When proposing cycle-resolutions or re-exports, lead with the no-alias option. Type aliases are not banned — if a case comes up where the alias is genuinely the better trade-off, flag it and let Robert decide — but the default is "extract a real package and update callers." Relates to [[feedback_yagni]] (no extra layers without a present-day reason) and the [[feedback_decisions_log_scope]] discipline of recording ratified-during-implementation choices.

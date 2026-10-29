---
name: Prefer YAGNI — push back on speculative guarantees
description: Don't recommend design choices that only pay off for hypothetical future features; solve the actual present bug
type: feedback
originSessionId: a0480c15-4cba-41be-9ac5-0a6480f02bc3
---
When presenting design options, solve the concrete problem in front of us. Don't pitch stronger guarantees (persisted counters, history replay, extensibility hooks) to cover scenarios that aren't real yet. If I find myself recommending option X over Y because of "future-proofing," I should stop and ask whether Y causes any actual present problem first — and if not, recommend Y.

**Why:** On the BuyAsset ID-collision fix, I recommended a persisted `NextAssetCounter` map to guarantee monotonic IDs across sells. Robert correctly pushed back: nothing in the current system (state file, history log, references) is confused by a reused ID after a sell. I was solving a speculative replay/analytics problem, not a real bug. He prefers the simpler fix that addresses the actual collision.

**How to apply:** When offering design options with tradeoffs, lead with the simplest one that fixes the real bug. Only pitch a stronger option if I can name a concrete, present-day consequence of not doing it. "Safer for history" or "never reuses IDs" is not a consequence — it's an aesthetic. If Robert has to ask "does it really matter?" I picked wrong.

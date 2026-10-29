---
name: Don't write project-state memories
description: Project state memories decay fast and are redundant with docs; only write feedback/preference memories
type: feedback
originSessionId: 2bae8af4-45eb-418c-a7b5-84f8b7024400
---
Don't save project state to memory (what's complete, what's next, plan written, audit results, design decisions from a specific session).

**Why:** Project state decays fast and is actively misleading when stale. The docs are more authoritative — CLAUDE.md already instructs reading relevant docs before any feature work. A stale memory is worse than no memory.

**How to apply:** Only write memories for feedback/preference/behavioral rules — things a future session would get wrong without them. If the information lives in a doc in the repo, don't duplicate it in memory. When in doubt, skip the memory write.

---
name: Return errors rather than dispatch to observer
description: Prefer returning errors from internal packages over passing observer/reporter interfaces
type: feedback
originSessionId: 9f660002-00ef-4900-a160-05b5e1aabdec
---
When an internal package (e.g. `dispatch/`) encounters an error condition, return it as a Go error rather than accepting an observer or reporter interface to call.

**Why:** Keeps sub-packages dependency-free and lets the caller (the orchestrator) decide what to do with the error — including forwarding it to the observer. Accepting an observer interface in a sub-package creates unnecessary coupling and was rejected in favor of `([]domain.Mutation, error)` return on `dispatch.MutationReactors`.

**How to apply:** Any time a new internal package needs to signal an error, default to returning it. Only accept an observer/callback parameter if the package genuinely needs to fire multiple out-of-band events (not just signal failure).

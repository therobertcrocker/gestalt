---
name: feedback-two-channel-logger
description: Sub-engines use a two-channel logger design (field + parameter)
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 94fc1cbd-e001-4084-a092-708136d2a4e5
---

Sub-engine logger surface is two-channel: a `log *slog.Logger` *field* on the engine struct (base logger, no cascade attrs) **and** a `log *slog.Logger` *parameter* on methods called from the orchestrator (enriched with `turn`/`faction`/`phase`/`engine` cascade attrs).

**Why:** The engine struct is shared across all factions and cycles, so the field can't be mutated per call (race + context leakage). The parameter is the per-call enriched view; the field exists for sub-engine-internal lines that have no orchestrator context (startup, registration, future internals). Robert confirmed this design at Commit 4 implementation time even though the field is currently unused — capability is intentional, not vestigial.

**How to apply:** When adding new methods to sub-engines (`tag`, `effect`, `world`, `turn`, `goal`, `action`, `mutation`) that are called from the orchestrator: take a `log *slog.Logger` parameter (last position). For methods called internally with no orchestrator context: use `e.log` (the field). Don't propose collapsing to a single channel — it's been considered and rejected.

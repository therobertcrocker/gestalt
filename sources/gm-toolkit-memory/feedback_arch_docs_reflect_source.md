---
name: feedback-arch-docs-reflect-source
description: "architecture/docs pages must be grounded in source code, never carry claims from plans or other docs"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 94cca3b5-9b4e-49fb-954a-bb5f336e8ae3
---

Architecture pages (`docs/architecture/`) and docs generally are a *reflection* of the source of truth (the code), not a source of truth themselves. They are living documents updated to track code changes.

**Why:** A plausible-but-unverified claim in a push-surface doc (e.g. an arch page Discovery sessions trust without re-reading source) propagates silently into every decision that leans on it. Robert challenged the orchestrator pilot page with "based in fact? not assumptions or other documentation?" and an overstated claim (`Tag.ApplyAll` reads the rulebook — it doesn't, its signature takes factionState) had slipped in from the plan's prose.

**How to apply:** Every load-bearing claim in an arch/doc page must be verified against actual source read this session — signatures, call sites, struct shapes — not carried from the plan's source map, the decisions log, or other docs. Plan source maps point you at where to look; they are not the fact. Frozen-log decision numbers are acceptable as *provenance pointers* but the claim they back must be source-verified. Don't assert hard counts ("five instances") without enumerating them in code. See [[feedback_verify_before_suggesting]] and [[feedback_refactor_reground]].

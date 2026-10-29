---
name: feedback_consult_arch_docs
description: "Proactively read the relevant docs/architecture/ page before any design decision, including mid-execution ones"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c11aa5a2-4ed4-4348-8e8e-12407fcf75bf
---

Before any design decision — including mid-execution judgment calls like confirming turn-phase order — open the relevant `docs/architecture/` page (front door: `architecture-overview.md`). This is "push, not pull": don't wait until you think to look.

**Why:** In the effect-keyed-dispatch session I confirmed the goal-lock turn order against the rules doc but never opened `turn-pipeline.md`/`orchestrator.md`, which exist and cover it directly. Robert flagged that CLAUDE.md's doc-discipline table is "pull" (available, often skipped) and wanted it enforced.

**How to apply:** A `SessionStart` hook in `.claude/settings.local.json` now injects the live `docs/architecture/` page index each session — treat that injected list as a prompt to actually read the page that matches the work, not just acknowledge it exists. Verify load-bearing claims against source per [[feedback_arch_docs_reflect_source]].

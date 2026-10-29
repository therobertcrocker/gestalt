---
name: Decisions log scope — implementation only
description: Decisions-log is a frozen archive; execution-time decisions go in the plan's Decision Record (append and reconcile)
type: feedback
originSessionId: 1e295659-90ec-4d87-8b33-3c02b84c6498
---
The old decisions log (`docs/dev_journals/faction-manager/archive/decisions-log.md`) is a **frozen historical archive** — never appended (frozen in D-002 Effort 1, June 2026). The replacement process (D-002 Effort 2, 2026-06-10) is push-not-pull:

- **Execution-time decisions** (and reversals of planned decisions) land in the initiative plan's **Decision Record — Execution** section, logged before each commit (CLAUDE.md rule 7.1).
- **Contract: append AND reconcile** — when execution overrides a planned decision, log the reversal with rationale and fix the plan body so it doesn't lie.
- **Discovery decisions** stay in the discovery doc; **Plan decisions** stay in "Decisions Ratified in Planning."
- **Pre-merge promotion** (CLAUDE.md rule 8.2): architecturally-durable Decision Record entries graduate to the relevant architecture page's `Key Decisions` (`docs/architecture/`, lands D-002 Effort 3). Micro-decisions stay as plan provenance.
- **Fence-signs:** `// deliberate: X, not Y, because <reason>` one-liners at the fence in code; binding during re-grounding.

**Why:** the old log was a pull resource organized by branch/time — an axis nobody retrieves on. Decisions now live where they get read (arch pages forced open during Discovery re-grounding).

**How to apply:** never append to the frozen log. Log execution decisions in the plan's Decision Record; run the promotion step at pre-merge. Full spec: `session-modes.md` section 10, "Decision records."

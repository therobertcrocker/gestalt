---
name: feedback_plan_discipline
description: "How implementation plans are written — self-implementable detail (code not prose), written in one pass, stored in docs/initiatives/implementation/, no padded commit splits"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1d2bdcda-c2bc-49df-9b10-02be8388c99c
  modified: 2026-10-20T19:44:04.936Z
---

Four rules for implementation-plan docs.

**1. Plans are self-implementable specs — code, not prose.** Every plan (top-level or per-Effort) is written so a human can implement directly from it with no further design derivation: full method signatures with param/return types, full struct field listings, file-creation order within each commit (deps first, then consumers), channel send/receive ops spelled out, concrete error type names and message strings, and the exact lines/pseudocode wherever the design is non-obvious. **Never** use placeholders like "the execution session reads this and writes the code" — the plan *is* the spec. **Specific failure mode to avoid:** task entries as English prose summaries ("Implement X that does Y, with edge cases A and B"). Even when Shared Context already holds the types/signatures, the task body must contain the actual function-body code — control flow, the exact branches and error sites, the loops. (Test sections — TestXxx descriptions in plain language — are the only exception.) If a reader has to translate prose into code, the plan failed. **Why:** Robert may implement himself rather than delegating to an Execution session; a plan that punts concrete detail is useless to a human implementer. Length follows the plan template's two budgets (set 2026-10-20, levels model in session-modes section 4): effort-plan front matter ~400 (every phase session re-reads it), ~800 per phase (one phase = one session); no per-file or per-commit budget, overview plans have none; check them with the template's awk commands before sign-off. Past any budget, split or record why not in one line under Decisions Ratified in Planning. Spend lines on code, not prose. Cross-cutting context (struct shapes, channel types) goes in Shared Context once and is referenced from tasks, not re-derived.

**2. Plan docs are written in one go** (unlike Discovery docs, which scaffold early — see [[feedback_discovery_discipline]]). Determine Phases, Commits, and Tasks through conversation first, *then* write the implementation doc in a single pass. Building it incrementally produces worse results because the structure isn't settled until all the pieces are known.

**3. Plans live in the repo, not the harness default.** Write to `docs/initiatives/implementation/<feature>.md` (current naming pattern `<feature>-plan.md` or `<feature>.md`), not the `~/.claude/plans/` path plan mode suggests. They're project artifacts — reviewable in-tree, version-controlled, routed via the CLAUDE.md table. Confirm the filename with Robert if uncertain.

**4. No padded commit splits.** Each commit = one shippable, reviewable unit — not "one file per session" or pairs grouped for symmetry. When sizing commits, ask "could a reviewer hold this and the next commit in their head as one unit?" If yes, merge them. Only split at a real seam — type-system boundary, cross-package surface, behavioral inflection point, or a place where build/test must be green between the two halves. Default toward fewer, more substantive commits; commits split only at real seams, never to hit a size. Sessions are sized by phase, not commit. Robert pushed back when a campaign-manager plan landed at 6 commits where 3 would do (two pairs split for symmetry inside one package / under one Cobra parent). Extra commits add session-ceremony and re-grounding cost for no review benefit.

Related: [[feedback_session_modes]], [[feedback_discovery_discipline]], [[feedback_yagni]] (don't structure for hypothetical reviewer needs).

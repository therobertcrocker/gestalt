---
name: feedback_discovery_discipline
description: "How Discovery docs are written and scoped — full doc even within an arc, scaffold early, Open Questions are genuine deferrals only, don't update post-completion"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1d2bdcda-c2bc-49df-9b10-02be8388c99c
---

Four rules for Discovery docs, all surfaced by Robert correcting me mid-Discovery.

**1. A per-initiative Discovery within an arc is still a FULL Discovery doc, not a thin one.** "Lighter" (session-modes section 8) means *arc-level decisions are not re-litigated* — it does **not** mean the doc is short or skeletal. The doc must be substantive enough that the per-initiative Plan can be derived from it. Write it to full Discovery quality (Problem, Design Summary, Per-Area Design Details, decisions, Out of Scope, etc.); skip only sections the arc-discovery already covers (framework rationale, top-level architecture). Robert called this out when I proposed a "Standard scope" with skim-only sketches — the arc-plan is a layer *above* per-initiative Discovery, not a replacement for it.

**2. Scaffold the doc file early; fill sections as decisions land.** At the start of a Discovery session (after the reflect-back + first directional question), create the doc from `docs/process/templates/discovery.md` at its real location (per [[feedback_plan_discipline]]) and fill the Problem / Design Summary / Open Questions skeleton with what's already known from arc-discovery/arc-plan/planned-work. As each design point is settled in conversation, edit the relevant section — Robert sees the doc grow in real time. The doc is the working surface, not an end-of-session transcript dump; the final pass is polish, not first-draft synthesis. (This early-scaffold rule is **Discovery-only** — Plan docs are written in one go; see [[feedback_plan_discipline]].)

**3. Open Questions are for genuine deferrals to Plan, not a parking lot for design points Discovery should resolve itself.** Only list an item as an Open Question if (a) deferring it has real branching cost AND (b) there's a principled reason to defer (depends on context that emerges in Plan/Execution). Design choices Discovery can settle should be surfaced interactively (AskUserQuestion or focused prose) and ratified in the doc as **Decisions**. Robert flagged this when I listed adapter-shape / dry-run-gating / cadence-plumbing as Open Questions: "Should these be questions you are asking me now?"

**4. Don't update Discovery docs after the feature ships.** They're planning artifacts (`docs/initiatives/discovery/*.md`) — rewriting them post-completion is overhead with no value. Skip any "rewrite discovery doc" step in a spec; only update the dev-journal, planned-work, and tracking journals. Post-implementation decisions belong in the plan's Decision Record (see [[feedback_decisions_log_scope]]).

Related: [[feedback_session_modes]], [[feedback_interactive_questions]], [[feedback_plan_discipline]].

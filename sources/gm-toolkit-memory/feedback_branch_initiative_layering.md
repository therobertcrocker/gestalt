---
name: feedback_branch_initiative_layering
description: "Multi-initiative feature branches — pre-merge checklist is branch-level, refactors live as wip commits (no sub-branches)"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 645b13c0-eae8-4e67-8fdf-30d9273e11db
---

On `feature/movement-redesign` (and feature branches generally), multiple initiatives can be layered as sequential wip commits. The pre-merge checklist runs once, at the branch level, after all initiatives on the branch are complete — not after each individual initiative lands.

**Why:** Refactors and sub-initiatives are enabling work for the top-level feature. They aren't independently shippable, so there's no meaningful boundary to review or merge at. Sub-branches add overhead (branch management, merge commits, per-initiative checklists) without benefit.

**How to apply:** When a refactor or sub-initiative lands mid-branch, commit it as `wip:` and continue. Do not trigger the pre-merge checklist or suggest sub-branch workflows. Only surface the checklist when the top-level feature is complete.

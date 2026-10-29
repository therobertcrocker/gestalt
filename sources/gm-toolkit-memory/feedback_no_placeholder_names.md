---
name: feedback-no-placeholder-names
description: avoid foo/foos/bar placeholder names in prose about real codebase conventions; reference real packages instead
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 7a38e5f5-fe6f-47f0-9159-18876bd83dba
---

In prose that describes a structural convention in the codebase, do not use placeholder package names like `foo/foos/` or `hooks/hookz/`. Use actual existing or proposed package names from the codebase (e.g., `action/actions/`, `tag/tags/`).

**Why:** Robert flagged the `foo/foos/` style as "silly" in the sub-engine shapes convention. The codebase has real examples that read more clearly than abstract placeholders, and the placeholder style sounds ceremonial.

**How to apply:** When writing convention statements in prose, reference the existing real subpackages. Placeholders remain appropriate in *generic contract code blocks* (Shape 2 spec, interface examples) — those are intentional abstractions and don't have the same problem. The rule is about prose-about-real-codebase, not about generic templates. See [[feedback-code-style]] for parameter-naming counterpart.

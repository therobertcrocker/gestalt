---
name: feedback_block_keyword
description: "Spatial Mermaid diagrams use bare `block`, not `block-beta`, in this project"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 5f8240bf-a727-4811-85c5-36f4c343afaf
---

When authoring spatial Mermaid diagrams in `docs/architecture/`, declare them with bare `block`, **not** `block-beta` — even though `docs/process/diagram-kit.md`'s gotchas section says to use `block-beta`.

**Why:** The diagrams that ship (e.g. the seam diagram in `architecture-overview.md`) and the kit's own reference example both use bare `block`, and that is what renders correctly where Robert reads them. Robert's explicit call.

**How to apply:** Use `block` as the top-level declaration for every spatial diagram. Don't go back and rewrite existing `block-beta` occurrences unless asked — just author new ones as `block`. See [[feedback_diagram_authorship]].

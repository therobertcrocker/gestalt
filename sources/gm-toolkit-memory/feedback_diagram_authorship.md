---
name: feedback_diagram_authorship
description: "Claude drafts diagrams off the committed diagram kit; Robert reviews layout/taste. (Reverses the earlier 'hand-author only' stance.)"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 97c4387c-a568-4944-8374-ed126a410963
---

When a doc needs a diagram, **draft it** using the committed kit at `docs/process/diagram-kit.md`. Robert reviews the result (in a live Mermaid preview) and steers layout/taste; the first-pass authoring is Claude's.

**Why:** This reverses an earlier "Robert hand-authors, don't generate Mermaid" stance. That blocker existed because a naive pass pushed everything through `flowchart`/dagre, which fought the desired composition (nested subgraphs sprawl, `direction` ignored inside connected subgraphs, back-edges tangle). The fix wasn't "stop authoring" — it was **picking the right diagram type for the content shape**, which the kit now codifies. With the kit, drafting is reproducible and Robert's role drops to review.

**How to apply:**
- Read `docs/process/diagram-kit.md` first. Choose the type by topology: **spatial → `block-beta`**, **flow → `flowchart`/dagre**, **cyclic/cross-actor → ELK flowchart or `sequenceDiagram`**. Don't force one type on everything.
- Use the kit's palette (Catppuccin Frappé, subdued semantic fills), the copy-paste style headers, and patterns (full-height span via nesting-inversion; saturated blocks = entities + muted block-arrows = motion; **neon-pink `#ff2e97` edges on flowcharts**).
- Present the draft for Robert's review; iterate on his layout/taste calls rather than deciding them. Same review dynamic as [[feedback_dislikes_ui_work]] — he owns the visual call, but here Claude produces the first pass.
- **Verify new syntax in the open-source renderer** (mermaid.live or the IDE preview), not a proprietary editor: `layout: fixed` only works in mermaid.ai, and declare `block-beta` (not bare `block`) so GitHub renders it. Diagrams stay inline Mermaid, never image files.

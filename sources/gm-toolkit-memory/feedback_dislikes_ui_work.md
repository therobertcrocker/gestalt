---
name: feedback_dislikes_ui_work
description: "Robert dislikes doing UI work himself; don't hand him UI tasks to implement"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 3621fd87-2ed1-4b95-a764-225b289b639f
---

Robert doesn't like doing UI/view-layer work. When a "Learn by Doing" contribution or any implementation slice falls on UI code (overlays, huh forms, lipgloss layout, view rendering), don't hand it to him — implement it yourself.

**Why:** He'd rather own design/logic decisions than write view plumbing; offering him a UI slice (e.g. the `reinforceLimit` validator-cap helper in an overlay) gets handed straight back.

**How to apply:** For UI-layer code, just implement it from the spec. Reserve any collaborative "your call" contributions for engine/domain logic, data-structure, or design decisions where his input is load-bearing. See [[feedback_learn_by_doing_scope]].

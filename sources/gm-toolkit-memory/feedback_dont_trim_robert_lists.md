---
name: feedback_dont_trim_robert_lists
description: "When a set of items is Robert's call, ask about every item (extra AskUserQuestion questions if needed) and verify each claim in source first"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 66d4f937-24e6-46ac-a19b-674cc4c13909
  modified: 2026-10-23T02:59:21.072Z
---

When a plan says an item is Robert's call (e.g. "if Robert files them"), put every candidate in front of him. If AskUserQuestion's 4-options cap runs out, add another question; never drop the "smallest" items on my own judgment.

Also verify each candidate's claim against the source before offering it, not just the plan's wording.

**Why:** At the A.001.6 pre-merge I silently left two Out of Scope items unfiled to fit two questions; Robert asked why. One of them, copied from the Effort 3 plan, was wrong (relocate reads the view; the stale index read is the purchase enabler), so he approved a row for a bug that does not exist.

**How to apply:** Pre-merge backlog filing and any "Robert decides" list. Related: [[feedback_interactive_questions]], [[feedback_arch_docs_reflect_source]].

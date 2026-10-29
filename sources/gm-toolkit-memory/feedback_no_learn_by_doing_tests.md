---
name: feedback-no-learn-by-doing-tests
description: "Don't hand Robert Learn-by-Doing slices for test authoring — write the tests yourself"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c88b9cbe-0e00-48b7-b489-774bf21ecbe2
---

When scaffolding code with tests, don't reserve a test (or its assertions) as a TODO(human) Learn-by-Doing slice. Robert wants the tests written for him.

**Why:** He said "Add tests to things I don't want learn by doing for - you can take this" after I left a `WorldsWithin` assertion as a slice. Test authoring is not a collaborative-decision he wants to own.

**How to apply:** Write all tests yourself as part of the implementation. Pairs with [[feedback_dislikes_ui_work]] (UI slices also off the table) and [[feedback_learn_by_doing_scope]] — the genuinely collaborative slices are engine/logic *design* decisions in production code, not tests or UI.

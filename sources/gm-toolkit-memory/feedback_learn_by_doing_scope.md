---
name: feedback-learn-by-doing-scope
description: "Learn by Doing is opt-in — never set up a TODO(human) slice unless Robert asks for one; implement it yourself"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 79cbf371-a110-4abc-8e19-8a095ab17e3c
  modified: 2026-10-21T03:44:24.711Z
---

Do **not** offer Learn by Doing slices on your own initiative, in any session mode. Robert asks for one when he wants it ("I will let you know when I want a learn by doing", 2026-10-21, after declining a `capturedEarlier` slice in an interim-review fix session). Until then, write the code yourself, including the business-logic pieces the Learning output style would normally hand over.

**Why:** Robert finds unrequested contribution requests slow the work down; he decides when a hands-on slice is worth his time. Earlier: the `Context:` / `Your Task:` / `Guidance:` template in Discovery/Plan sessions also added bureaucratic ceremony to what is a design conversation.

**How to apply:** Ask design and rules calls through AskUserQuestion or prose, as usual (see [[feedback_interactive_questions]], [[feedback_rules_calls]]). Insight blocks (`★ Insight ─────────`) are still fine — they are notes, not requests. When Robert does ask for a Learn by Doing, use the template with exactly one `TODO(human)` in source, in code only (never tests — [[feedback_no_learn_by_doing_tests]]; never UI — [[feedback_dislikes_ui_work]]).

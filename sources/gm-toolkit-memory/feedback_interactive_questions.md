---
name: feedback-interactive-questions
description: "Use AskUserQuestion for design questions in Discovery/Plan, not prose-only prompts"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 79cbf371-a110-4abc-8e19-8a095ab17e3c
---

When asking Robert to choose between multiple discrete options in Discovery or Plan sessions, use the `AskUserQuestion` tool to present them as interactive selections — not prose bullet lists with "what's your call?" at the end.

**Why:** Robert prefers the interactive selection UI for picking between options. Prose-only questions force him to type out an answer that could have been a single click, and they bury the choices in narrative. Interactive questions surface the decision crisply and capture the answer cleanly.

**How to apply:** Whenever a design question reduces to "pick one of N options" (or a small multi-select), reach for `AskUserQuestion`. Keep the labels short (1–5 words) and put the trade-off in the `description`. Multiple related questions can go in a single tool call (up to 4). Still pair with prose insight/framing in the response — the interactive prompt is the *ask*, not a replacement for explanation. Open-ended "what do you think about X?" questions stay conversational. See also [[feedback_learn_by_doing_scope]] — Discovery questions are conversational *in framing* but the choice itself should be a clickable prompt.

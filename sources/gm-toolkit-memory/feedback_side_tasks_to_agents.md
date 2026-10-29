---
name: feedback-side-tasks-to-agents
description: "Side tasks inside a design session (PDF extraction, building reference data, audits) go to a separate agent to keep the main context clean"
metadata:
  node_type: memory
  type: feedback
  originSessionId: b2e7d99a-7c18-4990-b790-b62444a66d98
  modified: 2026-10-19T22:04:51.444Z
---

When a side task comes up inside a main session (extracting a PDF, building a reference
table, a bulk data audit), run it on a separate agent, not inline. Bring back only the
findings the main task needs.

**Why:** Robert said so during the A.001.6 Discovery (2026-10-19), after I extracted the
SWN asset PDF inline. The extraction filled the design session's context with data that
did not serve the design work.

**How to apply:** This is a standing request to spawn, so it overrides the default
"don't spawn unless asked". Bulk reading or transcription → delegate with a
self-contained prompt. Design reasoning, and decisions that need the main conversation's
context, stay inline. Related: [[feedback-implementation-efficiency]].

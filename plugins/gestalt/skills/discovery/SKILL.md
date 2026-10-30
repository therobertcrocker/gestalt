---
name: discovery
description: Start a Discovery session for one initiative, by its tracker ID. Run by hand at the start of the session.
disable-model-invocation: true
argument-hint: "[ID]"
---

Start a Discovery session for initiative `$0`. Mode: Discovery. The session ends when the discovery doc is written and Robert has signed off; do not begin planning.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md` and the flow file for the ID's type prefix, from the same folder.
2. Read the `$0` row and its write-up in `docs/planned-work.md`. If there is no row, or the row is not in Current Initiatives, say so and stop; promotion is Robert's call.
3. If the initiative is inside an arc, read the arc's concept, arc-discovery and arc-plan under `docs/initiatives/arcs/`: In Plain Words first, then the decisions and the open questions routed to this initiative.
4. If `docs/architecture/` exists, read `architecture-overview.md` and the page that covers the area; their Key Decisions are binding.
5. If `docs/initiatives/discovery/$0-*-discovery.md` exists, read it and continue from its state. Otherwise scaffold it from `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/discovery.md` at `docs/initiatives/discovery/$0-<kebab-name>-discovery.md`, and fill Problem, Design Summary and Open Questions with what the tracker and the arc already say.
6. Reflect back in plain words: what the initiative is, what is already known, what is open. Then ask one directional question. Do not propose designs yet.

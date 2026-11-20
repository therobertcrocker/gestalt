---
name: discovery
description: Start a Discovery session for one initiative, by its tracker ID. Use when Robert asks for a Discovery session for an ID. Never use it to change modes in a session that is already running.
argument-hint: "[ID]"
---

Start a Discovery session for initiative `$0`. Mode: Discovery. The session ends when the discovery doc is written and Robert has signed off; do not begin planning.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md` and the flow file for the ID's type prefix, from the same folder.
2. Read the `$0` row and its write-up in `dev_journals/planned-work.md` (in a multi-product project, every `dev_journals/` path here reads `dev_journals/<product>/`). If there is no row, or the row is not in Current Initiatives, say so and stop; promotion is Robert's call.
3. Check the branch. If on `main`, cut `feature/<initiative-name>` before writing anything; every session of the initiative runs on it.
4. If the initiative is inside an arc, read the arc's concept, arc-discovery and arc-plan under `dev_journals/initiatives/arcs/`: In Plain Words first, then the decisions and the open questions routed to this initiative.
5. If `docs/architecture/` exists, read `architecture-overview.md` and the page that covers the area; their Key Decisions are binding.
6. If `dev_journals/initiatives/discovery/$0-*-discovery.md` exists, read it and continue from its state. Otherwise scaffold it from `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/discovery.md` at `dev_journals/initiatives/discovery/$0-<kebab-name>-discovery.md`, and fill Problem, Design Summary and Open Questions with what the tracker and the arc already say.
7. Reflect back in plain words: what the initiative is, what is already known, what is open. Then ask one directional question. Do not propose designs yet.

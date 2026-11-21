---
name: discovery
description: Start a Discovery session for one initiative, by its tracker ID. Use when Robert asks for a Discovery session for an ID. Never use it to change modes in a session that is already running.
argument-hint: "[ID]"
---

Start a Discovery session for initiative `$0`. Mode: Discovery. The session ends when the discovery doc is written and Robert has signed off; do not begin planning.

If `$0` is a refactor (`R.`), say that a refactor has no Discovery and stop. Name `/gestalt:audit $0` when the target shape needs an audit, or `/gestalt:plan $0` when it can be stated in a paragraph (`refactor-flow.md`).

If `$0` is a bare arc ID (`A.` and three digits, such as `A.001`), say that an arc's Discovery is its arc-discovery, name `/gestalt:arc-discovery $0` and stop. An initiative inside an arc (`A.001.4`) runs here as usual.

1. Read `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md` and the flow file for the ID's type prefix, from the same folder.
2. Read the `$0` row and its write-up in `dev_journals/planned-work.md` (in a multi-product project, every `dev_journals/` path here reads `dev_journals/<product>/`). If there is no row, or the row is not in Current Initiatives, say so and stop; promotion is Robert's call. If the write-up points at a seed, read it, `dev_journals/initiatives/seeds/$0-*-seed.md`: In Plain Words first, then the rest. It is the initiative's Concept. If the row or the write-up names an exploration, read it, `dev_journals/initiatives/explorations/<E.ID>-*-exploration.md`: In Plain Words, the Recommendation, then the rest. It counts as the audit: the Discovery starts from it and does not redo the audit or the choice of direction. Lighter, never skeletal.
3. Check the branch. If on `main`, cut `feature/<initiative-name>` before writing anything; every session of the initiative runs on it.
4. If the initiative is inside an arc, read the arc's seed, `dev_journals/initiatives/seeds/<arc-ID>-*-seed.md`, and its arc-discovery and arc-plan under `dev_journals/initiatives/arcs/` (an arc from before seeds has its concept doc there in place of the seed): In Plain Words first, then the decisions, the success criteria the arc-plan gives this initiative, and the open questions routed to it.
5. If `docs/architecture/` exists, read `architecture-overview.md` and the page that covers the area; their Key Decisions are binding.
6. If `dev_journals/initiatives/discovery/$0-*-discovery.md` exists, read it and continue from its state. Otherwise scaffold it from `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/discovery.md` at `dev_journals/initiatives/discovery/$0-<kebab-name>-discovery.md`, and fill Problem, Design Summary and Open Questions with what the tracker, the seed and the arc already say. Draft the Design Spec; in an arc, start from the criteria the arc-plan gives this initiative (`session-discipline.md`, Design Spec).
7. Reflect back in plain words: what the initiative is, what is already known, what is open. Then ask one directional question. Do not propose designs yet. Ratify the Design Spec's Success Criteria with Robert before any design point is settled; the design answers to them.

---
name: arc-discovery
description: Start the Arc-Discovery session of one arc, by its A. ID - the arc's success criteria and the decisions that bind every initiative in it, read from the arc's seed and written on the arc's own branch. Use when Robert asks for an arc's Discovery. Never use it to change modes in a session that is already running.
argument-hint: "[A.ID]"
---

Start the Arc-Discovery session of arc `$0`. Mode: Arc-Discovery. The session ends when the arc-discovery doc is signed off and committed; do not begin Arc-Plan. The arc-discovery ratifies the arc's success criteria and the decisions that bind every initiative in it; it does not slice the arc into initiatives. It runs on Fable (code-and-docs rules, Model selection).

A **stop** waits for Robert. Between stops, go on without asking.

1. **The address.** `$0` is a bare arc ID: `A.` and three digits, such as `A.001`. If it is an initiative inside an arc, such as `A.001.4`, name `/gestalt:discovery $0` and stop. Any other ID: say so and stop. In a multi-product project, every `dev_journals/` path below reads `dev_journals/<product>/`; when the product is not clear from the session, ask.
2. **Read** `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `lifecycle.md` and `arcs.md` in the same folder, and the template `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/arc-discovery.md`.
3. **The row.** Find `$0` in Current Initiatives in `dev_journals/planned-work.md`. If there is no row, or it is not there, say so and stop: promotion is Robert's call.
4. **The seed.** Read the arc's seed, `dev_journals/initiatives/seeds/$0-*-seed.md`: In Plain Words, Vision, Problem, Why an Arc, Candidate Initiatives and any proposed Success Criteria, then the rest. An arc from before seeds has its concept doc, `dev_journals/initiatives/arcs/$0-*/$0-*-arc-concept.md`, in place of the seed; read that. If there is neither, say that an arc starts from its seed, name `/gestalt:seed write <arc-name>` and then `/gestalt:seed plant <arc-name> $0`, which attaches the seed to this row and adds no new one, and stop.
5. **Branch.** `git status --porcelain` prints nothing; if it prints, show it and stop: the session's commit uses `git add -A`, so that work would ride in it. On `main`, check out `feature/<arc-name>` if it exists (an earlier arc-discovery session cut it), or cut it if it does not, before anything is written; the arc-discovery and the arc-plan both run on it, and `/gestalt:arc-plan` merges it. On `feature/<arc-name>`, go on. On any other branch, say so and stop.
6. **Architecture.** If `docs/architecture/` exists, read `architecture-overview.md` and the pages the arc touches; their Key Decisions are binding.
7. **The doc.** If `dev_journals/initiatives/arcs/$0-<arc-name>/$0-<arc-name>-arc-discovery.md` exists, read it and continue from the state its header gives. Otherwise copy the template there, and fill Problem, Design Summary and a first draft of the Design Spec from the seed.
8. **Start.** Reflect back in plain words: what the arc is, what the seed already says, what is open. Then ask one directional question. Do not propose designs yet. Ratify the Success Criteria with Robert before any arc decision is written; the decisions answer to them.
9. **Sign-off.** When the doc is complete, **stop:** Robert signs off, or says what to change; edit until he signs off. Then set the header's Status, `git add -A`, and make one commit with the subject `docs: $0 arc-discovery` and the session's attribution lines.
10. **The end.** Name the next step: `/gestalt:arc-plan $0`, in a new session.

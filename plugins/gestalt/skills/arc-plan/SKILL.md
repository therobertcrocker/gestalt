---
name: arc-plan
description: Start the Arc-Plan session of one arc, by its A. ID - the arc cut into initiatives with their order and boundaries, then the tracker rows written and the arc's branch merged into main, behind two stops. Use when Robert asks for an arc's plan. Never use it to change modes in a session that is already running.
argument-hint: "[A.ID]"
---

Start the Arc-Plan session of arc `$0`. Mode: Arc-Plan. The session ends when the tracker rows are committed and `feature/<arc-name>` is merged into `main`, or when Robert declines the merge. The arc-plan cuts the arc into initiatives, sets their order and boundaries, and gives every open question an owner. It is the one session starter that merges. It runs on Fable (code-and-docs rules, Model selection).

A **stop** waits for Robert. Between stops, go on without asking.

1. **The address.** `$0` is a bare arc ID: `A.` and three digits, such as `A.001`. If it is an initiative inside an arc, such as `A.001.4`, name `/gestalt:plan $0` and stop. Any other ID: say so and stop. In a multi-product project, every `dev_journals/` path below reads `dev_journals/<product>/`; when the product is not clear from the session, ask.
2. **Read** `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `lifecycle.md` and `arcs.md` in the same folder, and the template `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/arc-plan.md`.
3. **Inputs.**
   - The `$0` row in Current Initiatives in `dev_journals/planned-work.md`. If there is no row, or it is not there, say so and stop.
   - The arc's seed, `dev_journals/initiatives/seeds/$0-*-seed.md`. An arc from before seeds has its concept doc, `$0-*-arc-concept.md`, in the arc folder in place of the seed; read that.
   - The arc-discovery, `dev_journals/initiatives/arcs/$0-*/$0-*-arc-discovery.md`: In Plain Words, the Design Spec, the arc decisions and the routed open questions, then the rest. If there is none, or its header does not say it is signed off, name `/gestalt:arc-discovery $0` and stop.
4. **Branch.** `git status --porcelain` prints nothing; if it prints, show it and stop. On `feature/<arc-name>`, go on. On `main`, check out `feature/<arc-name>` if it exists, or cut it if it does not (an arc-discovery made before arcs had a branch is already on `main`). On any other branch, say so and stop.
5. **Architecture.** If `docs/architecture/` exists, read `architecture-overview.md` and the pages the arc touches; their Key Decisions are binding.
6. **The doc.** If `dev_journals/initiatives/arcs/$0-<arc-name>/$0-<arc-name>-arc-plan.md` exists, read it and continue from the state its header gives. Otherwise copy the template there.
7. **Settle.** With Robert, one call at a time: the initiatives, their order and dependencies, the boundary of each, the routing of every open question, the initiative that carries each success criterion, and the tracker rows. Propose each ID: a new initiative takes `<arc-ID>.<n>` in run order; one that existed before the arc keeps its ID. Then write the doc.
8. **Rows.** **Stop:** Robert signs off the doc and approves the tracker rows, with the table and the trigger of each. Then add each row to its table (`lifecycle.md`), with a link to the arc-plan at the end of its Detail. Do not edit the `$0` row or its write-up; they are frozen until the arc closes. Set the header's Status, run the gate (the project's `CLAUDE.md`), `git add -A`, and make one commit with the subject `docs: $0 arc-plan` and the session's attribution lines.
9. **Merge.** Write the merge message file with the Write tool in the scratchpad: the subject `docs: $0 <arc name> arc docs`, with the arc name in plain lower-case words, a blank line, the arc-plan's In Plain Words as the body, and the session's attribution lines. **Stop:** Robert approves the merge. Then:
   ```sh
   git checkout main && git merge --no-ff feature/<arc-name> -F <message file>
   ```
   If the merge conflicts, run `git merge --abort`, show the conflicting files and stop. The branch changes docs only: no code review and no tag. Do not push or delete the branch.
10. **The end.** Name the next step from the arc-plan's What Comes Next. Do not promote any row; promotion is Robert's call (`lifecycle.md`).

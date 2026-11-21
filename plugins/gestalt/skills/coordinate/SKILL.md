---
name: coordinate
description: Run the phases of one effort in sub-agents from one long session, by a work address. One agent per phase, then a review with Robert and one fix commit. Use when Robert asks to coordinate an effort or to run it under the coordinator. Never start it from inside a sub-agent.
argument-hint: "[ID][.E<n>]"
---

Coordinate the effort `$0`. Mode: Coordinator run. One run is one effort. The session ends when the effort's last phase is signed off. The coordinator does no phase work: it does not edit the code or the plan's tasks. Each phase is executed by a sub-agent of its own; the coordinator briefs it, checks its result and brings the open calls to Robert.

`$0` is a work address `<ID>.E<n>`, or a tracker ID `<ID>` for a single-file plan (`session-discipline.md`, File locations). Below, `<ID>` is `$0` up to its first `.E`, and `n` is the number after it. With `.E<n>`, the plan is effort n's own plan, `$0-*-plan.md`; without, it is the single-file plan. In a multi-effort initiative, a bare `<ID>` does not name one effort: ask which one. A phase's full address is `$0.P<p>`.

A **stop** waits for Robert. Between stops, go on without asking.

1. **Read.** `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `session-discipline.md`, `efforts.md` and the flow file for the ID's type prefix. Then, in `dev_journals/initiatives/implementation/` (under `dev_journals/<product>/` in a multi-product project): the overview plan's In Plain Words, decisions and Outside Rules, if there is an overview plan; then the plan's In Plain Words, Decisions Ratified in Planning, Decision Record, Shared Context, Outside Rules and Overview list. Then `${CLAUDE_PLUGIN_ROOT}/skills/coordinate/phase-brief.md`.
2. **Checks.** If one fails, say which one and stop.
   - This is the main session: `AskUserQuestion` is in your tool list. A sub-agent cannot ask Robert a question, and the coordinator must. In a sub-agent, say so and stop.
   - The plan is a file of its own with an Overview list. An effort that the overview plan specifies in full has no phase boxes to tick and no place for Look Here First: say so and stop; it needs a Plan session for `$0` first.
   - The session's model is Fable. If it is not, say which model it is; Robert decides whether to go on.
   - The feature branch is checked out, not `main`, and `git status --porcelain` prints nothing.
   - The gate passes: the build and test command in the project's `CLAUDE.md`.

   Note the base, the commit just before the effort's first commit, as `/gestalt:effort-close` step 3 finds it: the parent (`git rev-parse <first>^`) of the oldest commit that `git log --reverse --format='%h %s' main..HEAD | grep -E '^[0-9a-f]+ [a-z]+\(E<n>\)!?:'` lists. An effort started in an earlier session keeps its earlier phases in the briefs this way. For a single-file plan, whose commits carry no effort scope, the base is the commit that added the plan file, `git log --diff-filter=A --format=%h -- <plan file>`; every phase commit comes after it, so phases run in an earlier session stay in the briefs too. In a multi-effort plan with nothing listed, the base is `git rev-parse HEAD` before the first agent starts.
3. **The loop.** For each phase whose box is not ticked in the Overview list, in order:
   1. **Seam notes.** Read the phase's tasks against the current source. Write numbered notes: each call into older code and its side effects, each Find anchor that will not match, each shape a task expects (a signature, a field, a file) that the source no longer has, and each place an earlier phase's fix commit made the source differ from what this phase's tasks expect. Keep the notes in the conversation, not on disk.
   2. **Brief.** Fill every slot of `phase-brief.md` for this phase. The brief gives the full address `$0.P<p>`, so the agent never has to ask which phase is in scope. Leave out the parts marked for a case that does not hold.
   3. **Start.** Note the head before the phase: `git rev-parse HEAD`. Then start one agent with the Agent tool: `subagent_type: general-purpose`, `model: opus`, in the background, with the filled brief as its prompt. Keep its agent ID. Every spawn names the model.
   4. **Verify.** When the report comes, check the result yourself. Do not take the report's word for any of these:
      - The model. Every reply of the agent is on Opus. Its transcript is `~/.claude/projects/<project>/<session ID>/subagents/agent-<agent ID>.jsonl`:
        ```sh
        jq -r 'select(.type=="assistant" and .message.model != "<synthetic>") | .message.model' <transcript> | sort | uniq -c
        ```
        A `<synthetic>` record is written by the harness on an interrupt or an API error. It is not a reply.
      - The gate, run again by you.
      - A clean tree: `git status --porcelain` prints nothing.
      - The commits: `git log --format='%h %s' <head before the phase>..HEAD`. Each subject and scope is the plan's.
      - The diff, `git diff <head before the phase>..HEAD`, read against the plan's tasks and the project's rules, and against every deviation the report names. The agent wrote the code, so the diff is where its choices show: each change from the plan's shape needs a logged deviation.
      - The phase's box is ticked in the Overview list.
   5. **Review.** Give Robert the review as text: what landed, what you checked, each "needs a call" line of the report and each finding of your own, with your recommendation for each call. Then end the turn. The question block comes in the next turn, with AskUserQuestion, recommended option first. Never end a review turn with findings and no questions to follow. With nothing to decide, say so and go to the sign-off.
   6. **Stop:** Robert answers.
   7. **Fix.** Resume the same agent with `SendMessage` to its agent ID, and a short fix brief: Robert's answers, and one numbered fix per answer that changes something. The agent keeps its context and runs in the background. It makes one commit, `fix(E<n>): address phase <p> review findings`, with one bullet per fix; under a single-file plan the subject has no scope. The effort close squashes this commit into the effort commit with the phase's other commits; only the effort review fix stays separate. With nothing to fix, there is no commit and no resume.
   8. **Verify the fix commit** the same way as in step 4.
   9. **Stop:** Robert signs off the phase. Then start the next phase.
4. **The end.** When the last phase is signed off, name the next step: `/gestalt:effort-close $0` in a new session, or `/gestalt:initiative-close <ID>` in a new session for a single-file plan. Do not start it.

## How the brief hands over the phase

The brief tells the agent to call the Skill tool with `gestalt:execute` and the full address `$0.P<p>`. The `execute` skill then gives the agent its read list and its steps, so the brief does not repeat them. A `general-purpose` sub-agent can make this call; a trial showed it on 2026-11-20.

## The coordinator's three rules

- Do not edit a doc that an agent is editing. The plan belongs to the agent while it runs.
- Write nothing to disk in the repo while an agent runs. The agent's `git add -A` would sweep it up.
- Quote a source before you state a conclusion from it. This holds for the plan, the code and any fetched text. A conclusion from a source read only in part is the coordinator's most common mistake.

## Special cases

- **A two-stage phase.** When a phase needs Robert to act between two commits, the brief tells the agent to stop without committing, and the coordinator resumes it with `SendMessage` after Robert has acted.
- **The coordinator's own commits.** Anything the coordinator itself must commit lands before the effort's first commit or after its close, never between them. The unbroken-run check in `effort-close` step 3 stops on an unscoped commit.
- **The last phase.** Its brief carries the "Look here first" part of `phase-brief.md`. The agent writes `## Look Here First` into the effort's plan in the phase's last commit, and `effort-close` reads it there.
- **After a compaction.** Rebuild "what the earlier phases left" from `git log --oneline <base>..HEAD` and the plan's Decision Record, not from the summary. Rebuild the head before the current phase from the same log: the parent of the phase's first commit, or HEAD if the phase has no commit yet.

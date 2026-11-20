# Skills Expansion, Effort 1 — Sub-agents — Implementation Plan

## In Plain Words

- **What** — this plan delivers the coordinator: a skill that runs each step of a larger piece of work in a helper session of its own, checks the result and brings the open calls to Robert. To make that possible it lets Claude start the three session skills itself. It also delivers a check that makes a plan quote its outside rules, and gives the effort close two more things to read.
- **Why** — the discovery doc's Design Spec asks for criteria 6 and 7: one session runs an effort's phases in sub-agents with no hand-written brief, and every outside rule in a plan comes with its source. Today neither holds.
- **How it fits** — this is the first of F.008's five efforts, and it carries criteria 6 and 7 of the ten. Phase 2 delivers criterion 6; Phase 1, Commit 2 delivers criterion 7. After Phase 2, `/gestalt:effort-close F.008.E1` closes it.

## Context / Goal

Build the Sub-agents front of F.008: decisions 5, 28, 32 and 33 of the discovery doc.

- Discovery doc: [`F.008-skills-expansion-discovery.md`](../discovery/F.008-skills-expansion-discovery.md), the Sub-agents part of Design Summary and Coordinator Findings
- Overview plan: [`F.008-skills-expansion-overview-plan.md`](./F.008-skills-expansion-overview-plan.md). Its decisions 35 to 44, Shared Context and Outside rules bind this plan and are not repeated here
- Experiment retro: `/workspaces/gm-toolkit/dev_journals/gestalt-outbox/2026-11-20-phase-coordinator-experiment-retro.md`. Appendix A is the loop, Appendix B is the brief, and the table in its section 4 gives the Phase 6 additions

## Decisions Ratified in Planning

2026-11-20. The numbers continue from the overview plan. Decisions 45 to 51 are Robert's answers in the Plan session. Decisions 52 to 54 are Claude's proposals in this draft; Robert's sign-off of the plan ratifies them.

45. **The coordinator's trial runs on a real gm-toolkit effort** — Robert names the effort at the start of Phase 3. The session runs in gm-toolkit and loads this branch's plugin, so its commits land in gm-toolkit and stay out of effort 1's range. Rejected: a toy plan in a scratch repo, and no run inside effort 1. **Reversed on 2026-11-20** (Decision Record, entry 7): there is no run inside effort 1.
46. **The sub-agent trial is the first act of Phase 2** — a session sees the branch's skills only when it starts with `--plugin-dir`, so the session that removes the flag cannot be relied on to see its own edit. Phase 1 commits the flag removal; the Phase 2 session runs the trial before it writes the brief. This corrects the overview plan, which puts the trial in the first phase. Rejected: the end of Phase 1 with a fallback, and a short session of Robert's own.
47. **`effort-close` finds the known gaps by reading** — the close session reads the Decision Record and lists, by number, the entries that leave a gap open. No marker is added to the entry format. The "look here first" list has a fixed heading in the effort plan, `## Look Here First`, so the close finds it on disk. Rejected: a fixed marker on each known-gap entry.
48. **Three phases** — Phase 1 holds every edit to a skill that exists. Rejected: four phases, with the flag removal alone in the first. Two phases since 2026-11-20 (Decision Record, entry 7).
49. **The brief is `skills/coordinate/phase-brief.md`** — named for what it briefs, as `arc-close/review-brief.md` is.
50. **`efforts.md` names the coordinator** — one sentence in "Execution per effort", so the flow file agrees with the new skill.
51. **The three descriptions open the door narrowly** — each says the skill is for when Robert asks for that session by ID, and never for a change of mode in a running session. `execute` adds the phase brief as a second caller.
52. **A phase agent's questions travel in its report** — a sub-agent has no `AskUserQuestion` (Outside Rules, row 11). The brief gives the full work address, so `execute` step 2 never has to ask, and it turns every "ask Robert" and "pause and discuss" into a "needs a call" line. `execute` itself is not changed. The coordinator runs in the main session only, because it must ask Robert.
53. **`effort-close` holds its two lists at the Pick step** — step 4 runs `/code-review high` with no target, and that skill takes a level and a target, not a prompt. So the close does not brief the reviewer. It reads the known gaps and the "look here first" list in step 1, marks each finding that a Decision Record entry already logs, and reads each listed spot that no finding covers. This meets follow-ups 4 and 9 by another road: the reviewer still may flag a logged gap, and Robert sees at once that it is logged.
54. **The source check is a section of its own in the plan template** — `## Outside Rules`, after Shared Context, required when the plan builds a rule from outside the repo. The overview plan kept its table under Shared Context; a section of its own is easier for a task to cite and for a reviewer to find missing.

## Decision Record — Execution

1. **Phases 1 and 2 ran in one session** — Robert asked for the plan "in full" on 2026-11-20 and stepped away. That is a hand-off scope wider than one phase. Phase 3 needs Robert and was not started.
2. **The sub-agent trial ran in a nested session** — the executing session was not started with `--plugin-dir`, so an agent of its own would have called the installed `execute`, which still has the hand-only flag. The trial ran as `claude --plugin-dir plugins/gestalt -p` from the repo root, after Commit 1. That session, on Fable, started the one `general-purpose` agent with `model: opus` and the plan's prompt, word for word. Rejected: a trial against the installed copy (a false "no"), and a stop until Robert could restart the session.
3. **Open question 1 answered: yes** — a `general-purpose` sub-agent can call `/gestalt:execute` through the Skill tool. The model count on the agent's transcript shows 3 replies, all `claude-opus-5-5`. The report's four lines:
   1. "Yes. A tool named Skill was in my tool list."
   2. "The call returned the skill's text, not an error."
   3. "Start an Execution session for `F.008.E1.P3`. Mode: Execution. The session ends when the last commit in scope lands." `$0` was filled in. The text came back with no frontmatter, and the harness put one line of its own first: "Base directory for this skill: /workspaces/gestalt/plugins/gestalt/skills/execute"
   4. "`/workspaces/gestalt/plugins/gestalt/skills/session-modes/SKILL.md`". No `${CLAUDE_PLUGIN_ROOT}` was left in it.
4. **The brief hands over the phase with the Skill call** — from entry 3. `coordinate/SKILL.md` and `phase-brief.md` hold that form only; the read-the-path form of Commit 4, Task 1, item 6 was not written.
5. **The brief has a slot for the commit's attribution lines** — not in the plan's list for part 9. The experiment retro names a brief that gave two trailers that differed; one slot filled by the coordinator removes the choice. The brief also says that it wins where it and the `execute` text disagree, which is how decision 52 holds without a change to `execute`.
6. **The brief's task line has no number** — the plan lists thirteen parts. The brief opens with the task line as plain text and numbers the other twelve from 1, in the plan's order. So the brief's part numbers are one lower than the plan's.
7. **Phase 3, the coordinator's trial, is dropped** — Robert, 2026-11-20. Reverses decisions 45 and 48, and follows the overview plan's Decision Record, entry 1, which drops the trial phase of every effort. The trial asked for a six-phase run of gm-toolkit's `F.041.E5`, in a container that cannot see this checkout, and held effort 1 open until it ended. A fault in the design shows in the first real use and is fixed then. Effort 1 is done at the end of Phase 2. Open question 2 falls away. This leaves a gap open: `coordinate/SKILL.md`, `phase-brief.md` and the two `effort-close` edits of Commit 3 have passed the gate and nothing else. No coordinator run has happened, and no close has read a Look Here First list.
8. **This plan has no Look Here First section** — effort 1 did not run under the coordinator. The `## Look Here First` heading in Phase 1, Commit 3, Task 1 sits inside a fenced Replace block: it is the template's text, not this effort's list. Found by the effort 1 close review.
9. **The coordinator needs an effort plan of its own** — Robert, at the effort 1 close. An effort that the overview plan specifies in full has no Overview list to tick and no place for Look Here First, so `coordinate` now stops on it and asks for a Plan session first. Rejected: rules for phase boxes and Look Here First inside the overview plan's Effort n section. The same close fixed seven smaller gaps in `coordinate/SKILL.md`, `phase-brief.md`, `plan/SKILL.md` and the plan template; the files now differ from the text this plan's tasks quote, and the fix commit lists each change.

---

## Open Questions — To Ratify at Implementation Time

| # | Question | Resolved in |
|---|---|---|
| 1 | Can a `general-purpose` sub-agent call `/gestalt:execute` through the Skill tool once the hand-only flag is off? (overview plan, open question 1) | Yes (Decision Record, entry 3) |
| 2 | Which gm-toolkit effort does the coordinator's trial run on, and by which path does that session load this branch's plugin? | Dropped with Phase 3 (Decision Record, entry 7) |

## Shared Context

### Task format

Decision 34: an exact edit to a file that exists is a literal task with a Find anchor. A new file is a named deliverable: its path, its scope, the decisions it carries out and a numbered list of what it must hold. The Execution session writes the file, then checks it against the list, item by item.

### Gate and sessions

- **Gate** — `claude plugin validate .` from the repo root, before every commit
- **Phase 1** — a normal session; the installed plugin copy is enough
- **Phase 2** — starts with `claude --plugin-dir plugins/gestalt`, because its first act calls the edited `execute` skill
- **Phase 3** — dropped (Decision Record, entry 7)

### Loading the style guide

Every commit here edits or writes a doc. Load `/gestalt:style-guide` before the first edit of a session.

### Size of a phase

Decision 42: a phase is one coherent set of files, not a line count. Phase 1 has three commits over five files, Phase 2 has two commits over two new files and three files that exist.

## Outside Rules

The Claude Code behaviour this effort builds on. Rows 1 to 7 are in the overview plan (Outside rules) and are cited by number. Rows 8 to 13 were fetched on 2026-11-20 from `https://code.claude.com/docs/en/sub-agents.md` and `https://code.claude.com/docs/en/skills.md`, and each quote was found in the fetched file.

| # | Rule the plan builds | Quote | Source |
|---|---|---|---|
| 8 | A finished agent is continued with `SendMessage`, and keeps its context | "Claude uses the `SendMessage` tool with the agent's ID or name as the `to` field to resume it"; "Resumed subagents retain their full conversation history, including all previous tool calls, results, and reasoning" | `sub-agents.md`, Resume subagents |
| 9 | A resumed agent runs in the background | "When Claude sends a completed subagent a message with the `SendMessage` tool, the subagent resumes in the background without a new `Agent` invocation" | `sub-agents.md`, Resume subagents |
| 10 | The model named on the spawn wins, and is an alias | "The per-invocation `model` parameter, which Claude can pass when it starts the subagent. On an Agent tool call, the parameter takes a model alias, not a full model ID or `inherit`" (first in the order of sources) | `sub-agents.md`, Choose a model |
| 11 | A sub-agent cannot ask the user a question | "The first filter removes these tools, even when listed in the `tools` field:" followed by a list that holds `AskUserQuestion` | `sub-agents.md`, Available tools |
| 12 | An agent's transcript is a file the coordinator can read | "find IDs in the transcript files at `~/.claude/projects/{project}/{sessionId}/subagents/`. Each transcript is stored as `agent-{agentId}.jsonl`" | `sub-agents.md`, Resume subagents |
| 13 | A description is cut in the skill listing past a length | "the combined `description` and `when_to_use` text is truncated at 1,536 characters in the skill listing to reduce context usage" | `skills.md`, Frontmatter reference |

Two notes from the same pages:

- **Angle brackets in a description** — the `description` row says they "show as `&lt;` and `&gt;`". The new descriptions use none
- **The model check** — tried in this Plan session on a real transcript. A plain count of `"model"` values also counts one value that is not a reply. This command counts the replies only, and is the one the skill carries:

  ```sh
  jq -r 'select(.type=="assistant") | .message.model' <transcript> | sort | uniq -c
  ```

## Out of Scope

- **A change to `execute` for sub-agents** — decision 52; the brief carries the difference
- **A prompt for the `/code-review` reviewer** — decision 53
- **The checks as a script** — follow-up 5, left by decision 32. The skill lists the commands
- **The fixed report in a normal Execution session** — it stays in the brief (decision 32)
- **A guard for `CLAUDE_CODE_SUBAGENT_MODEL_FORCE`** — with that variable on, a spawn cannot name a model. The model check after each run shows it; no check before the run is built
- **The other files the overview plan gives to efforts 2 to 4** — `discovery/SKILL.md` and `plan/SKILL.md` get only the lines below

---

## Work Breakdown

**Overview**

- [x] **Phase 1 — The skills that exist**
  - Commit 1 — `feat(E1): let Claude start the three session skills` (3 tasks)
  - Commit 2 — `feat(E1): add the source check to the plan template and the plan skill` (2 tasks)
  - Commit 3 — `feat(E1): give the effort close the known gaps and the look-here-first list` (3 tasks)
- [x] **Phase 2 — The coordinator**
  - Trial — a sub-agent calls `/gestalt:execute`; no commit of its own
  - Commit 4 — `feat(E1): add the coordinate skill and its phase brief` (3 tasks)
  - Commit 5 — `docs(E1): name the coordinator in the rules and the effort flow` (3 tasks)
- **Phase 3 — Trial** — dropped (Decision Record, entry 7); it has no box, so no session takes it as the next phase

### Phase 1 — The skills that exist

**In plain words:** three small passes over files that exist. After this phase a Claude session can start `discovery`, `plan` and `execute`, a plan must quote its outside rules, and the effort close reads the known gaps and the "look here first" list.

#### Commit 1 — `feat(E1): let Claude start the three session skills`

##### Task 1 — `plugins/gestalt/skills/discovery/SKILL.md`

Remove the hand-only flag and reword the description (decisions 5 and 51).

**Find:**
```
description: Start a Discovery session for one initiative, by its tracker ID. Run by hand at the start of the session.
disable-model-invocation: true
```
**Replace with:**
```
description: Start a Discovery session for one initiative, by its tracker ID. Use when Robert asks for a Discovery session for an ID. Never use it to change modes in a session that is already running.
```

##### Task 2 — `plugins/gestalt/skills/plan/SKILL.md`

**Find:**
```
description: Start a Plan session for one initiative, by its tracker ID, or for one effort by a work address. Run by hand at the start of the session.
disable-model-invocation: true
```
**Replace with:**
```
description: Start a Plan session for one initiative, by its tracker ID, or for one effort by a work address. Use when Robert asks for a Plan session for an ID. Never use it to change modes in a session that is already running.
```

##### Task 3 — `plugins/gestalt/skills/execute/SKILL.md`

**Find:**
```
description: Start an Execution session for one initiative, by its tracker ID or a work address that names an effort and phase. Run by hand at the start of the session.
disable-model-invocation: true
```
**Replace with:**
```
description: Start an Execution session for one initiative, by its tracker ID or a work address that names an effort and phase. Use when Robert asks for an Execution session for an ID, or when a phase brief from the coordinate skill names this skill. Never use it to change modes in a session that is already running.
```

##### Commit message

```
feat(E1): let Claude start the three session skills

- remove disable-model-invocation from discovery, plan and execute
- reword each description: for when Robert asks for that session by ID,
  never for a change of mode in a running session
- execute also names the coordinator's phase brief as a caller
```

#### Commit 2 — `feat(E1): add the source check to the plan template and the plan skill`

##### Task 1 — `plugins/gestalt/skills/session-modes/templates/implementation-plan.md`

Add the Outside Rules section between Shared Context and Out of Scope (follow-up 1, decision 54).

**Find:**
```
wrong place — move it into that commit's task.
-->

## Out of Scope
```
**Replace with:**
```
wrong place — move it into that commit's task.
-->

## Outside Rules

<!--
REQUIRED when the plan builds a rule that lives outside the repo: a game rule,
a file format, an API, a tool's behaviour. Leave the section out when there is
none.

One row per rule. The quote and the link are fetched in the Plan session. A
rule written from memory is not a source: the code it leads to copies the
mistake faithfully. If the text cannot be fetched, the row says so and the rule
goes to Open Questions. A task that builds a rule cites its row ("Outside
Rules, row 3").

An overview plan holds the rules that more than one effort builds. An effort
plan cites those rows by number and adds its own.
-->

| # | Rule the plan builds | Quote | Source |
|---|---|---|---|
| 1 | [the rule, in plain words] | "[the text, word for word]" | [link and section], fetched [date] |

## Out of Scope
```

##### Task 2 — `plugins/gestalt/skills/plan/SKILL.md`

Add the source check as step 5 and move the two steps after it down by one.

**Find:**
```
5. Put the discovery doc's Open Questions to Robert, with context in one turn and the question batch in the next. Then settle phases, commits and tasks in conversation.
6. Write the plan in one pass from
```
**Replace with:**
```
5. Source check. List every rule the plan will build that lives outside the repo: a game rule, a file format, an API, a tool's behaviour. Fetch the text of each one in this session, and put the quote and the link in the plan's Outside Rules table. Do not write an outside rule from memory. If a text cannot be fetched, say so and put the rule to Robert.
6. Put the discovery doc's Open Questions to Robert, with context in one turn and the question batch in the next. Then settle phases, commits and tasks in conversation.
7. Write the plan in one pass from
```

##### Commit message

```
feat(E1): add the source check to the plan template and the plan skill

- plan template: an Outside Rules section, one row per rule with a quote
  and a link fetched in the Plan session
- plan skill: step 5 lists the outside rules and fetches each text; the
  later steps move down by one
```

#### Commit 3 — `feat(E1): give the effort close the known gaps and the look-here-first list`

##### Task 1 — `plugins/gestalt/skills/session-modes/templates/implementation-plan.md`

Give the "look here first" list a fixed heading, after the Decision Record (decision 47).

**Find:**
```
when the plan ships to _completed/.
-->

---
```
**Replace with:**
```
when the plan ships to _completed/.
-->

## Look Here First

<!--
Only for an effort that runs under /gestalt:coordinate. Leave the heading out
at plan time. The last phase's agent writes it in that phase's last commit:
the effort's weakest spots, one bullet each, with a file:line and one line of
why. /gestalt:effort-close finds the section by this heading.
-->

---
```

##### Task 2 — `plugins/gestalt/skills/effort-close/SKILL.md`, step 1

The close reads the effort's plan for its two lists (follow-ups 4 and 9, decisions 47 and 53).

**Find:**
```
its In Plain Words, then the Effort Summary row for effort n, which gives the effort's name.
```
**Replace with:**
```
its In Plain Words, then the Effort Summary row for effort n, which gives the effort's name. Then read effort n's plan, `$0-*-plan.md` in the same folder, or the overview plan's Effort n section when the effort has no plan of its own. From its Decision Record, list by number every entry that leaves a gap open: a known fault that stays, or work sent to a later effort. Read its Look Here First section, if it has one.
```

##### Task 3 — `plugins/gestalt/skills/effort-close/SKILL.md`, step 5

**Find:**
```
5. **Pick.** Show every finding, numbered, with its `file:line` and summary. **Stop:**
```
**Replace with:**
```
5. **Pick.** Hold the findings against the two lists from step 1. Mark each finding that a Decision Record entry already logs with the entry's number and where the entry sent it. For each Look Here First item that no finding covers, read the spot yourself; if something is wrong there, add it as a finding and mark it as the close session's own. Show every finding, numbered, with its `file:line` and summary. **Stop:**
```

##### Commit message

```
feat(E1): give the effort close the known gaps and the look-here-first list

- plan template: a Look Here First section, written by the last phase's
  agent of a coordinated effort
- effort-close step 1 reads the effort plan: the Decision Record's
  open-gap entries by number, and the Look Here First section
- effort-close step 5 marks findings that are already logged, and reads
  each listed spot that no finding covers
```

The phase's box in the Overview list is ticked in this commit.

### Phase 2 — The coordinator

**In plain words:** first a short trial shows whether a sub-agent can call `/gestalt:execute`. Then the `coordinate` skill and its phase brief are written, and the rules name them.

**Session start:** `claude --plugin-dir plugins/gestalt`, from the repo root.

#### Trial — a sub-agent calls `/gestalt:execute`

Answers open question 1 before the brief is written (decision 46). It makes no commit of its own; its result is logged in the Decision Record and lands with Commit 4.

1. Start one agent with the Agent tool: `subagent_type: general-purpose`, `model: opus`. Its prompt, word for word:

   ```
   This is a tool check. Do not edit, create or commit anything.

   1. Say whether a tool named Skill is in your tool list.
   2. Call the Skill tool with skill "gestalt:execute" and args "F.008.E1.P3".
   3. Do not carry out any step of the text that comes back.

   Report, numbered:
   1. Was the Skill tool in your list?
   2. Did the call return the skill's text, or an error? Quote an error in full.
   3. The first line of the returned text after the frontmatter, word for word.
   4. The path the text gives for session-modes/SKILL.md, word for word.
   ```

2. Read the report.
   - **Yes** — the text came back, line 3 names `F.008.E1.P3` (so `$0` was filled in), and line 4 is a real path with no `${CLAUDE_PLUGIN_ROOT}` left in it (Outside rules, row 7)
   - **No** — the tool was missing, the call failed, or a variable was not filled in
3. Check the agent's model with the command in Outside Rules.
4. Log the answer in the Decision Record, with the report's four lines. Give Robert the answer in one line before Commit 4 starts; it is not a stop.

#### Commit 4 — `feat(E1): add the coordinate skill and its phase brief`

##### Task 1 — `plugins/gestalt/skills/coordinate/SKILL.md` (new, named deliverable)

**Carries out:** decisions 5, 28, 32 (follow-ups 2, 6, 7, 10), 33, 46 and 52.

The frontmatter, literal:

```
---
name: coordinate
description: Run the phases of one effort in sub-agents from one long session, by a work address. One agent per phase, then a review with Robert and one fix commit. Use when Robert asks to coordinate an effort or to run it under the coordinator. Never start it from inside a sub-agent.
argument-hint: "[ID][.E<n>]"
---
```

The body is written in the register of `effort-close/SKILL.md`: an opening paragraph, the address line, the sentence that defines a **stop**, then numbered steps. It must hold:

1. **The frame** — mode "Coordinator run". One run is one effort. The session ends when the effort's last phase is signed off. The coordinator does no phase work: it does not edit the code or the plan's tasks
2. **The address** — `$0` is `<ID>.E<n>`, or `<ID>` for a single-file plan, read as `execute` reads it
3. **Read** — `session-modes/SKILL.md`, `session-discipline.md`, `efforts.md` and the flow file for the type, by `${CLAUDE_PLUGIN_ROOT}` paths; the overview plan's In Plain Words and decisions; the effort plan's front matter and Overview list; `${CLAUDE_PLUGIN_ROOT}/skills/coordinate/phase-brief.md`
4. **Checks**, each one a stop when it fails:
   - This is the main session: `AskUserQuestion` is in the tool list (Outside Rules, row 11). In a sub-agent, say so and stop
   - The session's model is Fable. If not, say so; Robert decides whether to go on (decision 33)
   - The feature branch is checked out, and `git status --porcelain` prints nothing
   - The gate in the project's `CLAUDE.md` passes
5. **The loop**, for each phase whose box is not ticked, in order. The ten lines of the retro's Appendix A, as steps:
   - Read the phase against the current source and write seam notes: calls into older code, Find anchors that will not match, and what the earlier phases' fix commits changed
   - Fill the brief from `phase-brief.md`
   - Start one agent: `subagent_type: general-purpose`, `model: opus`, in the background. Keep its agent ID
   - When the report comes, verify on your own: the model, with the `jq` command from Outside Rules on the agent's transcript (row 12); the gate; a clean tree; each commit's message and scope against the plan; the diff against the plan's tasks; the phase's box
   - Give Robert the review as text, with a recommendation for each call, and end the turn. The question block comes in the next turn, recommended option first. Never end a review turn with findings and no questions to follow
   - **Stop:** Robert answers
   - Resume the same agent with `SendMessage` (rows 8 and 9) and a short fix brief. It makes one commit, `fix(E<n>): address phase <p> review findings`, with one bullet per fix. With nothing to fix, there is no commit
   - Verify the fix commit the same way
   - **Stop:** Robert signs off the phase
6. **How the brief hands over the phase** — one form only, chosen by the trial's answer in this plan's Decision Record:
   - Yes: the brief tells the agent to call the Skill tool with `gestalt:execute` and the full address `<ID>.E<n>.P<p>`
   - No: the brief gives the path of `execute/SKILL.md`, written out in full, and tells the agent to read it and follow it with `<ID>.E<n>.P<p>` as its `$0`, as `arc-close` step 3 does with its review brief
7. **The coordinator's three rules** (follow-up 6), as a short list of their own:
   - It does not edit a doc that an agent is editing; the plan belongs to the agent while it runs
   - It writes nothing to disk in the repo while an agent runs, because the agent's `git add -A` would sweep it up
   - It quotes a source before it states a conclusion from it. This holds for the plan, the code and any fetched text
8. **The two-stage phase** (follow-up 7), one sentence: when a phase needs Robert to act between two commits, the brief tells the agent to stop without committing, and the coordinator resumes it after Robert has acted
9. **The coordinator's own commits** (follow-up 10): anything the coordinator itself must commit lands before the effort's first commit or after its close, never between them; the unbroken-run check in `effort-close` step 3 stops on an unscoped commit
10. **The last phase** — its brief carries the "look here first" part of `phase-brief.md`. The agent writes `## Look Here First` into the effort's plan in the phase's last commit
11. **After a compaction** — rebuild "what the earlier phases left" from `git log --oneline <base>..HEAD` and the plan's Decision Record, not from the summary
12. **The end** — when the last phase is signed off, name the next step: `/gestalt:effort-close <ID>.E<n>` in a new session, or `/gestalt:initiative-close <ID>` for a single-file plan. Do not start it

##### Task 2 — `plugins/gestalt/skills/coordinate/phase-brief.md` (new, named deliverable)

**Carries out:** decision 32 (follow-ups 3, 4 and 7), decisions 49 and 52.

A template the coordinator fills once per phase. It speaks to the agent ("You are executing one phase of a plan"), as `arc-close/review-brief.md` speaks to its reviewer. Slots the coordinator fills are in square brackets. It must hold these parts, in this order; parts 1 to 10 are Appendix B of the retro, changed where noted:

1. **The task in one line** — the plan path and the work address
2. **How to start** — the hand-over line in the form the trial chose (Task 1, item 6). The gestalt rules files are not repeated: they reach the agent through the project's `CLAUDE.md` (overview plan, Outside rules, row 6)
3. **You cannot ask** — the agent has no way to ask Robert a question (Outside Rules, row 11). Where `execute` says to ask Robert or to pause and discuss, the agent stops that line of work, goes on with what does not depend on it, and puts the question first in its report under "needs a call" (decision 52)
4. **What the earlier phases left** — the commits so far, and each place a fix commit made the source differ from what the plan's later tasks expect
5. **How to treat the plan** — the plan's code is literal; copy it, but check each Find anchor against the source first. A mismatch is a deviation: follow the source and record it. A reading of an outside rule is never the agent's to decide
6. **Source check** — the rows of the plan's Outside Rules table that this phase builds. The agent fetches each text again, holds it against the planned code, and reports each difference with a quote and a link. It also checks every field and mode of each outside data shape the phase reads, and reports what is not handled
7. **The coordinator's seam notes** — numbered, so the report can answer them one by one
8. **Project rules** — a slot for the rules of this project that agents break, and two fixed ones: edits with Edit and Write only; show that a test can fail with an edit and an edit back, never with `git stash` or `git checkout`
9. **Commits** — the plan's messages, the effort scope, `git add -A`, `git commit -F` from a file outside the repo, no push, no amend, and the gate command in full
10. **If plan mode switches on by accident** — wait, then carry on
11. **Two stages**, only when the phase has them (follow-up 7) — where the agent stops without committing, what Robert does there, and which data the agent may and may not run against
12. **Look here first**, only in the last phase (follow-up 4) — the agent lists the effort's weakest spots, one bullet each with a `file:line` and one line of why, and writes them under `## Look Here First` in the effort's plan in its last commit
13. **The report** (follow-up 3) — fixed and numbered, in this order: needs a call; commits; the tail of the gate's output; source check, one line per rule; deviations from the plan, with the Find anchors that did not match; existing tests changed, each with its reason; tests written, one line per planned case; answers to the seam notes, by number; Decision Record entries added; doubts and things for the next phase. The last phase adds: look here first

##### Task 3 — the trial's record

- Log the trial's answer in this plan's Decision Record (see the Trial steps above)
- In `F.008-skills-expansion-overview-plan.md`, change the "Resolved in" cell of open question 1 to the answer and "(E1 plan, Decision Record)", and change the "**First phase:**" paragraph of Effort 1 so it says the trial is the first act of the second phase (decision 46)

##### Commit message

```
feat(E1): add the coordinate skill and its phase brief

- /gestalt:coordinate runs one effort: one Opus agent per phase, a check
  of the result, a review with Robert, one fix commit, a sign-off
- phase-brief.md is the template the coordinator fills for each agent,
  with the fixed, numbered report
- the sub-agent trial's answer is logged, and the overview plan's open
  question 1 is closed
```

#### Commit 5 — `docs(E1): name the coordinator in the rules and the effort flow`

##### Task 1 — `plugins/gestalt/rules/code-and-docs.md`

Three edits.

In the Session modes paragraph, name the skill.

**Find:**
```
Plan and execute also take a work address that names an effort or phase, such as `F.001.E2.P3`.
```
**Replace with:**
```
Plan and execute also take a work address that names an effort or phase, such as `F.001.E2.P3`. `/gestalt:coordinate <ID>.E<n>` runs the phases of one effort from one session, each phase in a sub-agent of its own.
```

In the session table, add the coordinator run.

**Find:**
```
| Effort close | The effort is reviewed, the picked fixes are committed, and the squash is verified. |
```
**Replace with:**
```
| Coordinator run | Every phase of the effort is committed, reviewed and signed off. The effort close is a new session. |
| Effort close | The effort is reviewed, the picked fixes are committed, and the squash is verified. |
```

In Model selection, add the coordinator's line (decision 33).

**Find:**
```
Opus by default. Fable for Arc-Discovery, Arc-Plan and process-redesign sessions: structure-setting sessions whose output constrains many later sessions.
```
**Replace with:**
```
Opus by default. Fable for Arc-Discovery, Arc-Plan and process-redesign sessions: structure-setting sessions whose output constrains many later sessions. Under `/gestalt:coordinate`, Fable coordinates and Opus executes: the coordinator session runs on Fable, and every phase agent it starts runs on Opus.
```

##### Task 2 — `plugins/gestalt/skills/session-modes/session-discipline.md`

**Find:**
```
Opus by default. Fable for Arc-Discovery, Arc-Plan and process-redesign sessions — structure-setting sessions whose output constrains many later sessions.
```
**Replace with:**
```
Opus by default. Fable for Arc-Discovery, Arc-Plan and process-redesign sessions — structure-setting sessions whose output constrains many later sessions. Under `/gestalt:coordinate`, Fable coordinates and Opus executes: the coordinator session runs on Fable, and every phase agent it starts runs on Opus.
```

##### Task 3 — `plugins/gestalt/skills/session-modes/efforts.md`

**Find:**
```
The commit that finishes an effort ticks its Done box in the overview plan's Effort Summary.
```
**Replace with:**
```
The commit that finishes an effort ticks its Done box in the overview plan's Effort Summary. `/gestalt:coordinate <ID>.E<n>` can run an effort's phases from one session, each in a sub-agent of its own; the phases and their commits stay the same.
```

##### Commit message

```
docs(E1): name the coordinator in the rules and the effort flow

- code-and-docs: /gestalt:coordinate in Session modes, a Coordinator run
  row in the session table, and the model rule's line for it
- session-discipline: the same model line
- efforts.md: an effort's phases can run under the coordinator
```

The phase's box in the Overview list is ticked in this commit.

### Phase 3 — Trial (dropped)

**Dropped on 2026-11-20** (Decision Record, entry 7). Nothing below was run. The text stays as the record of what the trial would have checked; the nine checks are a fair list of what to watch in the coordinator's first real use.

**In plain words:** Robert runs `/gestalt:coordinate` on a real gm-toolkit effort and then closes that effort with the edited `effort-close`. What the run shows is fixed here, and effort 1 is done.

#### Trial — `/gestalt:coordinate` on a gm-toolkit effort

Robert's part, in gm-toolkit. Its commits land there, not on this branch (decision 45).

1. Robert names the effort and the path by which gm-toolkit's container sees this checkout (open question 2). The session starts on Fable with `claude --plugin-dir <that path>/plugins/gestalt`
2. `/gestalt:coordinate <address>` runs the effort
3. After the effort's last phase, a new session started the same way runs `/gestalt:effort-close <address>`, so the two edits of Commit 3 are tried too
4. After that close, the coordinator session writes a trial note into gm-toolkit's `dev_journals/gestalt-outbox/`, where the experiment retro sits. The note lands after the close, as follow-up 10 asks

What a pass looks like. The trial note answers each line with yes or no and the evidence:

| # | Check | Evidence |
|---|---|---|
| 1 | Each phase ran in one agent, on Opus | The `jq` count per transcript |
| 2 | The agent started from the brief's hand-over line with no help | The agent's first tool calls |
| 3 | Every report came back in the fixed order | The reports |
| 4 | No agent stalled on a question it could not ask | "Needs a call" lines in the reports |
| 5 | Each fix was made by the same agent, resumed | One agent ID per phase |
| 6 | The coordinator kept its three rules | Robert's corrections, counted, with the cause of each |
| 7 | The last agent wrote `## Look Here First` into the plan | The plan |
| 8 | `effort-close` listed the open-gap entries and read the list | The close session |
| 9 | No unscoped commit stopped the close | Step 3 of the close |

The whole effort is the trial. Robert may call it earlier; checks 7 to 9 then stay open, and the Decision Record says so.

#### Commit 6 — `fix(E1): address the coordinator trial findings`

The fix session, here. It reads the trial note from `/workspaces/gm-toolkit/dev_journals/gestalt-outbox/` (read-only) and puts each finding to Robert. Each fix he picks is an edit to `coordinate/SKILL.md`, `phase-brief.md` or one of the files Phases 1 and 2 changed, and gets one bullet in the message. A finding that is a design call is settled with Robert before the edit and logged in the Decision Record.

The same commit ticks this phase's box in the Overview list and effort 1's Done box in the overview plan's Effort Summary. With no fix picked, the commit holds the Decision Record entries and the two ticks, with the subject `docs(E1): record the coordinator trial`.

##### Commit message

```
fix(E1): address the coordinator trial findings

- one bullet per fix, written in the fix session
```

The wrap-up names the next step: `/gestalt:effort-close F.008.E1` in a new session.

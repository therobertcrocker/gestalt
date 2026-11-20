# One Claude — Arc Seed

> **What this file is.** A seed: the record of one design conversation in claude.ai chat (2026-11-19 and 2026-11-20), written so a gestalt session can continue from it. It is not an arc concept and it ratifies nothing. Decisions that Robert made are in "Decided so far". Everything else is a proposal from Claude.
>
> **Where it goes.** `dev_journals/initiatives/seeds/A.001-one-claude-seed.md`. Robert chose the arc name `one-claude` on 2026-11-20. The ID `A.001` is a proposal; Robert assigns it. The seed process is not defined yet (session-discipline.md, File locations), so this file borrows the arc-concept headings to make the concept easy to draft from it.
>
> **The board.** The conversation's diagrams are on a Whiteboard: https://claude.ai/artifact/VCJEBRcRfMVVf9F39ijEAG

## In Plain Words

- **What** — make every Claude that Robert talks to behave like one assistant: Claude Code in each project container, claude.ai chat, and claude.ai Projects. The model is Jarvis or Cortana: the same rules, the same knowledge, and the same view of work in flight, on every surface.
- **Why** — today gestalt gives that to Claude Code only. Chat and Projects do not read the rules, do not know which projects exist, and cannot see a tracker.
- **How it fits** — gestalt already holds the rules and is "the bootstrapper for new projects" (`CLAUDE.md`). This arc grows it into the one source that every surface reads, with nothing copied between surfaces.

## Vision

A new Claude starts with nothing. It behaves like "the same instance" only because of what it reads before it speaks. So the goal is one start-up sequence, not one process that runs all the time: who I work with and how, what I know, what is in flight.

When the arc is complete:

- Every surface loads the same rules from the same files
- Any surface can answer "which projects exist, and what is each one doing?" from live sources
- A new project starts in one step, inside a container, already on gestalt
- No fact is stored in two places

## Problem

The conversation mapped five things an assistant needs against the three surfaces. This is the state on 2026-11-20.

| Layer | Claude Code | Chat | Projects |
|---|---|---|---|
| Behaviour (rules, voice, when to push back) | Covered: gestalt rules and skills | Partial: saved preferences, tone and format only | Gap: instructions set per Project |
| Knowledge (who Robert is, what the projects are) | Covered: each repo's `CLAUDE.md` and docs | Covered: built-in memory, durable facts only | Partial: depends on each Project's memory setting |
| Working state (what is in flight) | Covered: `dev_journals/planned-work.md`, per repo | Gap: past-chat search only | Gap: that Project's chats only |
| Initiative (speaks first) | Gap: the SessionStart hook lists architecture pages, nothing more | Gap: no scheduled tasks exist | Gap |
| Agency (can act) | Covered: edits, commands, commits | Partial: Drive and Sheets connectors, web | Partial: as chat, plus Project files |

Robert's three complaints map to it:

- **Inconsistent personality** — the Behaviour row
- **Surfaces don't share** — the Working state row
- **Projects aren't as aware as he wants** — the Projects column

A correction to the board: its Initiative row says Claude Code has a "periodic repo pull". The source shows the marketplace auto-update (pulls gestalt into projects) and `/gestalt:graduate` (run by hand). Neither makes Claude speak first.

### gestalt against the proposed design

Claude proposed a "brain repo" with five parts, served by one hosted server. gestalt was read on 2026-11-19 at commit `5ec9fe2`.

| Part | Status | What the source shows |
|---|---|---|
| Rules and plugin | Done | Marketplace with auto-update, rules imported by `@` reference, `/gestalt:graduate` as the feedback loop |
| Container feature | Half | `templates/devcontainer-snippet.json` is merged into each project by `/gestalt:adopt`, so each project holds a copy |
| Project template | Half | `/gestalt:adopt` handles an empty repo, but needs a running container with Claude installed first |
| Knowledge notes | Missing | Facts about Robert sit in the rules, in per-project memory on one machine, and in the frozen `sources/` snapshot |
| State log | Missing | Each tracker is authoritative; nothing lists which repos exist (`F.007`) |
| Brain server | Missing | Nothing in gestalt is reachable from chat or Projects |

## Why an Arc

The work is several shippable pieces, and some decisions bind all of them.

**Cross-cutting decisions for Arc-Discovery:**

- **No stored copies** — Claude proposes that the brain reads, and does not store, anything a repo already holds. This follows the memory rule in `working-together.md` ("the docs are authoritative"). It replaces the "state log" in the first diagram with a project list plus live reads of each tracker
- **Where knowledge about Robert lives** — gestalt keeps none on purpose. Chat's built-in memory keeps some. The arc needs one answer
- **Work that has no repo** — the H.A.W.K. campaign, dance and fitness have no `.claude/settings.json`, so no search finds them
- **Repo layout** — a server written in Go makes gestalt multi-product. `CLAUDE.md` says single-product today, and the layout paths cannot be overridden (`code-and-docs.md`, Project layout)
- **Hosting and authentication** — chat can reach only a remote server. That server exposes Robert's rules and project state, so it needs real authentication. This is the largest cost in the arc
- **Containment** — Robert's constraint: Claude runs inside dev containers, and so do the projects

**Why order is a design question:** the first three candidates need no hosting and pay off inside Claude Code alone. The server is the only large piece and the only one that reaches chat. What ships before it decides how long chat and Projects wait.

**Robert's three constraints, which bind every initiative:**

1. Works with dev containers, so Claude is contained as well as the projects
2. Minimal duplication: nothing is copied to and from for it to work
3. Fast bootstrapping for new projects

## Success Criteria

Proposed by Claude on 2026-11-20 at Robert's request; Robert edits and ratifies. Each criterion is a question Robert can ask of the finished work, with the answer that means success. The arc is complete when every question gets its answer. Robert's rule for criteria: answers to questions, not counts or limits.

| # | Question | The answer that means success | Serves |
|---|---|---|---|
| 1 | Does every surface follow the same rules? | Yes: asked about a rule in `working-together.md`, Claude Code in a project container, a new chat and a chat in a Project each answer as the rule says | Inconsistent personality |
| 2 | When I change a rule, where do I change it? | In gestalt and nowhere else; after the merge, each surface gives the new answer in a new session | Constraint 2 |
| 3 | Can chat tell me which projects run on gestalt? | Yes, and its answer matches the `gh search code` result at that time | Surfaces don't share |
| 4 | Can chat tell me what is in flight in a project? | Yes: asked about gm-toolkit, its answer matches the Current Initiatives table in that repo's `planned-work.md` at that time | Surfaces don't share |
| 5 | Does a Project know what chat knows? | Yes: questions 1, 3 and 4 get the same answers inside a claude.ai Project | Projects aren't aware |
| 6 | Is any fact kept in two places? | No; the one exception is the instruction line on each surface that points at the server | Constraint 2 |
| 7 | Can I start a new project without editing a file by hand? | Yes: create the repo from the template, open it in a container, start `claude`, and `/context` lists the gestalt rules files | Constraint 3 |
| 8 | Can Claude in a container reach anything on the host that it should not? | No: it has the workspace mount and the shared state mount, and its server credential reads only what the server is meant to serve | Constraint 1 |
| 9 | Does the server answer a stranger? | No: a request with no credential, or a wrong one, gets no rules and no project data | Hosting and authentication |
| 10 | Does everything that works today still work? | Yes: `/gestalt:adopt` and `/gestalt:graduate` run as written, and a gm-toolkit session starts with the rules loaded | Existing process |

**Not a criterion (proposed):**

- **Voice and always-on presence** — outside what gestalt can build
- **Speaking first** — scheduled check-ins and session-summary hooks are a later candidate; the arc can close without them. Robert may want this in scope instead
- **Knowledge about work with no repo** — waits on open questions 1 and 2; a criterion is added when they are decided

**Left for Arc-Discovery:**

- Questions 1 and 5 name "a rule" without choosing one. Arc-Discovery picks the rule that is asked about, so the check is the same each time

## Candidate Initiatives

Rough and non-binding. Arc-Plan does the slicing.

- **Project list (`F.007`, existing row)** — the list of projects on gestalt, by GitHub search. Method decided; see below
- **Container feature** — turn the copied snippet into a dev container feature published from gestalt, referenced in one line. Not verified: whether a feature can declare the `${localEnv:HOME}` mount itself
- **Template repo** — the feature reference, `.claude/settings.json` and the starter `CLAUDE.md`, so a new project starts in one step. `/gestalt:adopt` stays for existing projects
- **Brain server** — a Go MCP server (a program that offers Claude a set of tools). It serves the rules files as they are, the project list, and live tracker reads. Local in containers first, then hosted
- **Connect chat and Projects** — add the server as a connector, plus one instruction line on each surface. That line is the only duplication left
- **Knowledge notes** — depends on the cross-cutting decision above; may be a design outcome and not an initiative
- **Initiative (later)** — a hook that records a session summary, and scheduled check-ins. Claude put these last

**Existing rows that touch the arc:** `F.007` (becomes a member), `F.004` (a lighter change flow would suit the small candidates), `F.005` and `F.006` (independent).

## Trigger

Not set. The arc has no row yet. Robert said on 2026-11-20 that he wants to treat this as an arc "from the get go".

## Decided so far

Robert's calls. Everything outside this table is open.

| Date | Decision | Detail |
|---|---|---|
| 2026-11-20 | `F.007` update method: GitHub search | `gh search code "gestalt@gestalt" --owner therobertcrocker --filename settings.json`; Robert's test run found gestalt and gm-toolkit |
| 2026-11-20 | `F.007` scope: repos for now | Whether the list covers work with no repo is deferred to the knowledge-notes decision |
| 2026-11-20 | Treat the work as an arc on gestalt | This seed is the hand-over |
| 2026-11-20 | Arc name: `one-claude` | Chosen over `every-surface`, `gestalt-everywhere`, `brain` and `jarvis`; `brain` would have named the arc after a design that is not ratified |

The `F.007` row in `planned-work.md` is not yet amended. Claude drafted the new row text in the chat; Robert has it.

## Open Questions

| # | Question | Notes |
|---|---|---|
| 1 | Where does knowledge about Robert live? | Options named so far: chat's built-in memory for stable facts, the brain for projects and state |
| 2 | Does the project list cover work with no repo? | Deferred by Robert; tied to question 1 |
| 3 | Is "state log" replaced by a project list plus live tracker reads? | Claude's proposal; Robert has not ruled on it |
| 4 | Does gestalt become multi-product, or does the server get its own repo? | Layout rule in `code-and-docs.md` |
| 5 | Where does the server run, and how does it authenticate? | A VPS, a hosted platform, or the home machine behind a tunnel were named in an October chat |
| 6 | Where does the `F.007` search live? | A skill, or a script that `/gestalt:graduate` can also call |
| 7 | Do the claude.ai Projects keep their memory separate from general memory? | A setting on each Project's page; it may explain part of the Projects column |

## What Claude did not verify

- Current Claude Code and claude.ai product details: custom connectors for remote MCP servers, dev container feature options, plugin install inside a feature. Check the current docs before any design relies on them
- The GitHub search limits (default branch only, index lag) come from general knowledge of GitHub code search, not from a test
- `plugins/gestalt/scripts/architecture-index.sh` was not read; the hook's purpose is taken from `hooks.json` and the README

## For the session that picks this up

Nothing here is a directive. The next steps, in the order the process gives them, each Robert's call:

1. File the arc as a row in `planned-work.md`. The Backlog has no Arcs subsection yet (lifecycle.md)
2. Promote it when ready. The arc concept is drafted at promotion, from `templates/arc-concept.md`; this seed has the same headings
3. Arc-Discovery ratifies the cross-cutting decisions above. Model selection in `code-and-docs.md` names Fable for Arc-Discovery and Arc-Plan
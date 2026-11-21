# Skills Expansion, Effort 2 — Seeds — Implementation Plan

## In Plain Words

- **What** — this plan delivers the seed: a template for writing down an idea that is coming, a skill that writes one and later turns it into a tracker row, and a start-of-session notice that lists every seed. It also writes the seed into the process files, so the rules, the lifecycle and the session skills know what a seed is and where it goes.
- **Why** — the discovery doc's Design Spec asks for criteria 2 and 3: a session on other work hears that a seed exists, and Robert turns a seed into a tracker row with one command. Today seeds are written by hand with no template, and no session hears of one unless it reads the tracker.
- **How it fits** — this is the second of F.008's five efforts. It carries criteria 2 and 3, and the seed's share of criterion 1. Phase 1 delivers both criteria; Phase 2 makes the rest of the process agree with them. After Phase 2, `/gestalt:effort-close F.008.E2` closes it.

## Context / Goal

Build the Seeds front of F.008: decisions 2, 3, 13 to 21, the seed's part of decision 30, and decision 39 for `seeds/`.

- Discovery doc: [`F.008-skills-expansion-discovery.md`](../discovery/F.008-skills-expansion-discovery.md), the Seeds part of Design Summary and Seed Findings
- Overview plan: [`F.008-skills-expansion-overview-plan.md`](./F.008-skills-expansion-overview-plan.md). Its decisions 35 to 44 and 62 to 63, Shared Context and Outside rules bind this plan and are not repeated here
- Effort 1 plan: [`F.008.E1-skills-expansion-plan.md`](./F.008.E1-skills-expansion-plan.md), for Outside Rules rows 8 to 13
- Seeds that exist, read as models for the template: gestalt `dev_journals/initiatives/seeds/one-claude-seed.md`; gm-toolkit `dev_journals/campaigns/initiatives/seeds/repo-layout-seed.md` (read-only)

## Decisions Ratified in Planning

2026-11-21. The numbers continue from the overview plan's 62 and 63. Decisions 64 to 67 are Robert's answers in the Plan session. Decisions 68 to 72 are Claude's proposals in this draft; Robert's sign-off of the plan ratifies them.

64. **The hook is its own script, `scripts/seed-index.sh`** — a second command hook in the same SessionStart group as `architecture-index.sh`, named like it. The two run in parallel and their order is not defined (Outside Rules, row 15); each prints a paragraph that stands alone, so order does not matter. Rejected: one script for both notices. Settles the overview plan's "For its Plan session" item.
65. **The hook prints each seed's path from the repo root** — the path shows the product in a multi-product project, and whether the seed is planted (an ID in front of the name). Rejected: the bare name.
66. **Two phases** — Phase 1 is the seed itself: the template, the skill and the hook. Phase 2 is the process text around it. Rejected: one phase of four commits.
67. **The plant job proposes, Robert confirms** — at its stop, the skill proposes the type, the next free ID for that type and the Backlog row, and Robert confirms or changes each one. Rejected: Robert gives the type and the ID with no proposal.
68. **The hook finds seeds by two globs, with no setting** — `dev_journals/initiatives/seeds/*-seed.md` and `dev_journals/*/initiatives/seeds/*-seed.md`. Together they cover the single-product and the multi-product layout, and neither matches `_completed/`. Tried in this Plan session under `sh`: one seed in gestalt, three in gm-toolkit. Settles the second half of the overview plan's "For its Plan session" item.
69. **A seed job stops on a dirty tree** — each job ends in a commit made with `git add -A`, so changes that were already in the tree would ride in the seed's commit. If `git status --porcelain` prints anything when the job starts, the skill says so and stops; Robert commits that work first, or says to let it ride.
70. **The seed skill warns when its commit lands inside an effort** — on a feature branch with an effort in progress, the seed's unscoped commit will stop `effort-close` step 3. Decision 21 accepts that; the warning makes sure it is no surprise.
71. **"Or its seed" in the Concept column for every type that has a write-up** — feature, refactor and docs. Decision 16 covers every seeded initiative, and gm-toolkit's `living-spec-migration` seed became a docs initiative. The arc row stays for effort 4 (decision 43).
72. **The plant job does not fix links in frozen folders** — a project's `CLAUDE.md` may name a folder that is never edited (gestalt's `sources/`). The link search skips those folders, and the skill lists any hit it skipped.

## Decision Record — Execution

1. **The effort review's fixes to the seed skill** — Robert, 2026-11-21, at the effort close. Five fixes change the text this plan gave the skill, and the task list below now holds the fixed text. A planted seed is found by `<ID>-$1-seed.md` with the ID as a glob, not by `*-$1-seed.md`, which also matched a seed whose name ends in `-$1`. The warning of decision 70 fires only when the newest `(E<n>)` subject is not a closed effort's review-fix commit, which survives the squash and set it off on every later seed job. The next-ID scan reads `_completed/` at every depth, so a closed arc counts. The link search leaves a hit that already carries the ID, the new Backlog row among them. A name asked for stands for `$1` in every later step.

---

## Design Spec — Carried By

Decision 59, for this effort. The criteria are in the discovery doc, Design Spec.

| Criterion | Carried by |
|---|---|
| 1 — each kind of work starts from a skill (the seed's row) | Phase 1, Commit 1 |
| 2 — a session hears of a seed | Phase 1, Commit 2 |
| 3 — a seed is planted with one command | Phase 1, Commit 1 |

Phase 2 makes the process files agree with what Phase 1 built; it carries no criterion of its own.

## Shared Context

### Task format

Decision 34: an exact edit to a file that exists is a literal task with a Find anchor. A new file is a named deliverable: its path, its scope, the decisions it carries out and a numbered list of what it must hold. The Execution session writes the file, then checks it against the list, item by item. The hook script and `hooks.json` are code, so their tasks give the full file.

### Gate and sessions

- **Gate** — `claude plugin validate .` from the repo root, before every commit
- **Both phases** — a normal session is enough; neither phase runs a skill it edits

### Loading the style guide

Every commit here edits or writes a doc. Load `/gestalt:style-guide` before the first edit of a session.

### Size of a phase

Decision 42: a phase is one coherent set of files. Phase 1 has two commits over four new files and one that exists; Phase 2 has two commits over ten files that exist.

### Paths in the process text

Every new line below names the single-product path, `dev_journals/initiatives/seeds/`. Each file it lands in already says that in a multi-product project every `dev_journals/` path reads `dev_journals/<product>/`, so the lines do not repeat it.

## Outside Rules

The Claude Code behaviour this effort builds on. Row 7 of the overview plan covers `$0` and `$1` in the skill (`$N` is `$ARGUMENTS[N]`). Rows 14 to 17 were fetched on 2026-11-21 from `https://code.claude.com/docs/en/hooks.md`, and each quote was found in the fetched file.

| # | Rule the plan builds | Quote | Source |
|---|---|---|---|
| 14 | What a SessionStart hook prints reaches Claude | "Claude Code adds plain-text stdout as context that Claude can see and act on" (the list item names `SessionStart`) | `hooks.md`, Exit code output, Exit code 0 |
| 15 | Two hooks on one event run side by side, in no stated order | "When an event fires, its matching hooks run in parallel." | `hooks.md`, Hook handler fields |
| 16 | The script can find the project root | "both export them as the environment variables `CLAUDE_PROJECT_DIR`, `CLAUDE_PLUGIN_ROOT`, and `CLAUDE_PLUGIN_DATA` on the spawned process" | `hooks.md`, Command hook fields |
| 17 | The printed list has a size limit | "its plain stdout, are capped at 10,000 characters" | `hooks.md`, JSON output |

Row 17 does not bind today: four seeds print about 300 characters. A list past the cap is cut to a file path and a preview, not lost.

## Out of Scope

- **The arc's half of the seed** — `arcs.md`, `arc-close/SKILL.md`, `arc-close/review-brief.md`, the arc row of the routing table and the arc concept line in `lifecycle.md` (decision 43, effort 4)
- **The explorations half of the "not defined yet" lines** — kept as it is; effort 3 replaces it
- **Reshaping the seeds that exist** — `one-claude` gets the new shape when it is planted (discovery doc, Out of Scope)
- **The Design Spec in the templates that exist** — effort 5. The seed template is written in the new shape from the start (decision 63)

---

## Work Breakdown

**Overview**

- [x] **Phase 1 — The seed**
  - Commit 1 — `feat(E2): add the seed template and the seed skill` (2 tasks)
  - Commit 2 — `feat(E2): list the seeds at session start` (2 tasks)
- [x] **Phase 2 — The seed in the process**
  - Commit 3 — `docs(E2): define the seed in the session-modes skill and the style guide` (4 tasks)
  - Commit 4 — `docs(E2): name the seed in the rules and the session skills` (7 tasks)

### Phase 1 — The seed

**In plain words:** the seed template and the `/gestalt:seed` skill are written, and every session starts with a list of the seeds. After this phase an idea can be written down as a seed, planted as a tracker row with one command, and heard of by every session.

#### Commit 1 — `feat(E2): add the seed template and the seed skill`

##### Task 1 — `plugins/gestalt/skills/session-modes/templates/seed.md` (new, named deliverable)

**Carries out:** decisions 13, 15, 16, 17, 30 (the seed proposes, it does not ratify), 56 (no Design Spec) and 61 (In Plain Words), per decision 63.

A template in the style of the others in the folder: guidance in HTML comments, slots in square brackets, REQUIRED marked. It must hold, in this order:

1. **The opening comment** — copy to `dev_journals/initiatives/seeds/<name>-seed.md`; `/gestalt:seed plant` renames it `<ID>-<name>-seed.md` (decision 17). Every section is required unless marked arc-only. The type need not be known when the seed is written. Delete the comments before writing
2. **Title** — `# [Name] — Seed`
3. **Frame: header** — a blockquote with five lines: Type (if known; set at planting), Status of the work (a concept, not scheduled), Source (the session's conversation, or a claude.ai chat draft and its date), Written (date, and branch and short commit it was written against), Tracker row (empty until planting)
4. **Frame: What a seed is** — a fixed paragraph, kept as written: a seed sits before the lifecycle and records work thought through at the concept level; it carries no commitment and may change or never be planted; planting is Robert's call. When planted, it is the Concept of its work, and the tracker write-up points at it (decision 16)
5. **Frame: Read this first** — REQUIRED (decision 13). "Awareness, not authorization", then bullets of what not to do (do not start the work, do not promote the row, re-ground before relying on a repo fact here, with the commit the facts are a snapshot of). Then a required "Practical effect today": what a session working nearby does differently now. The comment says this part is written from the code, not from the conversation
6. **Frame: Decisions already made** — a table: number, decision, who and when. Only Robert's rulings; Claude's proposals stay in the body
7. **Frame: Open questions** — a table, marked "not to be answered now"
8. **Frame: If planted** — the proposed Backlog row in tracker columns (Item, Trigger, Detail; the ID is left for the plant job), and the next steps, each Robert's call
9. **Body: In Plain Words** — REQUIRED, decision 61's three lines about this seed: What (the work that is coming, in plain words with none of the project's vocabulary), Why (the problem it answers), How it fits (where the work would sit in the project). The comment says a seed carries no Design Spec; the first doc after it holds one (decision 56)
10. **Body: Problem** — what is missing or wrong today
11. **Body: What is coming** — what the work would change and where it touches the repo, with file paths. A snapshot at the commit in the header
12. **Body: arc-only sections** — Vision, Why an Arc, Candidate Initiatives, each marked arc-only in its comment: leave them out unless the work may be an arc; a seed planted as an arc must have all three filled, because arc-discovery reads them (decisions 4 and 15)
13. **Body: Success Criteria** — arc-only and optional, marked as a proposal: arc-discovery ratifies them (decision 30). The comment carries Robert's rule: a criterion is a question he can ask of the finished work, with the answer that means success; not a count or a limit

##### Task 2 — `plugins/gestalt/skills/seed/SKILL.md` (new, named deliverable)

**Carries out:** decisions 2, 3, 17, 19, 20, 21, and 67 to 72.

The frontmatter, literal. No `disable-model-invocation` (decision 20). No angle brackets in the description (E1 plan, Outside Rules, note one):

```
---
name: seed
description: Write a seed for an idea that is coming, or plant a seed as a tracker row. Use when Robert asks to seed an idea, to write it down for later, or to plant a seed. A seed is a doc, not a mode, so it may run inside any session.
argument-hint: "write|plant [name]"
---
```

The body is written in the register of `effort-close/SKILL.md`: an opening paragraph, the sentence that defines a **stop**, then the steps. It must hold:

1. **The address** — `$0` is the job, `write` or `plant`; `$1` is the seed's name in kebab-case. Any other job: say so and stop. No name: ask for one; the name given stands for `$1` in every later step (Decision Record, entry 1)
2. **Paths** — `dev_journals/initiatives/seeds/`; in a multi-product project, `dev_journals/<product>/initiatives/seeds/`, and when the product is not clear from the session, ask. A planted seed is `<ID>-$1-seed.md`, the ID matched by the glob `[A-Z].[0-9][0-9][0-9]`, not by a bare `*` (Decision Record, entry 1)
3. **Read** — `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `lifecycle.md` and `session-discipline.md` (File locations), and the template `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/seed.md`
4. **Checks**, before either job writes anything, each a stop when it fails:
   - `git status --porcelain` prints nothing. If it prints, show it and stop: Robert commits that work first, or says to let it ride in the seed's commit (decision 69)
   - On a branch other than `main`, if the newest subject with an `(E<n>)` scope in `git log --format=%s main..HEAD` is not a closed effort's `fix(E<n>): address effort review findings`, warn: the seed's commit is unscoped, so `effort-close` step 3 will stop on it, and Robert will be asked to keep it there (decisions 21 and 70). This is a warning, not a stop
5. **Branch** — no branch is cut. The job commits on the branch the session stands on, `main` included (decision 21)
6. **Write job**:
   - If a file `$1-seed.md` or `<ID>-$1-seed.md` exists in `seeds/`, say so and stop
   - The source is the session's conversation, or a draft from claude.ai chat that Robert hands in as a path or pasted text (decision 19). A chat draft is raw material: its words may be kept, but its claims about the repo are checked
   - Read the code and docs the idea touches. Note the branch and `git rev-parse --short HEAD` for the header
   - Copy the template to `seeds/$1-seed.md` and fill it. "Read this first" and its "Practical effect today" come from the code just read. Fill the arc-only sections only when the work may be an arc; otherwise delete them. Put the type in the header only if Robert has said it
   - **Stop:** show the seed's In Plain Words and "Read this first"; Robert approves, or says what to change. Edit until he approves
   - `git add -A`, and commit with the subject `docs: add $1 seed` and the session's attribution lines
7. **Plant job**:
   - Find `seeds/$1-seed.md`. If only `<ID>-$1-seed.md` exists, the seed is planted already: say so and stop. If neither exists, say so and stop
   - Read the seed whole, and the tracker
   - Propose (decision 67): the type, from what the seed describes; the next free ID for that type's prefix, one more than the highest number with that prefix in the tracker and in the folder names at every depth under `initiatives/_completed/`, `_completed/arcs/` included; and the Backlog row, from the seed's "If planted" section, with a link to the seed's new path at the end of Detail
   - **Stop:** Robert confirms or changes the type, the ID and the row. Ask with AskUserQuestion, the proposal first and marked "(Recommended)"
   - If the type is an arc, check that Vision, Why an Arc and Candidate Initiatives are filled. If one is missing or still a slot, name it and stop (decision 15)
   - Add the row to the Backlog table for the type (`lifecycle.md`, Stage 1)
   - `git mv seeds/$1-seed.md seeds/<ID>-$1-seed.md` (decision 17)
   - Search the repo for `$1-seed.md`, outside `.git/`, and fix each link to the new name with Edit. Leave a hit that already names `<ID>-$1-seed.md`, or another seed whose name ends in `-$1`. Skip any folder the project's `CLAUDE.md` says is never edited, and list each hit skipped (decision 72)
   - In the seed's header, fill Type and Tracker row
   - **Stop:** show the row, the rename and the fixed links; Robert approves
   - `git add -A`, and commit with the subject `docs: plant $1 seed as <ID>` and the session's attribution lines
8. **The end** — after a write: name the plant job as the later step, `/gestalt:seed plant $1`. After a plant: the row waits in the Backlog; promotion is Robert's call (`lifecycle.md`). Do not promote

##### Commit message

```
feat(E2): add the seed template and the seed skill

- templates/seed.md: a frame for every seed (header, what a seed is,
  Read this first, decisions, open questions, if planted) and a body
  with arc-only sections
- /gestalt:seed write: a seed from the session or a chat draft, one
  docs commit on the branch the session stands on
- /gestalt:seed plant: proposes the type, ID and row; Robert confirms;
  the row, the rename and the fixed links land in one docs commit
```

#### Commit 2 — `feat(E2): list the seeds at session start`

##### Task 1 — `plugins/gestalt/scripts/seed-index.sh` (new)

Decisions 14, 64, 65 and 68; Outside Rules, rows 14 and 16. Full contents:

```sh
#!/bin/sh
# SessionStart context: the seed index, when the project has seeds.
cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
seeds=$(ls dev_journals/initiatives/seeds/*-seed.md dev_journals/*/initiatives/seeds/*-seed.md 2>/dev/null)
[ -n "$seeds" ] || exit 0
printf '%s\n' "This project has seeds: work that is coming and is not built yet. Before work that touches a seed's area, read that seed's \"Read this first\"; it says what not to build against. A file name that starts with an ID is a planted seed. The seeds:"
printf '%s\n' "$seeds" | sed 's#^#  - #'
```

##### Task 2 — `plugins/gestalt/hooks/hooks.json`

The second hook, and the description, which names the architecture index only. Full contents:

```json
{
  "description": "Lists the architecture wiki pages and the seeds at session start, when the project has them",
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "sh \"${CLAUDE_PLUGIN_ROOT}\"/scripts/architecture-index.sh",
            "statusMessage": "Loading architecture index"
          },
          {
            "type": "command",
            "command": "sh \"${CLAUDE_PLUGIN_ROOT}\"/scripts/seed-index.sh",
            "statusMessage": "Loading seed index"
          }
        ]
      }
    ]
  }
}
```

After the gate, run `CLAUDE_PROJECT_DIR=$PWD sh plugins/gestalt/scripts/seed-index.sh` from the repo root: it lists `one-claude-seed.md`.

##### Commit message

```
feat(E2): list the seeds at session start

- scripts/seed-index.sh lists every seed by its path, in both project
  layouts, with one line on reading "Read this first"
- hooks.json runs it beside the architecture index
```

The phase's box in the Overview list is ticked in this commit.

### Phase 2 — The seed in the process

**In plain words:** the lifecycle, the file rules, the style guide, the branch rule and the session skills learn the seed. After this phase every process file agrees with the skill: where a seed lives, when it is renamed, that it is a piece of work's Concept, and that the close moves it.

#### Commit 3 — `docs(E2): define the seed in the session-modes skill and the style guide`

##### Task 1 — `plugins/gestalt/skills/session-modes/lifecycle.md`

Two edits. In Stage 1, planting as the way a seed gets a row (decisions 2, 3 and 17).

**Find:**
```
Prose notes attached to a row (an idea to weigh, not a decision) go in the Backlog's **Captured Ideas** subsection, after the tables.
```
**Replace with:**
```
Prose notes attached to a row (an idea to weigh, not a decision) go in the Backlog's **Captured Ideas** subsection, after the tables.

**Planting a seed.** A seed in `dev_journals/initiatives/seeds/` gets its row by planting: `/gestalt:seed plant <name>` adds the Backlog row with a link to the seed, and renames the seed to start with the row's ID. The seed stays in `seeds/`, beside its row, until the initiative closes.
```

In Stage 3, the write-up of seeded work (decision 16).

**Find:**
```
- **Status** — see below

**Arcs are the exception:**
```
**Replace with:**
```
- **Status** — see below

**Seeded work:** when the initiative has a seed, the seed is its Concept. The write-up is a pointer to the seed, plus Trigger and Status, which change while the seed does not. Work with no seed keeps the full write-up.

**Arcs are the exception:**
```

##### Task 2 — `plugins/gestalt/skills/session-modes/session-discipline.md`

Three edits in File locations. The name rule's one exception (decision 17):

**Find:**
```
A project's docs from before it adopted this rule keep their names.
```
**Replace with:**
```
A project's docs from before it adopted this rule keep their names. An unplanted seed is the one exception: it has no ID yet, so its file is `<name>-seed.md` until it is planted.
```

The seeds half of "not defined yet":

**Find:**
```
- **Explorations and seeds** — `dev_journals/initiatives/explorations/` and `dev_journals/initiatives/seeds/`. Their process is not defined yet
```
**Replace with:**
```
- **Seeds** — `dev_journals/initiatives/seeds/<name>-seed.md`, renamed `<ID>-<name>-seed.md` when it is planted. Written and planted with `/gestalt:seed`, from `templates/seed.md`
- **Explorations** — `dev_journals/initiatives/explorations/`. Their process is not defined yet
```

The seed among the files a close moves (decision 18):

**Find:**
```
- **Completed artifacts** — when an initiative ships, its discovery doc, all its plans (single, overview, and effort plans) and its retro move into one folder.
```
**Replace with:**
```
- **Completed artifacts** — when an initiative ships, its seed, its discovery doc, all its plans (single, overview, and effort plans) and its retro move into one folder.
```

##### Task 3 — `plugins/gestalt/skills/session-modes/SKILL.md`

Two edits. The Concept column (decisions 16 and 71):

**Find:**
```
| **Feature** | Tracker write-up | Always, 1–2 sessions |
```
**Replace with:**
```
| **Feature** | Tracker write-up, or its seed | Always, 1–2 sessions |
```

**Find:**
```
| **Refactor** | Tracker write-up | Often skipped;
```
**Replace with:**
```
| **Refactor** | Tracker write-up, or its seed | Often skipped;
```

**Find:**
```
| **Docs** | Backlog row, or write-up if initiative-sized |
```
**Replace with:**
```
| **Docs** | Backlog row, or write-up or seed if initiative-sized |
```

The templates table, a row first:

**Find:**
```
|---|---|---|
| Discovery doc | `discovery.md` |
```
**Replace with:**
```
|---|---|---|
| Seed | `seed.md` | `dev_journals/initiatives/seeds/<name>-seed.md`; `/gestalt:seed plant` renames it `<ID>-<name>-seed.md` |
| Discovery doc | `discovery.md` |
```

##### Task 4 — `plugins/gestalt/skills/style-guide/SKILL.md`

The seed as a document type, first in the list.

**Find:**
```
**Discovery Doc** (`dev_journals/initiatives/discovery/<ID>-<name>-discovery.md`) — written before implementation begins.
```
**Replace with:**
```
**Seed** (`dev_journals/initiatives/seeds/<name>-seed.md`, `<ID>-<name>-seed.md` once planted) — work that is coming, written before it enters the lifecycle. It hands a conversation over to the session that picks the work up, and its "Read this first" tells today's sessions what not to build against. Written and planted with `/gestalt:seed`; template `templates/seed.md` in the session-modes skill. Carries no Design Spec. Moves to `_completed/` with its initiative.

**Discovery Doc** (`dev_journals/initiatives/discovery/<ID>-<name>-discovery.md`) — written before implementation begins.
```

##### Commit message

```
docs(E2): define the seed in the session-modes skill and the style guide

- lifecycle: planting gives a seed its row; seeded work's write-up is a
  pointer plus Trigger and Status
- session-discipline: the seed's file name before and after planting,
  its place in File locations, and the seed among the files a close moves
- session-modes SKILL.md: "or its seed" in the Concept column, and the
  seed template's row
- style guide: the seed as a document type
```

#### Commit 4 — `docs(E2): name the seed in the rules and the session skills`

##### Task 1 — `plugins/gestalt/rules/code-and-docs.md`

Two edits. The seeds half of "not defined yet":

**Find:**
```
- `dev_journals/initiatives/explorations/`, `dev_journals/initiatives/seeds/`: exploration docs and initiative seeds. Their process is not defined yet.
```
**Replace with:**
```
- `dev_journals/initiatives/seeds/`: initiative seeds, work that is coming and not yet in the lifecycle. `/gestalt:seed` writes and plants them; the session-modes skill holds the rest.
- `dev_journals/initiatives/explorations/`: exploration docs. Their process is not defined yet.
```

In Session modes, name the skill:

**Find:**
```
`/gestalt:coordinate <ID>.E<n>` runs the phases of one effort from one session, each phase in a sub-agent of its own.
```
**Replace with:**
```
`/gestalt:coordinate <ID>.E<n>` runs the phases of one effort from one session, each phase in a sub-agent of its own. Write a seed with `/gestalt:seed write <name>` and plant it as a tracker row with `/gestalt:seed plant <name>`; a seed is not a mode, so either job may run inside any session.
```

##### Task 2 — `plugins/gestalt/rules/git-and-delivery.md`

The seed's exemption from the branch rule (decision 21).

**Find:**
```
- Sub-initiatives and enabling refactors on a feature branch are sequential commits on that branch, not sub-branches.
```
**Replace with:**
```
- A seed is exempt from the branch rule. `/gestalt:seed` makes one unscoped `docs:` commit per job on the branch the session stands on, `main` included.
- Sub-initiatives and enabling refactors on a feature branch are sequential commits on that branch, not sub-branches.
```

##### Task 3 — `plugins/gestalt/skills/discovery/SKILL.md`

Two edits. Step 2 reads the seed:

**Find:**
```
If there is no row, or the row is not in Current Initiatives, say so and stop; promotion is Robert's call.
```
**Replace with:**
```
If there is no row, or the row is not in Current Initiatives, say so and stop; promotion is Robert's call. If the write-up points at a seed, read it, `dev_journals/initiatives/seeds/$0-*-seed.md`: In Plain Words first, then the rest. It is the initiative's Concept.
```

Step 6 scaffolds from it:

**Find:**
```
fill Problem, Design Summary and Open Questions with what the tracker and the arc already say.
```
**Replace with:**
```
fill Problem, Design Summary and Open Questions with what the tracker, the seed and the arc already say.
```

##### Task 4 — `plugins/gestalt/skills/plan/SKILL.md`

**Find:**
```
2. Read the `<ID>` row and write-up in `dev_journals/planned-work.md` (under `dev_journals/<product>/` in a multi-product project), then the discovery doc's In Plain Words, then the rest of it.
```
**Replace with:**
```
2. Read the `<ID>` row and write-up in `dev_journals/planned-work.md` (under `dev_journals/<product>/` in a multi-product project), and the seed, `dev_journals/initiatives/seeds/<ID>-*-seed.md`, if the write-up points at one. Then the discovery doc's In Plain Words, then the rest of it.
```

##### Task 5 — `plugins/gestalt/skills/initiative-close/SKILL.md`

Two edits (decision 18, the initiative's half). Step 1 reads the seed:

**Find:**
```
note the Type, which step 9 needs after step 8 removes the row.
```
**Replace with:**
```
note the Type, which step 9 needs after step 8 removes the row. If the write-up points at a seed, read it.
```

Step 8 moves it:

**Find:**
```
   - Move the discovery doc, every plan and the retro with `git mv` into the completed folder
```
**Replace with:**
```
   - Move the seed (`dev_journals/initiatives/seeds/$0-*-seed.md`, if there is one), the discovery doc, every plan and the retro with `git mv` into the completed folder
```

##### Task 6 — `plugins/gestalt/skills/adopt/SKILL.md`

`seeds/` in step 4 (decision 39). Two edits.

**Find:**
```
`dev_journals/initiatives/{discovery,implementation,arcs,_completed}/`
```
**Replace with:**
```
`dev_journals/initiatives/{discovery,implementation,arcs,seeds,_completed}/`
```

**Find:**
```
and the four `initiatives/` folders with a `.gitkeep` each.
```
**Replace with:**
```
and the five `initiatives/` folders with a `.gitkeep` each.
```

##### Task 7 — `dev_journals/initiatives/implementation/F.008-skills-expansion-overview-plan.md`

Tick effort 2's Done box in the Effort Summary.

**Find:**
```
| [ ] | 2 | Seeds |
```
**Replace with:**
```
| [x] | 2 | Seeds |
```

##### Commit message

```
docs(E2): name the seed in the rules and the session skills

- code-and-docs: seeds/ in the layout, /gestalt:seed in Session modes
- git-and-delivery: a seed is exempt from the branch rule
- discovery and plan read the seed where they read the write-up
- initiative-close reads the seed and moves it to _completed/
- adopt creates seeds/
- overview plan: effort 2 is done
```

The phase's box in the Overview list is ticked in this commit. The wrap-up names the next step: `/gestalt:effort-close F.008.E2` in a new session.

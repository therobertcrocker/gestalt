---
name: seed
description: Write a seed for an idea that is coming, or plant a seed as a tracker row. Use when Robert asks to seed an idea, to write it down for later, or to plant a seed. A seed is a doc, not a mode, so it may run inside any session.
argument-hint: "write|plant [name] [ID]"
---

Run the seed job `$0` for the seed `$1`. A seed records work that is coming, before it enters the lifecycle. It is a doc, not a mode: either job may run inside any session, and ends in one unscoped `docs:` commit on the branch the session stands on.

A **stop** waits for Robert. Between stops, go on without asking.

1. **The address.** `$0` is the job, `write` or `plant`. Any other job: say so and stop. `$1` is the seed's name in kebab-case. With no name, ask for one; the name given stands for `$1` in every step below. `$2`, for the plant job only, is optional: the ID of a row that is already in the tracker, for work that was promoted before it had a seed. With `$2`, the plant job attaches the seed to that row and adds no row.
2. **Paths.** Seeds live in `dev_journals/initiatives/seeds/`; in a multi-product project, in `dev_journals/<product>/initiatives/seeds/`. When the product is not clear from the session, ask. Below, `seeds/` is that folder, and every other `dev_journals/` path reads the same way. A planted seed's name starts with a tracker ID: `<ID>-$1-seed.md`, where `<ID>` is a capital letter, a dot and three digits (glob `[A-Z].[0-9][0-9][0-9]`). A bare `*-$1-seed.md` also matches another seed whose name ends in `-$1`.
3. **Read** `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/SKILL.md`, then `lifecycle.md` and `session-discipline.md` (File locations) in the same folder, and the template `${CLAUDE_PLUGIN_ROOT}/skills/session-modes/templates/seed.md`.
4. **Checks**, before either job writes anything:
   - `git status --porcelain` prints nothing. If it prints, show it and stop: the job's commit uses `git add -A`, so that work would ride in the seed's commit. Robert commits it first, or says to let it ride.
   - On a branch other than `main`, look at the subjects with an `(E<n>)` scope in `git log --format=%s main..HEAD`. If there is none, there is no warning. Take the effort of the newest of them. A closed effort has its squash commit, `feat: <ID> effort <n> — <name>`, in `main..HEAD`, and no commit scoped `(E<n>)` after it other than `fix(E<n>)`; unscoped commits after it do not count. If that effort is not closed, warn: an effort is in progress, the seed's commit is unscoped, so `/gestalt:effort-close` step 3 will stop on it and ask Robert to keep it there. This is a warning, not a stop.
5. **Branch.** No branch is cut. The job commits on the branch the session stands on, `main` included.
6. **Write job.**
   - If `seeds/$1-seed.md` or a planted `seeds/<ID>-$1-seed.md` exists, or a closed `<ID>-$1-seed.md` at any depth under `dev_journals/initiatives/_completed/`, say so and stop.
   - The source is the session's conversation, or a draft from claude.ai chat that Robert hands in as a path or as pasted text. A chat draft is raw material: its words may be kept, but each of its claims about the repo is checked against the source.
   - Read the code and docs the idea touches. Note the branch and `git rev-parse --short HEAD` for the header.
   - Copy the template to `seeds/$1-seed.md` and fill it. "Read this first" and its "Practical effect today" come from the code just read, not from the conversation. Fill the arc-only sections only when the work may be an arc; otherwise delete them. Put the type in the header only if Robert has said it. Delete the template's comments.
   - **Stop:** show the seed's In Plain Words and "Read this first". Robert approves, or says what to change; edit until he approves.
   - `git add -A`, then commit with the subject `docs: add $1 seed` and the session's attribution lines.
7. **Plant job.**
   - Find `seeds/$1-seed.md`. If only a planted `seeds/<ID>-$1-seed.md` exists, the seed is planted already: say so and stop. If neither exists, say so and stop.
   - Read the seed whole, then `dev_journals/planned-work.md`.
   - **With `$2`:** find the `$2` row in the tracker; if there is none, say so and stop. The ID is `$2` and the type is the one its prefix names. Propose no row, add no row, and do not edit the row or its write-up; a Current Initiative's row is frozen (`lifecycle.md`), and the skills that read a seed find it by ID. Skip the proposal, its stop and the Backlog step below; go on at the arc check.
   - Propose three things:
     - The type, from what the seed describes.
     - The ID: the next free number for that type's prefix, one more than the highest number with that prefix in the tracker and in the file and folder names at every depth under `dev_journals/initiatives/`, so `_completed/arcs/`, the initiatives inside it, `explorations/` and `seeds/` count too.
     - The Backlog row, from the seed's "If planted" section, with a link to the seed's new path, `<ID>-$1-seed.md`, at the end of Detail.
   - **Stop:** Robert confirms or changes the type, the ID and the row. Ask with AskUserQuestion, one question each, the proposal first and marked "(Recommended)".
   - If the type is an arc, check that Vision, Why an Arc and Candidate Initiatives are filled. If one is missing or still a slot, name it and stop.
   - Add the row to the Backlog table for the type (`lifecycle.md`, Stage 1).
   - `git mv seeds/$1-seed.md seeds/<ID>-$1-seed.md`.
   - Search the repo for `$1-seed.md`, outside `.git/`, and fix each link to the new name with Edit. Fix only a hit whose file name is exactly `$1-seed.md`. Leave alone every hit with more in front of `$1-seed.md`: the new `<ID>-$1-seed.md`, as the new Backlog row has; a closed seed of the same name under another ID; or another seed whose name ends in `-$1`. Skip any folder the project's `CLAUDE.md` says is never edited, and list each hit you skipped.
   - In the seed's header, fill Type and Tracker row.
   - **Stop:** show the row (with `$2`, the existing row), the rename and the fixed links. Robert approves, or says what to change.
   - `git add -A`, then commit with the subject `docs: plant $1 seed as <ID>` and the session's attribution lines.
8. **The end.** After a write, name the plant job as the later step: `/gestalt:seed plant $1`. After a plant, the row waits in the Backlog; promotion is Robert's call (`lifecycle.md`). Do not promote it.

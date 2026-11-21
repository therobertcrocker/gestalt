# Plans as Intent — Seed

> **Type:** feature
> **Status of the work it describes:** Promoted to Current Initiatives on 2026-11-21.
> **Source:** the conversation of the session that wrote it, the F.008 initiative close
> **Written:** 2026-11-21, against `main` @ `5c849b4`
> **Tracker row:** `F.009`, Current Initiatives

## What a seed is

A seed sits before the initiative lifecycle. It records a piece of work that has been thought through at the concept level. A seed carries no commitment: it may change shape or never be planted. Whether it enters the lifecycle is Robert's call. When it is planted, it is the Concept of its work, and the tracker write-up points at it.

## Read this first

This file exists so that sessions in this repo know a change to how plans and Execution work is coming, and do not build against it. It is **awareness, not authorization.**

- **Do not start the work.** No edit to `feature-flow.md`, the plan template, `execute` or the phase brief on the strength of this seed.
- **Do not promote the row.** Promotion is Robert's call.
- **Re-ground before relying on any repo fact below.** The facts are a snapshot at `5c849b4`.

*Practical effect today:*

- A plan written now still follows `feature-flow.md`: literal code in every task. Nothing changes until the work lands
- A session that edits `feature-flow.md` (Discipline), `templates/implementation-plan.md` (the phase budget and the task format), `execute/SKILL.md` or `coordinate/phase-brief.md` reads this seed first; those are the lines this work rewrites
- `C.003` (phase budget review) and `F.004` (lighter change flow) touch the same ground; a session on either reads this seed

## Decisions already made

| # | Decision | Who and when |
|---|---|---|
| 1 | The idea is captured as a seed, not as a row beside `F.004` | Robert, 2026-11-21 |
| 2 | The work is tried in one session in gestalt, from this seed, without the full Discovery, Plan and Execution sequence | Robert, 2026-11-21 |

## Open questions

Not to be answered now. The first session of the work picks them up.

| # | Question | Notes |
|---|---|---|
| 1 | What does a plan keep? | Candidates: types, signatures and struct fields; the decisions; test cases in plain words; the full body only for a hard algorithm or a quoted outside rule |
| 2 | What does Execution do when the plan and the source or the rules disagree? | Today a phase agent follows the source only on a Find anchor that does not match (`phase-brief.md:36`), and builds the plan as written on an outside-rule difference (line 45). The idea: follow the rules and the source, log the deviation, report it as "needs a call" |
| 3 | Does the change hold in every project, or only where the gate is weak? | The gm-toolkit evidence below is Go code with a compiler and tests, and shows the same rate of fixes |
| 4 | What does the phase budget count once bodies leave the plan? | `templates/implementation-plan.md` sizes a phase at about 1,500 lines of mostly literal code; `C.003` watches that number |
| 5 | Is the change tried on one gm-toolkit effort before the rules change, or written into the rules and judged at its first use? | Decision 2 sets the one-session try in gestalt. A trial effort would compare its effort-close fixes with the baseline below |
| 6 | How does this fit with `F.004`? | `F.004` asks for a lighter flow for gestalt's own changes; decision 2 makes this seed its first test |

## If planted

| Item | Trigger | Detail |
|---|---|---|
| Plans as intent, execution writes the code | `--` | Plans keep the shape (signatures, decisions, test cases) and drop function bodies; Execution writes the code under the rules and reports each deviation from the plan. Evidence: F.008 and gm-toolkit effort-review fixes. Seed: `F.009-plans-as-intent-seed.md` |

Next steps, each Robert's call:

1. Plant the seed: `/gestalt:seed plant plans-as-intent`
2. Run the one session of decision 2

## In Plain Words

- **What** — a change to how plans are written and run: a plan says what to build and how to tell it works, and the session that builds it writes the code itself, checks it against the project's rules and the real source, and reports where it had to depart from the plan.
- **Why** — today a plan holds the finished code and the build session copies it. The plan's mistakes ship as written, and the reviews at each effort's end catch them, 3 to 11 per effort.
- **How it fits** — it rewrites the core rule of the feature flow ("code, not prose"), the plan template, the Execution skill and the coordinator's brief. It is gestalt-wide, so every project's plans change.

## Problem

`feature-flow.md`, Discipline, requires every task to carry "the literal edit (real signatures, full struct fields, the function body, exact messages)". The rule exists to keep the build session from inventing code Robert did not agree to. Its cost is that the build session's job is to copy. `execute` step 6 runs the plan's commits as written. `coordinate/phase-brief.md` lets a phase agent follow the source only where a Find anchor does not match (line 36); where an outside rule differs from the planned code, it says "Do not decide a difference; build what the plan says and report" (line 45). Nothing tells a build session to hold the plan's code against the project's own rules.

The evidence, from the F.008 close on 2026-11-21:

- **F.008** (process files) — six fix commits, 44 review fixes, for about 1,460 plugin lines. Most were logic gaps in skill steps that the plans had written out in full
- **gm-toolkit** (Go, with a compiler and tests) — 17 effort-review fix commits from 2026-10-31 to 2026-11-20, 3 to 11 fixes each. The gate did not catch them, because the plans write the tests too, so the tests share the plan's blind spots

Three fixes checked against the plan text from before the fix:

| Fix | In the plan before it? |
|---|---|
| F.041.E3 (`9ff060b`): a basic save halves each damage type, not the total | Yes: the plan's literal `basic()` halves per part (plan line 966); execution copied it |
| F.041.E1 (`8b1f896`): ten fixes | Yes: the fix rewrote 113 lines of the plan's code blocks to match |
| A.001.8.E1 and E3, F.041.E1: short names `ctx`, `rb`, `fm`, `muts`, `camp` | Yes: 15, 12 and 32 hits in the plans |

The clearest sign: about ten of the sixteen distinct fix commits fix something the always-loaded rules forbid (short names, docstrings, comments that restate code). Every build session has those rules in context, and still wrote `rb` because the plan said `rb`.

Not every finding is a copy problem. Some are plan omissions (NPC Strike range from `range-increment` has no hit in the F.041.E3 plan), some are seams between features (shelter, relocate and capture in faction-manager), and some are outside rules written from memory, which F.008's source check now targets. Review still owns the seams.

## What is coming

A snapshot at `5c849b4`. The lines the work would change:

- `plugins/gestalt/skills/session-modes/feature-flow.md` — the Work breakdown table's Task row ("One edit, as literal code") and the Discipline paragraph
- `plugins/gestalt/skills/session-modes/templates/implementation-plan.md` — the SIZE comment ("Spend lines on literal code in tasks"), the phase budget, and the task format (Find and Replace with literal code)
- `plugins/gestalt/skills/plan/SKILL.md` — what a task holds
- `plugins/gestalt/skills/execute/SKILL.md` — step 5 and step 6: write the code under the rules, check it against the source, log and report each deviation
- `plugins/gestalt/skills/coordinate/phase-brief.md` — lines 36 and 45, and the report's "Deviations from the plan" part

The shape, as proposed in the conversation:

```
now:      plan (literal code + literal tests) -> copy -> review finds 3-11
proposed: plan (intent, signatures, cases)    -> write + check against
                                                 rules and source, flag
                                                 deviations as "needs a
                                                 call"                  -> review finds seams
```

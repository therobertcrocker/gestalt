# Exploration flow

An exploration looks at a part of the system, or at something outside it, weighs options and files each follow-on as its own row. It answers "which way?"; a Discovery answers "what exactly?". An exploration does not replace a Discovery. A refactor's audit runs the same way, so this file is the shared middle of `/gestalt:explore` and `/gestalt:audit`, as `session-discipline.md` is for the session skills.

## Exploration or audit

Which came first decides the name and the ID:

```
a question, no row yet    -> exploration, its own E. row -> files follow-on rows
                             (a refactor may be one of them)
an existing refactor row  -> audit, under the R. ID      -> that refactor's Plan
```

The two run the same way: the same template, the same seven steps, the same three stops. They differ at the edges:

| Edge | `/gestalt:explore <E.ID>` | `/gestalt:audit <R.ID>` |
|---|---|---|
| Start | An `E.` row in the Explorations table | A refactor row that is in progress |
| Branch | Exempt; may run on `main` | The refactor's branch, cut when its work starts |
| Middle | This file and `templates/exploration.md` | The same |
| End | Files the follow-on rows and removes its own row | Files nothing; names the refactor's Plan as the next step |

## The doc

One template serves both: `templates/exploration.md`. The two docs sit in one folder and end in different places:

| Doc | File | At the close |
|---|---|---|
| Exploration | `dev_journals/initiatives/explorations/<E.ID>-<name>-exploration.md` | Stays in `explorations/` |
| Audit | `dev_journals/initiatives/explorations/<R.ID>-<name>-audit.md` | `/gestalt:initiative-close` moves it to `_completed/<R.ID>-<name>/` with the refactor's plan and retro |

An audit holds the refactor's Design Spec, because it is the refactor's first doc. An exploration holds none; the first doc of each follow-on row holds that row's spec.

## One session, three stops

An exploration or an audit is one session. A **stop** waits for Robert; between stops, go on without asking.

1. **Stop:** ask Robert for the deciding criterion, before the audit: what makes one option better than another here. With a vague row, ask what prompted it. The audit starts once he answers.
2. Audit: write Current State and Existing Patterns, with `file:line` citations. Send a short update between audit steps; long silent stretches were the most common complaint about past runs.
3. Check every number in the doc against the source: each count, each "every" and each "only" is enumerated, not carried.
4. **Stop:** Robert reviews the audit. For an audit, the Design Spec is drafted before this stop and ratified at it, before any option is written; the options are weighed against it. A question Robert adds here goes into Questions, marked as added after the audit.
5. Write Options and the Recommendation. Facts found while the options are written go into Current State, Options and the rows, with no section of their own. An option Robert proposes is added beside the others, not in place of them. The doc marks its rows "proposed".
6. **Stop:** a spot check of what was left out, every item put to Robert, then his sign-off of the doc, the rows and their IDs.
7. File the follow-on rows. Only an exploration files rows; an audit files nothing and names the refactor's Plan. A new `E.` row goes into the Explorations table; every other new row goes into the Backlog. A doc the exploration feeds is not edited. A fed row in the Backlog or Up Next takes the answer in its Detail. A fed Current Initiative is frozen (`lifecycle.md`): its write-up gets one pointer line, "Answered by `<E.ID>`: link", never the answer.

## The doc while it runs

- **Status** — the header's Status moves from in progress, to written and waiting on review, to complete
- **In Plain Words** — drafted after the audit and rewritten last, in four lines: What, Short answer, Why, How it fits
- **Terms** — optional, on top of Options; added when a naming trap shows

## What comes after

The follow-on row's own flow decides what comes next. The exploration counts as the audit:

- **A feature** — gets its Discovery. The Discovery reads the exploration first and does not redo the audit or the choice of direction: lighter, never skeletal
- **A refactor whose target is chosen** — goes straight to Plan, which reads the exploration (`refactor-flow.md`)

The Recommendation's "How it lands" names the next mode for each follow-on row; for an audit, it names the refactor's Plan.

## Branch and commit

- **Exploration** — exempt from the branch rule. It runs on the branch the session stands on, `main` included
- **Audit** — the refactor's first session, so it runs on the refactor's branch

Each makes one unscoped `docs:` commit, at the end, after Robert's sign-off.

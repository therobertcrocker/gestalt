# Skills Expansion — Retro

## In Plain Words

Every kind of work in a gestalt project now starts from a skill. Six new skills: `seed` writes down an idea that is coming and later turns it into a tracker row; `explore` runs an exploration and `audit` runs a refactor's audit, both over one shared flow and template; `arc-discovery` and `arc-plan` run an arc's two planning sessions on a branch of their own, from the arc's seed; `coordinate` runs the phases of an effort in sub-agents, one per phase. A start-of-session hook lists every seed, so a session hears of coming work without reading the tracker. Claude can now start the session skills itself; the closes and upkeep skills stay Robert's. A plan quotes every outside rule it builds, with its link. The first doc of any work now opens with a Design Spec (what is built and how Robert will know), the close checks the work against it, and In Plain Words in every doc says only what that doc does. A new catalogue lists every skill and the five holes left.

Removed or reshaped: the arc concept template (the seed takes its place), and the refactor's Discovery (a refactor now runs Audit, Plan, Execution).

Criteria met: 1, 2, 7, 8, 9 and 10 in full. Criteria 3, 4, 5 and 6 are built and wait for their first real use, as the overview plan set out.

## 1 — Did we do what we set out to do?

Held against the ten criteria of the discovery doc's Design Spec.

| # | Met | Evidence |
|---|---|---|
| 1 | Met | Each row of "How a piece of work now starts" has its skill on disk: `seed`, `explore`, `audit`, `arc-discovery`, `arc-plan`, `discovery`, `coordinate`; none carries the hand-only flag |
| 2 | Met | `scripts/seed-index.sh` is in the SessionStart group of `hooks.json`; run here, it prints the notice and `one-claude-seed.md` |
| 3 | Built, not yet used | `seed` step 7: the row, the `git mv` and the link fixes land in one `docs: plant` commit. No seed has been planted with it |
| 4 | Built, not yet used | `explore` and `audit` both run the seven steps and three stops of `exploration-flow.md` over `templates/exploration.md`. Neither has run |
| 5 | Built, not yet used | `arc-discovery` reads `seeds/<A.ID>-*-seed.md` and uses `templates/arc-discovery.md` in `arcs/`; no feature template or folder is used. `one-claude` is not planted yet |
| 6 | Built, not yet used | `coordinate` with `phase-brief.md`: one command, one Opus agent per phase, a review stop per phase. The sub-agent trial of 2026-11-20 showed the Skill call works; no full run has happened |
| 7 | Met | The plan template has a required Outside Rules section and `plan` step 5 fetches each rule. The E2 plan, the first after effort 1, quotes four rules from `hooks.md` with links |
| 8 | Met | `skills/session-modes/catalogue.md`: 18 skills, the coverage table and five holes marked `(planned)` |
| 9 | Met | The Design Spec rule is in `session-discipline.md`; `discovery.md`, `exploration.md` (audit), `arc-discovery.md`, `implementation-plan.md` and `docs-plan.md` carry it; this retro is the close holding the work against it |
| 10 | Met | The rule is rewritten in `session-discipline.md` and in every template that defines In Plain Words; F.008's own discovery doc and plans were brought to the new shape |

Landed as designed: the six fronts, in five efforts. Cut: the trial phase of every effort (overview plan, Decision Record, entry 1), so four criteria wait for first use rather than a trial. Added that was not planned: three stops for an exploration in place of two (E3 plan, Decision Record, entry 1); a fallback to an old arc concept doc for arcs from before seeds (decision 86); the branch check before reading branch-only docs, across `plan`, `audit`, `arc-discovery` and `arc-plan` (E4 plan, Decision Record, entry 2); and the design spec itself, a sixth front added after the discovery sign-off.

## 2 — Is there a better way we didn't see?

Yes, for the process, not for the product. About 4,350 lines of discovery doc and plans produced about 1,460 lines of plugin change: three lines of planning per line shipped. Most plan text for new files was the file's full text, so Execution copied it and the effort close then found 7 or 8 real gaps in each. A lighter path, closer to what efforts 3 to 5 ran (plan, execute and close in one session), with the plan holding scope and decision numbers and the new file written once, would have cost one less copy of every file and saved about a third of the planning text. That is `F.004`'s question; this run is its best evidence.

The product shape still holds. One shared flow for explorations and audits, the seed as the arc's concept, and a single Design Spec per piece of work each removed a duplicate rather than adding one.

## 3 — Does it fit the project?

gestalt has no architecture wiki; the binding context is the three rules files and the session-modes skill.

- **Matches** — every new skill follows the shape of the existing starters: address check, read list, checks, numbered steps with named stops, one commit. New templates sit in `session-modes/templates/` with the In Plain Words rule. The hook copies `architecture-index.sh`
- **Matches** — starters open, closes and upkeep hand-only is now one rule, stated in the catalogue and kept by the frontmatter
- **Diverges** — "one mode per session" and "one phase is one session" were overridden for efforts 3 to 5 (overview plan, Decision Record, entry 2). The override is scoped to F.008 and handed to `F.004`
- **Diverges** — decision 34's two task shapes (literal edit, named deliverable) are an exception to `feature-flow.md`, scoped to F.008

## 4 — What does it change about the project?

- **New seams** — three skills now compute a next free ID (`seed plant`, `explore`, `arc-plan`) from the tracker and file names. Two branches can still hand out the same ID (E4 review finding 4, not picked)
- **New constraints** — the catalogue must change in the same commit as any skill, flow file or template. Every new doc needs a Design Spec when it is the first doc of its work
- **New patterns others will copy** — the "is this effort closed?" check by squash subject now lives in `seed`, `explore`, `coordinate` and `effort-close`; four copies of one rule
- **Docs out of date** — the installed plugin is still the old copy until the branch is pushed; this close ran from it, with the branch's retro template. Docs in other projects (gm-toolkit's arc concepts, its seeds) keep the old shape by design
- **Possible now** — planting `one-claude` and running it as an arc; running a gm-toolkit effort under `coordinate`; gm-toolkit's `R.037` as the first `audit`

## 5 — Rating

| Metric | Score | Evidence |
|---|---|---|
| Delivered | 4 | Six of ten criteria met in full; four built and waiting for first use by plan, not by slip |
| Plan held | 3 | Two overview decisions reversed or changed (40, 37), two in E1 (45, 48), two in E3 (8, 81), plus a sixth front added after sign-off |
| Rework | | |
| Fit | 4 | Every new skill matches the starter shape; the two divergences are scoped and recorded |
| Simplicity | 3 | The product removed duplicates; the skills grew long with edge cases the reviews found, and the "effort closed" check is copied four times |

**Verdict:** The right things were built and they fit, at a planning cost about three times the size of the change.

**What surprised me:** Every effort review found 7 or 8 real gaps in skill steps that the plan had written out in full.

## Follow-ups

| ID | Item | Trigger | Detail |
|---|---|---|---|
| `B.001` | The next free ID can be handed out twice | `when` an ID is handed out twice | `seed plant`, `explore` and `arc-plan` take the next free ID from the tracker and the file names under `dev_journals/initiatives/` on the current branch only. Two ways that gives an ID out again: work on two branches picks the same number (F.008 E4 review, finding 4); and a closed trivial bugfix or chore leaves no row and no file, so its number looks free (F.008 initiative review, finding 2; E3 plan, Decision Record, entry 2). A scan of commit subjects across branches would catch both |
| `F.004` | Lighter change flow for gestalt (changed row) | `--` | Add to Detail: F.008 closed with about 4,350 lines of discovery and plans for about 1,460 lines of plugin change, and 39 effort-review fixes over five closes; one session per effort (efforts 3 to 5) held up. See the F.008 retro, section 2 |

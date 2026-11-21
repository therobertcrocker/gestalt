# Arc-level flow

Some work spans multiple initiatives that share a common architecture — for example, a TUI rebuild that ships as a series of layered initiatives, each adding features against the same engine boundary. These are **arcs.** An arc is a Type in the tracker (`A.` prefix, see lifecycle.md), but unlike the other types it is a *container*: it ships nothing directly. The standard Discovery and Plan modes apply at two levels — once for the arc, once for each initiative within it.

**When to use:**
- The work clearly requires multiple shippable initiatives (not a single multi-phase initiative).
- Cross-cutting architectural decisions need to be ratified once and bind every initiative in the arc.
- The order in which the initiatives ship is itself a design question worth deliberation.

If the work fits in one initiative — even a multi-effort one — use the Feature or Refactor Flow directly. Arcs add overhead that only pays off when cross-initiative coordination is real.

**Arc artifacts live together:** while the arc is active, the arc-discovery and the arc-plan sit in `dev_journals/initiatives/arcs/<ID>-<arc-name>/`, and the arc's seed stays in `dev_journals/initiatives/seeds/<ID>-<arc-name>-seed.md`. Per-initiative artifacts stay in the standard `discovery/` and `implementation/` locations until the initiative ships. Then they move into the arc's `_completed/` folder (session-discipline.md, File locations).

## The seed

An arc's Concept is its seed (`templates/seed.md`, written and planted with `/gestalt:seed`), planted as an arc: Vision, Why an Arc and Candidate Initiatives are filled, and it may propose Success Criteria. Before promotion, an arc waits in the Backlog's Arcs subsection as a normal row; once promoted, its write-up is a pointer to the seed, plus Trigger and Status (lifecycle.md). An arc cannot start without a seed: arc-discovery has nothing else to read.

An arc from before seeds has an arc concept doc, `<ID>-<arc-name>-arc-concept.md`, in its arc folder in place of the seed. The arc sessions and closes read it where they would read the seed.

## The arc branch

Arc-discovery and arc-plan run on `feature/<arc-name>`, which `/gestalt:arc-discovery` cuts from `main`. The arc's decisions bind every initiative in it, and each initiative cuts its own branch from `main`, so those decisions must be on `main` before the first initiative starts. `/gestalt:arc-plan` merges the branch into `main` with `--no-ff` once the arc-plan is signed off. The branch changes docs only, so the merge has no code review and no tag. The arc close has a branch of its own, `feature/<arc-name>-close`.

## Success criteria

An arc's Design Spec runs as a chain through its docs:

| Doc | Its job |
|---|---|
| Seed | May propose criteria |
| Arc-discovery | Ratifies them in its Design Spec, before the arc decisions are written |
| Arc-plan | Gives each criterion the initiative that carries it |
| Arc close | Checks every criterion; the arc retro's first question is held against them |

A criterion is a question Robert can ask of the finished work, with the answer that means success; not a count or a limit. Criteria are numbered `SC-1`, `SC-2`. The arc-plan and the retro cite a criterion by number and do not restate it.

## Arc-Discovery (1–2 sessions)

**Goal:** ratify the arc's success criteria, then the cross-cutting architectural decisions that will constrain *every* initiative in the arc — framework, boundaries, conventions, extensibility patterns. Do not slice into initiatives yet; that is Arc-Plan's job.

**Start:** `/gestalt:arc-discovery <A.ID>`, once the arc's row is in Current Initiatives.

**Artifact:** `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-discovery.md`, from `templates/arc-discovery.md`. It opens with the arc's Design Spec. Its decisions (`ACD-1`, `ACD-2`) apply to the whole arc, each tagged as carried in or ratified here, and its Open Questions are routed to Arc-Plan or to a specific initiative.

**Session ends when:** the arc-discovery doc is written, Robert has signed off, and it is committed on `feature/<arc-name>`. Do not begin Arc-Plan in the same session.

## Arc-Plan (1 session)

**Goal:** define the initiatives that make up the arc, in what order, with what boundaries.

**Start:** `/gestalt:arc-plan <A.ID>`, once the arc-discovery is signed off.

**Artifact:** `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-plan.md`, from `templates/arc-plan.md`. Contains:

- **Design Spec — carried by** — each success criterion, cited by number, and the initiative that carries it.
- **Decisions ratified in Arc-Plan** — numbered `AP-1`, `AP-2`, with the rejected alternatives.
- **Initiative list** — ordered, with dependencies surfaced (a DAG, not necessarily a flat sequence — some entries can parallelize). A new initiative takes `<arc-ID>.<n>` in run order; one that existed before the arc keeps its ID.
- **Per-initiative boundary** — what is in scope for each initiative, what is punted to a later entry.
- **Open Question routing** — each open question from Arc-Discovery assigned to a specific initiative.
- **Cross-arc dependencies** — anything outside the arc that gates an initiative: prerequisites in other layers, data, tooling.
- **Out-of-arc deferrals** — explicit list of work the arc does not address.
- **Tracker rows** — the rows the session writes, and **What comes next**.

**Session ends when:** two stops have passed. At the first, Robert signs off the arc-plan and approves the tracker rows; the skill adds each initiative as a Backlog or Up Next row that links the arc-plan, and commits. The arc's own row is not edited (lifecycle.md, Stage 3). At the second, Robert approves the merge, and the skill merges `feature/<arc-name>` into `main`. Arc-plan is the one session starter that merges.

## Initiatives within the arc

Each initiative listed in the Arc-Plan goes through the standard lifecycle from lifecycle.md and the per-Type flow from lifecycle.md, Routing by type.

The arc-level artifacts make per-initiative Discovery and Plan *lighter*, not absent. Per-initiative Discovery does not re-litigate decisions already ratified at the arc level — it focuses on initiative-specific decisions (scope, internal slicing, the open questions Arc-Plan routed to this initiative, the success criteria it carries). Per-initiative Plan inherits the arc's boundary for the initiative. "Lighter" never means short or skeletal: the per-initiative discovery doc is written to full Discovery quality, substantive enough that the Plan can be derived from it, and skips only the sections the arc-discovery already covers.

## Arc completion

Each initiative closes like any other, with `/gestalt:initiative-close <ID>`. The final one leaves the arc's own artifacts and the arc's row in place. Then a new session closes the arc with `/gestalt:arc-close <arc-ID>`: a review of the seams between the initiatives and of drift from the arc-discovery decisions, one fix commit on `feature/<arc-name>-close`, and an arc retro built on the initiative retros that checks every success criterion. Its close-out removes the arc's row from Current Initiatives (lifecycle.md), moves the arc's seed from `seeds/` and the arc artifacts (arc-discovery, arc-plan, arc retro, and an old arc's concept doc) from `arcs/<ID>-<arc-name>/` into `_completed/arcs/<ID>-<arc-name>/`, next to the `initiatives/` folder, and removes the empty arc folder (session-discipline.md, File locations). The arc is complete when the close branch merges.

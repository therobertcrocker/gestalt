# Arc-level flow

Some work spans multiple initiatives that share a common architecture — for example, a TUI rebuild that ships as a series of layered initiatives, each adding features against the same engine boundary. These are **arcs.** An arc is a Type in the tracker (`A.` prefix, see lifecycle.md), but unlike the other types it is a *container*: it ships nothing directly. The standard Discovery and Plan modes apply at two levels — once for the arc, once for each initiative within it.

**When to use:**
- The work clearly requires multiple shippable initiatives (not a single multi-phase initiative).
- Cross-cutting architectural decisions need to be ratified once and bind every initiative in the arc.
- The order in which the initiatives ship is itself a design question worth deliberation.

If the work fits in one initiative — even a multi-effort one — use the Feature or Refactor Flow directly. Arcs add overhead that only pays off when cross-initiative coordination is real.

**Arc artifacts live together:** while the arc is active, every arc-level doc sits in `docs/initiatives/arcs/<ID>-<arc-name>/` — the concept, the arc-discovery, and the arc-plan. Per-initiative artifacts stay in the standard `discovery/` and `implementation/` locations until the initiative ships. Then they move into the arc's `_completed/` folder (session-discipline.md, File locations).

## Arc-Concept

The arc's Concept is a standalone doc, `docs/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-concept.md` (template: `templates/arc-concept.md` in this skill folder), drafted when the arc is promoted to Current Initiatives (lifecycle.md). Before promotion, an arc waits in the Backlog's Arcs subsection as a normal row. It captures the vision, why the work is an arc rather than one initiative, and the rough candidate initiatives — before any Discovery.

## Arc-Discovery (1–2 sessions)

**Goal:** ratify the cross-cutting architectural decisions that will constrain *every* initiative in the arc — framework, boundaries, conventions, extensibility patterns. Do not slice into initiatives yet; that is Arc-Plan's job.

**Artifact:** `docs/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-discovery.md`. Structurally similar to a per-initiative discovery doc, but its decisions apply to the whole arc, and its Open Questions may be routed to specific initiatives later (in Arc-Plan).

**Session ends when:** the arc-discovery doc is written and Robert has signed off. Do not begin Arc-Plan in the same session.

## Arc-Plan (1 session)

**Goal:** define the initiatives that make up the arc, in what order, with what boundaries.

**Artifact:** `docs/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-plan.md`. Contains:

- **Initiative list** — ordered, with dependencies surfaced (a DAG, not necessarily a flat sequence — some entries can parallelize).
- **Per-initiative boundary** — what is in scope for each initiative, what is punted to a later entry.
- **Open Question routing** — each open question from Arc-Discovery assigned to a specific initiative.
- **Cross-arc dependencies** — anything outside the arc that gates an initiative: prerequisites in other layers, data, tooling.
- **Out-of-arc deferrals** — explicit list of work the arc does not address.

**Session ends when:** the arc-plan is written and Robert has signed off. Each initiative in the arc is added to `docs/planned-work.md` as a standard Backlog or Up-Next entry that references the arc-plan.

## Initiatives within the arc

Each initiative listed in the Arc-Plan goes through the standard lifecycle from lifecycle.md and the per-Type flow from lifecycle.md, Routing by type.

The arc-level artifacts make per-initiative Discovery and Plan *lighter*, not absent. Per-initiative Discovery does not re-litigate decisions already ratified at the arc level — it focuses on initiative-specific decisions (scope, internal slicing, the open questions Arc-Plan routed to this initiative). Per-initiative Plan inherits the arc's boundary for the initiative. "Lighter" never means short or skeletal: the per-initiative discovery doc is written to full Discovery quality, substantive enough that the Plan can be derived from it, and skips only the sections the arc-discovery already covers.

## Arc completion

Each initiative closes like any other, with `/gestalt:initiative-close <ID>`. The final one leaves the arc's own artifacts and the arc's row in place. Then a new session closes the arc with `/gestalt:arc-close <arc-ID>`: a review of the seams between the initiatives and of drift from the arc-discovery decisions, one fix commit on `feature/<arc-name>-close`, and an arc retro built on the initiative retros. Its close-out removes the arc's row from Current Initiatives (lifecycle.md), moves the arc artifacts (concept, arc-discovery, arc-plan, arc retro) from `arcs/<ID>-<arc-name>/` into `_completed/arcs/<ID>-<arc-name>/`, next to the `initiatives/` folder, and removes the empty arc folder (session-discipline.md, File locations). The arc is complete when the close branch merges.

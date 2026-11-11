# The initiative lifecycle

Every initiative passes through the same stages, regardless of type. All stages are tracked in `dev_journals/planned-work.md` until the initiative ships.

## Stage 1 — Backlog

Lands in the **Backlog** section of `dev_journals/planned-work.md`, grouped into per-type subsections (Arcs, Features, Refactors, Bugfixes, Docs — others added as needed). A project may split Refactors and Bugfixes again into per-layer sub-tables; a row then goes in the layer where its fix lands, an empty layer shows `_None._`, and the Backlog intro lists what each layer holds. Each table has columns:

- **ID** — stable identifier; the prefix encodes the type: `A.` arc, `F.` feature, `R.` refactor, `B.` bugfix, `D.` docs, `C.` chore
- **Item** — short title
- **Trigger** — one of `--` (no gate), `ready` (scoped, can be promoted), `after <ID>`, `when <condition>`, `needs triage` (cause not known)
- **Detail** — one-line context, problem, or rationale

Prose notes attached to a row (an idea to weigh, not a decision) go in the Backlog's **Captured Ideas** subsection, after the tables.

Every table cell in the tracker is one line; no wrapping. **Item** and **Trigger** are short lookup keys: as few words as still unambiguous. **Detail** carries the substance and may run longer, still on one line. Trim Item and Trigger first, then spend what is left on Detail. If a row can't be stated in one line anywhere, ask whether it earns the row; elaboration belongs in the write-up, the discovery doc or a pointer.

The ID prefix determines which flow applies when the item is eventually worked (see lifecycle.md, Routing by type). Backlog items are unordered. They sit until their trigger fires.

## Stage 2 — Up Next

Promoted into the **Up Next** table when the trigger condition is close or already met. Items move (not copied) from Backlog — Up Next is the prioritized queue, not a projection. Single table; columns ID / Item / Type / Trigger / Detail.

Promotion from Backlog to Up Next is Robert's explicit call.

## Stage 3 — Current Initiative

Promoted into the **Current Initiatives** table at the top of `dev_journals/planned-work.md` and given a full write-up further down in the same file. The table is the index; each row links to the write-up.

The write-up is the initiative's **Concept** artifact — the basic idea, recorded before any Discovery happens. It adds:

- **Problem** — what's broken or missing
- **Approach** — how we plan to address it
- **Unlocks** — what becomes possible once it lands
- **Trigger** — copied from the Backlog/Up Next entry
- **Status** — see below

**Arcs are the exception:** an arc's Concept is a standalone doc at `dev_journals/initiatives/arcs/<ID>-<arc-name>/<ID>-<arc-name>-arc-concept.md` (template in `templates/`), because it outlives the planned-work entry and anchors the arc's folder. The arc's planned-work write-up reduces to a pointer at that doc.

**Status values:**

- `In-Progress` — actively being worked. Colloquially called "Current." Capped at 2–3 at any time; more than that is wishful thinking.
- `Blocked` — cannot proceed until something else lands. **Required `by:` note** in the write-up naming the blocker (another initiative, an external dep, a design decision).

Promotion from Up Next to Current Initiative is Robert's explicit call. The write-up (or arc concept doc) is drafted at promotion time, not in advance.

**Arc rows:** when an arc is promoted, its row stays in Current Initiatives for the arc's whole duration — the queue should show the arc is live. Its constituent initiatives get their own rows (and write-ups) as they are promoted, referencing the arc plan. The arc row is removed when the arc closes, after its final initiative ships (arcs.md, Arc completion).

## Stage 4 — Done

When all execution phases land, `/gestalt:initiative-close <ID>` runs the pre-merge checklist, merges the branch and does both steps below:

1. Remove the row from the Current Initiatives table and the write-up from `dev_journals/planned-work.md`
2. Tag the version bump if warranted (git-and-delivery rules)

## Minor items

Bugfix (`B.`) and chore (`C.`) items may skip Stages 2 and 3 entirely — they go straight from Backlog to a single execution session and are removed when done. See bugfix-flow.md for the bugfix flow and docs-chore-flow.md for docs/chore.

## Promotion is manual

Movement between stages is always Robert's explicit call, not automatic. Claude may *suggest* a promotion ("this feels ready for Up Next") but does not execute it without confirmation.

## Routing by type

The type of a Backlog entry (encoded in its ID prefix) determines which flow the work will run. Set it when the item lands in Backlog; revisit only if the nature of the work changes (e.g. a "bugfix" turns out to need a redesign and becomes a "refactor"). The routing tables are in `SKILL.md`.

**Mis-routing is recoverable.** If an initiative is partway through one flow and turns out to be a different type, change the ID prefix, move to the appropriate flow, and add a note in `dev_journals/planned-work.md` explaining the reroute. The flows aren't sealed — they're defaults that match common shapes of work.

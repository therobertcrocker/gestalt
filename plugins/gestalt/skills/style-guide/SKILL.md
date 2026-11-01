---
name: style-guide
description: Writing and formatting conventions for project docs: document types, heading levels and spacing, tables, writing style, and the rules for discovery docs and plan Decision Records. Load before creating or editing any doc.
---

# Documentation style guide

A reference for writing and maintaining project docs consistently. A project's own `CLAUDE.md` may add document types of its own; the rules here apply to every doc.

## Document types

**Discovery Doc** (`docs/initiatives/discovery/<ID>-<name>-discovery.md`) — written before implementation begins. Covers the problem, the design, decisions and open questions. Not updated after the fact; it is a planning artifact.

**Implementation Plan** (`docs/initiatives/implementation/<ID>-<name>-plan.md`) — a step-by-step plan for implementing an initiative: a phased breakdown of the tasks, split by commit, with the design rationale and any open questions to resolve during implementation. Carries the Decision Record for execution-time decisions (append and reconcile). Updated as needed during implementation, not after completion. Multi-effort docs initiatives use the docs-plan format instead (`templates/docs-plan.md` in the session-modes skill).

**Retro** (`docs/initiatives/implementation/<ID>-<name>-retro.md`) — written when an initiative or arc closes: what changed in plain words, five fixed questions, a rating table and follow-up rows. Template: `templates/retro.md` in the session-modes skill. Moves to `_completed/` with the plans; an arc's retro sits with the arc artifacts.

**Arc Artifacts** (`docs/initiatives/arcs/<ID>-<arc-name>/`) — the arc concept, arc-discovery, arc-plan and, at the end, the arc retro, co-located in the arc's folder. They move to `docs/initiatives/_completed/arcs/<ID>-<arc-name>/` when the arc closes, with `/gestalt:arc-close`.

**Completed Initiatives** (`docs/initiatives/_completed/`) — one folder per shipped initiative (`<ID>-<name>/`) that holds its discovery doc and plans. Arc initiatives nest under their arc's folder. See the session-modes skill, `session-discipline.md`, File locations.

**Architecture Page** (`docs/architecture/<subsystem>.md`) — the durable home for one subsystem's shape and Key Decisions. Template: `templates/arch-page.md` in the session-modes skill.

## Heading levels

- `#` (H1) — the document title, and major thematic sections in long reference docs
- `##` (H2) — major sections, or subsections within an H1 section
- `###` (H3) — sub-subsections (phase names, individual mode descriptions)
- `####` and `#####` — only where the template calls for them (commits and tasks in a plan)

**Spacing:** use `<br/><br/>` before a new `#` section in long reference docs. Use a single `<br/>` between `##` sections there. Initiative artifacts (discovery docs, plans) follow their templates and need no spacers.

**Numbered sections** read `## 3 — Purpose`. Never `## Section 3`, and never the section symbol. Cross-references say "section 3".

## Writing style

- Rationale is concise — sentence fragments are fine
- Em dash (`—`) separates a term from its description in bullet lists: `**Term** — description`
- Code identifiers (types, functions, files, flags) use backticks inline
- No trailing periods on table cell content
- `(planned)` suffix on items not yet implemented; `(Planned)` on section headings for future features
- Plain language. Say the thing in plain words first; a coined phrase may follow, never replace

## Bullet lists vs tables

Use **bullet lists** for behaviours, principles, mode descriptions, progress items — anything prose-like.

Use **tables** for decisions, features, questions, data architecture — anything that benefits from structured columns. Every cell is one line.

## Decision Record (in plan docs)

Only record decisions where the rationale is non-obvious or where a meaningful alternative was rejected. Implementation details that follow from prior decisions don't need an entry. Append and reconcile: when execution overrides a planned decision, log the reversal and fix the plan body so it doesn't lie.

## Open Questions

For unresolved *design* questions only — not deferred implementation work. A question belongs here when the answer will meaningfully affect how a feature is built and there is no answer yet. Remove or resolve entries when a decision is made; log the decision in the relevant plan's Decision Record.

## Discovery doc style

Discovery docs follow the heading conventions above, with a structure specific to their purpose (`templates/discovery.md` in the session-modes skill).

- `#` — document title only
- `##` — major sections: numbered features (`## 1 — Overview`) or named concepts (`## Responsibilities`)
- `###` — sub-sections within a major section: Inputs, Resolution Steps, Outputs, Notes, Design Notes
- `####` — where needed, such as phases inside a multi-phase process

Tone and content:

- Describe intent and design, not implementation: what the system does, not how the code does it
- Flag unresolved dependencies in Notes as `**Depends on X (planned)**`
- Cross-reference related discovery docs with blockquote links: `> Full breakdown in [file.md](file.md)`
- Do not update retroactively once implementation begins; post-implementation decisions belong in the plan's Decision Record

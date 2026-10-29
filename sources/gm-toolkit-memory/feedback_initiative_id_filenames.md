---
name: initiative-id-filenames
description: Initiative doc file names (and arc folders) start with the planned-work ID as written; multi-effort top-level plans are named -overview-plan.md
metadata:
  node_type: memory
  type: feedback
  originSessionId: f5bd85ff-318b-4bfe-9669-1654c41be84c
  modified: 2026-10-26T15:36:31.093Z
---

Every initiative doc created from 2026-10-24 on starts with the planned-work ID exactly as written, then a hyphen and the kebab-case name: `A.001.4-goals-tags-core-discovery.md`, `F.026-<name>-plan.md`. Arcs carry the ID on the folder and each file: `arcs/A.002-<arc-name>/A.002-<arc-name>-arc-plan.md`. A multi-effort initiative's top-level plan is `<ID>-<name>-overview-plan.md` (single-effort stays `-plan.md`); effort plans `<ID>-<name>-effort-N-plan.md`; hand-offs `<ID>-<name>[-effort-N]-handoff.md`. Older docs keep their names.

Completed folders (from 2026-10-26): `completed/<ID>-<name>/` holds the discovery + all plans; arc initiatives go to `completed/arcs/<arc-ID>-<arc-name>/initiatives/<ID>-<name>/` (arc folder created when its first initiative ships); arc artifacts move into `completed/arcs/<arc-ID>-<arc-name>/` when the arc completes. `completed/archive/` is frozen pre-change history. No underscores anywhere: Robert first chose `_completed/` and `<ID>_<name>`, then rejected both on sight.

**Why:** Robert wants docs to sort and match by ID, and wants overview plans to say "overview" in the name. He grouped completed docs per initiative so that one folder holds an initiative's full record.

**How to apply:** use the pattern when scaffolding any discovery, plan, hand-off or arc doc. The rule lives in `docs/process/session-modes.md` section 10, File locations, plus the templates and CLAUDE.md. See [[feedback_session_modes]].

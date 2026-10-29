---
name: Static Data Consolidation
description: When small/ungroupable static data accumulates, consolidate into a generic constants or static data file
type: feedback
originSessionId: bbcb1b1b-ae95-4ac9-8dc3-9e3d4b3581ea
---
If more small or hard-to-categorize static data files appear in `internal/faction/data/`, consolidate them into a single generic file (e.g. `constants.toml` or `static.toml`) rather than creating one file per value.

**Why:** Avoids proliferating tiny single-purpose files for data that doesn't naturally belong to a domain grouping (assets, tags, goals, etc.).

**How to apply:** Flag it when a new small static data item doesn't fit cleanly into an existing file — suggest consolidation rather than a new file.

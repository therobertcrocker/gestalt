---
name: Static Data Location — Campaign-Specific
description: Rulebook TOML data (assets, tags, goals) belongs to the campaign, not the source tree or binary
type: project
originSessionId: ba3208ec-3737-4318-adbc-6a10a9ff127d
---
Static rulebook data (asset definitions, tags, goals) must be campaign-specific — no embedded defaults and no hard-coded internal data directory.

Data lives alongside campaign state (e.g., `campaigns/<campaign-id>/data/`), not in `internal/faction/data/`. A new campaign ships with a starter set that the GM owns and edits freely. `FACTION_DATA_DIR` should either be derived automatically from the campaign directory or removed.

**Why:** Robert rejected the embed-defaults + user-overlay approach. He wants GMs to have full ownership of their data from the start, and wants the tool portable without any hard-coded content in the binary.

**How to apply:** Never suggest embedding rulebook data in the binary. When working on loader, campaign creation, or data-path resolution code, assume the data directory is always derived from the campaign directory.

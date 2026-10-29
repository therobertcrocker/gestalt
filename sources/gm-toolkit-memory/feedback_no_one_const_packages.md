---
name: feedback-no-one-const-packages
description: "Don't create a whole package for a single constant"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 94fc1cbd-e001-4084-a092-708136d2a4e5
---

Don't propose creating a new package whose only purpose is to hold a single constant (e.g., `internal/version/version.go` with just `const Version = "dev"`).

**Why:** A package is a unit of cohesion, not a wrapper for one value. One-const packages add import noise without adding meaning. Robert pushed back on `internal/version` for `Version = "dev"` as overkill.

**How to apply:** When a placeholder string or single constant is needed:
- Prefer an inline package-level `const` in whatever package consumes it
- Or add it to an existing constants/config location
- Only justify a new package when more than one related symbol is going there *now* (not "we'll add more later")

Connects to [[feedback-static-data-consolidation]] — same instinct, applied to Go constants instead of static data files.

---
name: go
description: Robert's Go rules beyond the general code style. Load when the work writes or restructures Go code, especially packages, imports and type definitions.
---

# Go rules

The general code style (full-word names, YAGNI, no comments, fence-signs) is in the always-on rules. These are Go-specific.

## Prefer real packages over type aliases

When facing an import cycle or a need to re-export a type at a parent package, prefer a real sibling or types package over a Go type alias (`type X = pkg.X`). Aliases hide the real layering and make tooling and refactors harder to reason about.

Lead with the no-alias option even when it has the larger blast radius across callers. Aliases are not banned: if a case comes up where the alias is the better trade-off, flag it and let Robert decide. The default is "extract a real package and update callers".

## No one-constant packages

Don't create a package whose only purpose is to hold a single constant (`internal/version/version.go` with `const Version = "dev"`). A package is a unit of cohesion, not a wrapper for one value.

When a single constant is needed: put a package-level `const` in the package that consumes it, or add it to an existing constants or config location. Justify a new package only when more than one related symbol goes there now, not "we'll add more later".

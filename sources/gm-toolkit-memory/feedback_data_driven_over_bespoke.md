---
name: data-driven-over-bespoke
description: Project direction is away from bespoke Go handlers toward data-driven behavior for every data file; consistency outweighs implementation cost
metadata:
  node_type: memory
  type: feedback
  originSessionId: f5bd85ff-318b-4bfe-9669-1654c41be84c
  modified: 2026-10-27T18:46:21.171Z
---

Robert wants every kind of rulebook data (assets, tags, goals, and the rest) handled the same data-driven way, and the project to move away from bespoke per-ID Go handlers. The cost of data-driving something (for example the 12 goal handlers) is not a reason to keep it bespoke.

**Why:** consistency in how data files are handled matters more to him than the size of the work.

**How to apply:** don't argue for keeping a bespoke handler, or for a design choice, because data-driving is expensive. Weigh options on fit and consistency. When sizing such work, report the cost as information, not as a deciding factor. Related: [[feedback_yagni]] still applies to features with no present use, but not as a brake on this direction.

**Health test (Robert, 2026-10-27):** an effect with one user is fine. Judge a data-driven effect by (1) are its values read from its entry, not hard-coded in Go, and (2) how the shared filter, scope, and trigger vocabularies grow: reused and composable, or one bespoke term per rule. Don't use "how many users does this effect have" as the test.

---
name: feedback-verify-before-suggesting
description: "Read the actual code before making suggestions or architectural claims about it; don't reason from plan docs or memory alone"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d0011d8b-d7c5-4611-9e18-eb1b882b32df
---

Read through the codebase before making suggestions about it. Don't reason from a plan document, a discovery doc, or prior conversation context alone — open the files and verify.

**Why:** Robert caught me making confident architectural assertions ("ability steps are a closed enum, drop the registry") that turned out to be partially wrong because I hadn't read `ability/ability.go` first. Plan docs describe intent; only the code shows what's actually there. Speaking past what the code says wastes Robert's time and erodes trust in my reasoning.

**How to apply:** Before recommending a design direction, refactor approach, or architectural critique, read the relevant files end-to-end. Especially when:
- Comparing how multiple packages are structured ("X does it this way, Y does it that way")
- Claiming something is/isn't a particular shape or pattern
- Suggesting code can be simplified, removed, or replaced
- Reasoning by analogy from another part of the codebase

If the suggestion is grounded in a plan doc or memory rather than current code, say so explicitly and verify before committing to the recommendation. Related: [[feedback-implementation-efficiency]] — that one says don't over-read before *writing*; this one says do read before *suggesting*. Writing follows a spec; suggestions invent one. **When the two rules collide in a structure-setting session (taxonomy, page/package boundaries, arc decisions), this one wins — always.**

**Failure example (2026-06-11, D-002 Effort 3 Plan):** drove four design questions off a tree survey (`ls` + one grep) labeled "re-grounding," including a premise from a stale memory that the movement redesign was unmerged — one `git log --grep` disproved it. The later real read-through moved three of the page boundaries the survey-based plan had ratified. A tree survey verifies that things *exist*; only reading source reveals where the *seams* are, and boundary decisions are claims about seams. Also: verify stale-looking project memories against git/source before using them as design premises.

---
name: don-t-commit-until-told-bundle-related-commits
description: Execution sessions on a plan commit each plan commit as it passes the gate, without asking; ad-hoc work (bugfix batches) waits for Robert's word and gets bundled
metadata: 
  node_type: memory
  type: feedback
  originSessionId: bfcd86f6-1760-48eb-8250-e7f8b9238c55
  modified: 2026-10-27T20:00:14.199Z
---

**Planned execution (Robert, 2026-10-27):** when executing a plan whose commits are already defined, make each commit as soon as it passes the gate (build/vet/test), with the plan's message. Don't stop to ask first. "In the future just make the commits as you go." This came after a Phase 5 session staged all three commits and asked for approval.

**Ad-hoc work:** for work with no plan-defined commit boundaries (e.g. a bugfix session), don't `git commit` until Robert says so. He bundles related changes into one commit (for example, all of a session's fixes together).

**Why:** a plan already fixes the commit shape, so asking again only adds a stop. Outside a plan, Robert decides commit boundaries and prefers fewer, bundled commits.

**How to apply:** Plan execution: gate passes → commit → next commit. Commit messages with multiple lines go through `git commit -F <file>` (a Write-tool file in the scratchpad). Never chain a heredoc with `&& \`, which runs the message as shell commands. Ad-hoc: make and verify the changes, then report what is staged and ask. See also [[feedback_git_commits]] (cadence + effort squash).

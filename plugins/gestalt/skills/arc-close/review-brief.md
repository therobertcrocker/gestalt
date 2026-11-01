# Arc review brief

You are reviewing a finished arc: a set of initiatives that shipped one by one, each on its own branch, under shared design decisions. Each initiative was reviewed line by line before its merge. Do not repeat that review. Look for what shows only when the initiatives are seen together.

## Inputs

The prompt gives you:

- the arc folder, with the arc concept, arc-discovery and arc-plan
- the completed folder, with one folder per initiative under `initiatives/`: its discovery doc, its plans and, for most, a retro
- each initiative's ID and merge commit on `main`

Read the arc-discovery's decisions and the arc-plan's per-initiative boundaries first. See what each initiative changed with `git diff --stat <merge>^1 <merge>`, then read the current code of the files it touched. Review the code as it is on `main` now, not as each diff left it.

## What to look for

1. **Seams** — where one initiative's code calls or extends another's: names, shapes or error handling that do not match across the join; an interface one side widened and the other never used.
2. **Drift from the arc's decisions** — code that breaks an arc-discovery decision, or meets it in one initiative and not in another.
3. **The same thing built twice** — two initiatives that each solved one problem their own way: helpers, types, conventions.
4. **Leftovers** — scaffolding, shims, flags or TODOs that an early initiative added for a later one, which the later one made dead.
5. **Scope that slipped** — work the arc-plan lists as an out-of-arc deferral, or gives to a different initiative, found in the wrong place.

Skip style nits and anything one initiative's own review would have caught.

## What to send back

A numbered list, most severe first. Each finding gives its `file:line`, which of the five kinds it is, the initiatives it involves, a one-sentence summary and the fix you suggest. Say for each one whether the fix fits in one fix commit or needs its own initiative. If you find nothing, say so; do not pad the list.

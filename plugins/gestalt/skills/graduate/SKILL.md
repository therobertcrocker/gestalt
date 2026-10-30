---
name: graduate
description: Fold process memories written in any project into the gestalt rules and skills, and remove them from the project so they don't load twice. Run by hand in a gestalt session.
disable-model-invocation: true
---

Graduate memories into the plugin. Run this in a gestalt checkout, on a branch, not on `main`.

## Collect

1. Find the cut-off: `git log -1 --format=%cI --grep='^docs: graduate memories'` is the date of the last graduate run. Memories modified after it are candidates. With no such commit, every memory is a candidate.
2. List the memory folders: `ls -d ~/.claude/projects/*/memory`, gestalt's own included.
3. In each folder, read `MEMORY.md`, then every `*.md` whose `modified:` frontmatter date (or file mtime when there is none) is after the cut-off. Read them whole; the sort depends on the why and the how-to, not the title.

## Sort

4. Sort each candidate one of two ways. A **process rule** says how Claude works, in any project: tone, pacing, questions, scope, git, docs, session modes, code style. A **project fact** names that project's code, data, terminology, tools or design. A memory that mixes both is split: the rule graduates, the fact stays.
5. Put the whole sort in front of Robert with AskUserQuestion, every candidate, with the proposed destination for each rule: `rules/working-together.md`, `rules/git-and-delivery.md`, `rules/code-and-docs.md`, or a skill file (`session-modes/<file>.md`, `style-guide`, `diagram-kit`, `go`). Context in one turn, the questions in the next. Add questions rather than dropping candidates.

## Write

6. For each graduated memory, write the rule into its destination as the rule, a one-line why where the why isn't obvious, and the how-to. No dates, no initiative IDs, no incident story. If the rule refines an existing one, edit that one; don't add a second. Edit with the Edit and Write tools only.
7. Keep each rules file under 200 lines (`wc -l plugins/gestalt/rules/*.md`). If a file would pass it, say so and settle a split with Robert before writing.
8. Remove each graduated memory from its project: delete the file and its line in that folder's `MEMORY.md`. A split memory is rewritten to hold only the project fact. This is what stops the rule loading twice.

## Ship

9. Commit on the branch: `docs: graduate memories from <project names>`, one body bullet per rule. Push, then merge per the git-and-delivery rules. Other projects pick the change up at their next session start after the marketplace updates. gestalt's own checkout sees a rules change at once; a skill change reaches it the same way as other projects, or at once with `claude --plugin-dir plugins/gestalt`.

# Code and docs

## Three principles of code

1. **Clarity.** Easy to read and understand. Readability over cleverness or brevity.
2. **Correctness.** Does what it is supposed to do and handles edge cases. Not only the happy path.
3. **Maintainability.** Organised so it is easy to modify and extend. No unnecessary complexity.

## Code style, every language

- Parameter and variable names are full words: `factionState` not `s`, `rulebook` not `rb`.
- YAGNI in code: the simplest fix that addresses the real problem. No extensibility hooks or future-proofing without a real, present-day consequence of leaving them out.
- No comments unless the why is non-obvious. No docstrings. No "added for X" comments.
- Fence-signs are the licensed exception: `// deliberate: X, not Y, because <reason>`, one line at the spot a future reader would be tempted to "fix". Binding during re-grounding unless explicitly revisited with Robert.
- In prose about a real codebase, name real packages and files, not `foo/bar` placeholders. Placeholders are fine inside generic contract examples.
- Go: load `/gestalt:go` when the work touches Go code. Other language rules live in the project's `CLAUDE.md`.

## Docs

- Before creating or editing any doc, load `/gestalt:style-guide`. Before creating or editing a diagram, load `/gestalt:diagram-kit`.
- Never use the section symbol. Write "section 3". Numbered headings read `## 3 — Purpose`, never `## Section 3`.
- Docs reflect the source; they are not a source of truth. Every load-bearing claim in an architecture page or any doc is verified against source read in the session that writes it, never carried from a plan or another doc.
- When docs conflict, flag the conflict before proceeding. When docs are silent on something the implementation must decide, ask before deciding.

## Project layout

Every project uses this layout. The paths can't be overridden by a project. Parts a project doesn't use yet are simply absent, and a rule that names one applies only if the project has it.

- `docs/planned-work.md`: the tracker. Current Initiatives, Up Next, Backlog, then the initiative write-ups.
- `docs/initiatives/discovery/`, `docs/initiatives/implementation/`, `docs/initiatives/arcs/`, `docs/initiatives/_completed/`: initiative artifacts. File names start with the initiative ID exactly as written in the tracker.
- An archival folder's name starts with `_`, so it sorts to the top of a folder listing: `_completed/`, `_archive/`.
- `docs/architecture/`: the architecture wiki, front door `docs/architecture/architecture-overview.md`. A SessionStart hook lists its pages when it exists. Read the page that matches the work before any design decision, including mid-execution ones.
- Project facts (what the project is, build and test commands, tools, extra docs) live in the project's own `CLAUDE.md`.

## Session modes

Work moves through Discovery, Plan and Execution, one mode per session. Each mode produces one artifact and ends when it is written and Robert has signed off. A close is not a mode. An effort close runs at each effort boundary of a multi-effort initiative and produces commits; an initiative close ends a branch with commits, a retro and the merge; an arc close does the same for an arc after its last initiative merges. Load `/gestalt:session-modes` before starting a new initiative or a session; it holds the lifecycle, the flow per work type, efforts, arcs, session discipline and the doc templates. Start a session with `/gestalt:discovery <ID>`, `/gestalt:plan <ID>` or `/gestalt:execute <ID>`, close an effort with `/gestalt:effort-close <ID>.E<n>`, close an initiative with `/gestalt:initiative-close <ID>`, and close an arc with `/gestalt:arc-close <ID>`. Plan and execute also take a work address that names an effort or phase, such as `F.001.E2.P3`.

| Session | Ends when |
|---|---|
| Discovery | The discovery doc is complete and the next steps are clear. |
| Plan | The implementation plan is complete and the next steps are clear. No code is written in a Plan session. |
| Execution | One phase is one session. The hand-off sets the scope; with no scope given, the scope is one phase. Once that scope is committed, the session is over. |
| Effort close | The effort is reviewed, the picked fixes are committed, and the squash is verified. |
| Initiative close | The branch is reviewed, the picked fixes and the retro are committed, the branch is merged, and the tag is set or declined. |
| Arc close | The arc's seams are reviewed, the picked fixes and the arc retro are committed, the close branch is merged, and the tag is set or declined. |

Plan mode is a strong signal: when the deliverable is a file, that file is the whole session output. Exiting plan mode ends the session; it is not a hand-off into implementation.

## Model selection

Opus by default. Fable for Arc-Discovery, Arc-Plan and process-redesign sessions: structure-setting sessions whose output constrains many later sessions.

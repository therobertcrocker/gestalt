---
name: lipgloss is for TUI only, not for CLI text output
description: Use lipgloss for the Bubbletea TUI; for sequential Cobra CLI output use huh + ANSI styling
type: feedback
originSessionId: 0d805bd6-9a89-460d-a812-b2938823b1bb
---
**Rule:** Use `lipgloss` only for TUI output via the styles in `cmd/faction-manager/tui/styles.go`. For Cobra CLI output (e.g. `faction list`, command-line summaries), use `huh`'s built-in styling and plain ANSI escape codes.

**Why:** lipgloss is a layout library — appropriate for the Bubbletea TUI's split panels and tables, overkill and the wrong fit for sequential CLI text output.

**How to apply:** Inside `cmd/faction-manager/tui/` (Bubbletea TUI), reach for lipgloss. Outside the TUI — Cobra command output, status lines, prompts — use `huh` + ANSI. This split is codified in CLAUDE.md.

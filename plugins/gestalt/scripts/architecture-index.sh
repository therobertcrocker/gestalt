#!/bin/sh
# SessionStart context: the architecture wiki page index, when the project has one.
cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
[ -d docs/architecture ] || exit 0
printf '%s' "This project has an architecture wiki under docs/architecture/."
[ -f docs/architecture/architecture-overview.md ] && printf '%s' " The front door is docs/architecture/architecture-overview.md."
printf '%s\n' " The page that covers a subsystem is read before any design decision or any work that touches that subsystem's shape (push, not pull). The pages:"
find docs/architecture -name '*.md' | sort | sed 's#^#  - #'

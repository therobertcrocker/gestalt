#!/bin/sh
# SessionStart context: the seed index, when the project has seeds.
cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
seeds=$(ls dev_journals/initiatives/seeds/*-seed.md dev_journals/*/initiatives/seeds/*-seed.md 2>/dev/null)
[ -n "$seeds" ] || exit 0
printf '%s\n' "This project has seeds: work that is coming and is not built yet. Before work that touches a seed's area, read that seed's \"Read this first\"; it says what not to build against. A file name that starts with an ID is a planted seed. The seeds:"
printf '%s\n' "$seeds" | sed 's#^#  - #'

#!/usr/bin/env bash
# Pick a git repository with fzf and open (or switch to) a zellij session for it.
# Usage: zellij-repo-picker.sh [search_root]

set -eu

SEARCH_ROOT=${1:-"$HOME/repos"}
MAX_DEPTH=4

if [ ! -d "$SEARCH_ROOT" ]; then
    echo "Search root doesn't exist: $SEARCH_ROOT" >&2
    exit 1
fi

# Relative repo paths (relative to SEARCH_ROOT), one per line.
# fd prints directories with a trailing slash, e.g. "foo/bar/.git/".
entries=$(
    cd "$SEARCH_ROOT" &&
        fd --hidden --type d --max-depth "$MAX_DEPTH" '^\.git$' 2>/dev/null |
            sed -e 's|^\.git/*$|.|' -e 's|/\.git/*$||' |
            sort -u
) || true

if [ -z "$entries" ]; then
    echo "No repositories found under $SEARCH_ROOT"
    exit 1
fi

selected=$(
    printf '%s\n' "$entries" |
        fzf --height 80% --layout reverse --border --prompt 'repo > '
) || true

[ -n "$selected" ] || exit 0

repo="$SEARCH_ROOT/$selected"

session_name=$(basename "$repo" | sed 's/[^A-Za-z0-9_.-]/-/g')

# Existing sessions (first field of each line, without formatting)
existing=$(zellij list-sessions --no-formatting 2>/dev/null | awk '{print $1}') || existing=

if printf '%s\n' "$existing" | grep -Fxq -- "$session_name"; then
    if [ -n "${ZELLIJ:-}" ]; then
        exec zellij action switch-session "$session_name"
    fi
    exec zellij attach "$session_name"
fi

if [ -n "${ZELLIJ:-}" ]; then
    exec zellij action switch-session "$session_name" --cwd "$repo"
fi

cd "$repo"
exec zellij attach --create "$session_name"

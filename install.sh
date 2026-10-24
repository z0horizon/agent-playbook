#!/usr/bin/env bash
# Symlink the config in claude/ into ~/.claude/ so the repo stays the source of truth.
# Safe to re-run. Usage: ./install.sh [--dry-run] [--with codegraph,ecc]
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${CLAUDE_HOME:-$HOME/.claude}"
DRY=0
ITEMS=(CLAUDE.md skills/agy-worker skills/agy-ui)

while (( $# )); do
  case "$1" in
    --dry-run) DRY=1 ;;
    --with)
      [[ -n "${2:-}" ]] || { echo "--with needs a list, e.g. --with codegraph,ecc" >&2; exit 2; }
      IFS=, read -ra extras <<< "$2"
      for x in "${extras[@]}"; do
        [[ -f "$REPO/claude/rules/$x.md" ]] || { echo "unknown add-on: $x (see claude/rules/)" >&2; exit 2; }
        ITEMS+=("rules/$x.md")
      done
      shift ;;
    *) echo "unknown option: $1" >&2; exit 2 ;;
  esac
  shift
done
STAMP="$(date +%Y%m%d-%H%M%S)"
status=0

run() {
  if (( DRY )); then echo "  would: $*"; else "$@"; fi
}

for item in "${ITEMS[@]}"; do
  src="$REPO/claude/$item"
  dst="$TARGET/$item"

  if [[ -L "$dst" ]]; then
    if [[ "$(readlink "$dst")" == "$src" ]]; then
      echo "ok       $dst"
    else
      echo "SKIP     $dst -> $(readlink "$dst") (points elsewhere; fix by hand)" >&2
      status=1
    fi
    continue
  fi

  if [[ -e "$dst" ]]; then
    # Outside skills/, or Claude Code would load the backup as a duplicate skill.
    bak="$TARGET/.agent-playbook-backup/$STAMP/$item"
    echo "backup   $dst -> $bak"
    run mkdir -p "$(dirname "$bak")"
    run mv "$dst" "$bak"
  fi
  echo "link     $dst -> $src"
  run mkdir -p "$(dirname "$dst")"
  run ln -s "$src" "$dst"
done

exit $status

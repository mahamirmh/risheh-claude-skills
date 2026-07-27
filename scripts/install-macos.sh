#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/../skills"
DESTINATION="${1:-$HOME/.claude/skills}"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Skills directory not found: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$DESTINATION"
cp -R "$SOURCE_DIR"/. "$DESTINATION"/

echo "Claude skills installed successfully."
echo "Destination: $DESTINATION"
echo "Restart Claude Code if it is currently open."

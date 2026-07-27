#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: ./scripts/install-local.sh /path/to/project" >&2
  exit 1
fi

PROJECT_PATH="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/../skills"
DESTINATION="$PROJECT_PATH/.claude/skills"

if [[ ! -d "$PROJECT_PATH" ]]; then
  echo "Project path not found: $PROJECT_PATH" >&2
  exit 1
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Skills directory not found: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$DESTINATION"
cp -R "$SOURCE_DIR"/. "$DESTINATION"/

echo "Project-local Claude skills installed successfully."
echo "Destination: $DESTINATION"

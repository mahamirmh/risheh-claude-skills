#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILLS_SOURCE="$REPO_ROOT/skills"

[[ -d "$SKILLS_SOURCE" ]] || { echo "Skills directory not found: $SKILLS_SOURCE" >&2; exit 1; }

copy_skills() {
  local destination="$1"
  mkdir -p "$destination"
  cp -R "$SKILLS_SOURCE"/. "$destination"/
  echo "Installed: $destination"
}

copy_skills "$HOME/.claude/skills"
copy_skills "$HOME/.codex/skills"
copy_skills "$HOME/.agents/skills"

GEMINI_COMMANDS="$HOME/.gemini/commands"
mkdir -p "$GEMINI_COMMANDS"
for skill_dir in "$SKILLS_SOURCE"/*; do
  [[ -d "$skill_dir" && -f "$skill_dir/SKILL.md" ]] || continue
  name="$(basename "$skill_dir")"
  {
    printf 'description = "Risheh AI skill: %s"\n' "$name"
    printf "prompt = '''\n"
    cat "$skill_dir/SKILL.md"
    printf "\n'''\n"
  } > "$GEMINI_COMMANDS/$name.toml"
done

echo "Installed Gemini CLI commands: $GEMINI_COMMANDS"
echo "Global installation complete for Claude, Codex/OpenAI Agent Skills and Gemini CLI."
echo "For Cursor, Copilot, Cline and Windsurf run install-project-all.sh inside each project."
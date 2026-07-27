#!/usr/bin/env bash
set -euo pipefail

[[ $# -eq 1 ]] || { echo "Usage: $0 /path/to/project" >&2; exit 1; }
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILLS_SOURCE="$REPO_ROOT/skills"
PROJECT="$(cd "$1" && pwd)"

copy_skills() {
  local destination="$1"
  mkdir -p "$destination"
  cp -R "$SKILLS_SOURCE"/. "$destination"/
}

copy_skills "$PROJECT/.claude/skills"
copy_skills "$PROJECT/.codex/skills"
copy_skills "$PROJECT/.agents/skills"

INDEX=""
for skill_dir in "$SKILLS_SOURCE"/*; do
  [[ -d "$skill_dir" && -f "$skill_dir/SKILL.md" ]] || continue
  name="$(basename "$skill_dir")"
  INDEX+="- **$name**: برای کارهای مرتبط، فایل \`skills/$name/SKILL.md\` را بخوان و طبق آن اجرا کن."$'\n'
done

AGENT_TEXT="# Risheh Universal AI Skills

قبل از اجرای کار، Skillهای زیر را بررسی کن. وقتی درخواست با یک Skill مرتبط است، فایل همان Skill را بخوان و دستورهای آن را اجرا کن. از حدس‌زدن محتوای Skill خودداری کن.

$INDEX
## قواعد ایمنی
- اطلاعات حساس، رمز و API Key را افشا یا Commit نکن.
- پیش از عملیات مخرب، Migration یا Deploy نتیجه را بازبینی و اجازه لازم را دریافت کن.
- خروجی را با تست و شواهد قابل بررسی تحویل بده.
"
printf '%s' "$AGENT_TEXT" > "$PROJECT/AGENTS.md"
printf '@./AGENTS.md\n' > "$PROJECT/CLAUDE.md"
printf '@./AGENTS.md\n' > "$PROJECT/GEMINI.md"

mkdir -p "$PROJECT/.cursor/rules" "$PROJECT/.clinerules" "$PROJECT/.windsurf/rules" "$PROJECT/.github/prompts" "$PROJECT/.gemini/commands"
printf '%s\n' '---' 'description: Risheh reusable AI skills and workflows' 'alwaysApply: true' '---' '' "$AGENT_TEXT" > "$PROJECT/.cursor/rules/risheh-skills.mdc"
printf '%s' "$AGENT_TEXT" > "$PROJECT/.clinerules/risheh-skills.md"
printf '%s' "$AGENT_TEXT" > "$PROJECT/.windsurf/rules/risheh-skills.md"
printf '%s' "$AGENT_TEXT" > "$PROJECT/.windsurfrules"
printf '%s' "$AGENT_TEXT" > "$PROJECT/.github/copilot-instructions.md"

for skill_dir in "$SKILLS_SOURCE"/*; do
  [[ -d "$skill_dir" && -f "$skill_dir/SKILL.md" ]] || continue
  name="$(basename "$skill_dir")"
  {
    printf '%s\n' '---' "agent: 'agent'" "description: 'Risheh skill: $name'" '---' ''
    cat "$skill_dir/SKILL.md"
  } > "$PROJECT/.github/prompts/$name.prompt.md"
  {
    printf 'description = "Risheh AI skill: %s"\n' "$name"
    printf "prompt = '''\n"
    cat "$skill_dir/SKILL.md"
    printf "\n'''\n"
  } > "$PROJECT/.gemini/commands/$name.toml"
done

echo "Universal AI skills installed in project: $PROJECT"
echo "Supported adapters: Claude, Codex, Agent Skills, Cursor, Copilot, Gemini CLI, Cline and Windsurf."
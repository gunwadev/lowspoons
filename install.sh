#!/usr/bin/env bash
# Installs the plain output style and the lowspoons skill into ~/.claude/
# Copies two files. Touches nothing else.

set -euo pipefail

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
claude="$HOME/.claude"

style_dir="$claude/output-styles"
skill_dir="$claude/skills/lowspoons"

mkdir -p "$style_dir" "$skill_dir"

cp "$src/output-styles/plain.md"    "$style_dir/plain.md"
cp "$src/skills/lowspoons/SKILL.md" "$skill_dir/SKILL.md"

echo
echo "Installed:"
echo "  $style_dir/plain.md"
echo "  $skill_dir/SKILL.md"
echo
echo "Next: run /output-style plain in Claude Code."
echo "It takes effect in a new session, or after /clear."
echo

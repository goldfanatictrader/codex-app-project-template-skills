#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
skills_dir="$repo_root/skills"
status=0

for skill_dir in "$skills_dir"/*; do
  [[ -d "$skill_dir" ]] || continue
  skill_name="$(basename "$skill_dir")"
  skill_md="$skill_dir/SKILL.md"
  openai_yaml="$skill_dir/agents/openai.yaml"

  if [[ ! -f "$skill_md" ]]; then
    echo "missing SKILL.md for $skill_name" >&2
    status=1
  fi

  if [[ ! -f "$openai_yaml" ]]; then
    echo "missing agents/openai.yaml for $skill_name" >&2
    status=1
  fi

  if [[ -f "$skill_md" ]] && ! grep -Eq '^name:[[:space:]]+[-a-z0-9]+' "$skill_md"; then
    echo "invalid or missing name field in $skill_md" >&2
    status=1
  fi

  if [[ -f "$skill_md" ]] && ! grep -Eq '^description:[[:space:]]+.+' "$skill_md"; then
    echo "invalid or missing description field in $skill_md" >&2
    status=1
  fi

  if [[ -f "$openai_yaml" ]] && ! grep -Eq '^interface:' "$openai_yaml"; then
    echo "missing interface section in $openai_yaml" >&2
    status=1
  fi
done

if [[ "$status" -eq 0 ]]; then
  echo "all skills look structurally valid"
fi

exit "$status"

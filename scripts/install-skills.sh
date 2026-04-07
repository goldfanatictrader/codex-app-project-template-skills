#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="$repo_root/skills"
target_dir="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "$target_dir"

for skill_dir in "$source_dir"/*; do
  [[ -d "$skill_dir" ]] || continue
  skill_name="$(basename "$skill_dir")"
  ln -sfn "$skill_dir" "$target_dir/$skill_name"
  echo "linked $skill_name -> $target_dir/$skill_name"
done

echo "installed Codex skills into $target_dir"

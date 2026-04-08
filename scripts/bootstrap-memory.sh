#!/usr/bin/env bash
set -euo pipefail

target_root="${1:-$PWD}"
target_memory_dir="${2:-$target_root/memory}"
force_flag="${3:-}"

source_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
project_name="$(basename "$target_root")"
today="$(date +%F)"

if ! command -v rsync >/dev/null 2>&1; then
  echo "bootstrap-memory.sh requires rsync to be installed." >&2
  exit 1
fi

mkdir -p "$target_root"
mkdir -p "$(dirname "$target_memory_dir")"

target_parent="$(cd "$(dirname "$target_memory_dir")" && pwd -P)"
target_memory_real="$target_parent/$(basename "$target_memory_dir")"

case "$target_memory_real" in
  "$source_root"|"$source_root"/*)
    echo "Refusing to copy the template into itself or one of its descendants: $target_memory_real" >&2
    exit 1
    ;;
esac

if [[ -e "$target_memory_real" && ! -d "$target_memory_real" ]]; then
  echo "Target memory path exists and is not a directory: $target_memory_real" >&2
  exit 1
fi

if [[ -d "$target_memory_real" && -f "$target_memory_real/PROJECT.md" && "$force_flag" != "--force" ]]; then
  echo "Memory already exists at $target_memory_real"
  exit 0
fi

if [[ -d "$target_memory_real" && ! -f "$target_memory_real/PROJECT.md" && -n "$(find "$target_memory_real" -mindepth 1 -maxdepth 1 -print -quit 2>/dev/null)" && "$force_flag" != "--force" ]]; then
  echo "Target memory directory already contains files but does not look like a managed memory copy: $target_memory_real" >&2
  echo "Re-run with --force only if you want to overwrite it." >&2
  exit 1
fi

initialize_project_file=0
if [[ ! -f "$target_memory_real/PROJECT.md" ]]; then
  initialize_project_file=1
fi

mkdir -p "$target_memory_real"

rsync_args=(
  -a
  --exclude
  .git
  --exclude
  node_modules
  --exclude
  dist
  --exclude
  .DS_Store
  --exclude
  "*.tsbuildinfo"
)

if [[ "$force_flag" == "--force" ]]; then
  rsync_args+=(--delete)
fi

rsync "${rsync_args[@]}" "$source_root"/ "$target_memory_real"/

if [[ "$initialize_project_file" -eq 1 && -f "$target_memory_real/TEMPLATE.md" ]]; then
  sed \
    -e "s/\\[PROJECT_NAME\\]/$project_name/g" \
    -e "s/Last Session | YYYY-MM-DD/Last Session | $today/g" \
    -e "s/created: 2026-04-07/created: $today/g" \
    -e "s/updated: 2026-04-07/updated: $today/g" \
    "$target_memory_real/TEMPLATE.md" > "$target_memory_real/PROJECT.md"
fi

echo "Bootstrapped memory from $source_root to $target_memory_real"

#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
branch="$(git -C "$repo_root" branch --show-current)"
remote="${1:-origin}"
commit_message="${2:-Sync Ghostty and Oh My Posh config}"

if [[ -z "$branch" ]]; then
  echo "Unable to determine the current branch." >&2
  exit 1
fi

mkdir -p "$repo_root/config/ghostty" "$repo_root/config/ohmyposh"
cp "$HOME/.config/ghostty/config" "$repo_root/config/ghostty/config"
cp "$HOME/.config/ohmyposh/themes.json" "$repo_root/config/ohmyposh/themes.json"

git -C "$repo_root" add config/ghostty/config config/ohmyposh/themes.json

if git -C "$repo_root" diff --cached --quiet; then
  echo "No config changes to commit."
  exit 0
fi

git -C "$repo_root" commit -m "$commit_message"
git -C "$repo_root" push -u "$remote" "$branch"

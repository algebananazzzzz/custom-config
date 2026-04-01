#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config/ghostty" "$HOME/.config/ohmyposh"
cp "$repo_root/config/ghostty/config" "$HOME/.config/ghostty/config"
cp "$repo_root/config/ohmyposh/themes.json" "$HOME/.config/ohmyposh/themes.json"

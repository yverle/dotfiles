#!/usr/bin/env bash
set -euo pipefail
dots="$HOME/repos/dotfiles"

link() {
  mkdir -p "$(dirname "$2")"
  ln -sfn "$1" "$2"
}

link "$dots/packages/neovim" "$HOME/.config/nvim"
link "$dots/packages/pwsh/Profile.ps1" "$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"
link "$dots/packages/yazi" "$HOME/.config/yazi"
link "$dots/packages/zellij" "$HOME/.config/zellij"
link "$dots/packages/cli-tools/sessionizer.sh" "$HOME/.local/bin/sessionizer.sh"

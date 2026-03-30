#!/usr/bin/env bash
# =============================================================================
#  HY4S — Hyprland for School | Update Script
#  Place in the root of your dotfiles repo.
# =============================================================================

set -euo pipefail

GRN='\033[38;2;184;187;38m'
AQU='\033[38;2;142;192;124m'
YLW='\033[38;2;250;189;47m'
RED='\033[38;2;251;73;52m'
FG='\033[38;2;235;219;178m'
DIM='\033[38;2;146;131;116m'
BLU='\033[38;2;131;165;152m'
RST='\033[0m'

step() { echo -e "${YLW} ┌─[$1]──────────────────────────────┐\n └─ ${FG}$2${RST}"; }
ok()   { echo -e "${GRN} [  OK  ]  $*${RST}"; }
info() { echo -e "${DIM} $*${RST}"; }
warn() { echo -e "${YLW} [WARN]  $*${RST}"; }
err()  { echo -e "${RED} [ ERR ]  $*${RST}"; exit 1; }

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_FILE="$REPO_DIR/packages.txt"

echo ""
echo -e "${GRN} ██╗  ██╗██╗   ██╗██╗  ██╗███████╗${RST}"
echo -e "${AQU} ╔══════════════════════════════════════╗${RST}"
echo -e "${AQU} ║  ${FG}HY4S  ·  Update                      ${AQU}║${RST}"
echo -e "${AQU} ╚══════════════════════════════════════╝${RST}"
echo ""

step " GIT " "Pulling latest from GitHub..."
git -C "$REPO_DIR" pull 2>&1 | while IFS= read -r line; do info "$line"; done
ok "Repo up to date."

if [[ ! -f "$PACKAGES_FILE" ]]; then
    warn "No packages.txt found — skipping package sync."
else
    mapfile -t PACKAGES < <(grep -v '^\s*#' "$PACKAGES_FILE" | grep -v '^\s*$')
    if [[ ${#PACKAGES[@]} -eq 0 ]]; then
        warn "packages.txt is empty — nothing to install."
    else
        step " PKG " "Syncing ${#PACKAGES[@]} packages (skipping already installed)..."
        yay -S --needed --noconfirm "${PACKAGES[@]}" 2>&1 | while IFS= read -r line; do info "$line"; done
        ok "Packages synced."
    fi
fi

step " GNU " "Re-stowing dotfiles..."
stow --restow -d "$REPO_DIR" -t "$HOME" dotfiles
ok "Dotfiles re-stowed."

echo ""
echo -e "${AQU} ╔══════════════════════════════════════╗${RST}"
echo -e "${AQU} ║  ${FG}HY4S update complete!               ${AQU}  ║${RST}"
echo -e "${AQU} ╚══════════════════════════════════════╝${RST}"
echo ""
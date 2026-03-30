#!/usr/bin/env bash
# =============================================================================
#  HY4S — Hyprland for School | Update Script
#  Place this file in the root of your dotfiles repo.
#
#  Run this any time you:
#    - Add new packages to packages.txt
#    - Update your configs and want them re-stowed
#    - Just want to pull the latest from GitHub
# =============================================================================

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

info()    { echo -e "${CYAN}${BOLD}[INFO]${RESET}  $*"; }
success() { echo -e "${GREEN}${BOLD}[ OK ]${RESET}  $*"; }
warn()    { echo -e "${YELLOW}${BOLD}[WARN]${RESET}  $*"; }
error()   { echo -e "${RED}${BOLD}[ERR ]${RESET}  $*"; exit 1; }

# Resolve repo root (works whether you run the script from anywhere)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_FILE="$REPO_DIR/packages.txt"

echo -e "\n${CYAN}${BOLD}  HY4S — Update${RESET}\n"

# ── Step 1: Pull latest from GitHub ──────────────────────────────────────────
info "Pulling latest from GitHub..."
git -C "$REPO_DIR" pull
success "Repo up to date."

# ── Step 2: Install any new packages ─────────────────────────────────────────
if [[ ! -f "$PACKAGES_FILE" ]]; then
    warn "No packages.txt found — skipping package sync."
else
    info "Checking for new packages in packages.txt..."
    mapfile -t PACKAGES < <(grep -v '^\s*#' "$PACKAGES_FILE" | grep -v '^\s*$')

    if [[ ${#PACKAGES[@]} -eq 0 ]]; then
        warn "packages.txt is empty — nothing to install."
    else
        # yay --needed means it skips already-installed packages
        info "Syncing ${#PACKAGES[@]} packages (skipping already installed)..."
        yay -S --needed --noconfirm "${PACKAGES[@]}"
        success "Packages synced."
    fi
fi

# ── Step 3: Re-stow configs ───────────────────────────────────────────────────
info "Re-stowing dotfiles..."
# --restow removes and re-creates symlinks cleanly (handles moved/renamed files)
stow --restow -d "$REPO_DIR" -t "$HOME" dotfiles
success "Dotfiles re-stowed."

echo ""
echo -e "${GREEN}${BOLD}  HY4S update complete!${RESET}"
echo ""

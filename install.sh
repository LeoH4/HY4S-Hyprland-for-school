#!/usr/bin/env bash
# =============================================================================
#  HY4S — Hyprland for School | Install Script
#  https://github.com/LeoH4/HY4S-Hyprland-for-school
#
#  Paste this on a fresh Arch / EndeavourOS install and run it.
#  It will:
#    1. Install yay (AUR helper)
#    2. Clone your dotfiles repo to ~/Projects/HY4S/
#    3. Read packages.txt from the repo and install everything
#    4. Stow your configs into ~/
#    5. Set fish as the default shell
# =============================================================================

set -euo pipefail

# ── Colours ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

info()    { echo -e "${CYAN}${BOLD}[INFO]${RESET}  $*"; }
success() { echo -e "${GREEN}${BOLD}[ OK ]${RESET}  $*"; }
warn()    { echo -e "${YELLOW}${BOLD}[WARN]${RESET}  $*"; }
error()   { echo -e "${RED}${BOLD}[ERR ]${RESET}  $*"; exit 1; }

# ── Config ────────────────────────────────────────────────────────────────────
REPO_URL="https://github.com/LeoH4/HY4S-Hyprland-for-school.git"
REPO_DIR="$HOME/Projects/HY4S"
DOTFILES_DIR="$REPO_DIR/dotfiles"
PACKAGES_FILE="$REPO_DIR/packages.txt"

# ── Banner ────────────────────────────────────────────────────────────────────
echo -e "${CYAN}${BOLD}"
echo "  ╦ ╦╦ ╦┌─┐┌─┐  ╦ ╦┬ ┬┌─┐┬─┐┬  ┌─┐┌┐┌┌┬┐"
echo "  ╠═╣╚╦╝╠═╣╚═╗  ╠═╣└┬┘├─┘├┬┘│  ├─┤│││ ││"
echo "  ╩ ╩ ╩ ╩ ╩╚═╝  ╩ ╩ ┴ ┴  ┴└─┴─┘┴ ┴┘└┘─┴┘"
echo -e "${RESET}"
echo -e "  ${BOLD}Hyprland for School — Fresh Install${RESET}"
echo -e "  ${YELLOW}Arch / EndeavourOS${RESET}\n"

# ── Sanity checks ─────────────────────────────────────────────────────────────
[[ $EUID -eq 0 ]] && error "Don't run this as root. Run as your normal user."
command -v pacman &>/dev/null || error "pacman not found — this script is for Arch-based distros only."

# ── Step 1: Update system ─────────────────────────────────────────────────────
info "Updating system packages..."
sudo pacman -Syu --noconfirm
success "System up to date."

# ── Step 2: Install base dependencies ────────────────────────────────────────
info "Installing base dependencies (git, stow, base-devel)..."
sudo pacman -S --needed --noconfirm git stow base-devel
success "Base dependencies installed."

# ── Step 3: Install yay ───────────────────────────────────────────────────────
if command -v yay &>/dev/null; then
    success "yay is already installed, skipping."
else
    info "Installing yay (AUR helper)..."
    TMP_YAY=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$TMP_YAY/yay"
    (cd "$TMP_YAY/yay" && makepkg -si --noconfirm)
    rm -rf "$TMP_YAY"
    success "yay installed."
fi

# ── Step 4: Clone dotfiles repo ───────────────────────────────────────────────
if [[ -d "$REPO_DIR/.git" ]]; then
    warn "Repo already exists at $REPO_DIR — pulling latest instead."
    git -C "$REPO_DIR" pull
else
    info "Cloning dotfiles to $REPO_DIR..."
    mkdir -p "$HOME/Projects"
    git clone "$REPO_URL" "$REPO_DIR"
    success "Repo cloned."
fi

# ── Step 5: Install packages from packages.txt ───────────────────────────────
if [[ ! -f "$PACKAGES_FILE" ]]; then
    warn "No packages.txt found at $PACKAGES_FILE."
    warn "Skipping package install. Add a packages.txt to your repo to automate this."
else
    info "Reading packages from $PACKAGES_FILE..."
    # Strip comments (#) and blank lines
    mapfile -t PACKAGES < <(grep -v '^\s*#' "$PACKAGES_FILE" | grep -v '^\s*$')

    if [[ ${#PACKAGES[@]} -eq 0 ]]; then
        warn "packages.txt is empty — nothing to install."
    else
        info "Installing ${#PACKAGES[@]} packages via yay..."
        yay -S --needed --noconfirm "${PACKAGES[@]}"
        success "All packages installed."
    fi
fi

# ── Step 6: Stow dotfiles ─────────────────────────────────────────────────────
info "Stowing dotfiles from $DOTFILES_DIR → $HOME ..."
if [[ ! -d "$DOTFILES_DIR" ]]; then
    error "dotfiles directory not found at $DOTFILES_DIR — check your repo structure."
fi

# Back up any existing configs that would conflict
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
conflicts=$(stow --simulate -d "$REPO_DIR" -t "$HOME" dotfiles 2>&1 | grep 'existing target' || true)
if [[ -n "$conflicts" ]]; then
    warn "Conflicting files found — backing up to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    echo "$conflicts" | grep -oP '(?<=existing target is not owned by stow: ).*' | while read -r f; do
        src="$HOME/$f"
        [[ -e "$src" ]] && mv "$src" "$BACKUP_DIR/" && info "  Backed up: $f"
    done
fi

stow -d "$REPO_DIR" -t "$HOME" dotfiles
success "Dotfiles stowed."

# ── Step 7: Set fish as default shell ─────────────────────────────────────────
FISH_PATH="$(command -v fish 2>/dev/null || true)"
if [[ -z "$FISH_PATH" ]]; then
    warn "fish not found in PATH — skipping shell change. Install fish and re-run."
else
    if [[ "$SHELL" == "$FISH_PATH" ]]; then
        success "fish is already your default shell."
    else
        info "Setting fish as default shell..."
        # Ensure fish is in /etc/shells
        grep -qxF "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells
        chsh -s "$FISH_PATH"
        success "Default shell set to fish. Takes effect on next login."
    fi
fi

# ── Step 8: Enable SDDM (if installed) ───────────────────────────────────────
if command -v sddm &>/dev/null; then
    info "Enabling SDDM display manager..."
    sudo systemctl enable sddm
    success "SDDM enabled."
fi

# ── Step 9: Enable NetworkManager ────────────────────────────────────────────
info "Enabling NetworkManager..."
sudo systemctl enable --now NetworkManager
success "NetworkManager enabled."

# ── Step 10: Enable Bluetooth ─────────────────────────────────────────────────
info "Enabling Bluetooth..."
sudo systemctl enable --now bluetooth
success "Bluetooth enabled."

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════╗"
echo -e "║   HY4S install complete! Reboot to go.   ║"
echo -e "╚══════════════════════════════════════════╝${RESET}"
echo ""
echo -e "  To update configs/packages in future, run:"
echo -e "  ${CYAN}${BOLD}bash $REPO_DIR/update.sh${RESET}"
echo ""

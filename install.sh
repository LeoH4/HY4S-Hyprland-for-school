#!/usr/bin/env bash
# =============================================================================
#  HY4S — Hyprland for School | Install Script
#  https://github.com/LeoH4/HY4S-Hyprland-for-school
# =============================================================================

set -euo pipefail

# ── Gruvbox colours ───────────────────────────────────────────────────────────
GRN='\033[38;2;184;187;38m'   # gruvbox green   #b8bb26
AQU='\033[38;2;142;192;124m'  # gruvbox aqua    #8ec07c
YLW='\033[38;2;250;189;47m'   # gruvbox yellow  #fabd2f
ORG='\033[38;2;254;128;25m'   # gruvbox orange  #fe8019
RED='\033[38;2;251;73;52m'    # gruvbox red     #fb4934
FG='\033[38;2;235;219;178m'   # gruvbox fg      #ebdbb2
DIM='\033[38;2;146;131;116m'  # gruvbox gray    #928374
BLU='\033[38;2;131;165;152m'  # gruvbox blue    #83a598
RST='\033[0m'

# ── Step header printer ───────────────────────────────────────────────────────
step() {
    local tag="$1"; local msg="$2"
    echo -e "${YLW} ┌─[${tag}]──────────────────────────────┐${RST}"
    echo -e "${YLW} └─ ${FG}${msg}${RST}"
}
ok()   { echo -e "${GRN} [  OK  ]  $*${RST}"; }
info() { echo -e "${DIM} $*${RST}"; }
warn() { echo -e "${YLW} [WARN]  $*${RST}"; }
err()  { echo -e "${RED} [ ERR ]  $*${RST}"; exit 1; }

# ── Config ────────────────────────────────────────────────────────────────────
REPO_URL="https://github.com/LeoH4/HY4S-Hyprland-for-school.git"
REPO_DIR="$HOME/Projects/HY4S"
DOTFILES_DIR="$REPO_DIR/dotfiles"
PACKAGES_FILE="$REPO_DIR/packages.txt"

# ── Banner ────────────────────────────────────────────────────────────────────
echo -e "${GRN}"
echo ' ██╗  ██╗██╗   ██╗██╗  ██╗███████╗'
echo ' ██║  ██║╚██╗ ██╔╝██║  ██║██╔════╝'
echo ' ███████║ ╚████╔╝ ███████║███████╗ '
echo ' ██╔══██║  ╚██╔╝  ╚════██║╚════██║ '
echo ' ██║  ██║   ██║        ██║███████║ '
echo ' ╚═╝  ╚═╝   ╚═╝        ╚═╝╚══════╝'
echo -e "${RST}"
echo -e "${AQU} ╔══════════════════════════════════════╗${RST}"
echo -e "${AQU} ║  ${FG}Hyprland for School  ·  Fresh Install${AQU}  ║${RST}"
echo -e "${AQU} ║  ${DIM}Arch / EndeavourOS                    ${AQU}║${RST}"
echo -e "${AQU} ╚══════════════════════════════════════╝${RST}"
echo ""

# ── Sanity checks ─────────────────────────────────────────────────────────────
[[ $EUID -eq 0 ]] && err "Don't run this as root. Run as your normal user."
command -v pacman &>/dev/null || err "pacman not found — Arch-based distros only."

# ── Step 1: System update ─────────────────────────────────────────────────────
step " SYS " "Updating system packages..."
sudo pacman -Syu --noconfirm 2>&1 | while IFS= read -r line; do info "$line"; done
ok "System up to date."

# ── Step 2: Base dependencies ─────────────────────────────────────────────────
step " PKG " "Installing git, stow, base-devel..."
sudo pacman -S --needed --noconfirm git stow base-devel 2>&1 | while IFS= read -r line; do info "$line"; done
ok "Base dependencies installed."

# ── Step 3: Install yay ───────────────────────────────────────────────────────
if command -v yay &>/dev/null; then
    ok "yay is already installed, skipping."
else
    step " YAY " "Building yay from AUR..."
    TMP_YAY=$(mktemp -d)
    info "Cloning yay..."
    git clone https://aur.archlinux.org/yay.git "$TMP_YAY/yay" 2>&1 | while IFS= read -r line; do info "$line"; done
    (cd "$TMP_YAY/yay" && makepkg -si --noconfirm 2>&1 | while IFS= read -r line; do info "$line"; done)
    rm -rf "$TMP_YAY"
    ok "yay installed."
fi

# ── Step 4: Clone dotfiles ────────────────────────────────────────────────────
if [[ -d "$REPO_DIR/.git" ]]; then
    warn "Repo already exists at $REPO_DIR — pulling latest instead."
    git -C "$REPO_DIR" pull 2>&1 | while IFS= read -r line; do info "$line"; done
else
    step " GIT " "Cloning dotfiles → ~/Projects/HY4S/"
    mkdir -p "$HOME/Projects"
    git clone "$REPO_URL" "$REPO_DIR" 2>&1 | while IFS= read -r line; do info "$line"; done
    ok "Repo cloned."
fi

# ── Step 5: Install packages ──────────────────────────────────────────────────
if [[ ! -f "$PACKAGES_FILE" ]]; then
    warn "No packages.txt found — skipping package install."
else
    mapfile -t PACKAGES < <(grep -v '^\s*#' "$PACKAGES_FILE" | grep -v '^\s*$')
    if [[ ${#PACKAGES[@]} -eq 0 ]]; then
        warn "packages.txt is empty — nothing to install."
    else
        step " PKG " "Installing ${#PACKAGES[@]} packages via yay..."
        yay -S --needed --noconfirm "${PACKAGES[@]}" 2>&1 | while IFS= read -r line; do info "$line"; done
        ok "All packages installed."
    fi
fi

# ── Step 6: Stow dotfiles ─────────────────────────────────────────────────────
step " GNU " "Stowing dotfiles → ~/"
[[ ! -d "$DOTFILES_DIR" ]] && err "dotfiles/ not found at $DOTFILES_DIR — check repo structure."

info "Checking for conflicts..."
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
ok "Dotfiles stowed."

# ── Step 7: Default shell ─────────────────────────────────────────────────────
FISH_PATH="$(command -v fish 2>/dev/null || true)"
if [[ -z "$FISH_PATH" ]]; then
    warn "fish not found in PATH — skipping shell change."
else
    step "  SH  " "Setting fish as default shell..."
    grep -qxF "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells
    chsh -s "$FISH_PATH"
    ok "Default shell set to fish. Takes effect on next login."
fi

# ── Step 8: SDDM ─────────────────────────────────────────────────────────────
if command -v sddm &>/dev/null; then
    step " SVC " "Enabling SDDM display manager..."
    sudo systemctl enable sddm
    ok "SDDM enabled."
fi

# ── Step 9: Services ──────────────────────────────────────────────────────────
step " SVC " "Enabling system services..."
sudo systemctl enable --now NetworkManager
ok "NetworkManager enabled."
sudo systemctl enable --now bluetooth
ok "Bluetooth enabled."

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo -e "${GRN}"
echo ' ██████╗  ██████╗ ███╗   ██╗███████╗██╗'
echo ' ██╔══██╗██╔═══██╗████╗  ██║██╔════╝██║'
echo ' ██║  ██║██║   ██║██╔██╗ ██║█████╗  ██║'
echo ' ██║  ██║██║   ██║██║╚██╗██║██╔══╝  ╚═╝'
echo ' ██████╔╝╚██████╔╝██║ ╚████║███████╗██╗'
echo ' ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝'
echo -e "${RST}"
echo -e "${AQU} ╔══════════════════════════════════════╗${RST}"
echo -e "${AQU} ║  ${FG}HY4S install complete!  Reboot now.${AQU}  ║${RST}"
echo -e "${AQU} ╚══════════════════════════════════════╝${RST}"
echo ""
echo -e "${DIM} To update configs/packages in future, run:${RST}"
echo -e "${BLU} \$ bash ~/Projects/HY4S/update.sh${RST}"
echo ""
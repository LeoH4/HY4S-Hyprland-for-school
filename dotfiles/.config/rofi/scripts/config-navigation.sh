#!/usr/bin/env bash
## Rofi Config File Navigator
## Dynamically scans ~/.config for config files

# Rofi theme
theme="$HOME/.config/rofi/launchers/type-1/style-5.rasi"

# Base config directory
CONFIG_DIR="/home/leoh/Projects/HY4S/dotfiles/.config"
# Directories to exclude from scanning
exclude_dirs=(
    "BraveSoftware" "Code" "chromium" "discord" "Electron"
    "obs-studio" "pulse" "spotify" "Slack" "zoom"
    "google-chrome" "fontconfig" "fonts" "QtProject" "Trolltech"
    "dconf" "ibus" "menus" "mimeapps.list" "user-dirs"
    "autostart" "systemd" "nautilus" "evolution" "gnome"
    "gtk-2.0" "gtk-3.0" "gtk-4.0" "enchant" "glib-2.0"
    "gio" "tracker" "xfce4"
)

# Allowed file extensions
allowed_extensions=(
    "conf" "json" "jsonc" "css" "rasi" "txt" "lua"
    "sh" "toml" "yaml" "yml" "ini" "rc"
)

# Rofi command with custom sizing
rofi_cmd() {
    rofi -dmenu \
        -theme "$theme" \
        -font "JetBrains Mono Nerd Font 16" \
        -width 35 \
        -lines 30 \
        -p "$1"
}

# Check if file has allowed extension
is_allowed_extension() {
    local file="$1"
    local filename=$(basename "$file")
    local ext="${filename##*.}"

    # Handle files without extension (like 'config', 'rc', etc.)
    if [[ "$filename" == "$ext" ]]; then
        case "$filename" in
            config|rc|profile|bashrc|zshrc|vimrc)
                return 0
                ;;
        esac
    fi

    # Check extension
    for allowed in "${allowed_extensions[@]}"; do
        if [[ "${ext,,}" == "${allowed,,}" ]]; then
            return 0
        fi
    done
    return 1
}

# Get all config files
get_config_files() {
    # Build find arguments for excluded directories
    local find_args=("$CONFIG_DIR" -type d \()
    local first=true
    for dir in "${exclude_dirs[@]}"; do
        if $first; then
            first=false
        else
            find_args+=(-o)
        fi
        find_args+=(-name "$dir")
    done
    find_args+=(\) -prune -o -type f -print)

    local files=()
    while IFS= read -r file; do
        if is_allowed_extension "$file"; then
            files+=("$file")
        fi
    done < <(find "${find_args[@]}")

    printf '%s\n' "${files[@]}"
}

# Group files by top-level directory
declare -A categories
while IFS= read -r filepath; do
    # Get relative path from config dir
    rel_path="${filepath#$CONFIG_DIR/}"

    # Get top-level directory as category
    if [[ "$rel_path" == */* ]]; then
        category="${rel_path%%/*}"
    else
        category="root"
    fi

    categories["$category"]+="$filepath"$'\n'
done < <(get_config_files)

# Check if we found any files
if [[ ${#categories[@]} -eq 0 ]]; then
    rofi -e "No config files found!" -theme "$theme"
    exit 1
fi

# Show category selection
category_list=$(printf '%s\n' "${!categories[@]}" | sort)
selected_category=$(echo "$category_list" | rofi_cmd "Select Category")
[[ -z "$selected_category" ]] && exit 0

# Show files in selected category with Back option
while true; do
    file_list=$(echo -e "${categories[$selected_category]}" | sed "s|$HOME|~|g" | sort)
    file_list="Back\n$file_list"

    selected_file=$(echo -e "$file_list" | rofi_cmd "Files in $selected_category")

    if [[ -z "$selected_file" ]]; then
        exit 0
    elif [[ "$selected_file" == "Back" ]]; then
        selected_category=$(echo "$category_list" | rofi_cmd "Select Category")
        [[ -z "$selected_category" ]] && exit 0
        continue
    fi

    # Expand ~ back to $HOME and open in nvim
    selected_file="${selected_file/#\~/$HOME}"
    kitty -e nvim "$selected_file"
    exit 0
done
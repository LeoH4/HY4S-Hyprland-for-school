#!/usr/bin/env bash

## Rofi Config File Navigator
## Dynamically scans ~/.config for config files

# Rofi theme
theme="$HOME/.config/rofi/launchers/type-1/style-5.rasi"

# Directories to exclude from scanning
exclude_dirs=(
    "BraveSoftware"
    "Code"
    "chromium"
    "discord"
    "Electron"
    "obs-studio"
    "pulse"
    "spotify"
    "Slack"
    "zoom"
    "google-chrome"
    "fontconfig"
    "fonts"
    "QtProject"
    "Trolltech"
    "dconf"
    "ibus"
    "menus"
    "mimeapps.list"
    "user-dirs"
    "autostart"
    "systemd"
    "nautilus"
    "evolution"
    "gnome"
    "gtk-2.0"
    "gtk-3.0"
    "gtk-4.0"
    "enchant"
    "glib-2.0"
    "gio"
    "tracker"
    "xfce4"
)

# Allowed file extensions
allowed_extensions=(
    "conf"
    "json"
    "jsonc"
    "css"
    "rasi"
    "txt"
    "lua"
    "sh"
    "toml"
    "yaml"
    "yml"
    "ini"
    "rc"
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

# Build find exclude pattern
build_exclude_pattern() {
    local pattern=""
    for dir in "${exclude_dirs[@]}"; do
        pattern="$pattern -path '$HOME/.config/$dir' -prune -o"
    done
    echo "$pattern"
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
    local exclude_pattern=$(build_exclude_pattern)
    local files=()
    
    # Use eval to properly handle the exclude pattern
    while IFS= read -r file; do
        if is_allowed_extension "$file"; then
            files+=("$file")
        fi
    done < <(eval "find '$HOME/.config' -type f $exclude_pattern -print")
    
    printf '%s\n' "${files[@]}"
}

# Group files by top-level directory
declare -A categories

while IFS= read -r filepath; do
    # Get relative path from .config
    rel_path="${filepath#$HOME/.config/}"
    
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
    
    # Handle Back or empty selection
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

#!/bin/bash
# Hyprland Keybind Viewer Script
# Displays keybinds in rofi with descriptions

# Path to your keybinds config
CONFIG_FILE="$HOME/.config/hypr/conf/keybinds.conf"

# Check if config exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    rofi -e "Config file not found: $CONFIG_FILE"
    exit 1
fi

# Parse keybinds and create formatted output
parse_keybinds() {
    local current_description=""
    
    while IFS= read -r line; do
        # Skip empty lines and comments (except name: comments)
        [[ -z "$line" ]] && continue
        
        # Check for description comment (# name: Description)
        if [[ "$line" =~ ^[[:space:]]*#[[:space:]]*name:[[:space:]]*(.+)$ ]]; then
            current_description="${BASH_REMATCH[1]}"
            continue
        fi
        
        # Skip other comments
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        
        # Parse bind lines
        if [[ "$line" =~ ^[[:space:]]*(bind|bindel|bindl|bindm)[[:space:]]*=[[:space:]]*([^,]+),[[:space:]]*([^,]+),[[:space:]]*(.+)$ ]]; then
            local bind_type="${BASH_REMATCH[1]}"
            local modifiers="${BASH_REMATCH[2]}"
            local key="${BASH_REMATCH[3]}"
            local action="${BASH_REMATCH[4]}"
            
            # Replace $mainMod with SUPER
            modifiers="${modifiers//\$mainMod/SUPER}"
            
            # Format the keybind
            local formatted_key="${modifiers} + ${key}"
            
           # Format the keybind
		local formatted_key="${modifiers} + ${key}"

           # Clean up spacing - handle all modifiers properly
		formatted_key="${formatted_key// / + }"  # Replace all spaces with " + "
		formatted_key="${formatted_key//+ + +/+}"  # Clean up any triple plusses
		formatted_key="${formatted_key//+ +/+}"    # Clean up any double plusses
		formatted_key="${formatted_key//  / }"     # Clean up any double spaces
            
            # Generate description from action if no custom description
            local description="$current_description"
            if [[ -z "$description" ]]; then
                # Try to make a nice description from the action
                if [[ "$action" =~ exec,[[:space:]]*(.+) ]]; then
                    local exec_cmd="${BASH_REMATCH[1]}"
                    # Extract just the program name
                    exec_cmd="${exec_cmd##*/}"  # Remove path
                    exec_cmd="${exec_cmd%% *}"  # Remove arguments
                    exec_cmd="${exec_cmd//\$/}" # Remove variables
                    description="Execute: $exec_cmd"
                else
                    description="$action"
                fi
            fi
            
            # Clean up description
            description="${description//,/ }"
            
            # Output formatted line with arrow and minimal spacing
            printf "%s → %s\n" "$formatted_key" "$description"
            
            # Reset description after use
            current_description=""
        fi
    done < "$CONFIG_FILE"
}

# Generate the keybind list and display in rofi
keybind_list=$(parse_keybinds)

# Rofi theme
rofi_theme="~/.config/rofi/launchers/type-7/style-5.rasi"

# Show in rofi
echo "$keybind_list" | rofi -dmenu \
    -i \
    -p "Keybinds" \
    -theme "$rofi_theme" \
    -no-custom

exit 0

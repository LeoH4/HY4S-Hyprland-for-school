#!/bin/bash

if [ "$1" = "run" ]; then
    foot -e bash -c '
        yay -Syu
        if pacman -Qu linux 2>/dev/null | grep -q linux; then
            notify-send -a "System Update" -i "system-reboot" "Update Complete" "Kernel or system packages were updated. Please restart." -u critical
        else
            notify-send -a "System Update" -i "software-update-available" "Update Complete" "All packages are up to date."
        fi
        echo "Press enter to close..."
        read
    '
else
    COUNT=$(yay -Qu 2>/dev/null | wc -l)
    if [ "$COUNT" -gt 0 ]; then
        echo "$COUNT"
    else
        echo "0"
    fi
fi
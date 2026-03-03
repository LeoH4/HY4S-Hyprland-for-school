#!/bin/bash

notification_timeout=1000
step=5

get_backlight() {
    brightnessctl -m | cut -d, -f4 | sed 's/%//'
}

get_icon() {
    local current=$1
    if [ "$current" -le "10" ]; then
        icon="󰃛"  # Very dim
    elif [ "$current" -le "30" ]; then
        icon="󰃜"  # Dim
    elif [ "$current" -le "50" ]; then
        icon="󰃝"  # Medium-low
    elif [ "$current" -le "70" ]; then
        icon="󰃞"  # Medium
    elif [ "$current" -le "90" ]; then
        icon="󰃟"  # Bright
    else
        icon="󰃠"  # Very bright
    fi
}

notify_user() {
    local current=$1
    get_icon "$current"
    notify-send -e -h string:x-canonical-private-synchronous:brightness_notif \
                -h int:value:$current \
                -u low \
                "Brightness" \
                "$icon  $current%"
}

change_backlight() {
    local direction="$1"
    local current_brightness=$(get_backlight)
    local new_brightness
    
    if [[ "$direction" == "up" ]]; then
        new_brightness=$((current_brightness + step))
        if ((new_brightness > 100)); then
            new_brightness=100
        fi
    elif [[ "$direction" == "down" ]]; then
        new_brightness=$((current_brightness - step))
        if ((new_brightness < 0)); then
            new_brightness=0
        fi
    fi
    
    brightnessctl set "${new_brightness}%"
    notify_user "$new_brightness"
}

case "$1" in
    "--get")
        get_backlight
        ;;
    "--inc")
        change_backlight "up"
        ;;
    "--dec")
        change_backlight "down"
        ;;
    *)
        get_backlight
        ;;
esac

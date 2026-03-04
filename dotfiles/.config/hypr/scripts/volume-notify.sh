#!/bin/bash

notification_timeout=1000
step=5

get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | sed 's/%//'
}

get_mute_status() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes" && echo "muted" || echo "unmuted"
}

get_icon() {
    local current=$1
    local mute_status=$2
    
    if [ "$mute_status" == "muted" ]; then
        icon="󰖁"  # Muted
    elif [ "$current" -eq "0" ]; then
        icon="󰖁"  # Zero volume
    elif [ "$current" -le "30" ]; then
        icon="󰕿"  # Low volume
    elif [ "$current" -le "70" ]; then
        icon="󰖀"  # Medium volume
    else
        icon="󰕾"  # High volume
    fi
}

notify_user() {
    local current=$1
    local mute_status=$(get_mute_status)
    get_icon "$current" "$mute_status"
    
    if [ "$mute_status" == "muted" ]; then
        notify-send -e -h string:x-canonical-private-synchronous:volume_notif \
                    -h int:value:0 \
                    -u low \
                    "Volume" \
                    "$icon  Muted"
    else
        notify-send -e -h string:x-canonical-private-synchronous:volume_notif \
                    -h int:value:$current \
                    -u low \
                    "Volume" \
                    "$icon  $current%"
    fi
}

change_volume() {
    local direction="$1"
    local current_volume=$(get_volume)
    local new_volume
    
    if [[ "$direction" == "up" ]]; then
        new_volume=$((current_volume + step))
        if ((new_volume > 100)); then
            new_volume=100
        fi
        pactl set-sink-volume @DEFAULT_SINK@ "${new_volume}%"
    elif [[ "$direction" == "down" ]]; then
        new_volume=$((current_volume - step))
        if ((new_volume < 0)); then
            new_volume=0
        fi
        pactl set-sink-volume @DEFAULT_SINK@ "${new_volume}%"
    fi
    
    notify_user "$new_volume"
}

toggle_mute() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    local current_volume=$(get_volume)
    notify_user "$current_volume"
}

case "$1" in
    "--get")
        get_volume
        ;;
    "--inc")
        change_volume "up"
        ;;
    "--dec")
        change_volume "down"
        ;;
    "--toggle")
        toggle_mute
        ;;
    *)
        get_volume
        ;;
esac

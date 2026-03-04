#!/bin/bash

# Get connected Bluetooth devices
connected_devices=$(bluetoothctl devices Connected 2>/dev/null)

# If no devices connected, output nothing (module will be hidden)
if [ -z "$connected_devices" ]; then
    echo ""
    exit 0
fi

# Get the first connected device MAC address
device_mac=$(echo "$connected_devices" | head -n1 | awk '{print $2}')

# Get device info
device_info=$(bluetoothctl info "$device_mac" 2>/dev/null)

# Get device name
device_name=$(echo "$device_info" | grep "Name:" | cut -d':' -f2- | xargs)

# Get device icon based on type
device_icon=""
if echo "$device_info" | grep -qi "headset\|headphones\|earbuds"; then
    device_icon="󰋋"  # Headphones
elif echo "$device_info" | grep -qi "mouse"; then
    device_icon="󰍽"  # Mouse
elif echo "$device_info" | grep -qi "keyboard"; then
    device_icon="󰌌"  # Keyboard
elif echo "$device_info" | grep -qi "phone"; then
    device_icon="󰄜"  # Phone
elif echo "$device_info" | grep -qi "speaker"; then
    device_icon="󰓃"  # Speaker
elif echo "$device_info" | grep -qi "watch"; then
    device_icon="󰖉"  # Watch
else
    device_icon="󰂯"  # Generic Bluetooth
fi

# Try to get battery level using multiple methods
battery_level=""

# Method 1: Check bluetoothctl info for Battery Percentage
battery_info=$(echo "$device_info" | grep -i "Battery Percentage" | grep -oP '\d+')

# Method 2: Try upower for battery info
if [ -z "$battery_level" ]; then
    battery_level=$(upower -d | grep -A 20 "$device_mac" | grep "percentage" | grep -oP '\d+' | head -n1)
fi

# Method 3: Try /sys/class/power_supply
if [ -z "$battery_level" ]; then
    for bat_path in /sys/class/power_supply/*; do
        if [ -d "$bat_path" ] && grep -q "$device_mac" "$bat_path/uevent" 2>/dev/null; then
            battery_level=$(cat "$bat_path/capacity" 2>/dev/null)
            break
        fi
    done
fi

# Format battery display
battery_display=""
if [ -n "$battery_level" ]; then
    # Choose battery icon based on level
    if [ "$battery_level" -ge 90 ]; then
        battery_icon="󰁹"
    elif [ "$battery_level" -ge 80 ]; then
        battery_icon="󰂂"
    elif [ "$battery_level" -ge 70 ]; then
        battery_icon="󰂁"
    elif [ "$battery_level" -ge 60 ]; then
        battery_icon="󰂀"
    elif [ "$battery_level" -ge 50 ]; then
        battery_icon="󰁿"
    elif [ "$battery_level" -ge 40 ]; then
        battery_icon="󰁾"
    elif [ "$battery_level" -ge 30 ]; then
        battery_icon="󰁽"
    elif [ "$battery_level" -ge 20 ]; then
        battery_icon="󰁼"
    elif [ "$battery_level" -ge 10 ]; then
        battery_icon="󰁻"
    else
        battery_icon="󰁺"
    fi
    battery_display=" $battery_icon $battery_level%"
fi

# Output format: Device Icon + Battery Info
echo "$device_icon$battery_display"

# Tooltip with device name
echo "$device_name"

#!/usr/bin/env bash

# Check if Bluetooth is powered on
power_status=$(bluetoothctl show | grep Powered | awk '{print $2}')

if [ "$power_status" = "no" ]; then
    icon="󰂱"  # Bluetooth OFF with line
    tooltip="Bluetooth is off"
else
    # Count connected devices
    connected_devices=$(bluetoothctl info | grep "Connected: yes" | awk '{print $2}')
    if [ -n "$connected_devices" ]; then
        icon="󰂰"  # Bluetooth ON + connected
        # List connected devices
        tooltip=$(bluetoothctl devices | while read line; do
            device_mac=$(echo $line | awk '{print $2}')
            device_name=$(bluetoothctl info "$device_mac" | grep "Name" | awk -F ': ' '{print $2}')
            connected=$(bluetoothctl info "$device_mac" | grep "Connected" | awk '{print $2}')
            if [ "$connected" = "yes" ]; then
                echo "$device_name"
            fi
        done)
    else
        icon="󰂯"  # Bluetooth ON but not connected
        tooltip="No devices connected"
    fi
fi

# Print icon for Waybar
echo "$icon"

# Print tooltip (Waybar reads this)
echo "$tooltip"


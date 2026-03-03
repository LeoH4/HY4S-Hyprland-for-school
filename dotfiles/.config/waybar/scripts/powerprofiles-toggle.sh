#!/usr/bin/env bash
# Cycle through power profiles: Performance → Balanced → Powersave

current=$(~/.config/waybar/scripts/powerprofiles.sh)

case "$current" in
    "performance")
        echo "Setting profile: balanced"
        sudo sh -c 'echo balance > /sys/class/powercap/intel-rapl:0/energy_perf_policy'
        ;;
    "balanced")
        echo "Setting profile: powersave"
        sudo sh -c 'echo powersave > /sys/class/powercap/intel-rapl:0/energy_perf_policy'
        ;;
    "powersave")
        echo "Setting profile: performance"
        sudo sh -c 'echo performance > /sys/class/powercap/intel-rapl:0/energy_perf_policy'
        ;;
esac


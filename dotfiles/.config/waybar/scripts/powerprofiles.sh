#!/usr/bin/env bash
# Output current power profile
profile=$(cat /sys/class/powercap/intel-rapl:0/energy_perf_policy 2>/dev/null || echo "balanced")

# Normalize to lowercase simple names
case "$profile" in
    "performance"|"0")
        echo "performance"
        ;;
    "powersave"|"2")
        echo "powersave"
        ;;
    *)
        echo "balanced"
        ;;
esac


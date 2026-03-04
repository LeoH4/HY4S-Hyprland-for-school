#!/bin/bash

# Get CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{printf "%.1f%%", 100 - $1}')

# Get RAM usage
ram_usage=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
ram_percent=$(free | awk '/^Mem:/ {printf("%.1f%%", $3/$2 * 100)}')

# Get system uptime
uptime_info=$(uptime -p | sed 's/up //')

# Get load average
load_avg=$(uptime | awk -F'load average:' '{print $2}' | xargs)

# Get disk usage for root
disk_usage=$(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')

# Output empty (icon is in config format field)
echo ""

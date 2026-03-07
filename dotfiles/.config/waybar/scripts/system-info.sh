#!/bin/bash
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
RAM=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
DISK=$(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')
GPU=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null || cat /sys/class/drm/card*/device/gpu_busy_percent 2>/dev/null | head -1 || echo "N/A")
echo "CPU: ${CPU}% | RAM: ${RAM} | Disk: ${DISK} | GPU: ${GPU}%"

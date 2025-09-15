#!/bin/bash
echo "===== System Report ====="
date
echo
echo "Disk Usage:"
df -h | grep -v tmpfs
echo
echo "Top 5 Largest Files in /var/log"
du -ah /var/log | sort -rh | head -5
echo
echo "Memory Usage:"
free -h
echo
echo "CPU Info:"
cat /proc/cpuinfo | head -5
echo
echo "Uptime:"
uptime

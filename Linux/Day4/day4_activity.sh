#!/bin/bash

echo "===== Top 5 Memory-Consuming Processes ====="
ps aux --sort=-%mem | head -6
echo

echo "===== 5 Largest Files in /home ====="
du -ah /home 2>/dev/null | sort -rh | head -5
echo

echo "===== Printing Numbers from 1 to 10 ====="
for i in {1..10}; do
  echo $i
done
echo

echo "===== Saving Disk Usage to disk_usage.txt ====="
df -h > disk_usage.txt
echo "Disk usage saved to disk_usage.txt"

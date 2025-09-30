#!/bin/bash

fu=$( df -h | egrep -v "tmpfs|udev|Filesystem" | awk '{print $5}' | tr -d %)
to="garvcu@gmail.com"
if [[ %fu -ge 80 ]]
then
	echo "Warning, disk space running low - $fu %" | mail -s "Disk Space Alert!" $to
else
	echo "ALl good"
fi

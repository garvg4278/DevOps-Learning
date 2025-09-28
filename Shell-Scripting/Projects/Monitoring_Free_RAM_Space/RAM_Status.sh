#!/bin/bash

free_space=$(free -mt | grep "Total" | awk '{print $4}')

th=500

if (( free_space < th ))
then
	echo "Warning, space is running low"
else
	echo "RAM is sufficient $free_space M"
fi

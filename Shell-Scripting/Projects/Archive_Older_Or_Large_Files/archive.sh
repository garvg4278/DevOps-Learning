#!/bin/bash

base="/home/garv/Documents"
days=10
depth=1
run=0

# Check if the base directory exists
if [ ! -d "$base" ]; then
    echo "Directory does not exist: $base"
    exit 1
fi

# Create archive directory if it doesn't exist
if [ ! -d "$base/archive" ]; then
    mkdir "$base/archive"
fi

# Archive files larger than 20MB
find "$base" -maxdepth "$depth" -type f -size +20M | while read -r i; do
    if [ "$run" -eq 0 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] archiving large file $i ==> $base/archive"
        gzip "$i" || exit 1
        mv "$i.gz" "$base/archive" || exit 1
    fi
done

# Archive files older than $days days
find "$base" -maxdepth "$depth" -type f -mtime +"$days" | while read -r i; do
    if [ "$run" -eq 0 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] archiving old file $i ==> $base/archive"
        gzip "$i" || exit 1
        mv "$i.gz" "$base/archive" || exit 1
    fi
done

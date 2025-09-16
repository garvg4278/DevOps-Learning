#!/bin/bash

echo "===== IP Address ====="
ip a | grep inet
echo

echo "===== Pinging Google ====="
ping -c 4 google.com
echo

echo "===== Top 5 Listening Connections ====="
ss -tulnp | head -6

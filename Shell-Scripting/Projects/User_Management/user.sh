#!/bin/bash

# Script should be executed with sudo/root access.

if [[ "${UID}" -ne 0 ]]; then
    echo "Please run with sudo or root."
    exit 1
fi

# User should provide at least one argument as username, else guide them.

if [[ "${#}" -lt 1 ]]; then
    echo "Usage: ${0} USERNAME [COMMENT]..."
    echo "Create a user with USERNAME and optional COMMENT field."
    exit 1
fi

# Store first argument as username
username="${1}"

# Shift to get remaining arguments as comment
shift
comment="${@}"

# Check if the user already exist
if id "${username}" &>/dev/null; then
    echo "User '${username}' already exists."
    exit 1
fi

# Create a password using current timestamp
password=$(date +%s%N)

# Create the user with comment and home directory
useradd -c "${comment}" -m "${username}"

# Check if user creation was successful
if [[ $? -ne 0 ]]; then
    echo "The account could not be created."
    exit 1
fi

# Set the password for the user
echo "${password}" | passwd --stdin "${username}"

# Check if password was successfully set
if [[ $? -ne 0 ]]; then 
    echo "Password could not be set."
    exit 1
fi

# Force password change on first login
passwd -e "${username}"

# Display the username, password, and host
echo
echo "Username: ${username}"
echo "Password: ${password}"
echo "Host: $(hostname)"

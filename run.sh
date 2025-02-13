#!/usr/bin/env bash

# Ensure script exits on errors
set -e

# Check if arguments are provided
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

IP="$1"
INTERFACE='eth0' # inside docker it's always eth0

# Run the Docker container with the provided arguments
docker run --rm \
    -p "$IP:8080:8080" \
    -p "$IP:554:554" \
    -p "$IP:1000:1000" \
    -p "$IP:8554:8554" \
    -e INTERFACE="$INTERFACE" \
    onvif-camera-mock-onvif-camera /onvif-camera-mock/main.py

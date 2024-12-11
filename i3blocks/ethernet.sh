#!/bin/bash

ETH_INTERFACE=$(ip -o link show | awk -F': ' '{print $2}' | grep '^eth')
IP_ADDR=$(ip addr show $ETH_INTERFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
SPEED=$(cat /sys/class/net/$ETH_INTERFACE/speed 2>/dev/null)

if [ -n "$IP_ADDR" ]; then
    if [ -n "$SPEED" ]; then
        echo "E: $IP_ADDR (${SPEED}Mb/s)"
    else
        echo "E: $IP_ADDR"
    fi
else
    echo "E: down"
fi

#!/bin/bash

if pgrep onboard > /dev/null
then
    # If Onboard is running, kill it (close it)
    pkill onboard
    echo "VKB: Off"
else
    # If Onboard is not running, start it
    onboard &
    echo "VKB: On"
fi

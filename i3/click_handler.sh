#!/bin/bash

# Get the coordinates of the click
read x y button << $(xdotool getmouselocation --shell 2>/dev/null | grep -oE '[0-9]+')

# Get the geometry of the i3bar
read bar_x bar_y bar_width bar_height << $(xwininfo -name "i3bar for output" | grep -A 2 "Absolute upper-left X" | grep -oE '[0-9]+')

# Check if the click is within the i3bar
if [ $y -ge $bar_y ] && [ $y -le $((bar_y + bar_height)) ]; then
    # Calculate the position of the keyboard icon (assuming it's the leftmost item)
    icon_width=30  # Adjust this value based on your font and icon size
    if [ $x -le $((bar_x + icon_width)) ]; then
        # Toggle the keyboard
        if pgrep onboard > /dev/null; then
            killall onboard
        else
            onboard &
        fi
    fi
fi

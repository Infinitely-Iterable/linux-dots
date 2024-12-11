#!/bin/bash

# Get battery percentage
BATTERY_PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

BATTERY_ICON=""
if [ "$BATTERY_PERCENT" -ge 90 ]; then
    BATTERY_ICON="󱈏"  # Full battery +
elif [ "$BATTERY_PERCENT" -ge 75 ]; then
	BATTERY_ICON="󰂂" # full
elif [ "$BATTERY_PERCENT" -ge 50 ]; then
    BATTERY_ICON="󰂀"  # 75% battery
elif [ "$BATTERY_PERCENT" -ge 25 ]; then
    BATTERY_ICON="󰁾"  # 50% battery
elif [ "$BATTERY_PERCENT" -ge 10 ]; then
    BATTERY_ICON="󰁻"  # 25% battery
else
    BATTERY_ICON="󱃍"  # Low battery
fi

# Add charging symbol if plugged in
if [ "$BATTERY_STATUS" = "Charging" ]; then
    BATTERY_ICON="󰂄"
fi

# Output the indicator
echo "$BATTERY_ICON  $BATTERY_PERCENT%"


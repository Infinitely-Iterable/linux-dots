#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch Polybar on each monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bar1 &
  done
else
  polybar --reload bar1 &
fi

echo "Polybar launched on all monitors"


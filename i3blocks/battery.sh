#!/bin/bash

BATTERY=BAT0
BATTERY_INFO=$(acpi -b | grep "Battery ${BATTERY}")
BATTERY_STATE=$(echo "${BATTERY_INFO}" | grep -wo "Full\|Charging\|Discharging")
BATTERY_POWER=$(echo "${BATTERY_INFO}" | grep -o '[0-9]\+%' | tr -d '%')

if [[ "${BATTERY_STATE}" = "Charging" ]]; then
  echo "🔌${BATTERY_POWER}%"
elif [[ "${BATTERY_STATE}" = "Discharging" ]]; then
  echo "🔋${BATTERY_POWER}%"
else
  echo "🔋${BATTERY_POWER}%"
fi

#!/bin/bash

power_out=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 2>/dev/null)

if [[ -z "$power_out" ]]; then
	echo "No battery"
	exit 0
fi

# Get the current battery percentage
battery_percentage=$(echo "$power_out" | grep "percentage:" | awk '{print $2}' | tr -d '%')

# Get the battery status (Charging or Discharging)
battery_status=$(echo "$power_out" | grep "state:" | awk '{print $2}')

echo "$battery_percentage%" 

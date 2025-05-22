#!/bin/bash

light=$(cat ~/.config/waybar/scripts/gamma_config/default_light.conf)
temperature=$(cat ~/.config/waybar/scripts/gamma_config/default_temperature.conf)

killall gammastep 2>/dev/null

temperature=$((temperature + 300))
if [ "$temperature" -gt 6500 ]; then
        temperature=6500
fi
echo "$temperature" > ~/.config/waybar/scripts/gamma_config/default_temperature.conf
temperature="${temperature}K"

gammastep -O "$temperature" -b "$light" &

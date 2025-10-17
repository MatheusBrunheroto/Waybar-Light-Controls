#!/bin/bash

temperature=$(cat ~/.config/waybar/scripts/gamma_config/default_temperature.conf)
temperature=$((temperature - 300))

if [ "$temperature" -lt 1500 ]; then
        temperature=1500
fi
echo "$temperature" > ~/.config/waybar/scripts/gamma_config/default_temperature.conf

hyprctl hyprsunset temperature "$temperature"

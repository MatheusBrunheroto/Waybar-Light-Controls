#!/bin/bash

temperature=$(cat ~/.config/waybar/scripts/gamma_config/default_temperature.conf)
temperature=$((temperature + 300))

if [ "$temperature" -gt 6500 ]; then
        temperature=6500
fi

echo "$temperature" > ~/.config/waybar/scripts/gamma_config/default_temperature.conf

hyprctl hyprsunset temperature "$temperature"

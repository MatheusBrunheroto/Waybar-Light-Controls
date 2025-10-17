#!/bin/bash

light=$(cat ~/.config/waybar/scripts/gamma_config/default_light.conf)
light=$((light + 10))

if [ "$light" -gt 100 ]; then
    light=100
fi

echo "$light" > ~/.config/waybar/scripts/gamma_config/default_light.conf

hyprctl hyprsunset gamma "$light"

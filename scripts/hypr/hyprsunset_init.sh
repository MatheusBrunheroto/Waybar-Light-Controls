#!/bin/bash

hyprsunset &

sleep 1

hyprctl hyprsunset gamma $(cat ~/.config/waybar/scripts/gamma_config/default_light.conf)
hyprctl hyprsunset temperature $(cat ~/.config/waybar/scripts/gamma_config/default_temperature.conf)

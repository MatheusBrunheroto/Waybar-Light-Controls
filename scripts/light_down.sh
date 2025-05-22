light=$(cat ~/.config/waybar/scripts/gamma_config/default_light.conf)
temperature=$(cat ~/.config/waybar/scripts/gamma_config/default_temperature.conf)

killall gammastep 2>/dev/null

light=$(echo "$light - 0.1" | bc)
if (( $(echo "$light < 0.2" | bc -l) )); then
    light=0.2
fi

echo "$light" > ~/.config/waybar/scripts/gamma_config/default_light.conf

gammastep -O "$temperature" -b "$light" &

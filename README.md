# Waybar-Light-Controls (Hyprland)

**Waybar integration for [hyprsunset](https://github.com/hyprwm/hyprsunset)**, featuring configurable gamma and temperature limits with persistent settings saved between sessions.  
This behavior can alternatively be achieved using direct Waybar actions, such as:  
```shell
hyprctl hyprsunset gamma +10   # on-scroll-up  
hyprctl hyprsunset gamma -10   # on-scroll-down
```

###### The colors appear to change rapidly due to GIF compression.
| You can configure the brightness and blue light filter by scrolling through the icons. |
| -------------------------------------- |
|![Demonstration](./preview.mp4)|
<hr>

## Installation
```shell
git clone https://github.com/MatheusBrunheroto/Waybar-Light-Controls.git
cd Waybar-Light-Controls
chmod +x install.sh
./install.sh
```
The `install.sh` script will:

- Create directories under `~/.config/hypr` and `~/.config/waybar`.
- If the `scripts` directory does not exist, it will be created along with a `waybar-light-controls` subdirectory.
- Move the repository files into their respective configuration directories.
## Waybar Configuration
Add the following blocks to your Waybar configuration file under the desired section (modules-left, modules-center, or modules-right):

```json
"custom/light":{
        "format": "{icon} ",
        "format-source": "{icon} ",
        "tooltip": false,
        "format-icons": ["●"],
        "on-scroll-up": "bash ~/.config/waybar/scripts/waybar-light-controls/light_control.sh up",
        "on-scroll-down": "bash ~/.config/waybar/scripts/waybar-light-controls/light_control.sh down",
},
"custom/temperature":{
        "format": "{icon} ",
        "format-source": "{icon} ",
        "tooltip": false,
        "format-icons": ["○"],
        "on-scroll-up": "bash ~/.config/waybar/scripts/waybar-light-controls/temperature_control.sh up",
        "on-scroll-down": "bash ~/.config/waybar/scripts/waybar-light-controls/temperature_control.sh down",
},
```
After editing your config, restart Waybar or reload it:
```shell
pkill waybar && waybar &
```

## Initialization on Startup
To ensure the system initializes with the previously saved gamma and temperature settings, add the following line to your `~/.config/hypr/hyprland.conf` file:
```shell
exec-once = ~/.config/hypr/scripts/waybar-light-controls/hyprsunset_init.sh
```
This command will restore the values stored in `default_light.conf` and `default_temperature.conf` during startup.

<hr>

## Dependencies

`hyprsunset` must be installed for these scripts to function properly.
```shell
yay -S hyprsunset
```

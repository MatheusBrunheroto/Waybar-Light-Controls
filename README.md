# Waybar-Light-Controls
**Waybar integration for hyprsunset**, featuring configurable gamma and temperature limits, with persistent settings saved between sessions.
<br>This behavior can alternatively be "achieved" by using direct Waybar actions, such as `hyprctl hyprsunset gamma +10` for `"on-scroll-up"` and `hyprctl hyprsunset gamma -10` for `"on-scroll-down"`.
###### The colors appear to change rapidly due to GIF compression.
| You can configure the brightness and blue light filter by scrolling through the icons. |
| -------------------------------------- |
|![Demonstration](https://github.com/user-attachments/assets/dc4c3dcb-0b0d-4743-9633-7d429c9becb2)|
<hr>

# Installation
```shell
git clone https://github.com/MatheusBrunheroto/Waybar-Light-Controls.git
cd Waybar-Light-Controls
chmod +x install.sh
./install.sh

# The install.sh script creates two directories:
# one inside ~/.config/hypr and another inside ~/.config/waybar.
# If the "scripts" directory does not exist,
# it will be created along with a "waybar-light-controls" subdirectory.
# The script then moves the files from this repository into the newly created directories.
```

Next, insert the following blocks into your Waybar configuration file under the appropriate section (modules-left, modules-center, or modules-right):

```json
"custom/light":{
        "format": "{icon} ",
        "format-source": "{icon} ",
        "format-icons": ["●"],
        "on-scroll-up": "bash ~/.config/waybar/scripts/waybar-light-controls/light_control.sh up",
        "on-scroll-down": "bash ~/.config/waybar/scripts/waybar-light-controls/light_control.sh down",
},
"custom/temperature":{
        "format": "{icon} ",
        "format-source": "{icon} ",
        "format-icons": ["○"],
        "on-scroll-up": "bash ~/.config/waybar/scripts/waybar-light-controls/temperature_control.sh up",
        "on-scroll-down": "bash ~/.config/waybar/scripts/waybar-light-controls/temperature_control.sh down",
},
```
After editing your config, restart Waybar or reload it:
```shell
pkill waybar && waybar &
```
<hr>

# Dependencies

You must have `hyprsunset` installed for the scripts to function properly.

```shell
yay -S hyprsunset
```

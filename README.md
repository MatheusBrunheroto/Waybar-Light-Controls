## Preview
###### The colors appear to change rapidly due to GIF compression.
| You can configure the brightness and blue light filter by scrolling through the icons. |
| -------------------------------------- |
|![Demonstration](https://github.com/user-attachments/assets/dc4c3dcb-0b0d-4743-9633-7d429c9becb2)|
<hr>

# Installation
```shell
# Clone the repository
git clone https://github.com/MatheusBrunheroto/Waybar-Light-Controls.git

# Create the destination directory if it doesn't exist
mkdir -p ~/.config/waybar/scripts/

# Move the scripts to the destination directory
mv Waybar-Light-Controls/scripts/* ~/.config/waybar/scripts/

# Optionally, remove the cloned repository
rm -rf Waybar-Light-Controls
```

Next, insert the following blocks into your Waybar configuration file under the appropriate section (modules-left, modules-center, or modules-right):

```json
"custom/light":{
        "format": "{icon} ",
        "format-source": "{icon} ",
        "format-icons": [""],
        "on-scroll-up": "bash ~/.config/waybar/scripts/light_up.sh",
        "on-scroll-down": "bash ~/.config/waybar/scripts/light_down.sh",
},
"custom/temperature":{
        "format": "{icon} ",
        "format-source": "{icon} ",
        "format-icons": [""],
        "on-scroll-up": "bash ~/.config/waybar/scripts/temperature_up.sh",
        "on-scroll-down": "bash ~/.config/waybar/scripts/temperature_down.sh",
},
```
After editing your config, restart Waybar or reload it:
```shell
pkill waybar && waybar &
```
<hr>

# Dependencies

You must have `gammastep` and `bc` installed for the scripts to function properly.

```shell
yay -S gammastep
yay -S bc
```

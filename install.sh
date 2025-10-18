#!/bin/bash

# Exit on error
set -e

echo "[+] Installing Waybar Light Controls..."

# Search for essential folders
REPO_DIR="$(pwd)"
if [ ! -d "$REPO_DIR/scripts" ]; then
    echo -e "\e[31m[x] ERROR: 'scripts' folder not found in $REPO_DIR. Are you in the correct directory?\e[0m"
    exit 1
fi
HYPR_DIR="$HOME/.config/hypr"
if [ ! -d "$HYPR_DIR" ]; then
	echo -e "\e[31m[x] ERROR: Unable to find \"hypr\" at $HOME/.config. \e[0m"
	exit 1
fi
WAYBAR_DIR="$HOME/.config/waybar"
if [ ! -d "$WAYBAR_DIR" ]; then
	echo -e "\e[31m[x] ERROR: Unable to find \"waybar\" at $HOME/.config. \e[0m"
	exit 1
fi


TARGET="scripts/waybar-light-controls"
# Reinstall in case the folder "waybar-light-controls" already exists
if [ -d "$HYPR_DIR/$TARGET" ]; then
	echo -e "\e[33m[!] WARNING: $HYPR_DIR/$TARGET already exists. Removing for reinstallation... \e[0m"
        rm -rf "$HYPR_DIR/$TARGET"
fi
sleep 0.5
if [ -d "$WAYBAR_DIR/$TARGET" ]; then
        echo -e "\e[33m[!] WARNING: $WAYBAR_DIR/$TARGET already exists. Removing for reinstallation... \e[0m"
        rm -rf "$WAYBAR_DIR/$TARGET"
fi

sleep 1
echo -e " "


create_directory() {

    local BASE_DIR="$1"
    local DIR="$BASE_DIR/$TARGET"

    # Verifying BASE_DIR
    if [ -d "$BASE_DIR/scripts" ]; then
        echo -e "\e[33m[!] WARNING: Found $BASE_DIR/scripts.\e[0m"
        echo "[+] Creating /waybar-light-controls/ at $BASE_DIR/scripts"
    else
        echo "[+] Creating $TARGET at $BASE_DIR"
    fi
    sleep 0.5

    # Create directories at BASE_DIR
    mkdir -p "$DIR"
    if [ -d "$DIR" ]; then
        echo -e "\e[32m[✓] Directory created successfully!\e[0m"
    else
        echo -e "\e[31m[x] ERROR: Failed to create directory: $DIR\e[0m"
        exit 1
    fi    

    sleep 1
    echo -e " "
	
}
create_directory "$HYPR_DIR"
create_directory "$WAYBAR_DIR"


cp -r "$REPO_DIR/scripts/hypr/"* "$HYPR_DIR/$TARGET"
echo -e "\e[32m[✓] Files moved to $HYPR_DIR/$TARGET successfully!\e[0m"
sleep 1

cp -r "$REPO_DIR/scripts/waybar/"* "$WAYBAR_DIR/$TARGET"
echo -e "\e[32m[✓] Files moved to $WAYBAR_DIR/$TARGET successfully!\e[0m"
sleep 1.5


echo -e "\n\e[32m[✓] Installation complete!\e[0m"
echo "Next steps:"
echo "  1. Configure your Waybar to use the scripts."
echo "  2. Configure hyprland.conf exec-once."
echo "  3. Restart Waybar or your session to apply changes."
echo "Full guide available at: https://github.com/MatheusBrunheroto/Waybar-Light-Controls"

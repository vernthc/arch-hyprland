#!/bin/bash

THEMES="$HOME/.config/waybar/themes"
ACTIVE="$HOME/.config/waybar"

themes=$(ls -1 "$THEMES")

choice=$(printf "%s\n" $themes | rofi -dmenu -p "Waybar Theme")

[ -z "$choice" ] && exit 0

# replace active files
cp "$THEMES/$choice/config.jsonc" "$ACTIVE/config.jsonc"
cp "$THEMES/$choice/style.css" "$ACTIVE/style.css"

# restart waybar
pkill waybar
sleep 0.3
waybar &

# send notificatio
notify-send "Changed waybar theme"

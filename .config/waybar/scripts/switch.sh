#!/bin/bash

WAYBAR_DIR="$HOME/.config/waybar"

profiles=$(ls -1 "$WAYBAR_DIR" | grep -v switch.sh)

choice=$(printf "%s\n" $profiles | rofi -dmenu -p "Waybar")

[ -z "$choice" ] && exit 0

pkill waybar
sleep 0.3

waybar \
  -c "$WAYBAR_DIR/$choice/config.jsonc" \
  -s "$WAYBAR_DIR/$choice/style.css" &

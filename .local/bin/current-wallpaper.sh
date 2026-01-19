#!/bin/sh

WALL=$(swww query | grep image | cut -d' ' -f2-)

ln -sf "$WALL" "$HOME/.cache/current-wallpaper"

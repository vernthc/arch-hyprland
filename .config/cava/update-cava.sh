#!/bin/bash

TEMPLATE="$HOME/.config/cava/template.ini"
COLORS="$HOME/.config/cava/colors.ini"
OUT="$HOME/.config/cava/config"

awk '
/COLORS_INSERT/ {
    while ((getline line < "'"$COLORS"'") > 0)
        print line
    close("'"$COLORS"'")
    next
}
{ print }
' "$TEMPLATE" >"$OUT"

pkill -USR1 cava

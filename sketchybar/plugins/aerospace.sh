#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on icon= background.border_color="$rose" background.border_width=1
else
    sketchybar --set "$NAME" background.drawing=off icon=
fi

#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting
#
# Clock reference
# https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
#
# Useful to know
# _ = padding
# - = no padding

# sketchybar --set "$NAME" label="$(date '+%d/%m %H:%M')"
sketchybar --set "$NAME" label="$(date '+%a %-d %b %H:%M')"

#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting
#
# Clock reference:
# https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/

# sketchybar --set "$NAME" label="$(date '+%d/%m %H:%M')"
# sketchybar --set "$NAME" label="$(date '+%a %e %B %H:%M')" icon.padding_left="5" icon.padding_right="5" label.padding_right="5" background.color="0x82000000" background.corner_radius="5" background.height="20" background.drawing="on"

sketchybar --add item calendar right \
		   --set calendar icon='󰸗' \
						  icon.padding_left="10" \
						  label.padding_right="10" \
						  label.padding_left="5" \
						  update_freq=30 \
						  background.color=$LOVE \
						  background.border_color=0xffffffff \
						  background.border_width=1 \
		  script="$PLUGIN_DIR/calendar.sh"

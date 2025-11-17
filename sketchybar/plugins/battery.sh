#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="" ICON_COLOR="0xFFC3F7C7"
  ;;
  [6-8][0-9]) ICON="" ICON_COLOR="0xFFDDB892"
  ;;
  [3-5][0-9]) ICON="" ICON_COLOR="0xFFDDB892"
  ;;
  [1-2][0-9]) ICON="" ICON_COLOR="0xFFFA5959"
  ;;
  *) ICON=""
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=""
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
# sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color="$ICON_COLOR" icon.padding_left="5" icon.padding_right="5" label.padding_right="5" background.color="0x82000000" background.corner_radius="5" background.height="20" background.drawing="on"

# when loading the volume plugin - it is always set at 0, need to correc this
# by finding the percentage and set it on load.
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" background.border_color=0xffffffff background.border_width=1 label.padding_right="10" label.padding_left="5" icon.padding_left="15"

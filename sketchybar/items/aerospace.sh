#!/bin/bash

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
	--subscribe space.$sid aerospace_workspace_change \
	--set space.$sid \
	icon=⚬ \
	background.color=0x82000000 \
	background.corner_radius=5 \
	background.height=20 \
	background.drawing=off \
	icon.padding_left=5 \
	icon.padding_right=5 \
	label.padding_left=5 \
	label.padding_right=5 \
	label="$sid" \
	background.border_width=1 \
	click_script="aerospace workspace $sid" \
	script="$CONFIG_DIR/plugins/aerospace.sh $sid"
  done

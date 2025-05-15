#!/bin/bash

# Define custom labels/icons for your workspaces
SPACE_ICONS=("1" "2" "3" "4" "8" "9" "B" "F" "M" "N" "T")
# background.color=0x44ffffff \

for i in "${!SPACE_ICONS[@]}"; do
  id="${SPACE_ICONS[i]}"

  space_item=(
    icon="$id"
    icon.padding_left=7
    icon.padding_right=7
    icon.y_offset=1
    label.drawing=off
    background.color=0xff939ab7
    background.corner_radius=3
    background.padding_left=5
    background.padding_right=5
    background.height=20
    drawing=on
    script="$CONFIG_DIR/plugins/aerospace.sh $id"
    click_script="aerospace workspace $id"
  )

  sketchybar --add item space.$id left \
             --set space.$id "${space_item[@]}" \
             --subscribe space.$id aerospace_workspace_change
done

#!/bin/bash

mic=(
  update_freq=3
  script="$PLUGIN_DIR/mic.sh"
  click_script="$PLUGIN_DIR/mic_click.sh"
  label.drawing=off
  icon.align=center
  icon.padding_left=8
  icon.padding_right=8
  padding_left=10
  padding_right=0
  background.color="$PURE_BLACK"
  background.drawing=off
  popup.align=right
  popup.y_offset=6
  popup.height=28
  popup.background.color=$PURE_BLACK
  popup.background.border_color=$BACKGROUND_2
  popup.background.border_width=1
  popup.background.corner_radius=8
  popup.background.drawing=on
)

sketchybar --add item mic right \
           --set mic "${mic[@]}" \
           --subscribe mic volume_change

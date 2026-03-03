#!/bin/sh

battery=(
  script="$PLUGIN_DIR/battery.sh"
  click_script="$PLUGIN_DIR/close_popups.sh"
  icon.font="$FONT:Regular:15.0"
  background.color="$PURE_BLACK"
  # icon.font.size=14
  padding_right=0
  padding_left=0
  update_freq=120
  updates=on
  background.drawing=off
  script="$PLUGIN_DIR/battery.sh"
)
sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke

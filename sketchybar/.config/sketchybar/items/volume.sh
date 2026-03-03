#!/bin/sh

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  width=200
  slider.width=180
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$BLUE
  slider.background.height=5
  slider.background.corner_radius=2
  slider.background.color=0x80939ab7
  background.color="$PURE_BLACK"
  padding_left=10
  padding_right=10
  slider.knob=⬤
  slider.knob.font="$FONT:Regular:14.0"
  slider.knob.drawing=on
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=5
  padding_right=0
  icon.width=0
  icon.align=center
  icon.padding_left=20
  icon.padding_right=20 
  background.color="$PURE_BLACK"
  icon.color=$GREY
  icon.font="$FONT:Regular:14.0"
  label.width=20
  label.font="$FONT:Regular:14.0"
  popup.align=right
  popup.y_offset=6
  popup.height=28
  popup.background.color=$PURE_BLACK
  popup.background.border_color=$BACKGROUND_2
  popup.background.border_width=1
  popup.background.corner_radius=8
  popup.background.drawing=on
)

sketchybar --add item volume_icon right              \
           --set volume_icon "${volume_icon[@]}"     \
           --add slider volume popup.volume_icon     \
           --set volume "${volume_slider[@]}"        \
           --subscribe volume volume_change mouse.clicked

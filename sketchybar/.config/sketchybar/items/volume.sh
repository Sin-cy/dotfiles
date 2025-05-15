#!/bin/sh

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$BLUE
  slider.background.height=5
  slider.background.corner_radius=0
  slider.background.color=$BACKGROUND_2
  background.color="$PURE_BLACK"
  padding_left=0
  padding_right=5
  slider.knob=
  icon.padding_left=8
  icon.padding_right=8 
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
)

status_bracket=(
  # background.color=$BACKGROUND_1
  background.color="$PURE_BLACK"
  background.border_color=$BACKGROUND_2
)

sketchybar --add slider volume right            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
           --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}"

sketchybar --add bracket status brew github.bell wifi volume_icon \
           --set status "${status_bracket[@]}"

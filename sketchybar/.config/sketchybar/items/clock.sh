#!/bin/sh

clock=(
    background.color="$PURE_BLACK"
    update_freq=10
    icon=
    script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock right \
           --set clock "${clock[@]}" \

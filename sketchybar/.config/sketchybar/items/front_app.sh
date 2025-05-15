#!/bin/bash

front_app=(
     background.color="$PURE_BLACK"
     icon.drawing=off
     label.padding_left=10
     label.padding=10
     script="$PLUGIN_DIR/front_app.sh"
    )

sketchybar --add item front_app left \
    --set front_app "${front_app[@]}" \
    --subscribe front_app front_app_switched

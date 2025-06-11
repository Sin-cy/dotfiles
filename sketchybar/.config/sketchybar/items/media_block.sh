#!/bin/bash

source "$ITEM_DIR/battery.sh"
source "$ITEM_DIR/wifi.sh"
source "$ITEM_DIR/volume.sh"
source "$ITEM_DIR/mic.sh"

media_block=(
    background.color="$PURE_BLACK"
    background.corner_radius=6 
    background.padding_left=0 
    background.padding_right=0 
    blur_radius=0
)

sketchybar --add bracket media_block battery wifi volume mic \
           --set media_block "${media_block[@]}" \

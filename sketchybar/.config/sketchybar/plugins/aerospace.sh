#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
        background.drawing=on \
        icon.color=0xFF1E1E2E
else
    sketchybar --set $NAME \
        background.drawing=off \
        icon.color=0xFF8D93AF
fi

#!/bin/bash

volume_change() {
  source "$CONFIG_DIR/icons.sh"

  case $INFO in
    [6-9][0-9]|100) ICON=$VOLUME_100
    ;;
    [3-5][0-9]) ICON=$VOLUME_66
    ;;
    [1-2][0-9]) ICON=$VOLUME_33
    ;;
    [1-9]) ICON=$VOLUME_10
    ;;
    0) ICON=$VOLUME_0
    ;;
    *) ICON=$VOLUME_100
  esac

  MUTED="$(osascript -e 'output muted of (get volume settings)')"
  if [ "$MUTED" = "true" ]; then
    ICON=$VOLUME_0
  fi

  sketchybar --set volume_icon label="$ICON" \
             --set "$NAME" slider.percentage="$INFO"
}

mouse_clicked() {
  osascript -e "set volume output volume $PERCENTAGE" \
            -e 'set volume output muted false'
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
  "mouse.clicked") mouse_clicked
  ;;
esac

#!/bin/bash

toggle_mute() {
  MUTED="$(osascript -e 'output muted of (get volume settings)')"

  if [ "$MUTED" = "true" ]; then
    osascript -e 'set volume output muted false'
  else
    osascript -e 'set volume output muted true'
  fi

  sketchybar --set volume_icon popup.drawing=off \
             --set mic popup.drawing=off
}

toggle_dropdown() {
  source "$CONFIG_DIR/colors.sh"

  sketchybar --set mic popup.drawing=off

  args=(--remove '/volume.device\.*/' --set volume_icon popup.drawing=toggle)

  if command -v SwitchAudioSource >/dev/null; then
    COUNTER=0
    CURRENT="$(SwitchAudioSource -t output -c)"
    while IFS= read -r device; do
      COLOR=$GREY
      if [ "$device" = "$CURRENT" ]; then
        COLOR=$WHITE
      fi
      args+=(--add item volume.device.$COUNTER popup.volume_icon \
             --set volume.device.$COUNTER width=200 \
                                          icon.drawing=off \
                                          label="$device" \
                                          label.width=200 \
                                          label.align=left \
                                          label.padding_left=10 \
                                          label.padding_right=0 \
                                           label.color="$COLOR" \
                                          background.color=$PURE_BLACK \
                                          background.drawing=on \
                   click_script="SwitchAudioSource -s \"$device\" && sketchybar --set /volume.device\\.*/ label.color=$GREY --set \$NAME label.color=$WHITE --set volume_icon popup.drawing=off")
      COUNTER=$((COUNTER + 1))
    done <<< "$(SwitchAudioSource -a -t output)"
  fi

  sketchybar -m "${args[@]}" > /dev/null
}

if [ "$BUTTON" = "right" ]; then
  toggle_mute
else
  toggle_dropdown
fi

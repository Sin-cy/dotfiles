#!/bin/bash

source "$CONFIG_DIR/colors.sh"

toggle_mic_mute() {
  NEW_INPUT_VOLUME="$(osascript \
    -e 'set cur to input volume of (get volume settings)' \
    -e 'if cur > 0 then' \
    -e 'set volume input volume 0' \
    -e 'return 0' \
    -e 'else' \
    -e 'set volume input volume 100' \
    -e 'return 100' \
    -e 'end if')"

  if [ "$NEW_INPUT_VOLUME" -eq 0 ]; then
    sketchybar --set mic icon= icon.drawing=on icon.color=$RED label.color=$RED
  else
    sketchybar --set mic icon= icon.drawing=on icon.color=$WHITE label.color=$WHITE
  fi

  sketchybar --set volume_icon popup.drawing=off \
             --set mic popup.drawing=off
}

toggle_mics_dropdown() {
  source "$CONFIG_DIR/colors.sh"

  sketchybar --set volume_icon popup.drawing=off

  args=(--remove '/mic.device\.*/' --set mic popup.drawing=toggle)

  if command -v SwitchAudioSource >/dev/null; then
    COUNTER=0
    CURRENT="$(SwitchAudioSource -t input -c)"
    while IFS= read -r device; do
      COLOR=$GREY
      if [ "$device" = "$CURRENT" ]; then
        COLOR=$WHITE
      fi
      args+=(--add item mic.device.$COUNTER popup.mic \
             --set mic.device.$COUNTER width=260 \
                                      icon.drawing=off \
                                      label="$device" \
                                      label.width=260 \
                                      label.align=left \
                                      label.padding_left=10 \
                                      label.padding_right=0 \
                                      label.color="$COLOR" \
                                      background.color=$PURE_BLACK \
                                      background.drawing=on \
                   click_script="SwitchAudioSource -t input -s \"$device\" && sketchybar --set /mic.device\\.*/ label.color=$GREY --set \$NAME label.color=$WHITE --set mic popup.drawing=off")
      COUNTER=$((COUNTER + 1))
    done <<< "$(SwitchAudioSource -a -t input)"
  fi

  sketchybar -m "${args[@]}" > /dev/null
}

if [ "$BUTTON" = "right" ]; then
  toggle_mic_mute
else
  toggle_mics_dropdown
fi

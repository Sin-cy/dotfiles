#!/bin/sh

source "$CONFIG_DIR/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  [8-9][0-9] | 100)
    ICON=""
    ICON_COLOR=$BATTERY_1
    ;;
  7[0-9])
    ICON=""
    ICON_COLOR=$BATTERY_2
    ;;
  [4-6][0-9])
    ICON=""
    ICON_COLOR=$BATTERY_3
    ;;
  [1-3][0-9])
      ICON=""
    ICON_COLOR=$BATTERY_4
    ;;
  [0-9])
    ICON=""
    ICON_COLOR=$BATTERY_5
    ;;
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=""
  ICON_COLOR=$YELLOW
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color=${ICON_COLOR}

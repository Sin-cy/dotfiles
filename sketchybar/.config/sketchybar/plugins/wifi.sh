#!/bin/bash

SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I \
  | awk -F: '($1 ~ "^ *SSID$"){print $2}' \
  | cut -c 2-)

sketchybar --set wifi \
  icon= \
  icon.color=0xff39FF14 \
  icon.align=center \
  label="$SSID"

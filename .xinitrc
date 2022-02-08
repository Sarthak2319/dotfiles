#!/bin/bash

pipewire &
pipewire-pulse &
xrdb -merge ~/.cache/wal/colors.Xresources &
xrdb -merge ~/.Xresources &
#xrandr --output LVDS1 --scale 1.1x1.1 &
~/.config/wpg/wp_init.sh &
pgrep -x sxhkd > /dev/null || sxhkd &
exec dwm

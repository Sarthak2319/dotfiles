#!/bin/bash

pipewire &
pipewire-pulse &
xrdb -merge ~/.cache/wal/colors.Xresources &
~/.config/wpg/wp_init.sh &
pgrep -x sxhkd > /dev/null || sxhkd &
exec dbus-run-session dwm

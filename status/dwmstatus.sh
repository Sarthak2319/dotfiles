#!/bin/bash

#dwm status
while true
do
	VOL=$(amixer get Master -M | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	LOCALTIME=$(date "+%F %r")
	HOSTNAME=$(echo dwm6.3@void-linux)	
	BRIGHT=$(light -G)
	SONGTITLE=$(playerctl metadata title)
	SONGARTIST=$(playerctl metadata artist)	

	GAP=$(echo //)
	VOL_ECHO=$(echo VOL)
	BRT_ECHO=$(echo BRT)
	PLY_ECHO=$(echo ♫)	
	PLY_GAP=$(echo -)
	
	if acpi -a | grep off-line > /dev/null
	then
		BAT="$(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',') BAT"
		xsetroot -name " $BAT $GAP $BRIGHT $BRT_ECHO $GAP $GAP $VOL $VOL_ECHO $GAP $LOCALTIME "
	else
		xsetroot -name " $PLY_ECHO $SONGARTIST $PLY_GAP $SONGTITLE $GAP $BRIGHT $BRT_ECHO $GAP $VOL $VOL_ECHO $GAP $LOCALTIME "
	fi
	sleep 1s
done &

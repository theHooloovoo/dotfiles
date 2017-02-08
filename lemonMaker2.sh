#!/bin/bash

# Declare Colors
VOID_GREEN1="478061"
VOID_GREEN2="abc2ab"

GREY1="#ababab"
GREY1="#6b6b6b"

# Declare Symbols
tune=""	# Siji Music symbol
circle1=""	# Non-filled
circle2=""	# Filled

workSpaces="unset"
getWorkSpaces() {
	WS=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	if   [ $WS = "0" ]; then	echo -e "       "
	elif [ $WS = "1" ]; then	echo -e "       "
	elif [ $WS = "2" ]; then	echo -e "       "
	elif [ $WS = "3" ]; then	echo -e "       "
	elif [ $WS = "4" ]; then	echo -e "       "
	elif [ $WS = "5" ]; then	echo -e "       "
	else						echo -e "       "
	fi
}

#cpu=""
#getCPU() {
#
#}
#
#mem=""
#getMem() {
#
#}
#
music="unset"
getMusic() {
	band=$(audtool current-song-tuple-data artist)
	# if music is not playing, then exit function
	if  [[ -z $band ]]; then
		return
	fi
	song=$(audtool current-song-tuple-data title)
	time_max=$(audtool current-song-length)
	time_current=$(audtool current-song-output-length)

	echo  $band" - "$song"  "$time_current"/"$time_max
}

#battery=""
#getBattery() {
#
#}
#
#volume=""
#getVolume() {
#
#}

currentTime="unset"
getTime() {
	#    +"%r" formats to 'HH:MM:SS AM/PM'
	date +"%r"
}

while true; do
	# Use to decide if a variable should be updated
	msec=$(date +%1N)

	# continuously refresh variable
	workSpaces="$(getWorkSpaces)"

	# Refresh variables every 1 second
	if (( $msec == 0 )); then
		currentTime=$(getTime)
		music=$(getMusic)
	fi


	echo -e " Zenbook $workSpaces $music $msec $currentTime "
	sleep 0.08
done


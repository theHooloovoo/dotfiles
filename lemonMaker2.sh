#!/bin/bash

# Declare Colors
VOID_GREEN1="478061"
VOID_GREEN2="abc2ab"

# Declare Bar Styles
FC0="%{F#ffffff}"
FC1="%{F#$VOID_GREEN2}"

GREY1="#ababab"
GREY2="#6b6b6b"

# Declare Symbols
tune=""	# Siji Music symbol
circle1=""	# Non-filled
circle2=""	# Filled


F_E=" "$FC0"%{F"$GREY1"}"
F_O=" "$FC0"%{F"$GREY1"}"
U_E=" "
U_O=" "
getWorkSpaces2() {
	CURRENT_WS=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	WS=""

	# Iterate through desktops
	for n in 1 2 3 4 5 6 7 8 9
	do
		# Check if workspace is focused
		if	[[ $CURRENT_WS = $((n - 1)) ]]; then
			if	[[ -z $(bspc query -T -d ^$n | grep '"root":null') ]]; then
				# And occupied
				WS=$WS" "$F_O
			else
				# Or empty
				WS=$WS" "$F_E
			fi
		else
			# If not Focused
			if	[[ -z $(bspc query -T -d ^$n | grep '"root":null') ]]; then
				# And occupied
				WS=$WS" "$U_O
			else
				# Or empty
				WS=$WS" "$U_E
			fi
		fi
	done
	echo $WS
}

workSpaces="unset"
getWorkSpaces() {
	# Why do I use xprop, if bspc functions work just as well?
	WS=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	if   [ $WS = "0" ]; then	echo -e "$FC1  $FC0        " 
	elif [ $WS = "1" ]; then	echo -e "  $FC1 $FC0       " 
	elif [ $WS = "2" ]; then	echo -e "   $FC1 $FC0      " 
	elif [ $WS = "3" ]; then	echo -e "    $FC1 $FC0     " 
	elif [ $WS = "4" ]; then	echo -e "     $FC1 $FC0    " 
	elif [ $WS = "5" ]; then	echo -e "      $FC1 $FC0   " 
	elif [ $WS = "6" ]; then	echo -e "       $FC1 $FC0  " 
	elif [ $WS = "7" ]; then	echo -e "        $FC1 $FC0 " 
	elif [ $WS = "8" ]; then	echo -e "         $FC1 $FC0" 
	else						echo -e "Outside the Universe"
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
	workSpaces="$(getWorkSpaces2)"

	# Refresh variables every 1 second
	if (( $msec == 0 )); then
		currentTime=$(getTime)
		music=$(getMusic)
	fi


	echo -e "%{B#$VOID_GREEN1} Zenbook $workSpaces %{c} $music %{r} $currentTime "
	sleep 0.08
done


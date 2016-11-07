#!/bin/bash


getWorkSpaces() {
	WS=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	if   [ $WS = "0" ]; then
		echo "[I] II  III  IV  V  VI "
	elif [ $WS = "1" ]; then
		echo " I [II] III  IV  V  VI "
	elif [ $WS = "2" ]; then
		echo " I  II [III] IV  V  VI "
	elif [ $WS = "3" ]; then
		echo " I  II  III [IV] V  VI "
	elif [ $WS = "4" ]; then
		echo " I  II  III  IV [V] VI "
	elif [ $WS = "5" ]; then
		echo " I  II  III  IV  V [VI]"
	else
		echo " I  II  III  IV  V  VI "
	fi
}

getTime() {
	#    +"%r" formats to 'HH:MM:SS AM/PM'
	date +"%r"
}

getCPU() {
	# Modified from u/siliconSwordz's script
        cpu=$(grep 'cpu ' /proc/stat | awk '{print int(($2+$4)/($2+$4+$5)*100)}')%
        if   [ $cpu | awk '{print length}' = 2 ]; then
                echo "  "$cpu
        elif [ $cpu | awk '{print length}' = 3 ]; then
                echo " "$cpu
        else
                echo $cpu
        fi
}

getRAM() {
	# Modified from u/siliconSwordz's script
        ram=$(free | grep Mem: | awk '{print int($3/$2 * 1000.0)/10}')%
        if   [ $ram | awk '{print length}' = 2 ]; then
                echo "| RAM     "$ram
        elif [ $ram | awk '{print length}' = 3 ]; then
                echo "| RAM    "$ram
        elif [ $ram | awk '{print length}' = 4 ]; then
                echo "| RAM   "$ram
        elif [ $ram | awk '{print length}' = 5 ]; then
                echo "| RAM  "$ram
        else
                echo "| RAM "$ram
        fi
}

STYLE_0="%{B#0a0a0a}%{F#a0a0a0}"
STYLE_1="%{B#875f5f}%{F#a0a0a0}"

while true; do
	echo -e "%{l}$STYLE_1 Eric B. $STYLE_0 $(getWorkSpaces) %{r} $(getTime) "
	sleep 0.1
done



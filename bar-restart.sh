#!/bin/bash

if	[ ! -z $(pidof lemonbar) ]; then
	pkill -9 lemonbar
	pkill -9 lemonMaker.sh
	pkill -9 stalonetray
fi

# Use xlsfonts to get font names
siji='-f -wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1'
font1='-f -misc-fixed-medium-r-normal--9-90-75-75-c-60-iso8859-10'
font2='-f -misc-fixed-medium-r-semicondensed--0-0-75-75-c-0-iso8859-13'
font3='-f -schumacher-clean-medium-r-normal--14-140-75-75-c-70-iso646.1991-irv'

geom='-g 1880x22+20+0 -u 3'
~/.config/bspwm/./lemonMaker.sh | lemonbar $geom $font2 $siji -p &

stalonetray & # --geometry 1x1+1600+0 --grow-gravity W -bg "#000000" -i 20 &

# nm-applet &

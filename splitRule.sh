#!/bin/bash

split=$(xwininfo -id $(bspc query -N -n focused) | awk '/(Width)|(Height)/ {print $2}')
echo $split | {
	read width height
	if [ $width -gt $height ] ; then
		echo 'split_dir=east' 'split_ratio=0.7'
	else
		echo 'split_dir=south' 'split_ratio=0.7'
	fi
}

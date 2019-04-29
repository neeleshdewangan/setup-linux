#!/bin/bash
EXTERNAL_OUTPUT="DP-1"
INTERNAL_OUTPUT="HDMI-0"
MONITOR_MODE=$1

if [ $MONITOR_MODE = "monitor" ]; then
	xrandr --output $EXTERNAL_OUTPUT --auto 
	xrandr --output $INTERNAL_OUTPUT --off
elif [ $MONITOR_MODE = "tv" ]; then
	xrandr --output $EXTERNAL_OUTPUT --off 
	xrandr --output $INTERNAL_OUTPUT --auto
	pactl set-card-profile 0 output:hdmi-stereo-extra1
elif [ $MONITOR_MODE = "clone" ]; then
	xrandr --output $INTERNAL_OUTPUT --auto
	xrandr --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
	pactl set-card-profile 0 output:hdmi-stereo-extra1
elif [ $MONITOR_MODE = "expand" ]; then
	xrandr --output $INTERNAL_OUTPUT --auto
	xrandr --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
	pactl set-card-profile 0 output:hdmi-stereo-extra1
fi


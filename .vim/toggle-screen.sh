#!/bin/bash
EXTERNAL_OUTPUT="DP-1"
INTERNAL_OUTPUT="HDMI-0"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="LEFT"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "LEFT" ]; then
        monitor_mode="RIGHT"
	xrandr --output $EXTERNAL_OUTPUT --auto 
	xrandr --output $INTERNAL_OUTPUT --off
else
        monitor_mode="LEFT"
	xrandr --output $EXTERNAL_OUTPUT --off 
	xrandr --output $INTERNAL_OUTPUT --auto
	pactl set-card-profile 0 output:hdmi-stereo-extra1
fi

# Sound Output Always TV
echo "${monitor_mode}" > /tmp/monitor_mode.dat

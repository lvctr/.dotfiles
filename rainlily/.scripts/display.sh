#!/bin/bash
xrandr \
	--output HDMI-A-0 --primary --mode 2560x1080 --rate 144 --pos 0x1080 --rotate normal --set TearFree on \
	--output DisplayPort-0 --off \
	--output DisplayPort-1 --off \
	--output DisplayPort-2 --mode 1920x1080 --rate 74.97 --pos 2560x660 --rotate left --set TearFree on \

# --mode 1920x1080 --rate 74.97 --pos 320x0 --rotate normal --set TearFree on
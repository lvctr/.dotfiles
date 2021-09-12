#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo " $(playerctl metadata title) by $(playerctl metadata artist)"
elif [ "$player_status" = "Paused" ]; then
    echo " $(playerctl metadata title) by $(playerctl metadata artist)"
else
    echo " Stopped"
fi

#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

if ! updates_flatpak=$(flatpak update 2>/dev/null | tail -n +5 | grep -Ecv "^$|^Proceed|^Nothing"); then
    updates_flatpak=0
fi

fwupdmgr refresh

if ! updates_fw=$(fwupdmgr get-updates 2> /dev/null | grep -c "Updatable"); then
    updates_fw=0
fi

updates=$(("$updates_arch" + "$updates_aur" + "$updates_flatpak" + "$updates_fw"))

if [ "$updates" -gt 0 ]; then
	returnval=$(notify-send -i "/home/insti/Downloads/386451_arch linux_archlinux_icon.png" --app-name="Update Notifier" "Updates Available" "󰏗 $updates_arch  $updates_aur  $updates_flatpak  $updates_fw" --action "update=Update Packages" --action "firmware=Update Firmware")
	if [ "$returnval" = "update" ]; then
		kitty yay -Syu
	fi

	if [ "$returnval" = "firmware" ]; then
		kitty fwupdmgr update
	fi
fi
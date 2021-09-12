#!/bin/sh
# Show notifications in Polybar
# Depends on tiramisu being built with json output
# https://github.com/Sweets/tiramisu

# Notification history written here
file="$HOME/.config/polybar/.notifs"

# How long each line stays on screen
duration=1.1

# Set to 1  to keep last line of last notification on screen
keep_last=

# Set to 1 to prepend notification lines with name of notifying app
show_app_name=

# Truncate notifications by this amount of characters
char_limit=100
# Mouse1 command. Since this is in a variable, complex
# commands might not work as expected so edit the
# formatting directly below.
# This example opens the notification history in vim
# in alacritty
mouse1="kitty -e sh -c \"vim $file\""

# Formatting help:
# https://github.com/polybar/polybar/wiki/Formatting#foreground-color-f
left="%{A1:$mouse1:}%{+u}%{u#F8E5AB}"
right="%{-u}%{A}"

# Clickable area displayed if not keeping
# last notification on screen
empty="%{A1:$mouse1:}                        %{A}"

##############################################################################

is_notif_complete() {
	case "$notif" in
		*\ \}) return 0 ;;
		*) return 1 ;;
	esac
}


# Parse tiramisu and write notifications
# into the notification history file
touch "$file"
tiramisu |
	while read -r notif; do
		# Get relevant data from tiramisu json output
		_=${notif#*\"app_name\": \"}
		app=${_%%\",*}

		_=${notif#*\"summary\": \"}
		summary="${_%%\",*}"
		test "$show_app_name" = 1 && summary="$app: $summary"

		_=${notif#*\"body\": \"}
		body="${_%\" \}}"
		test "$show_app_name" = 1 && body="$app: $body"
		# As body can have newlines, keep adding
		# them until reaching end of json
		while ! is_notif_complete; do
			while read -r notif; do
				if [ "$show_app_name" = 1 ]; then
					body=$(printf "$body\n$app: ${notif%\" \}}")
				else
					body=$(printf "$body\n${notif%\" \}}")
				fi
				break
			done
		done

		# Fall back to summary if body is empty
		test -z "${body#$app\: }" && body="$summary"

		# Append body to the notification history file
		echo "$body" >> "$file"
	done & # This all happens in the background


# Display lines as they get
# added to the history file
tail -n 1 -f "$file" |
	while read -r line; do
		# Truncate notification line to user-selected limit
		if [ "${#line}" -gt "$char_limit" ]; then
			line="$(echo "$line" | cut -c1-$((char_limit-1)))…"
		fi

		echo "$left$line$right"

		if [ -n "$duration" ]; then
			sleep "$duration"
		fi

		# If decided to not keep last notification,
		# Keep a clickable area by putting spaces
		# in between user-set formatting
		if [ "$keep_last" != "1" ]; then
			echo "$empty"
		fi
	done

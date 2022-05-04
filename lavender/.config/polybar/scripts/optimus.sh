#!/bin/sh

icon_integrated="  "
icon_nvidia="  "
icon_hybrid="  "

hybrid_switching=1


gpu_current() {
	mode=$(envycontrol --query)

    echo "$mode" | cut -d ' ' -f 5 | tr -d '[:space:]'
}

gpu_switch() {
    mode=$(gpu_current)

	if [ "$mode" = "integrated" ]; then
		next="hybrid"
	elif [ "$mode" = "nvidia" ]; then
		if [ "$hybrid_switching" = 1 ]; then
			next="hybrid"
		else
			next="integrated"
		fi
	elif [ "$mode" = "hybrid" ]; then
		next="integrated"
	fi

	envycontrol --switch $next --no-confirm
}

gpu_display(){
    mode=$(gpu_current)

    if [ "$mode" = "integrated" ]; then
		echo "$icon_integrated"
	elif [ "$mode" = "nvidia" ]; then
		echo "$icon_nvidia"
	elif [ "$mode" = "hybrid" ]; then
		echo "$icon_hybrid"
	fi
}

case "$1" in
	--switch)
        gpu_switch
        ;;
    *)
        gpu_display
        ;;
esac
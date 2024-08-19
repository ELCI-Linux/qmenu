#! /bin/bash


	prompt="Select a screenshot option"
	input='echo -e "entire screen\nspecific window"'
	currenlty=$(date)
	source /bin/qmenu/menu_engine.sh
	range="$output"

	if [[ $range == *"entire screen"* ]]; then
	import -window root ~/Pictures/screenshots/${currently}.png & \
	zenity --notification --text="Screenshot captured" || \
	zenity --warning --text="Error during screenshot capture"
	elif [[ $range == *"specific window"* ]]; then
	zenity --notification --text="Select a window to capture"
	import ~/Pictures/screenshots/${currently}.png
	fi

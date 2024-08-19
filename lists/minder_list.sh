#! /bin/bash

	input='echo -e "Open minder\nBrowse Mindmaps"'
	prompt="Select an option"
	source /bin/qmenu/menu_engine.sh

	if [[ $output == *"Open minder"* ]]; then
	flatpak run com.github.phase1geo.minder &
	elif [[ $output == *"Browse Mindmaps"* ]]; then
	input="ls $minder_dir" &&
	prompt="Select a mindmap" &&
	source /bin/qmenu/menu_engine.sh
	fi

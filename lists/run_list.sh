#! /bin/bash



	input="flatpak list --columns=application"
	prompt="Select a program to run"
	source /bin/qmenu/menu_engine.sh

	flatpak run $output &

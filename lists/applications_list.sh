#! /bin/bash



	#pre-processing
	brew_count=$(brew list | wc -w) &
	zenity --notification --text="brew count is $brew_count"
	flatpak_count=$(flatpak list | wc -l)
	snap_count=$(snap list | wc -l)

	prompt="Here is a breakdown of your installed applications"
	input='echo -e "homebrews [$brew_count]\nflatpaks [$flatpak_count]\nsnaps [$snap_count]\n"'
	source /bin/qmenu/menu_engine.sh

	selection=$(echo $output | cut -f 1 -d " ")

	prompt="Here are your $selection"
	if [[ $outout == *"homebrews [$brew_count]"* ]]; then
	input='brew list'
	elif [[ $output == *"flatpaks [$flatpak_count]"* ]]; then
	input='flatpak list --columns=application'
	elif [[ $output == *"snaps [$snap_count]"* ]]; then
	input='snap list'
	fi

	
	source /bin/qmenu/menu_engine.sh

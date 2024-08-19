#! /bin/bash

	cd ~/Music

	source /bin/qmenu/playing_music.sh
		if [ ${#title} -gt 0 ]; then
		prompt="Currently playing $playing"
		else
		prompt="Qmenu music player"
		fi

		if [[ $play_mode == *"shuffle"* ]]; then
		shuffle_button="Stop shuffle"
		else
		shuffle_button="Shuffle"
		fi

	zenity --notification --text="Playing: $title"
	if [ ${#playing} -eq 0 ]; then
	input='echo -e "$shuffle_button\nExplore library\nExit"'
	prompt="Qmenu music player"
	source /bin/qmenu/menu_engine.sh
		qmp_main="$output"
		if [[ $qmp_main == *"Explore library"* ]]; then
			if [ ${#music_dir} -eq 0 ]; then
			music_dir="~/Music"
			fi
		input="ls | grep '.mp3'"
		prompt="Available audio"
		output=""
		source /bin/qmenu/menu_engine.sh
		qmp_library="$output"
			if [[ $qmp_library != *"exit"* ]]; then
				vlc $qmp_library
			elif [ $qmp_library == *"exit"* ]]; then
			exit
			fi
		elif [[ $qmp_library == *"shuffle"* ]]; then

		# Define play_mode with the word "shuffle" to start the loop
		play_mode="shuffle"

		# Directory to search for .mp3 files
		music_dir="$HOME/Music"

		# Infinite loop that runs as long as play_mode contains "shuffle"
		while [[ $play_mode == *"shuffle"* ]]; do
		    # Select a random .mp3 file from the directory
		    mp3_file=$(find "$music_dir" -type f -name "*.mp3" | shuf -n 1); zenity --notification --text="playing $mp3_file"
		    # Check if a file was found
		    if [[ -n "$mp3_file" ]]; then
		        # Play the file using mpg123
		        mpg123 "$mp3_file"
		    else
		        echo "No .mp3 files found in $music_dir"
		        exit 1
		    fi 
		    # Add logic here to change play_mode if needed
		    # For now, it stays in "shuffle" mode, so the loop will continue
		done

echo "Exited shuffle mode."

		elif [[ $qmp_main == *"exit"* ]]; then
		exit
		fi
	fi

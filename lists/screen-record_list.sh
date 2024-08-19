#! /bin/bash


	if [[ $toggle_1 != *"stop"* ]]||[ ${#toggle_1} -gt 1 ]; then
	toggle_1="quick start"
	elif [[ $toggle_1 == *"quick start"* ]]; then
	toggle_1="stop"
	fi

	if [[ $toggle_1 == *"quick start"* ]]; then
	toggle_2="advanced start"*
	else
	toggle_2=""
	fi
	

	prompt="Qmenu screen recorder (powered by ffmpeg"
	input='echo -e "$toggle_2\n$toggle_1\nexit"'
	source /bin/qmenu/menu_engine.sh


	until [[ $recording == *"ended"* ]]; do

	if [[ $toggle_1 != *"stop"* ]]||[ ${#toggle_1} -gt 1 ]; then
	toggle_1="quick start"
	elif [[ $toggle_1 == *"quick start"* ]]; then
	toggle_1="stop"
	fi

	if [[ $signal == *"stop"* ]]; then
	recording="ended"
	else
		if [[ $recording == *"advanced start"* ]]; then
		prompt="Select a screen resolution"
		input="cat /bin/qmenu/resolutions.txt"
		RESOLUTION="$output"
		FRAMERATE=$(yad --scale --min-value=1 --max-value=240 --title="Qmenu screen recorder (powered by ffmpeg)" --text="Select your target frame rate")
		elif [[ $recording == *"quick start" ]]; then
		# Define the screen resolution (change according to your screen)
		RESOLUTION="1920x1080"
		# Define the framerate
		FRAMERATE=30
		elif [[ $recording == *"ended"* ]]; then
		pgrep ffmpeg | kill
		fi
	fi

	if [[ $recording == *"advanced start"* ]] || [[ $recording == *"quick start"* ]]; then
	# Start recording the screen using ffmpeg
	ffmpeg -video_size $RESOLUTION -framerate $FRAMERATE -f x11grab -i :0.0 -codec:v libx264 -preset ultrafast -threads 0 "$OUTPUT_FILE"
	elif [[ $recording == *"start (audio only)"* ]];
	# Alternative for audio (uncomment if needed)
	-f pulse -ac 2 -i default
	fi
echo "Screen recording saved as $OUTPUT_FILE"



	done

#! /bin/bash


	cd /etc/qmenu/workouts
	input='ls /etc/qmenu/workouts | cut -f 1 -d "_"'
	prompt="Select a workout"
	source /bin/qmenu/menu_engine.sh


	bash ${output}_workout.sh

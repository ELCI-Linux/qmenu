#! /bin/bash



	input="ls ~/Games | cut -f 3 -d '/'"
	prompt="Select a console to emulate"
	source /bin/qmenu/menu_engine.sh


	input="$ls ~/Games/$output"
	prompt="Select a title"
	source /bin/qmenu/menu_engine.sh

	

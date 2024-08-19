##! /bin/bash



	# This source command is used to gather the users settings
	source ~/.qmenu_config
	# This source command runs the main_menu script.
	source /bin/qmenu/main_menu.sh
	if [ ${#main_menu} -gt 0 ]; then
	source /bin/qmenu/lists/${main_menu}_*.sh
	sudo echo "$main_menu" >> /etc/qmenu/history.txt
	fi

	exit

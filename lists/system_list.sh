#! /bin/bash

export prompt="🖥️ Select a system option"
export input='ls /bin/qmenu/*_system.sh | cut -f 4 -d "/" | cut -f 1 -d "_"'
source /bin/qmenu/menu_engine.sh
contents="$output"


if [[ $contents != *"reboot"* ]] || [[ $contents != *"shutdown"* ]]; then
source /bin/qmenu/${contents}_system.sh

elif [[ $contents == *"logout"* ]]; then
	wm=$(neofetch wm | cut -f 2 -d " ")
	if [[ $wm == *"i3"* ]]; then
	i3-msg exit
	else
	echo "error"
	zenity --notification --text="wm not supoorted by qmenu"
	fi
else

eval contents
fi

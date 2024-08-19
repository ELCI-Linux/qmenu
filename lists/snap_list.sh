#! /bin/bash

	source /etc/qmenu/snap.sh
	app=$(snap list | cut -f 1 -d " " | dmenu -p "Select a snap" -nb $nb -nf $nf -sb $sb -sf $sf) && \
	zenity --notification --text="Selected $app" || \
	echo "Snap list fucked up. App is $app"

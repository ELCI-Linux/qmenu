#! /bin/bash

	url=$(yad --entry --title="Qmenu Downloader (powered by youtube-dl)" --text="Enter a URL to download" --splash)

	ytd_do="$url"
	if [ ${#ytd} -gt 0 ]; then
	ytd_do+="$ytd"
	fi

	eval $ytd_do && \
	zenity --notification --text="Download [$url] done" ||\
	zenity --notifcation --text="Error evaluating ytd_do"

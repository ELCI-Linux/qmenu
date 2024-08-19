#! /bin/bash






	search_term=$(yad --entry --no-decoration --text="Searching for" --splash)


	cs='cargo search $search_term | cut -f 1 -d " "'

	fs="flatpak search $search_term --columns=application| tail -n +2"

	ss="snap search $search_term | tail -n +2"



	csq=$(eval $cs | wc -l)
	fsq=$(eval $fs  | wc -l)
	ssq=$(eval $ss | wc -l)

	input='echo -e "Cargo: $csq\nFlatpaks: $fsq\nSnaps: $ssq"'
	prompt="Your multisearch returned..."
	source /bin/qmenu/menu_engine.sh
	ins_type="$output"

	if [[ $ins_type == *"Cargo: $csq"* ]]; then
	input="$cs"
	elif [[ $ins_type == *"Flatpaks: $fsq"* ]]; then
	input="$fs"
	elif [[ $ins_type == *"Snaps: $ssq"* ]]; then
	input="$ss"
	fi


	prompt="Here are available flatpaks:"
	source /bin/qmenu/menu_engine.sh

	if [[ $ins_type == *"Flatpaks: $fsq"* ]]; then
	id="$output"
	flatpak install $id -y | yad --progress --title="qmenu: installer" --text="Installing $id" --auto-close --no-buttons --pulsate --splash && \

# Initialize the progress bar using yad
yad --progress --title="Installing $output" --text="Installing $output..." --width=300 --pulsate --auto-close --auto-kill --splash&

# Get the process ID of the yad command
YAD_PID=$!

# Run the flatpak install command and capture its output
flatpak install -y "$id" | while read -r line; do
    # Here you can parse the output to get progress information
    # Flatpak doesn't provide explicit progress, so we simulate it

    echo "$line" | grep -q 'Installing:'
    if [ $? -eq 0 ]; then
        # If an 'Installing' message is detected, stop pulsating and update progress
        echo "50" | yad --progress --title="Installing $APP_NAME" --text="Halfway through the installation..." --width=300 --auto-close --auto-kill --percentage=50
    fi
done

# Close the progress bar when installation is complete
kill $YAD_PID

	zenity --notification --text="$output installed" ||\
	zenity --warning --text="$output could not be installed"
	fi

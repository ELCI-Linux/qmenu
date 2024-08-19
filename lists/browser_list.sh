#! /bin/bash

# Note: This file has been created to work with a typical google-chrome installation.

# Path to the Chrome Bookmarks file
BOOKMARKS_FILE="$HOME/.config/google-chrome/Default/Bookmarks"

# Output file where the formatted bookmarks will be saved
OUTPUT_FILE="$HOME/.bookmarks_list.txt"

# Ensure the output file is empty before writing
> "$OUTPUT_FILE"

# Extract bookmark names and URLs
grep -E '"name":| "url":' "$BOOKMARKS_FILE" | sed -E 's/^[ \t]*//g' | paste -d '|' - - | sed -E 's/"name": "(.*)",/\1/; s/"url": "(.*)"/\1/' >> "$OUTPUT_FILE"
zenity --notification --text="Bookmarks have been extracted and saved to $OUTPUT_FILE"
bookmarks=$(cat $BOOKMARKS_FILE  | grep https:// | cut -f 3- -d '/')





# Get the most recent string from the clipboard
#	CLIPBOARD=$(pbpaste)  # For macOS
	 CLIPBOARD=$(xclip -o -selection clipboard)||\  # For Linux with xclip
	 CLIPBOARD=$(xsel --clipboard --output)  # For Linux with xsel

# Regular expressions
URL_REGEX="^https?:\/\/[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(:[0-9]+)?(\/[a-zA-Z0-9._%+-]*)*\/?$"
IP_REGEX="^([0-9]{1,3}\.){3}[0-9]{1,3}$"
FILE_PATH_REGEX="^\/([a-zA-Z0-9._-]+\/?)+$"

# Function to check if the string matches any of the patterns
check_syntax() {
    if [[ $1 =~ $URL_REGEX ]] || [[ $1 =~ $IP_REGEX ]] || [[ $1 =~ $FILE_PATH_REGEX ]]; then
        input+="open copied url"
    fi
}

# Check the clipboard content
check_syntax "$CLIPBOARD"
	input='echo -e "$bookmarks\nrestore last session\nopen browser\nopen incognito window\n"'
	prompt="Select an option"
	source /bin/qmenu/menu_engine.sh



	browser_do="$output"
	echo "browser_do is $browser_do"

	if [[ $browser_do == *"open browser"* ]]; then
	xdg-open $home_url
	elif [[ $browser_do == *"open copied url" ]]; then
	xdg-open $1
	elif [[ $browser_do == *"open incognito window"* ]]; then
	google-chrome --incognito &
	elif [[ $browser_do == *"restore last session"* ]]; then
	google-chrome --restore-last-session &
	elif [[ ${#browser_do} -gt 0 ]]; then
	google-chrome $output
	else
	exit
	fi

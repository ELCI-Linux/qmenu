#!/bin/bash


rm ~/.qmenu_weather
# File containing the cities and timezones
LOCALES_FILE="/bin/qmenu/modules/world-view/locales.txt"
# File to store the output
OUTPUT_FILE="$HOME/.qmenu_weather"

# Clear the output file
> "$OUTPUT_FILE"

# Read the locales file line by line
while IFS="|" read -r city timezone; do
  # Fetch the current weather for the city
  weather_now=$(weather-cli -c "$city")


	if [ ${#weather_now} -gt 0 ]; then
  # Append the information to the output file
  echo "$weather_now" >> "$OUTPUT_FILE"
	fi
done < "$LOCALES_FILE"

# Final output
input='cat "$OUTPUT_FILE"'
echo "$world_view"
source /bin/qmenu/menu_engine.sh



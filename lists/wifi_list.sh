#! /bin/bash


export input="nmcli dev wifi list | tail -n +2"
export prompt="Select a wifi network"
source /bin//qmenu/menu_engine.sh
sel_net=$(echo "$output" | grep -o '[^ ]*:[^ ]*:[^ ]*:[^ ]*')
info=$(sudo iwlist wlan0 scan | grep -A 10 "$sel_net")
echo $info | lolcat


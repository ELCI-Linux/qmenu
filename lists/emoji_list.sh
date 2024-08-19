#! /bin/bash


input="grep -v '^$'/etc/qmenu/emoji_list.txt"
prompt="Select an emoji"
source /bin/qmenu/menu_engine.sh

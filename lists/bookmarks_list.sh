#!/bin/sh
# source /etc/qmenu/bookmarks.sh
jq '.roots.bookmark_bar.children[] | {name: .name, url: .url}' ~/.config/google-chrome/Default/Bookmarks | lolcat -a

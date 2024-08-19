#! /bin/bash



input='echo -e "chatgpt"'
prompt="Select an LLM to interact with"
source /bin/qmenu/menu_engine.sh


source /bin/qmenu/${output}_ai.sh

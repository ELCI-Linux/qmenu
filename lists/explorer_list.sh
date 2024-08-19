#! /bin/bash

	until [[ $output == *"exit"* ]]; do
	rm ~/.file_explorer
	touch ~/.file_explorer
	contents=$(ls)
	destinations='echo -e "~/\n../\n...\n/"'
	options='echo -e "exit\ncopy\ndelete\nrename\nmove\n"'
	eval $destinations >> ~/.file_explorer
	ls >> ~/.file_explorer
	eval $options >> ~/.explorer

	input="cat ~/.file_explorer"
        prompt="Select a file or directory to continue"
        source /bin/qmenu/menu_engine.sh

	if [ -f "$output" ]; then
  	input='echo -e "open\ncopy\ndelete\nrename\nmove\n"'
	elif [ -d "$input" ]; then
	cd $output || cd ./$output
	elif [[ $output == *"exit"* ]]; then
	break && exit
	else
    echo "$input is neither a file nor a directory."
	fi


	done

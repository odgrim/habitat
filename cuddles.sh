#!/bin/bash

load_config_path()
{ # wrapper for loading dirs or files into our env

	ARGS=$(getopt -o p:r -l "path:,recursive" -n "cuddles" -- "$@");

	if [ $? -ne 0 ];
	then
		#exit if getopt failed/we got bad args
		#exit 1
		echo "error in getopt!"
	fi

	eval set -- "$ARGS";

  	local recursive=false 
  	local load_path=''

	while [[ $# -gt 0 ]] ; do
		local token="$1" ; shift
		case "$token" in
		  -p|--path)
			load_path=$1
			;;
		  -r|--recursive)
			recursive=true
			;;
		  *)
			true # Ignore everything else.
			;;
		esac
	done

	if [ -d $load_path ]; then
		# path is a directory
		load_config_dir $load_path $recursive
	elif [ -f $load_path ]; then
		# path is a file
		load_config_file $load_path	
	fi
}

load_config_dir()
{ # load a dirs contents into the current env
  # will load recursively if the second argument is true

	local load_path=$1
	local recursive=$2

	for config in $load_path/*; do
		# make sure we can run the bash file
		if [ -d $config ] && $recursive ; then
			load_config_dir $config $recursive
			continue
		fi
		load_config_file $config
	done
}

load_config_file()
{ # load target file into the current env

	local load_path=$1
	# path is a file
	if [ ! -x "$load_path" ]; then
		echo "error loading $load_path, check your syntax."
	else
		# it loads fine, so bring it in!
		. $load_path
	fi
}
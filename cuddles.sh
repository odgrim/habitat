#!/bin/bash

# wrapper for loading dirs or files into our env
load_config_path() {
	# assume not recursive
	recursive=false

  # set the option indicator var
  OPTIND=1

  # loop through our named ops
  while getopts "p:r" opt; do
    case "$opt" in
      p) load_path="$OPTARG"
        ;;
      r) recursive=true
        ;;
    esac
  done

  # shift off the remaining options and optional --
  shift $((OPTIND-1))

	if [ -d "$load_path" ]; then
		# path is a directory
		load_config_dir "$load_path" "$recursive"
	elif [ -f "$load_path" ]; then
		# path is a file
		load_config_file "$load_path"	
	fi
}

# load a dirs contents into the current env
# will load recursively if the second argument is true
load_config_dir() { 
	load_path="$1"
	recursive="$2"

	for config in "$load_path"/*; do
		# make sure we can run the bash file
		if [ -d "$config" ] && "$recursive" ; then
			load_config_dir "$config" "$recursive"
			continue
		fi
		load_config_file "$config"
	done
}

# load target file into the current env
load_config_file() { 
	load_path="$1"

	# path is a file
	if [ ! -x "$load_path" ]; then
		echo "error loading $load_path, check your syntax."
	else
		# it loads fine, so bring it in!
		. "$load_path"
	fi
}
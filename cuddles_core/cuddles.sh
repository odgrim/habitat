#!/usr/bin/env bash

cuddles () {

}

# wrapper for loading dirs or files into our env
__cuddles_load_modules() {
  # loop through args and hand off to helper if a dir or file
  while [[ $# -gt 0 ]]; do
    local token="$1" ; shift

    if [[ -d "$token" ]]; then
    load_module_dir "$token"
  elif [[ -f "$token" ]]; then
    load_module_file "$token"
  else 
    echo "module $token not found"
  fi
  done
}

# conveniance wrapper...
__cuddles_load_module() {
  load_modules $@
}

# load a dirs contents into the current env
__cuddles_load_module_dir() {
  load_path="$1"

  init_path="${load_path}/init.*"

  if [ -e $init_path ] && [ -f $init_path ]; then
    load_module_file $init_path
  else
    echo "module $load_path can not load. Did you forget an init.sh?"
    fi
}

# load target file into the current env
__cuddles_load_module_file() { 
  load_path="$1"
  if [[ ! -f "$load_path" ]]; then
    echo "error loading $load_path, does not exist!"
    return 1
  elif [[ ! -x "$load_path" ]]; then
    echo "error loading $load_path, make sure it's executable!"
    return 1
  else
    # it loads fine, so bring it in!
    . "$load_path"
  fi
}
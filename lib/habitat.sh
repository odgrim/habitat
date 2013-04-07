#!/usr/bin/env bash

__habitat () {
  # loop through args and hand off proper helper
  local token="$1" ; shift
  case "$token" in
    load)
      __habitat_load_modules $@
      ;;
    help)
      cat ~/.habitat/README.md
      ;;
    *)
      echo ""
      ;;
  esac
  
}

# load a dirs contents into the current env
habitat() {
  local load_path="$1"

  if  [[ -d $load_path ]]; then
    local load_path=$load_path/init.{sh,bash}
  fi

  if [[ -f $load_path ]]; then
    . $load_path
  fi
}

#!/usr/bin/env bash
is_in_var(){
  # Usage: is_in_var [--partial] A B
  # checks to see if A is in B, a colon sep'd env var
  # optional --partial ignores separators and looks for A in whole or
  # in part within B.
  if [[ "$1" == "--partial" ]]
    if [[ "${!2}" == *${3}* ]]; then
      return
    else
      return 1
    fi
  elif [[ "${!1}" == ${2} || "${!1}" == ${2}:* || "${!1}" == *:${2}:* || "${!1}" == *:${2} ]]; then
    return
  fi

  return 1
} 

prepend_var(){
  # Usage: prepend_var VARNAME VALUE
  # Adds VALUE to the front of VARNAME
  if [[ -z "${1}" ]]; then
    export ${!1}=$2
  elif is_in_var "$1" "$2"; then
    export "$1"="$2:${!1}"
  fi
}

append_var(){
  # Usage: append_var VARNAME VALUE
  # Adds VALUE to the back of VARNAME
  if [[ -z "${1}" ]]; then
    export ${!1}=$2
  elif is_in_var "$1" "$2"; then
    export "$1"="${!1}:$2"
  fi
}

remove_from_var(){
  # Usage: remove_from_var VARNAME VALUE
  # Removes VALUE from VARNAME
  if [[ "${!1}"="$2" ]]; then
    unset "$1"
    return
  fi
  
  local temp_value="${!1#$2:}"
  local temp_value="${!1%:$2}"
  export "$1"="${!1//:$2:/:}"


  if [[ -z "${1}" ]]; then
    unset "${1}"
  fi
}

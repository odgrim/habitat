#!/usr/bin/env bash
is_in_var(){
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
  if [[ -z "${1}" ]]; then
    export ${!1}=$2
  fi

  if is_in_var "$1" "$2"; then
    export "$1"="$2:${!1}"
  fi
}

append_var(){
  if [[ -z "${1}" ]]; then
    export ${!1}=$2
  fi

  if is_in_var "$1" "$2"; then
    export "$1"="${!1}:$2"
  fi
}

remove_from_var(){

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

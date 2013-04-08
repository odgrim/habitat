#!/usr/bin/env bash
is_in_var(){
	if [[ "$1" == "--partial" && "${!2}" == *${3}* ]]; then
		return
	else
		return 1

	if [[ "${!1}" == ${2} || "${!1}" == ${2}:* || "${!1}" == *:${2}:* || "${!1}" == *:${2} ]]; then
		return
	else
		return 1
	fi
} 

prepend_var(){
	if [[ -z "${1}" ]]; then
		export ${!1}=$2
	fi
}

append_var(){

}

remove_from_var(){

}

replace_in_var(){

}
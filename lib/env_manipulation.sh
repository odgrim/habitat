is_in_var(){
#[--partial --delineator ":"] VAR_NAME value
	if [[ "${!1}" == ${2} || "${!1}" == ${2}:* || "${!1}" == *:${2}:* || "${!1}" == *:${2} ]]; then
		return
	else
		return 1
	fi
} 

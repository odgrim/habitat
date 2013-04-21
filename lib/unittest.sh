#!/usr/bin/env bash
# 
# test_suite- don't care about the name, just make it a file representing a feature to test
### Core
# run_all_tests- goes and gathers suites,queuestests, execs each. 
# queue_test- Does the savin' bit, make sure we don't dupe up on scopies in the env var
# run_test- kicks off a single test run, 
# print_result- 
# 
# 

run_all_tests(){
    echo ''
}

queue_test(){
    echo ''
}

run_test(){
  	if (${1}); then
  		print_result
  	else
  		print_result -f
  	fi
}

print_result(){
    tput bold;
    if [[ "$1" = "-f" ]]; then             
        shift
        tput setaf 1
    else
        tput setaf 2
    fi

    if [[ $# -ge 1 ]]; then
    	local out_value=$@
    else
    	local out_value="."
    fi

    echo $out_value
    tput setaf 3
    tput sgr0
}


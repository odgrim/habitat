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
  $@ | capture_test_output
  #echo ${exec_result[@]}
}

diff_env() {
  local current_env=`env`

  echo `diff <( $1 ) <( $current_env )`
}

capture_test_output(){
  # grab last pipe status with PIPESTATUS array
  local test_return=${PIPESTATUS[${#PIPESTATUS[@]}-1]}

  if [[ ! $test_return ]]; then
    local i=0
    while read line
    do
      all_output[ $i ]="$line"
      (( i++ ))
    done
    print_result -f
    echo ${all_output[@]}
  else
    print_result
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


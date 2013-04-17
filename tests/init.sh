#!/usr/bin/env bash
# We don't use our framework here as we assume that everything
# potentially doesn't work. Start from scratch!
# 
# Automatically seak and source anything in a "tests" directory
all=~/.habitat/{modules,lib}/*/tests
echo $all
load_tests(){

  shopt -s extglob nullglob
  local all_tests=~/.habitat/?(modules|lib)/*/tests
  echo $all_tests
  for one_test in $all_tests; do
    echo $one_test
  done

  shopt -u extglob nullglob
}

load_tests

#Execute our tests using shunit2
#. ./shunit2-2.1.6/shunit2
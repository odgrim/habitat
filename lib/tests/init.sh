#!/usr/bin/env bash
# We don't use our framework here as we assume that everything
# potentially doesn't work. Start from scratch!
# 
# Automatically seak and source anything in a "tests" directory
all=~/.habitat/{modules,lib}/tests/*

load_tests(){

  shopt -s extglob nullglob
  #local all_tests=~/.habitat/?(modules|lib)/*/tests
  local all_tests=~/.habitat/lib/tests/*

  for one_test in $all_tests; do
    . $one_test
  done

  shopt -u extglob nullglob
}

load_tests

#Execute our tests using shunit2
. ./shunit2-2.1.6/shunit2
#!/bin/bash

# ###
# test_exercises.sh, by Tim Austin (neenjaw) tim@neenjaw.com
# ###
# Script is to test each exercise against it's test unit individually
# against the example solution to prove the test works, and the problem
# is solvable.
#
# This works by creating a copy of the exercises, then for each exercise running
# `mix test` with some options, suppressing the output, then tallying the results
# with a brief report.
#
# An exit code of 0 indicates all tests successful, 1 indicates an error with at
# least one exercise.
# ###

# helper subroutine
function test_or_tests () {
    local tests="test"
    if (( $1 != 1 ))
    then
      tests+="s"
    fi
    printf "%s" "$tests"
}

# Initialize counts / array
test_count=0
pass_count=0
fail_count=0

failing_exercises=()

# Store the relative root dir to variable
relative_root=$(pwd)

# make a copy of exercises
rm -rf tmp-exercises
cp -a exercises tmp-exercises

# test each exercise
for exercise in tmp-exercises/*
do 
  if [ -d $exercise ]
  then
    cd "$exercise"

    exercise_name=$(basename $exercise)
    test_count=$((test_count+1))

    printf "\\033[33mTesting\\033[0m: $exercise_name"

    # Move the example into the lib file
    for file in lib/*.ex
    do 
      mv "$file" "${file/.ex/.ex.bkp}"
    done

    mv example.exs lib/example.ex

    # test compilation with --warnings-as-errors flag as the example and test should not raise any
    cat test/test_helper.exs > test/glob_test.exs
    for file in test/*.exs
    do
      if [ "$file" != "test/test_helper.exs" -a "$file" != "test/glob_test.exs" ]
      then
        cat "$file" >> test/glob_test.exs
      fi
    done

    elixirc --warnings-as-errors lib/example.ex test/glob_test.exs &> compiler_output
    compile_exit_code="$?"
    compiler_results=$(cat compiler_output)

    rm compiler_output
    rm test/glob_test.exs
    rm *.beam

    # perform unit tests
    test_results=$(mix test --color --no-elixir-version-check --include pending 2> /dev/null)
    test_exit_code="$?"

    # based on compiler and unit test, print results
    if [ "$compile_exit_code" -eq 0 -a "$test_exit_code" -eq 0 ]
    then
      printf " -- \\033[32mPass\\033[0m\n"
      pass_count=$((pass_count+1))
    else
      printf " -- \\033[31mFail\\033[0m\n"

      if [ "$compile_exit_code" -ne 0 ]
      then
        printf -- "-- \\033[36mcompiler output\\033[0m "; printf -- '-%.0s' {1..62}; echo ""
        printf "${compiler_results}\n"
      fi
      if [ "$test_exit_code" -ne 0 ]
      then
        printf -- "-- \\033[36mtest output\\033[0m "; printf -- '-%.0s' {1..66}; echo ""
        printf "${test_results}\n"
      fi
      printf -- '-%.0s' {1..80}; echo ""

      fail_count=$((fail_count+1))
      failing_exercises+=( $exercise_name )
    fi

    cd "$relative_root"
  fi
done

# clean up
rm -rf tmp-exercises

# report
printf -- '-%.0s' {1..80}; echo ""
printf "${pass_count}/${test_count} tests passed.\n"

if [ "$fail_count" -eq 0 ]
then
  # everything is good, exit
  exit 0;
else
  # There was at least one problem, list the exercises with problems.
  printf "${fail_count} $(test_or_tests "$fail_count") failing:\n"

  for exercise in ${failing_exercises[@]}
  do
    printf " - ${exercise}\n"
  done

  exit 1;
fi
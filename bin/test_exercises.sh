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
test_or_tests () {
    local tests="test"
    if (( $1 != 1)); then
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
cp -a exercises tmp-exercises

# test each exercise
for exercise in tmp-exercises/*
  do if [ -d $exercise ]; then
    cd "$exercise"

    exercise_name=$(basename $exercise)
    test_count=$((test_count+1))

    printf "Testing: $exercise_name"

    # Move the example into the lib file
    for file in lib/*.ex
      do mv "$file" "${file/.ex/.ex.bkp}"
    done

    mv example.exs lib/example.ex

    # do testing then based on exit code print the result
    mix test --no-elixir-version-check --include pending > /dev/null

    if [ "$?" -eq 0 ]; then
        printf " -- pass ✅\n"
        pass_count=$((pass_count+1))
    else
        printf " -- fail ❌\n"
        fail_count=$((fail_count+1))
        failing_exercises+=( $exercise_name )
    fi

    cd "$relative_root"
  fi
done

# clean up
rm -rf tmp-exercises

# report
printf -- '-%.0s' {1..30}; echo ""
printf "${pass_count}/${test_count} tests passed.\n"

if [ "$fail_count" -eq 0 ]; then
  # everything is good, exit
  exit 0;
else
  # There was at least one problem, list the exercises with problems.
  printf "${fail_count} $(test_or_tests "$fail_count") failing:\n"

  for exercise in ${failing_exercises[@]}; do
    printf " - ${exercise}\n"
  done

  exit 1;
fi
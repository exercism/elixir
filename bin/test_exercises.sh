#!/usr/bin/env bash

set -euo pipefail

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
#
# Optionally, you can pass a list of exercise names
# to only run tests for those exercises.
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

exercises=`echo tmp-exercises/*/*`

if [[ ! -z "$@" ]]; then
  pattern=$(echo "$@" | sed 's/ /|/g')
  exercises=$(find $exercises -maxdepth 0 | grep -E "$pattern")
fi

# test each exercise
for exercise in $exercises
do
  if [ -d ${exercise} ]
  then
    cd "${exercise}"

    exercise_name=$(basename $exercise)
    test_count=$((test_count+1))

    printf "\\033[33mTesting\\033[0m: $exercise_name "

    exercise_config=".meta/config.json"
    files_to_remove=($(jq -r '.files.solution[]' "${exercise_config}"))

    # Move the example into the lib file
    for file in "${files_to_remove[@]}"
    do
      rm -r "$file"
    done

    # concept exercises have "exemplar" solutions (ideal, to be strived to)
    if [ -f .meta/exemplar.ex ]; then
      mv .meta/exemplar.ex lib/solution.ex
    fi

    # practice exercises have "example" solutions (one of many possible solutions with no single ideal approach)
    if [ -f .meta/example.ex ]; then
      mv .meta/example.ex lib/solution.ex
    fi

    # test compilation with --warnings-as-errors flag as the example and test should not raise any
    set +e
    compiler_results=$(MIX_ENV=test mix compile --force --warnings-as-errors 2>&1)
    compile_exit_code="$?"
    set -e

    if [ "${compile_exit_code}" -eq 0 ]
    then
      # turn on doctests
      test_file=$(find . -name \*_test.exs)
      module_name=$(cat "${test_file}" | sed -rn 's/^defmodule (.*)Test do$/\1 /p')
      doctest_code="doctest ${module_name}"

      if [ ${module_name} != "Form" ]
      then
        # This module is skipped because it contains tests *for* doc tests.
        # It already *has* a `doctest ...` line, and mix really doesn't like seeing that in a module twice.

        # .bak and rm part left here to simplify GNU/BSD sed options compatibility
        sed -i.bak 's/use ExUnit.Case\(.*\)/use ExUnit.Case\1\n'" ${doctest_code}"'\n/g' "${test_file}" && rm -f "${test_file}.bak"
      fi

      # perform unit tests
      set +e
      test_results=$(mix test --color --no-elixir-version-check --include pending 2> /dev/null)
      test_exit_code="$?"
      set -e
    else
      # use code 5 to indicate tests skipped
      test_exit_code=5
    fi

    # based on compiler and unit test, print results
    if [ "${compile_exit_code}" -eq 0 -a "${test_exit_code}" -eq 0 ]
    then
      printf "\\033[32mPass\\033[0m\n"
      pass_count=$((pass_count+1))
    else
      printf "\\033[31mFail\\033[0m\n"

      if [ "${compile_exit_code}" -ne 0 ]
      then
        printf "\\033[36mcompiler output\\033[0m "; printf -- '-%.0s' {1..61}; echo ""
        printf "${compiler_results}\n"
      fi
      if [ "${test_exit_code}" -ne 0 -a "${test_exit_code}" -ne 5 ]
      then
        printf "\\033[36mtest output\\033[0m "; printf -- '-%.0s' {1..65}; echo ""
        printf "${test_results}\n"
      fi
      printf -- '-%.0s' {1..80}; echo ""

      fail_count=$((fail_count+1))
      failing_exercises+=( $exercise_name )
    fi

    cd "${relative_root}"
  fi
done

# clean up
rm -rf tmp-exercises

# report
printf -- '-%.0s' {1..80}; echo ""
printf "${pass_count}/${test_count} tests passed.\n"

if [ "${fail_count}" -eq 0 ]
then
  # everything is good, exit
  exit 0;
else
  # There was at least one problem, list the exercises with problems.
  printf "${fail_count} $(test_or_tests "${fail_count}") failing:\n"

  for exercise in ${failing_exercises[@]}
  do
    printf " - ${exercise}\n"
  done

  exit 1;
fi

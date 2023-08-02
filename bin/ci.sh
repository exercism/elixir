#!/bin/bash

# ###
# ci.sh
# ###
# Actions to run on every commit
# ###

echo "Running test_exercises.sh"
("bin/test_exercises.sh")
TEST_EXIT_CODE="$?"

if [ "$TEST_EXIT_CODE" -ne 0 ]
then
  echo "Tests failed"
  exit 1;
fi

echo "Tests passed"
exit 0;

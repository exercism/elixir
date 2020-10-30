#!/bin/bash

# ###
# ci-check.sh
# ###
# Precheck actions to run on a commit to master
# ###

echo "Running check_formatting.sh"
("bin/check_formatting.sh")
CHECK_FORMAT_EXIT_CODE="$?"

echo "Running dialyzer_check.sh"
("bin/dialyzer_check.sh")
DIALYZER_EXIT_CODE="$?"

if [ "$CHECK_FORMAT_EXIT_CODE" -ne 0 -o "$DIALYZER_EXIT_CODE" -ne 0 ]
then
  echo "Precheck failed"
  exit 1;
fi

echo "Precheck passed"
exit 0;

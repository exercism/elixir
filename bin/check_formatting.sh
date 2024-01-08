#!/bin/bash

echo 'Temporarily transforming .txt snippets into .ex snippets'
FILES="exercises/**/**/.approaches/**/snippet.txt"
for file in $FILES
do
  txt_file_path=$file
  ex_file_path="${file//\.txt/.ex}"
  mv $txt_file_path $ex_file_path
done

# ###
# check_formatting.sh
# ###
# Uses `mix format` to validate formatting of all elixir code
# Looks for trailing whitespace in files
# ###
echo "Running 'mix format'"
mix format --check-formatted
FORMAT_EXIT_CODE="$?"

echo 'Transforming snippets back to .txt'
FILES="exercises/**/**/.approaches/**/snippet.ex"
for file in $FILES
do
  ex_file_path=$file
  txt_file_path="${file//\.ex/.txt}"
  mv $ex_file_path $txt_file_path
done

echo "Checking for trailing whitespace"
# git grep returns a 0 status if there is a match
# so we negate the result for consistency
! git grep --line-number ' $'
GREP_EXIT_CODE="$?"

if [ "$FORMAT_EXIT_CODE" -ne 0 -o "$GREP_EXIT_CODE" -ne 0 ]
then
  echo "Formatting checks failed"
  exit 1;
fi

echo "Formatting checks passed"
exit 0;

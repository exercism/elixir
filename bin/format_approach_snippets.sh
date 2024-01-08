#!/bin/bash

# this script is necessary as long as
# the config option approaches.snippet_extension is not supported
# and we're forced to keep snippets in txt files
FILES="exercises/**/**/.approaches/**/snippet.txt"
for file in $FILES
do
  txt_file_path=$file
  ex_file_path="${file//\.txt/.ex}"
  mv $txt_file_path $ex_file_path
  mix format $ex_file_path
  mv $ex_file_path $txt_file_path
done

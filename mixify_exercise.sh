#!/bin/bash

if [ ! $1 ]
then
  echo "ERROR: Need to supply an exercise to mixify"
  exit 1  
fi

echo "* Mixifying exercise \"${1}\""

EXERCISE=$1
EX_DIR="./exercises/${EXERCISE}"
EX_BKP="./exercises/${EXERCISE}-bkp"

if [ -f "${EX_DIR}/mix.exs" ]
then
  echo "SKIP: ${EXERCISE} is already mixified"
  exit 1
fi

EXAMPLE_FILE="example.exs"
EXAMPLE_PATH="${EX_BKP}/${EXAMPLE_FILE}"

if [ ! -f "${EX_DIR}/${EXAMPLE_FILE}" ]
then
  echo "> Example file \"${EXAMPLE_FILE}\" doesn't exist, exiting."
  exit 1;
fi

CODE_FILE="${EXERCISE}.exs"
CODE_PATH="${EX_BKP}/${CODE_FILE}"

if [ ! -f "${EX_DIR}/${CODE_FILE}" ]
then
  echo "> Code file \"${CODE_FILE}\" doesn't exist, exiting."
  exit 1;
fi

TEST_FILE="${EXERCISE}_test.exs"
TEST_PATH="${EX_BKP}/${TEST_FILE}"

if [ ! -f "${EX_DIR}/${TEST_FILE}" ]
then
  echo "> Test file \"${TEST_FILE}\" doesn't exist, exiting."
  exit 1;
fi

README_FILE="README.md"
README_PATH="${EX_BKP}/${README_FILE}"

if [ ! -f "${EX_DIR}/${README_FILE}" ]
then
  echo "> Test file \"${README_FILE}\" doesn't exist, exiting."
  exit 1;
fi

# Move the exercise to a backup directory
if [ -d $EXDIR ] 
then
    mv "${EX_DIR}" "${EX_BKP}"
fi

# create a blank mix project
mix new "${EX_DIR}"

# copy the example and readme to the new dir
cp $EXAMPLE_PATH $EX_DIR
cp $README_PATH $EX_DIR

# add configure line to <exercise>/test/test_helper.exs
TEST_CONFIG="ExUnit.configure(exclude: :pending)"
echo $TEST_CONFIG >> "${EX_DIR}/test/test_helper.exs"

# trim leading lines from <exercise>_test.exs, 
#   put output into test dir
cat "${TEST_PATH}" | perl -ne 'print if /^defmodule/../^end/' > "${EX_DIR}/test/${TEST_FILE}"

# Copy the exercise from backup to the lib dir
rm "${EX_DIR}/lib/${EXERCISE}.ex"
cp "${EX_BKP}/${EXERCISE}.exs" "${EX_DIR}/lib/${EXERCISE}.ex"

# delete backup
rm -rf $EX_BKP
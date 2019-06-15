#!/bin/bash

if [ ! $1 ]
then
  echo "ERROR: Need to supply an exercise to mixify"
  exit 1  
fi

EXERCISE=$1

SKIP_FILE="skipped.out"
CUSTOMIZED_FILE="customized.out"

EX_DIR="./exercises/${EXERCISE}"
EX_BKP="./exercises/${EXERCISE}-bkp"

if [ -f "${EX_DIR}/mix.exs" ]
then
  echo "SKIP: ${EXERCISE} is already mixified"
  echo "$EXERCISE" >> $SKIP_FILE
  exit 1
fi

echo "* Mixifying exercise: ${1}"

EXAMPLE_FILE="example.exs"
EXAMPLE_PATH="${EX_BKP}/${EXAMPLE_FILE}"

if [ ! -f "${EX_DIR}/${EXAMPLE_FILE}" ]
then
  echo "> Example file \"${EXAMPLE_FILE}\" doesn't exist, exiting."
  exit 1;
fi

CODE_FILE="${EXERCISE//-/_}.exs"

if [ ! -f "${EX_DIR}/${CODE_FILE}" ]
then
  echo "> Code file \"${CODE_FILE}\" doesn't exist, specify?"
  read -p 'Code file name: ' CODE_FILE

  if [ -z "$CODE_FILE" ]
  then
    exit 1
  fi

  echo "$EXERCISE" >> $CUSTOMIZED_FILE
fi

TEST_FILE="${EXERCISE//-/_}_test.exs"
TEST_PATH="${EX_BKP}/${TEST_FILE}"

if [ ! -f "${EX_DIR}/${TEST_FILE}" ]
then
  echo "> Test file \"${TEST_FILE}\" doesn't exist, exiting."
  read -p 'Code file name: ' CODE_FILE

  if [ -z "$CODE_FILE" ]
  then
    exit 1
  fi
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
mix new "${EX_DIR//-/_}"

if [ $EX_DIR != ${EX_DIR//-/_} ]
then
  mv ${EX_DIR//-/_} $EX_DIR
fi

if [ "$CODE_FILE" != "${EXERCISE}.exs" ]
then
  BASE_CODE_FILE=$(basename --suffix='.exs' "$CODE_FILE")
  # echo ">>> $BASE_CODE_FILE"

  # cp "${EX_DIR}/mix.exs" "${EX_DIR}/mix.exs.tmp"
  perl -pi -e "s/:${EXERCISE//-/_}/:${BASE_CODE_FILE}/" "${EX_DIR}/mix.exs"
  # rm "${EX_DIR}/mix.exs.tmp" 
  # sed 's/string/replace/1' filename
fi

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
rm "${EX_DIR}/lib/${EXERCISE//-/_}.ex"
cp "${EX_BKP}/${CODE_FILE}" "${EX_DIR}/lib/${CODE_FILE%?}"

# delete backup
# rm -rf $EX_BKP
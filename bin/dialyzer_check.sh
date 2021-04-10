#!/bin/bash

mkdir -p ./priv/plts

mkdir -p ./tmp/src
mkdir ./tmp/build

for example_file in $(find ./exercises -type f -name '*mix.exs')
do
  exercise_dir=$(dirname $example_file)
  exercise=$(basename $exercise_dir)

  # concept exercises have "exemplar" solutions
  if [ -f "${exercise_dir}/.meta/exemplar.ex" ]; then
    cp "${exercise_dir}/.meta/exemplar.ex" "./tmp/src/${exercise}.ex"
  fi

  # practice exercises have "example" solutions
  if [ -f "${exercise_dir}/.meta/example.ex" ]; then
    cp "${exercise_dir}/.meta/example.ex" "./tmp/src/${exercise}.ex"
  fi

  support_files=($(jq -r '(.files.editor[])?' "${exercise_dir}/.meta/config.json"))
  for support_file_path in "${support_files[@]}"
  do
    file=$(basename "${support_file_path}")
    cp "${exercise_dir}/${support_file_path}" "./tmp/src/${file}"
  done
done

elixirc -o ./_build ./tmp/src/*.ex
mix deps.get
mix dialyzer
RESULT=$?
rm -rf ./tmp

exit $RESULT

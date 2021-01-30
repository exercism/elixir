#!/bin/bash

# currently dialyzer is timing out after 30 mins only on elixir 1.7 / otp 19
if elixir --version | grep -q 'Elixir 1.7'; then
  echo "skipping dialyzer for Elixir 1.7"
  exit 0
fi

mkdir -p ./priv/plts

mkdir -p ./tmp/src
mkdir ./tmp/build

for example_file in exercises/concept/**/mix.exs
do
  exercise_dir=$(dirname $example_file)
  exercise=$(basename $exercise_dir)
  cp "${exercise_dir}/.meta/exemplar.ex" "./tmp/src/${exercise}.ex"
done

for example_file in exercises/practice/**/mix.exs
do
  exercise_dir=$(dirname "${example_file}")
  exercise=$(basename "${exercise_dir}")
  cp "${exercise_dir}/.meta/example.ex" "./tmp/src/${exercise}.ex"
done

elixirc -o ./_build ./tmp/src/*.ex
mix dialyzer --no-check
RESULT=$?
rm -rf ./tmp

exit $RESULT

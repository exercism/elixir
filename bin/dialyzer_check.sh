#!/bin/bash

# currently dialyzer is timing out after 30 mins only on elixir 1.7 / otp 19
if elixir --version | grep -q 'Elixir 1.7'; then
  echo "skipping dialyzer for Elixir 1.7"
  exit 0
fi

mkdir -p ./priv/plts

mkdir -p ./tmp/src
mkdir ./tmp/build

for example_file in exercises/**/example.exs
do
  exercise_dir=$(dirname $example_file)
  exercise=$(basename $exercise_dir)
  cp "$exercise_dir/example.exs" "./tmp/src/$exercise.exs"
done

elixirc -o ./_build ./tmp/src/*.exs
mix dialyzer --no-check --halt-exit-status
RESULT=$?
rm -rf ./tmp

exit $RESULT

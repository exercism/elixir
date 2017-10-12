mkdir -p ./tmp/src
mkdir ./tmp/build


for example_file in exercises/**/example.exs
do
  exercise_dir=$(dirname $example_file)
  exercise=$(basename $exercise_dir)
  cp "$exercise_dir/example.exs" "./tmp/src/$exercise.exs"
done

elixirc -o ./tmp/build ./tmp/src/*.exs
mix dialyzer
RESULT=$?
rm -rf ./tmp

exit $RESULT

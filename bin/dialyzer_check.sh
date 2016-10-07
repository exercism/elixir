mkdir -p ./tmp/src
mkdir ./tmp/build


for example_file in exercises/**/example.exs
do
  exercise_dir=$(dirname $example_file)
  exercise=$(basename $exercise_dir)
  cp "$exercise_dir/example.exs" "./tmp/src/$exercise.exs"
done

elixirc -o ./tmp/build ./tmp/src/*.exs

if [ $CI ]; then
    export PLT_FILENAME=elixir-${TRAVIS_ELIXIR_VERSION:=1.3.2}_${TRAVIS_OTP_RELEASE:=19.0}.plt
    export PLT_LOCATION=./tmp/$PLT_FILENAME
    wget -O $PLT_LOCATION https://github.com/danielberkompas/travis_elixir_plts/blob/master/elixir-${TRAVIS_ELIXIR_VERSION}_${TRAVIS_OTP_RELEASE}.plt?raw=true

    dialyzer --no_check_plt --plt $PLT_LOCATION --no_native ./tmp/build;
    RESULT=$?
else
    dialyzer ./tmp/build;
    RESULT=$?
fi

rm -rf ./tmp

exit $RESULT

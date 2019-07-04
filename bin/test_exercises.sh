# make copy of exercises folder
# for each exercise
#   create a backup of the lib
#   move the example into lib
#   test
# delete test folder

for file in lib/*.ex
    do  mv "$file" "${file/.ex/.ex.bkp}"
done

mv example.exs lib/example.ex

mix test --include pending

result=$?